---
title: Prerequisites
description: Get familiar with the requirements for using the GenAI-powered Document Insights functionality in the SpreadProcessing library. 
page_title: Prerequisites
slug: radspreadprocessing-features-gen-ai-powered-document-insights-prerequisites
tags: ai, document, analysis, prerequisites, setup, installation, gen, excel, xlsx, spread, processing
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
This article explains the requirements for using the GenAI-powered Document Insights functionality in the [RadSpreadProcessing library]({%slug radspreadprocessing-overview%}).

## Required References

In addition to the [standard RadSpreadProcessing references]({%slug radspreadprocessing-getting-started%}#package-references), you will need to add the following references to use the GenAI-powered Document Insights features:

|.NET Framework|.NET Standard-compatible|
|---|---|
|**Telerik.Windows.Documents.AIConnector** * |**Telerik.Documents.AIConnector** *|
|**Telerik.Windows.Documents.Spreadsheet.FormatProviders.Json** * |**Telerik.Documents.Spreadsheet.FormatProviders.Json** *|

> __*__ The **Documents.AIConnector** NuGet package internally depends on:
>
>* **Telerik.Documents.AI.Core**
>* **Telerik.Documents.AI.RAG**
>    * **Microsoft.Extensions.AI.Abstractions**
>    * **SharpToken**
>
>**Microsoft.Extensions.AI.Abstractions** is currently available only in **preview** version. 
>If you are referencing an _assembly/dll_ of **Documents.AIConnector** instead of a NuGet package, you must manually add the **SharpToken** NuGet package.

## NuGet Packages

You will also need to install a package for your specific AI provider:

* **Microsoft.Extensions.AI.OpenAI** and **Azure.AI.OpenAI** - For using Azure OpenAI
* **Microsoft.Extensions.AI.OpenAI** and **OpenAI** - For using OpenAI
* **Microsoft.Extensions.AI.Ollama** - For using Ollama (local AI models)

## AI Provider Setup

Before using the GenAI-powered Document Insights functionality, you need to set up an AI provider.

| [Azure OpenAI Setup](#azure-openai-setup) | [OpenAI Setup](#openai-setup) | [Ollama Setup (Local AI)](#ollama-setup-local-ai) |
|---|---|---|
| Uses the Azure OpenAI service, which provides enterprise-grade security, compliance, and regional availability for OpenAI models. | Uses direct access to OpenAI's models through their API service. Suitable for general development scenarios. | Runs AI models locally on your machine. Useful for development or working with sensitive data where privacy is important. |

### Azure OpenAI Setup

1. Create an Azure OpenAI resource in the Azure portal.
2. Deploy a model in your Azure OpenAI resource.
3. Get your Azure OpenAI endpoint and key.

>caution The following code snippet is valid for Microsoft.Extensions.AI.OpenAI 9.3. The specific **IChatClient** initialization may be different according to the specific version.

#### __[C#] Example 1: Setting up Azure OpenAI__

<snippet id='libraries-spread-features-gen-ai-setup-azure-open-ai'/>

### OpenAI Setup

1. Create an OpenAI account.
2. Get your API key from the OpenAI dashboard.

#### __[C#] Example 2: Setting up OpenAI__

<snippet id='libraries-spread-features-gen-ai-setup-open-ai'/>

### Ollama Setup (Local AI)

Ollama allows you to run AI models locally on your machine. This is useful for development or when dealing with sensitive data.

1. Install Ollama from [ollama.com](https://ollama.com/).
2. Pull the model you want to use.
3. Start the Ollama server.

#### __[C#] Example 3: Setting up Ollama__

<snippet id='libraries-spread-features-gen-ai-setup-ollama-ai'/>

## See Also

* [GenAI-powered Document Insights Overview]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-overview%})
* [SummarizationProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
