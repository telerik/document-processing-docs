---
title: SummarizationProcessor
description: SummarizationProcessor class enables you to generate concise summaries of PDF documents using Large Language Models.
page_title: SummarizationProcessor
slug: radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor
tags: ai, document, analysis, summarization, processor, summary
published: True
position: 3
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

<snippet id='libraries-pdf-features-gen-ai-summirize-configure'/>

## Usage Example

The following example demonstrates how to use the **SummarizationProcessor** to generate a summary of a PDF document. To set up the AI client as shown in this example, see the [AI Provider Setup]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) section.

### Handling Large Documents

For large documents that exceed the token limit of the model, **SummarizationProcessor** automatically splits the document into smaller chunks and processes them separately:

1. The document is split into chunks that fit within the model's token limit.
2. Each chunk is summarized individually.
3. The individual summaries are combined and sent for a final summarization.

This approach allows the processor to efficiently handle documents of any size, but it increases the number of API calls required. The **SummaryResourcesCalculated** event provides information about the expected resource usage, allowing you to decide whether to proceed with the operation.

#### __[C#] Example 2: Using SummarizationProcessor__

<snippet id='libraries-pdf-features-gen-ai-summarize-document'/>

## See Also

* [GenAI-powered Document Insights Overview]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%})
* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
