---
title: Getting Started
description: Learn how to use the GenAI-powered Document Insights functionality to summarize a Word document with WordsProcessing.
page_title: Getting Started
slug: radwordsprocessing-features-gen-ai-powered-document-insights-getting-started
tags: ai, document, analysis, overview, word, flow, processing, genai, powered, insights
published: True
position: 2
---

# Getting Started

The following example demonstrates how to use the GenAI-powered Document Insights functionality to summarize a Word document and ask questions about it:

>note The following code snippet is valid for Azure Open AI 9.3. The specific **IChatClient** initialization may be different according to the specific version.

>important For .NET {{site.mindotnetversion}}+ (Target OS Windows) with [Packages for .NET {{site.mindotnetversion}} and .NET {{site.maxdotnetversion}} for Windows]({%slug available-nuget-packages%}#packages-for-net-framework-and-net-{{site.mindotnetversion}}-and-net-{{site.maxdotnetversion}}-for-windows), an [IEmbedder]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder) implementation is required for the [PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}).

#### __Example 1: Using GenAI-powered Document Insights__

<snippet id='libraries-flow-features-gen-ai-getting-started'/>

When you run this code, the AI will process your document, generate a summary, and answer your questions.

## See Also

* [Prerequisites]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [SummarizationProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [Custom IEmbedder Implementation]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#implementing-custom-iembedder)
* [CompleteContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
