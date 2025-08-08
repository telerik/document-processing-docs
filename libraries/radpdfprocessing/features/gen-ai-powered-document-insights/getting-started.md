---
title: Getting Started
description: Learn how to use the GenAI-powered Document Insights functionality to summarize a PDF document with PdfProcessing.
page_title: Getting Started
slug: radpdfprocessing-features-gen-ai-powered-document-insights-getting-started
tags: ai, document, analysis, overview, pdf, processing, genai, powered, insights
published: True
position: 2
---

# Getting Started

The following example demonstrates how to use the GenAI-powered Document Insights functionality to summarize a PDF document and ask questions about it:

>note The following code snippet is valid for Azure Open AI 9.3. The specific **IChatClient** initialization may be different according to the specific version.

>important For .NET {{site.mindotnetversion}}+ (Target OS Windows) with [Packages for .NET {{site.mindotnetversion}} and .NET {{site.maxdotnetversion}} for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows), an [IEmbeddingsStorage]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembeddingsstorage) implementation is required for the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}).

#### __[C#] Example 1: Using GenAI-powered Document Insights__

<snippet id='libraries-pdf-features-gen-ai-getting-started'/>

When you run this code, the AI will process your document, generate a summary, and answer your questions.

>note A sample runnable project is available in the Document Processing SDK: [AIConnectorDemo](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/AIConnectorDemo).

## See Also

* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [Custom IEmbeddingsStorage Implementation]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembeddingsstorage)
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
