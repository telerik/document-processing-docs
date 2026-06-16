---
title: Getting Started
description: Learn how to use the GenAI-powered Document Insights functionality to summarize a PDF document and ask questions about it with RadPdfProcessing.
page_title: Getting Started
slug: radpdfprocessing-features-gen-ai-powered-document-insights-getting-started
tags: genai, pdf, summarization, radpdfprocessing, llm, ai, insights, started
published: True
position: 2
---

# Getting Started

The following example demonstrates how to use the GenAI-powered Document Insights functionality to summarize a PDF document and ask questions about it:

>note The following code snippet is valid for Azure OpenAI 9.3. The specific `IChatClient` initialization may differ depending on the version.

>important For .NET {{site.mindotnetversion}}+ (Target OS Windows) with [Packages for .NET {{site.mindotnetversion}} and .NET {{site.maxdotnetversion}} for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows), an [IEmbedder]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder) implementation is required for the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}).

#### **Example 1: Using GenAI-powered Document Insights**

<snippet id='libraries-pdf-features-gen-ai-getting-started'/>

When you run this code, the AI processes your document, generates a summary, and answers your questions.

>note A sample runnable project is available in the Document Processing SDK: [AIConnectorDemo](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/AIConnectorDemo).

## See Also

* [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [Custom IEmbedder Implementation]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder)
* [CompleteContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
