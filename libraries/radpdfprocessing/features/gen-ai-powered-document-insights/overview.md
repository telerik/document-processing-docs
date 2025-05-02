---
title: Overview
page_title: Overview
slug: radpdfprocessing-features-gen-ai-powered-document-insights-overview
tags: ai, document, analysis, overview, pdf, processing, genai, powered, insights
published: True
position: 0
---

# GenAI-powered Document Insights Overview

The GenAI-powered Document Insights feature enables you to easily extract insights from PDF documents using Large Language Models (LLMs). This functionality allows you to summarize document content and ask questions about the document, with the AI providing relevant answers based on the document's content.

The GenAI-powered Document Insights feature includes three main components:

* **[SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})**: Generates concise summaries of PDF documents.
* **[CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})**: Answers questions by providing the entire document content to the AI model.
* **[PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})**: Answers questions by providing only the relevant portions of the document to the AI model.

## Key Features

* **Extract Document Insights**: Quickly understand the key points of lengthy documents.
* **Efficient Information Retrieval**: Ask specific questions about your documents and receive accurate answers.
* **Token Optimization**: Reduce token usage by only sending relevant portions of the document to the AI model as shown in the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#when-to-use-partialcontextquestionprocessor) section.
* **Multiple LLM Support**: Compatible with different AI providers including Azure OpenAI, OpenAI, and Ollama as described in the [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup).

## Complete Example

The following example demonstrates how to use the GenAI-powered Document Insights functionality to summarize a PDF document and ask questions about it:

#### __[C#] Example 1: Using GenAI-powered Document Insights__

```csharp
private async void ProcessPdfWithAI()
{
    // Load the PDF document
    string filePath = @"path\to\your\document.pdf";
    PdfFormatProvider formatProvider = new PdfFormatProvider();
    RadFixedDocument fixedDocument;
    
    using (FileStream fs = File.OpenRead(filePath))
    {
        fixedDocument = formatProvider.Import(fs);
    }
    
    // Convert the document to a simple text representation
    ISimpleTextDocument plainDoc = fixedDocument.ToSimpleTextDocument();
    
    // Set up the AI client (Azure OpenAI in this example)
    string key = Environment.GetEnvironmentVariable("AZUREOPENAI_KEY");
    string endpoint = Environment.GetEnvironmentVariable("AZUREOPENAI_ENDPOINT");
    string model = "gpt-4o-mini";
    
    AzureOpenAIClient azureClient = new(
        new Uri(endpoint),
        new Azure.AzureKeyCredential(key),
        new AzureOpenAIClientOptions());
    ChatClient chatClient = azureClient.GetChatClient(model);
    
    IChatClient iChatClient = new OpenAIChatClient(chatClient);
    int maxTokenCount = 128000;
    
    // 1. Summarize the document
    using (SummarizationProcessor summarizationProcessor = new SummarizationProcessor(iChatClient, maxTokenCount))
    {
        // Handle resources calculation event to control token usage
        summarizationProcessor.SummaryResourcesCalculated += (object sender, SummaryResourcesCalculatedEventArgs e) =>
        {
            Console.WriteLine($"Estimated calls required: {e.EstimatedCallsRequired}");
            Console.WriteLine($"Estimated tokens required: {e.EstimatedTokensRequired}");
            
            // Confirm if the operation should continue
            e.ShouldContinueExecution = true;
        };
        
        string summary = await summarizationProcessor.Summarize(plainDoc);
        Console.WriteLine("Document Summary:");
        Console.WriteLine(summary);
    }
    
    // 2. Answer questions using partial context (recommended for efficiency)
#if NET7_0_OR_GREATER
    using (PartialContextQuestionProcessor partialContextQuestionProcessor = 
           new PartialContextQuestionProcessor(iChatClient, maxTokenCount, plainDoc))
    {
        string question = "What are the main findings in the document?";
        string answer = await partialContextQuestionProcessor.AnswerQuestion(question);
        
        Console.WriteLine($"Question: {question}");
        Console.WriteLine($"Answer: {answer}");
    }
#else
    IEmbeddingsStorage embeddingsStorage = new OllamaEmbeddingsStorage();
    using (PartialContextQuestionProcessor partialContextQuestionProcessor = 
           new PartialContextQuestionProcessor(iChatClient, embeddingsStorage, maxTokenCount, plainDoc))
    {
        string question = "What are the main findings in the document?";
        string answer = await partialContextQuestionProcessor.AnswerQuestion(question);
        
        Console.WriteLine($"Question: {question}");
        Console.WriteLine($"Answer: {answer}");
    }
#endif
    
    // 3. Answer questions using complete context (for smaller documents)
    using (CompleteContextQuestionProcessor completeContextQuestionProcessor = 
           new CompleteContextQuestionProcessor(iChatClient, maxTokenCount))
    {
        string question = "What is the conclusion of the document?";
        string answer = await completeContextQuestionProcessor.AnswerQuestion(plainDoc, question);
        
        Console.WriteLine($"Question: {question}");
        Console.WriteLine($"Answer: {answer}");
    }
}
```

When you run this code, the AI will process your document, generate a summary, and answer your questions.

## See Also

* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
