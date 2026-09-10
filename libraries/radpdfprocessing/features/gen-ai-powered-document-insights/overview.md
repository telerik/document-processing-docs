---
title: Overview
description: Learn how to use GenAI-powered Document Insights in RadPdfProcessing to summarize PDF documents and answer questions with AI.
page_title: Overview
slug: radpdfprocessing-features-gen-ai-powered-document-insights-overview
tags: genai, pdf, insights, radpdfprocessing, llm, ai, documents, overview
published: True
position: 0
---

# GenAI-powered Document Insights Overview

The GenAI-powered Document Insights feature in Telerik Document Processing lets you extract insights from PDF documents with Large Language Models (LLMs). Use it to summarize document content and ask questions about a PDF document. The AI returns answers based on the document content.

## Key Features

* **Extract Document Insights**: Understand the key points of lengthy documents.
* **Efficient Information Retrieval**: Ask specific questions about your documents and receive accurate answers.
* **Token Optimization**: Reduce token usage by sending only relevant portions of the document to the AI model as shown in the [PartialContextQuestionProcessor]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}#when-to-use-partialcontextquestionprocessor) section.
* **Multiple LLM Support**: Compatible with different AI providers including Azure OpenAI, OpenAI, and Ollama as described in the [Prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup).

>note Explore the [PdfProcessing GenAI Document Insights demo](https://demos.telerik.com/document-processing/pdfprocessing/genai_document_insights).

The GenAI-powered Document Insights feature includes these processors:

| Processor | Description |
|---|---|
| [`SummarizationProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%}) | Generates concise summaries of PDF documents. |
| [`CompleteContextQuestionProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%}) | Answers questions by sending the entire document content to the AI model. |
| [`PartialContextQuestionProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) | Answers questions by sending only relevant document parts to the AI model. |

## See Also

* [Set up prerequisites]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [Get started with document insights]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-getting-started%})
* [`SummarizationProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [`PartialContextQuestionProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [`CompleteContextQuestionProcessor`]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
* [Explore the PdfProcessing demo](https://demos.telerik.com/document-processing/pdfprocessing/genai_document_insights)
