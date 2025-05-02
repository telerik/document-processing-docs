---
title: CompleteContextQuestionProcessor
page_title: CompleteContextQuestionProcessor
slug: radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor
tags: ai, document, analysis, question, processor, complete, context
published: True
position: 4
---
<style>
table, th, td {
	border: 1px solid;
}
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 70%;
} 
</style>

# CompleteContextQuestionProcessor

The **CompleteContextQuestionProcessor** class enables you to ask questions about a PDF document and receive answers based on the entire document content. This processor sends the complete document text to the AI model, which is suitable for smaller documents or when you need to ensure that the AI model has access to all the information in the document. This class inherits from the abstract **AIProcessorBase** class, which provides common functionality for all AI processors.

## When to Use CompleteContextQuestionProcessor

The **CompleteContextQuestionProcessor** is ideal for the following scenarios:

1. **Small Documents**: When the document is small enough to fit within the token limit of the AI model.
2. **Holistic Understanding**: When the question requires understanding the entire document context.
3. **Simplicity**: When you don't need the advanced embedding functionality of [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}).

However, if you're working with larger documents or want to optimize token usage, you should use the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#when-to-use-partialcontextquestionprocessor) instead.

## Public API

|Property|Description|
|---|---|
|**Settings**|Gets the settings for the AI question-answering process. Returns [CompleteContextProcessorSettings]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%}#completectextprocessorsettings).|

|Method|Description|
|---|---|
|**public Task<string> AnswerQuestion(ISimpleTextDocument document, string question)**|Answers a question using the provided document. Parameters: **document** - The document containing the text to process, **question** - The question to answer. Returns a task that represents the asynchronous operation. The task result contains the answer to the question.|

## CompleteContextProcessorSettings

The **CompleteContextProcessorSettings** class provides configuration options for the question-answering process.

### Settings Properties

* **ModelMaxInputTokenLimit**: Gets or sets the maximum input token limit the model allows.
* **TokenizationEncoding**: Gets or sets the tokenization encoding.
* **ModelId**: Gets or sets the ID of the model.

## Usage Example

The following example demonstrates how to use the **CompleteContextQuestionProcessor** to ask questions about a PDF document, including working with specific document pages. For setting up the AI client as shown in this example, see the [AI Provider Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) section:

#### __[C#] Example 1: Using CompleteContextQuestionProcessor__

```csharp
private async void AskQuestionUsingCompleteContext()
{
    // Load the PDF document
    string filePath = @"path\to\your\document.pdf";
    PdfFormatProvider formatProvider = new PdfFormatProvider();
    RadFixedDocument fixedDocument;
    
    using (FileStream fs = File.OpenRead(filePath))
    {
        fixedDocument = formatProvider.Import(fs);
    }
    
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
    
    // Create the processor
    using (CompleteContextQuestionProcessor processor = 
           new CompleteContextQuestionProcessor(iChatClient, maxTokenCount))
    {
        try
        {
            // Customize settings if needed
            processor.Settings.TokenizationEncoding = "cl100k_base";
            processor.Settings.ModelId = "gpt-4o-mini";
            
            // Example 1: Process full document
            // Convert the document to a simple text representation
            ISimpleTextDocument plainDoc = fixedDocument.ToSimpleTextDocument();
            
            // Ask a question about the full document
            string question = "What is the main subject of this document?";
            string answer = await processor.AnswerQuestion(plainDoc, question);
            
            Console.WriteLine($"Question: {question}");
            Console.WriteLine($"Answer: {answer}");
            
            // Ask another question
            string question2 = "What are the key conclusions drawn in this document?";
            string answer2 = await processor.AnswerQuestion(plainDoc, question2);
            
            Console.WriteLine($"Question: {question2}");
            Console.WriteLine($"Answer: {answer2}");
            
            // Example 2: Process specific pages
            // Convert only pages 5-10 to a simple text document (0-based index)
            ISimpleTextDocument partialDoc = fixedDocument.ToSimpleTextDocument(4, 9);
            
            // Ask a question about the specific pages
            string pageQuestion = "Summarize the content of pages 5-10 of the document.";
            string pageAnswer = await processor.AnswerQuestion(partialDoc, pageQuestion);
            
            Console.WriteLine($"Question: {pageQuestion}");
            Console.WriteLine($"Answer: {pageAnswer}");
        }
        catch (ArgumentException ex) when (ex.Message.Contains("The text is too long"))
        {
            Console.WriteLine("The document is too large to process with CompleteContextQuestionProcessor.");
            Console.WriteLine("Consider using PartialContextQuestionProcessor instead.");
        }
    }
}
```

## Token Limit Considerations

The **CompleteContextQuestionProcessor** sends the entire document to the AI model, which means the document must fit within the model's token limit. If the document exceeds this limit, the **AnswerQuestion** method will throw an **ArgumentException**. This is a key difference from the [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%}#handling-large-documents), which can handle documents of any size.

Here's how to check if a document is suitable for processing with **CompleteContextQuestionProcessor**:

#### __[C#] Example 2: Checking Document Size__

```csharp
private bool IsDocumentSuitableForCompleteContext(RadFixedDocument document, int modelMaxInputTokenLimit)
{
    ISimpleTextDocument textDoc = document.ToSimpleTextDocument();
    
    if (textDoc is ISimpleTextDocumentInternal internalDoc)
    {
        string text = internalDoc.Text;
        
        // Create an encoding to count tokens
        GptEncoding encoding = GptEncoding.GetEncoding("cl100k_base");
        
        // Estimate the token count for the document text + prompt + typical question
        const string prompt = "You are a helpful assistant. Use the following context to answer the question.";
        const string typicalQuestion = "What is this document about?";
        
        int estimatedTokens = encoding.Encode(prompt + text + typicalQuestion).Count;
        
        // Allow for a safety margin
        return estimatedTokens <= (int)(modelMaxInputTokenLimit * 0.9);
    }
    
    return false;
}
```

## See Also

* [AI Document Analysis Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
