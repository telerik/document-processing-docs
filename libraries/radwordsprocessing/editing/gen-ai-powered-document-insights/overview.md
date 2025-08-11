---
title: Overview
description: Learn more about the GenAI-powered Document Insights feature of the WordsProcessing library. 
page_title: Overview
slug: radwordsprocessing-features-gen-ai-powered-document-insights-overview
tags: ai, document, analysis, overview, word, processing, genai, powered, insights
published: True
position: 0
---

# GenAI-powered Document Insights Overview

The GenAI-powered Document Insights feature enables you to easily extract insights from Word documents using Large Language Models (LLMs). This functionality allows you to summarize document content and ask questions about the document, with the AI providing relevant answers based on the document's content.

## Key Features

* **Extract Document Insights**: Quickly understand the key points of lengthy documents.
* **Efficient Information Retrieval**: Ask specific questions about your documents and receive accurate answers.
* **Token Optimization**: Reduce token usage by only sending relevant portions of the document to the AI model as shown in the [PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#when-to-use-partialcontextquestionprocessor) section.
* **Multiple LLM Support**: Compatible with different AI providers including Azure OpenAI, OpenAI, and Ollama as described in the [Prerequisites]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup).

The GenAI-powered Document Insights feature includes three main components:

|Processor|Description|
|----|----|
|**[SummarizationProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%})**|Generates concise summaries of Word documents.|
|**[CompleteContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})**|Answers questions by providing the entire document content to the AI model.|
|**[PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})**|Answers questions by providing only the relevant portions of the document to the AI model.|

## See Also

* [Prerequisites]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [Getting Started]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-getting-started%})
* [SummarizationProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [PartialContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [CompleteContextQuestionProcessor]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
