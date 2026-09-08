---
title: Overview
description: Learn how to use GenAI-powered Document Insights in RadWordsProcessing to summarize Word documents and answer questions with AI.
page_title: Overview
slug: radwordsprocessing-features-gen-ai-powered-document-insights-overview
tags: genai, word, flow, docx, document, llm, ai, insights, overview, analysis
published: True
position: 0
---

# GenAI-powered Document Insights Overview

The GenAI-powered Document Insights feature in Telerik Document Processing lets you extract insights from Word documents with Large Language Models (LLMs). Use it to summarize document content and ask questions about a Word document. The AI returns answers based on the document content.

## Key Features

* **Extract Document Insights**: Extract document insights from lengthy Word documents.
* **Efficient Information Retrieval**: Ask targeted questions and receive answers based on document content.
* **Token Optimization**: Reduce token usage by sending only relevant document parts to the AI model, as shown in the [`PartialContextQuestionProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) article.
* **Multiple LLM Support**: Use multiple AI providers, including Azure OpenAI, OpenAI, and Ollama, as described in the [Prerequisites]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) article.

>note Explore the [WordsProcessing GenAI Document Insights demo](https://demos.telerik.com/document-processing/wordsprocessing/genai_document_insights).

The GenAI-powered Document Insights feature includes these processors:

| Processor | Description |
|---|---|
| [`SummarizationProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%}) | Generates concise summaries of Word documents. |
| [`CompleteContextQuestionProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%}) | Answers questions by sending the entire document content to the AI model. |
| [`PartialContextQuestionProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) | Answers questions by sending only relevant document parts to the AI model. |

## See Also

* [Set up prerequisites]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [Get started with document insights]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-getting-started%})
* [`SummarizationProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [`PartialContextQuestionProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [`CompleteContextQuestionProcessor`]({%slug radwordsprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
* [Explore the WordsProcessing demo](https://demos.telerik.com/document-processing/wordsprocessing/genai_document_insights)
