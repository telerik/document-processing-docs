---
title: Prerequisites
description: Get familiar with the requirements for using the GenAI-powered Document Insights functionality in the PdfProcessing library. 
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

You will also need to install a package for your specific AI provider:

* **Azure.AI.OpenAI** - For using Azure OpenAI
* **Microsoft.Extensions.AI.OpenAI** - For using OpenAI
* **OllamaSharp** - For using Ollama (local AI models)

>important Microsoft.Extensions.AI.Abstractions is currently available only in preview version.

## AI Provider Setup

Before using the GenAI-powered Document Insights functionality, you need to set up an AI provider.

| [Azure OpenAI Setup](#azure-openai-setup) | [OpenAI Setup](#openai-setup) | [Ollama Setup (Local AI)](#ollama-setup-local-ai) |
|---|---|---|
| Uses the Azure OpenAI service, which provides enterprise-grade security, compliance, and regional availability for OpenAI models. | Uses direct access to OpenAI's models through their API service. Suitable for general development scenarios. | Runs AI models locally on your machine. Useful for development or working with sensitive data where privacy is important. |

### Azure OpenAI Setup

1. Create an Azure OpenAI resource in the Azure portal.
2. Deploy a model in your Azure OpenAI resource.
3. Get your Azure OpenAI endpoint and key.

>note: The following code snippet is valid for Azure Open AI 9.3. The specific **IChatClient** initialization may be different according to the specific version.

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

When using the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#constructors-and-platform-support)  in .NET Standard or .NET Framework, you need to provide an implementation of the **IEmbeddingsStorage** interface.

For this sample Ollama implementation, you'll need to add references to the following NuGet packages:
* **LangChain.Ollama**
* **LangChain.Databases.Sqlite**

#### __[C#] Example 4: OllamaEmbeddingsStorage Implementation__

<snippet id='libraries-pdf-features-gen-ai-summarize-optimize-embeddings-storage'/>

## See Also

* [GenAI-powered Document Insights Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
