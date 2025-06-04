---
title: PartialContextQuestionProcessor
description: PartialContextQuestionProcessor class enables you to ask questions about a PDF document and receive answers based on the most relevant parts of the document content.
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

The **PartialContextQuestionProcessor** is ideal for the following scenarios:

1. **Large Documents**: When the document exceeds the token limit of the AI model and cannot be processed in a single call.
2. **Efficient Token Usage**: When you want to minimize token consumption and optimize costs.
3. **Specific Questions**: When questions are targeted at specific information within the document rather than requiring complete document understanding.

## Public API and Configuration

|Constructor|Platform|Description|
|---|---|---|
|**PartialContextQuestionProcessor(IChatClient chatClient, int modelMaxInputTokenLimit, ISimpleTextDocument document)**|_Specific*_ |Creates an instance with built-in embeddings storage|
|**PartialContextQuestionProcessor(IChatClient chatClient, IEmbeddingsStorage embeddingsStorage, int modelMaxInputTokenLimit, ISimpleTextDocument document)**|Any|Creates an instance with custom embeddings storage|

> _Specific*_ The .NET {{site.mindotnetversion}}+ (Target OS Windows) + [Packages for .NET Framework and .NET 8 and .NET 9 for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows) constructor uses **DefaultEmbeddingsStorage** internally, while the cross-platform constructor requires a custom implementation of **IEmbeddingsStorage** as shown in the [Custom IEmbeddingsStorage Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembeddingsstorage) section.

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

#### Example 1: Using PartialContextQuestionProcessor with default embeddings storage.

This example demonstrates how to use the **PartialContextQuestionProcessor** with the built-in embeddings storage on .NET {{site.mindotnetversion}}+ (Target OS Windows) + [Packages for .NET Framework and .NET 8 and .NET 9 for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows). For setting up the AI client, see the [AI Provider Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) section:

<snippet id='libraries-pdf-features-gen-ai-ask-questions-using-partial-context'/>

#### Example 2: Using PartialContextQuestionProcessor with Custom Embeddings (.NET Standard/.NET Framework)

This example demonstrates how to use the **PartialContextQuestionProcessor** with a custom embeddings storage implementation as described in the [Custom IEmbeddingsStorage Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembeddingsstorage) section:

<snippet id='libraries-pdf-features-gen-ai-ask-questions-using-partial-context-iembeddingsstorage'/>

### Implementing custom IEmbeddingsStorage

A sample custom implementation for the OllamaEmbeddingsStorage is shown in the below code snippet:

>note Requires installing the following NuGet packages:
> * **LangChain**
> * **LangChain.Databases.Sqlite**
> * **Microsoft.Extensions.AI.Ollama**
> * **Telerik.Windows.Documents.AIConnector**
> * **Telerik.Windows.Documents.Fixed**  

1. Install Ollama from [ollama.com](https://ollama.com/).
2. Pull the model you want to use.
3. Start the Ollama server.

<snippet id='libraries-pdf-features-gen-ai-ask-questions-using-partial-context-ollama-embeddings-storage'/>

#### Example 3: Processing Specific Pages

<snippet id='libraries-pdf-features-gen-ai-summarize-process-specific-pages'/>

#### Example 4: Optimizing Embeddings Settings

<snippet id='libraries-pdf-features-gen-ai-summarize-optimize-embeddings-storage'/>

## See Also

* [GenAI-powered Document Insights Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
