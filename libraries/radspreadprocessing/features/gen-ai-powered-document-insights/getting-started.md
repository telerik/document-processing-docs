---
title: Getting Started
description: Learn how to use the GenAI-powered Document Insights functionality to summarize an Excel document and ask questions about it with SpreadProcessing.
page_title: Getting Started
slug: radspreadprocessing-features-gen-ai-powered-document-insights-getting-started
tags: genai, spreadsheet, excel, radspreadprocessing, llm, ai, summarization, started, genai, insights
published: True
position: 2
---

# Getting Started

|Minimum Version:|Q4 2025|
|----|----|

The following example demonstrates how to use the GenAI-powered Document Insights functionality to summarize an Excel document and ask questions about it:

>note The following code snippet is valid for Azure Open AI 9.3. The specific `IChatClient` initialization may differ depending on the version.

>important For .NET {{site.mindotnetversion}}+ (Target OS Windows) with [Packages for .NET {{site.mindotnetversion}} and .NET {{site.maxdotnetversion}} for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows), an [IEmbedder]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder) implementation is required for the [PartialContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}).

**Example 1: Using GenAI-powered Document Insights**

<snippet id='libraries-spread-features-gen-ai-powered-document-insights-getting-started'/>

When you run this code, the AI processes your document, generates a summary, and answers your questions.

## See Also

* [Prerequisites]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [Custom IEmbedder Implementation]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder)
* [CompleteContextQuestionProcessor]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
