---
title: Overview
page_title: Overview
slug: radpdfprocessing-features-ai-document-analysis-overview
tags: ai, document, analysis, overview, pdf, processing
published: True
position: 0
---

# AI Document Analysis Overview

The AI Document Analysis feature enables you to easily extract insights from PDF documents using Large Language Models (LLMs). This functionality allows you to summarize document content and ask questions about the document, with the AI providing relevant answers based on the document's content.

The AI Document Analysis feature includes three main components:

* **SummarizationProcessor**: Generates concise summaries of PDF documents. For more information, see the [SummarizationProcessor documentation]({%slug radpdfprocessing-features-ai-document-analysis-summarization-processor%}).
* **CompleteContextQuestionProcessor**: Answers questions by providing the entire document content to the AI model. For details, see the [CompleteContextQuestionProcessor section]({%slug radpdfprocessing-features-ai-document-analysis-complete-context-question-processor%}#when-to-use-completecontextquestionprocessor).
* **PartialContextQuestionProcessor**: Answers questions by providing only the relevant portions of the document to the AI model, which helps reduce token usage and improve response relevance. Learn more in the [PartialContextQuestionProcessor documentation]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%}).

## Key Benefits

* **Extract Document Insights**: Quickly understand the key points of lengthy documents.
* **Efficient Information Retrieval**: Ask specific questions about your documents and receive accurate answers.
* **Token Optimization**: Reduce token usage by only sending relevant portions of the document to the AI model as shown in the [PartialContextQuestionProcessor section]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%}#when-to-use-partialcontextquestionprocessor).
* **Multiple LLM Support**: Compatible with different AI providers including Azure OpenAI, OpenAI, and Ollama as described in the [Prerequisites]({%slug radpdfprocessing-features-ai-document-analysis-prerequisites%}#ai-provider-setup).

## Complete Example

The following example demonstrates how to use the AI Document Analysis functionality to summarize a PDF document and ask questions about it:

#### __[C#] Example 1: Using AI Document Analysis__

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

* [Prerequisites]({%slug radpdfprocessing-features-ai-document-analysis-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-ai-document-analysis-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-ai-document-analysis-complete-context-question-processor%})
