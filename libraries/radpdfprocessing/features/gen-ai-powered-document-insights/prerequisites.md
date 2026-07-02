---
title: Prerequisites
description: Learn about the requirements for using the GenAI-powered Document Insights functionality in the RadPdfProcessing library, including NuGet packages and AI provider setup.
page_title: Prerequisites
slug: radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites
tags: genai, prerequisites, pdf, radpdfprocessing, llm, nuget, setup, ai
published: True
position: 1
---

# GenAI-powered Document Insights Prerequisites

The GenAI-powered Document Insights functionality in the [RadPdfProcessing library]({%slug radpdfprocessing-overview%}) requires specific references and AI provider configuration.

## Required References

In addition to the [standard RadPdfProcessing references]({%slug radpdfprocessing-getting-started%}#package-references), add the following references to use the GenAI-powered Document Insights features:

| .NET Framework | .NET Standard-compatible |
|---|---|
| `Telerik.Windows.Documents.AIConnector` * | `Telerik.Documents.AIConnector` * |

> **\*** The `Documents.AIConnector` NuGet package internally depends on:
>
> * `Telerik.Documents.AI.Core`
> * `Telerik.Documents.AI.RAG`
>    * `Microsoft.Extensions.AI.Abstractions`
>    * `SharpToken`
>
> `Microsoft.Extensions.AI.Abstractions` is now available only in **preview** version.
> If you are referencing an _assembly/dll_ of `Documents.AIConnector` instead of a NuGet package, you must manually add the `SharpToken` NuGet package.

## NuGet Packages

Install a package for your specific AI provider:

| Package | Use case |
|---|---|
| `Microsoft.Extensions.AI.OpenAI` + `Azure.AI.OpenAI` | For using Azure OpenAI. |
| `Microsoft.Extensions.AI.OpenAI` + `OpenAI` | For using OpenAI. |
| `Microsoft.Extensions.AI.Ollama` | For using Ollama (local AI models). |

## AI Provider Setup

Before using the GenAI-powered Document Insights functionality, set up an AI provider.

| [Azure OpenAI Setup](#azure-openai-setup) | [OpenAI Setup](#openai-setup) | [Ollama Setup (Local AI)](#ollama-setup-local-ai) |
|---|---|---|
| Uses the Azure OpenAI service, which provides enterprise-grade security, compliance, and regional availability for OpenAI models. | Uses direct access to the OpenAI models through their API service. Suitable for general development scenarios. | Runs AI models locally on your machine. Useful for development or working with sensitive data where privacy is important. |

### Azure OpenAI Setup

1. Create an Azure OpenAI resource in the Azure portal.
2. Deploy a model in your Azure OpenAI resource.
3. Get your Azure OpenAI endpoint and key.

>caution The following code snippet is valid for `Microsoft.Extensions.AI.OpenAI` 10.3. The specific `IChatClient` initialization may differ depending on the version.

**Setting Up Azure OpenAI**

<snippet id='libraries-pdf-features-gen-ai-setup-azure-open-ai'/>

### OpenAI Setup

1. Create an OpenAI account.
2. Get your API key from the OpenAI dashboard.

**Setting Up OpenAI**

<snippet id='libraries-pdf-features-gen-ai-setup-open-ai'/>

### Ollama Setup (Local AI)

Ollama allows you to run AI models locally on your machine. This is useful for development or when dealing with sensitive data.

1. Install Ollama from [ollama.com](https://ollama.com/).
2. Pull the model you want to use.
3. Start the Ollama server.

**Setting Up Ollama**

<snippet id='libraries-pdf-features-gen-ai-setup-ollama-ai'/>

## See Also

* [GenAI-powered Document Insights Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
