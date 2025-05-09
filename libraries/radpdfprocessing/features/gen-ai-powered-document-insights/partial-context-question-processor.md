---
title: PartialContextQuestionProcessor
page_title: PartialContextQuestionProcessor
slug: radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor
tags: ai, document, analysis, question, processor, partial, context, embeddings
published: True
position: 4
---
<style>
table, th, td {
    border: 1px solid;
}
table th:first-of-type {
    width: 65%;
}
table th:nth-of-type(2) {
    width: 10%;
}
table th:nth-of-type(3) {
    width: 25%;
}
</style>

# PartialContextQuestionProcessor

The **PartialContextQuestionProcessor** class enables you to ask questions about a PDF document and receive answers based on the most relevant parts of the document content. This processor uses embeddings to identify and send only the relevant portions of the document to the AI model, making it more efficient for token usage and more suitable for large documents. This class inherits from the abstract **AIProcessorBase** class, which provides common functionality for all AI processors.

## When to Use PartialContextQuestionProcessor

The **PartialContextQuestionProcessor** is ideal for the following scenarios:

1. **Large Documents**: When the document exceeds the token limit of the AI model and cannot be processed in a single call.
2. **Efficient Token Usage**: When you want to minimize token consumption and optimize costs.
3. **Specific Questions**: When questions are targeted at specific information within the document rather than requiring complete document understanding.

## Public API and Configuration

|Constructor|Platform|Description|
|---|---|---|
|**PartialContextQuestionProcessor(IChatClient chatClient, int modelMaxInputTokenLimit, ISimpleTextDocument document)**|.NET 7+|Creates an instance with built-in embeddings storage|
|**PartialContextQuestionProcessor(IChatClient chatClient, IEmbeddingsStorage embeddingsStorage, int modelMaxInputTokenLimit, ISimpleTextDocument document)**|Any|Creates an instance with custom embeddings storage|

> The .NET 7+ constructor uses **DefaultEmbeddingsStorage** internally, while the cross-platform constructor requires a custom implementation of **IEmbeddingsStorage** as shown in the [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#iembeddingsstorage-setup-for-net-standard-and-net-framework).

### Properties and Methods

|Member|Type|Description|
|---|---|---|
|**Settings**|Property|Gets the **PartialContextProcessorSettings** for configuring the AI process|
|**AnswerQuestion(string question)**|Method|Returns an answer to the question using relevant document context|

### PartialContextProcessorSettings

The settings class provides configuration options for the question-answering process:

* **ModelMaxInputTokenLimit**: Maximum input token limit the model allows
* **TokenizationEncoding**: Tokenization encoding used
* **ModelId**: ID of the AI model
* **MaxNumberOfEmbeddingsSent**: Maximum number of context chunks sent (default: 30)
* **EmbeddingTokenSize**: Size in tokens of each context chunk (default: 300)

## Usage Examples

### Example 1: Using PartialContextQuestionProcessor in .NET 7 and Later

This example demonstrates how to use the PartialContextQuestionProcessor with the built-in embeddings storage on .NET 7 and later. For setting up the AI client, see the [AI Provider Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) section:

```csharp
private async void AskQuestionsUsingPartialContext()
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
    
    // Create the processor with built-in DefaultEmbeddingsStorage (.NET 7+ only)
    using (PartialContextQuestionProcessor processor = 
           new PartialContextQuestionProcessor(iChatClient, maxTokenCount, plainDoc))
    {
        // Customize settings if needed
        processor.Settings.MaxNumberOfEmbeddingsSent = 20;
        processor.Settings.EmbeddingTokenSize = 500;
        
        // Ask a question
        string question = "What are the key findings in the document?";
        string answer = await processor.AnswerQuestion(question);
        
        Console.WriteLine($"Question: {question}");
        Console.WriteLine($"Answer: {answer}");
        
        // Ask additional questions using the same processor
        string question2 = "What methodology was used in the research?";
        string answer2 = await processor.AnswerQuestion(question2);
        
        Console.WriteLine($"\nQuestion: {question2}");
        Console.WriteLine($"Answer: {answer2}");
    }
}
```

### Example 2: Using PartialContextQuestionProcessor with Custom Embeddings (.NET Standard/.NET Framework)

This example demonstrates how to use the PartialContextQuestionProcessor with a custom embeddings storage implementation as described in the [IEmbeddingsStorage Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#iembeddingsstorage-setup-for-net-standard-and-net-framework) section:

```csharp
private async void AskQuestionsUsingPartialContext()
{
    // Load the PDF document and convert to simple text (same as Example 1)
    string filePath = @"path\to\your\document.pdf";
    PdfFormatProvider formatProvider = new PdfFormatProvider();
    RadFixedDocument fixedDocument;
    
    using (FileStream fs = File.OpenRead(filePath))
    {
        fixedDocument = formatProvider.Import(fs);
    }
    
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
    
    // Create an embeddings storage implementation
    // Uses Ollama for embeddings and SQLite for storage
    IEmbeddingsStorage embeddingsStorage = new OllamaEmbeddingsStorage();
    
    // Create the processor with custom embeddings storage
    using (PartialContextQuestionProcessor processor = 
           new PartialContextQuestionProcessor(iChatClient, embeddingsStorage, maxTokenCount, plainDoc))
    {
        try
        {
            // Ask a question
            string question = "What are the main conclusions of the document?";
            string answer = await processor.AnswerQuestion(question);
            
            Console.WriteLine($"Question: {question}");
            Console.WriteLine($"Answer: {answer}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error processing question: {ex.Message}");
        }
    }
}

// IEmbeddingsStorage interface defines:
// - SetText(string text, PartialContextProcessorSettings settings): Processes text and creates embeddings
// - GetQuestionContext(string question): Returns relevant context for the question
// - Dispose(): Cleans up resources

// Example implementation of IEmbeddingsStorage using Ollama and SQLite
internal class OllamaEmbeddingsStorage : IEmbeddingsStorage
{
    // Configuration constants for Ollama embeddings model
    private const string AllMinilmEmbeddingModelName = "all-minilm";
    private const string DBName = "vectors.db";
    private const int DimensionsForAllMinilm = 384; // Dimension size for all-minilm model
    private static readonly string defaultCollectionName = "defaultName";

    private readonly SqLiteVectorDatabase vectorDatabase;
    private readonly OllamaEmbeddingModel embeddingModel;
    private IVectorCollection vectorCollection;

    public OllamaEmbeddingsStorage()
    {
        // Initialize Ollama provider and SQLite vector database
        OllamaProvider provider = new OllamaProvider();
        this.embeddingModel = new OllamaEmbeddingModel(provider, id: AllMinilmEmbeddingModelName);
        this.vectorDatabase = new SqLiteVectorDatabase(dataSource: DBName);
    }

    // Retrieve similar documents for a question using embeddings similarity
    public async Task<string> GetQuestionContext(string question)
    {
        IReadOnlyCollection<Document> similarDocuments = await this.vectorCollection.GetSimilarDocuments(
            this.embeddingModel, question, amount: 5);

        return similarDocuments.AsString();
    }

    public void SetText(string text, PartialContextProcessorSettings settings)
    {
        MemoryStream memoryStream = new MemoryStream();
        StreamWriter writer = new StreamWriter(memoryStream);
        writer.Write(text);
        writer.Flush();
        memoryStream.Position = 0;

        if (this.vectorDatabase.IsCollectionExistsAsync(defaultCollectionName).Result)
        {
            this.vectorDatabase.DeleteCollectionAsync(defaultCollectionName).Wait();
        }

        this.vectorCollection = this.vectorDatabase.AddDocumentsFromAsync<TextLoader>(
            this.embeddingModel,
            dimensions: DimensionsForAllMinilm,
            dataSource: DataSource.FromBytes(memoryStream.ToArray()),
            textSplitter: null,
            collectionName: defaultCollectionName,
            behavior: AddDocumentsToDatabaseBehavior.JustReturnCollectionIfCollectionIsAlreadyExists).Result;
    }

    public void Dispose()
    {
        this.vectorDatabase.Dispose();
    }
}
```

### Example 3: Processing Specific Pages

```csharp
// Convert only pages 5-10 to a simple text document (0-based index)
ISimpleTextDocument partialDoc = fixedDocument.ToSimpleTextDocument(4, 9);

using (PartialContextQuestionProcessor processor = 
       new PartialContextQuestionProcessor(iChatClient, maxTokenCount, partialDoc))
{
    // Ask a question about the specific pages
    string question = "What information is presented on pages 5-10 of the document?";
    string answer = await processor.AnswerQuestion(question);
    
    Console.WriteLine($"Question: {question}");
    Console.WriteLine($"Answer: {answer}");
}
```

### Example 4: Optimizing Embeddings Settings

```csharp
using (PartialContextQuestionProcessor processor = 
       new PartialContextQuestionProcessor(iChatClient, maxTokenCount, plainDoc))
{
    // For more comprehensive answers at the cost of more tokens
    processor.Settings.MaxNumberOfEmbeddingsSent = 50;   // Increase the number of context chunks
    processor.Settings.EmbeddingTokenSize = 400;         // Increase the size of each context chunk
    
    // For more precise answers and fewer tokens
    // processor.Settings.MaxNumberOfEmbeddingsSent = 15;  // Decrease for fewer chunks
    // processor.Settings.EmbeddingTokenSize = 250;        // Decrease for smaller chunks
    
    string question = "What are the key recommendations in the document?";
    string answer = await processor.AnswerQuestion(question);
    
    Console.WriteLine($"Question: {question}");
    Console.WriteLine($"Answer: {answer}");
}
```

## See Also

* [GenAI-powered Document Insights Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
