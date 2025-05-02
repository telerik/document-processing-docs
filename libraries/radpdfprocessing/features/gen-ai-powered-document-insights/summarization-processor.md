---
title: SummarizationProcessor
page_title: SummarizationProcessor
slug: radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor
tags: ai, document, analysis, summarization, processor, summary
published: True
position: 2
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

# SummarizationProcessor

The **SummarizationProcessor** class enables you to generate concise summaries of PDF documents using Large Language Models (LLMs). It inherits from the abstract **AIProcessorBase** class, which provides common functionality for all AI processors. It automatically handles large documents by splitting them into smaller chunks when needed, making it suitable for documents of any size.

## Public API

|Property|Description|
|---|---|
|**Settings**|Gets or sets the settings that will be used for summarization.|


|Method|Description|
|---|---|
|**Task<string> Summarize(ISimpleTextDocument document)**|Generates a summary of the provided document. The parameter **document** is an **ISimpleTextDocument** containing the text to be summarized.|


|Event|Description|
|---|---|
|**EventHandler<SummaryResourcesCalculatedEventArgs> SummaryResourcesCalculated**|Triggered before the actual summarization process begins, providing information about the estimated resource usage. The **SummaryResourcesCalculatedEventArgs** provides properties: **EstimatedCallsRequired** (number of API calls required), **EstimatedTokensRequired** (number of tokens to be processed), and **ShouldContinueExecution** (boolean flag indicating whether to proceed with summarization, default is **true** for single-call and **false** for multi-call operations).|

## SummarizationProcessorSettings

The **SummarizationProcessorSettings** class provides configuration options for the summarization process:

* **PromptAddition**: Gets or sets an addition for the prompt used for summarization. It can be used for clarification purposes.

#### __[C#] Example 1: Configuring SummarizationProcessorSettings__

```csharp
// Create a summarization processor with settings
using (SummarizationProcessor summarizationProcessor = new SummarizationProcessor(iChatClient, maxTokenCount))
{
    // Configure the summarization settings
    summarizationProcessor.Settings.PromptAddition = "Focus on the key points and main arguments. ";
    
    // Rest of the code...
}
```

## Usage Example

The following example demonstrates how to use the **SummarizationProcessor** to generate a summary of a PDF document. To set up the AI client as shown in this example, see the [AI Provider Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) section:

#### __[C#] Example 2: Using SummarizationProcessor__

```csharp
private async void SummarizeDocument()
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
    
    using (SummarizationProcessor summarizationProcessor = new SummarizationProcessor(iChatClient, maxTokenCount))
    {
        // Configure the summarization settings (optional)
        summarizationProcessor.Settings.PromptAddition = "Focus on the key points and main arguments. ";
        
        // Subscribe to the SummaryResourcesCalculated event to monitor token usage
        summarizationProcessor.SummaryResourcesCalculated += (object sender, SummaryResourcesCalculatedEventArgs e) =>
        {
            Console.WriteLine($"This summarization will require approximately {e.EstimatedTokensRequired} tokens " +
                             $"and {e.EstimatedCallsRequired} API calls.");
            
            // For large documents, you need to explicitly approve the operation
            // to avoid unexpected API usage and costs
            if (e.EstimatedCallsRequired > 1)
            {
                Console.WriteLine("Document is large and will require multiple API calls.");
                
                // Set to true to proceed with summarization, or leave as false to cancel
                e.ShouldContinueExecution = false;
            }
        };
        
        try
        {
            // Generate the summary
            string summary = await summarizationProcessor.Summarize(plainDoc);
            Console.WriteLine("Document Summary:");
            Console.WriteLine(summary);
        }
        catch (OperationCanceledException)
        {
            Console.WriteLine("Summarization was cancelled.");
        }
    }
}
```
## Handling Large Documents

For large documents that exceed the token limit of the model, **SummarizationProcessor** automatically splits the document into smaller chunks and processes them separately. This approach is similar to how [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) handles large documents. The process is as follows:

1. The document is split into chunks that fit within the model's token limit.
2. Each chunk is summarized individually.
3. The individual summaries are combined and sent for a final summarization.

This approach allows the processor to efficiently handle documents of any size, but it increases the number of API calls required. The **SummaryResourcesCalculated** event provides information about the expected resource usage, allowing you to decide whether to proceed with the operation.

#### __[C#] Example 4: Configuring Resource Limits__

```csharp
summarizationProcessor.SummaryResourcesCalculated += (object sender, SummaryResourcesCalculatedEventArgs e) =>
{
    // Set limits based on your requirements
    int maxTokens = 500000; // Maximum tokens to process
    int maxCalls = 5;      // Maximum API calls to make
    
    if (e.EstimatedTokensRequired > maxTokens || e.EstimatedCallsRequired > maxCalls)
    {
        Console.WriteLine("Document exceeds resource limits. Cancelling summarization.");
        e.ShouldContinueExecution = false;
    }
    else
    {
        Console.WriteLine($"Proceeding with summarization. Estimated tokens: {e.EstimatedTokensRequired}, " +
                         $"Estimated calls: {e.EstimatedCallsRequired}");
        e.ShouldContinueExecution = true;
    }
};
```
## See Also

* [AI Document Analysis Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
