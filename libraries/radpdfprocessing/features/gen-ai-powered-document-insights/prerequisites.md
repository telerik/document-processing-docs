---
title: Prerequisites
page_title: Prerequisites
slug: radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites
tags: ai, document, analysis, prerequisites, setup, installation
published: True
position: 1
---
<style>
table, th, td {
    border: 1px solid;
}
/* First table with two columns */
table:nth-of-type(1) th:first-of-type {
    width: 50%;
}
table:nth-of-type(1) th:nth-of-type(2) {
    width: 50%;
}
/* Second table with three columns */
table:nth-of-type(2) th {
    width: 33.33%;
}
</style>

# GenAI-powered Document Insights Prerequisites
This article explains the requirements for using the GenAI-powered Document Insights functionality in the [RadPdfProcessing library]({%slug radpdfprocessing-overview%}).

## Required Assemblies

In addition to the [standard RadPdfProcessing assemblies]({%slug radpdfprocessing-getting-started%}#assembly-references), you will need to reference the following assemblies to use the GenAI-powered Document Insights features:

|.NET Framework|.NET Standard-compatible|
|---|---|
|**Telerik.Windows.Documents.AIConnector.dll**|**Telerik.Documents.AIConnector.dll**|

## NuGet Packages

You will also need to install the following NuGet packages:

* **Microsoft.Extensions.AI.Abstractions** - Core abstractions for AI functionality
* **SharpToken** - For token counting and text chunking

Additionally, you'll need a package for your specific AI provider:

* **Azure.AI.OpenAI** - For using Azure OpenAI
* **Microsoft.Extensions.AI.OpenAI** - For using OpenAI
* **OllamaSharp** - For using Ollama (local AI models)

## AI Provider Setup

Before using the GenAI-powered Document Insights functionality, you need to set up an AI provider.

| [Azure OpenAI Setup](#azure-openai-setup) | [OpenAI Setup](#openai-setup) | [Ollama Setup (Local AI)](#ollama-setup-local-ai) |
|---|---|---|
| Uses the Azure OpenAI service, which provides enterprise-grade security, compliance, and regional availability for OpenAI models. | Uses direct access to OpenAI's models through their API service. Suitable for general development scenarios. | Runs AI models locally on your machine. Useful for development or working with sensitive data where privacy is important. |

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

When using the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-ai-document-analysis-partial-context-question-processor%}#constructors-and-platform-support)  in .NET Standard or .NET Framework, you need to provide an implementation of the **IEmbeddingsStorage** interface.

For this sample Ollama implementation, you'll need to add references to the following NuGet packages:
* **LangChain.Ollama**
* **LangChain.Databases.Sqlite**

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

## See Also

* [AI Document Analysis Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
