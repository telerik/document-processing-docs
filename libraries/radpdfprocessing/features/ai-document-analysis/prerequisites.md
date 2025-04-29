---
title: Prerequisites
page_title: Prerequisites
slug: radpdfprocessing-features-ai-document-analysis-prerequisites
tags: ai, document, analysis, prerequisites, setup, installation
published: True
position: 1
---

# AI Document Analysis Prerequisites

This article explains the requirements for using the AI Document Analysis functionality in the RadPdfProcessing library.

## Required Assemblies

In addition to the [standard RadPdfProcessing assemblies]({%slug radpdfprocessing-getting-started%}#assembly-references), you will need to reference the following assemblies to use the AI Document Analysis features:

<table>
<thead>
    <tr>
        <th>.NET Framework</th>
        <th>.NET Standard-compatible</th>
    </tr>
</thead>
<tbody>
    <tr>
        <td><b>Telerik.Windows.Documents.AIConnector.dll</b></td>
        <td><b>Telerik.Documents.AIConnector.dll</b></td>
    </tr>
</tbody>
</table>

## NuGet Packages

You will also need to install the following NuGet packages:

* **Microsoft.Extensions.AI.Abstractions** - Core abstractions for AI functionality
* **SharpToken** - For token counting and text chunking

Additionally, you'll need a package for your specific AI provider:

* **Azure.AI.OpenAI** - For using Azure OpenAI
* **Microsoft.Extensions.AI.OpenAI** - For using OpenAI
* **OllamaSharp** - For using Ollama (local AI models)

## AI Provider Setup

Before using the AI Document Analysis functionality, you need to set up an AI provider. To understand how these components work together, see the [AI Document Analysis Overview]({%slug radpdfprocessing-features-ai-document-analysis-overview%}#key-benefits).

### Azure OpenAI Setup

1. Create an Azure OpenAI resource in the Azure portal.
2. Deploy a model in your Azure OpenAI resource.
3. Get your Azure OpenAI endpoint and key.

#### __[C#] Example 1: Setting up Azure OpenAI__

```csharp
using Microsoft.Extensions.AI;
using Azure.AI.OpenAI;

// Set up Azure OpenAI client
string key = "your-azure-openai-key";
string endpoint = "https://your-resource-name.openai.azure.com/";
string deploymentName = "your-deployment-name";

AzureOpenAIClient azureClient = new(
    new Uri(endpoint),
    new Azure.AzureKeyCredential(key),
    new AzureOpenAIClientOptions());
ChatClient chatClient = azureClient.GetChatClient(deploymentName);

IChatClient iChatClient = new OpenAIChatClient(chatClient);
int maxTokenLimit = 128000; // Adjust based on your model
```

### OpenAI Setup

1. Create an OpenAI account.
2. Get your API key from the OpenAI dashboard.

#### __[C#] Example 2: Setting up OpenAI__

```csharp
using Microsoft.Extensions.AI;
using OpenAI;

// Set up OpenAI client
string key = "your-openai-api-key";
string modelId = "gpt-4o-mini";

OpenAIClient openAIClient = new OpenAIClient(key);
IChatClient client = openAIClient.AsChatClient(modelId);
int maxTokenLimit = 128000; // Adjust based on your model
```

### Ollama Setup (Local AI)

Ollama allows you to run AI models locally on your machine. This is useful for development or when dealing with sensitive data.

1. Install Ollama from [ollama.com](https://ollama.com/).
2. Pull the model you want to use.
3. Start the Ollama server.

#### __[C#] Example 3: Setting up Ollama__

```csharp
using Microsoft.Extensions.AI;

// Install and run Ollama:
// 1. Install Ollama: https://ollama.com/
// 2. Pull the model: ollama pull llama3
// 3. Ensure Ollama is running: ollama serve

// Set up Ollama client
IChatClient iChatClient = new OllamaChatClient(new Uri("http://localhost:11434/"), "llama3");
int maxTokenLimit = 4096; // Adjust based on your model
```

## IEmbeddingsStorage Setup for .NET Standard and .NET Framework

When using the `PartialContextQuestionProcessor` in .NET Standard or .NET Framework, you need to provide an implementation of the `IEmbeddingsStorage` interface. This is required for the functionality described in the [PartialContextQuestionProcessor section]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%}#constructors-and-platform-support). Below is an example implementation using Ollama:

#### __[C#] Example 4: OllamaEmbeddingsStorage Implementation__

```csharp
internal class OllamaEmbeddingsStorage : IEmbeddingsStorage
{
    private const string AllMinilmEmbeddingModelName = "all-minilm";
    private const string DBName = "vectors.db";
    private const int DimensionsForAllMinilm = 384; // Should be 384 for all-minilm
    private static readonly string defaultCollectionName = "defaultName";

    private readonly SqLiteVectorDatabase vectorDatabase;
    private readonly OllamaEmbeddingModel embeddingModel;
    private IVectorCollection vectorCollection;

    public OllamaEmbeddingsStorage()
    {
        OllamaProvider provider = new OllamaProvider();
        this.embeddingModel = new OllamaEmbeddingModel(provider, id: AllMinilmEmbeddingModelName);
        this.vectorDatabase = new SqLiteVectorDatabase(dataSource: DBName);
    }

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

For this implementation, you'll need to add references to the following NuGet packages:
* **LangChain.Ollama**
* **LangChain.Databases.Sqlite**

## See Also

* [AI Document Analysis Overview]({%slug radpdfprocessing-features-ai-document-analysis-overview%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-ai-document-analysis-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-ai-document-analysis-complete-context-question-processor%})
