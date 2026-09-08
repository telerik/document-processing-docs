---
title: Overview
description: Learn how to use GenAI-powered Document Insights in RadSpreadProcessing to summarize Excel workbooks and answer questions with AI.
page_title: Overview
slug: radspreadprocessing-features-gen-ai-powered-document-insights-overview
tags: genai, spreadsheet, excel, radspreadprocessing, llm, ai, insights, overview, analysis, insights, xlsx, csv, xls
published: True
position: 0
---

# GenAI-powered Document Insights Overview <sup>(Preview)</sup>

|Minimum Version:|Q4 2025|
|----|----|

The GenAI-powered Document Insights feature in Progress® Telerik® Document Processing lets you extract insights from Excel workbooks with Large Language Models (LLMs). Use it to summarize workbook content and ask questions about a workbook. The AI returns answers based on the workbook content.

## Key Features

* **Extract Document Insights**: Extract document insights from large Excel workbooks.
* **Efficient Information Retrieval**: Ask targeted questions and receive answers based on workbook content.
* **Token Optimization**: Reduce token usage by sending only relevant workbook parts to the AI model, as shown in the [`PartialContextQuestionProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) article.
* **Multiple LLM Support**: Use multiple AI providers, including Azure OpenAI, OpenAI, and Ollama, as described in the [Prerequisites]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-prerequisites%}#ai-provider-setup) article.

The GenAI-powered Document Insights feature includes these processors:

| Processor | Description |
|---|---|
| [`SummarizationProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-summarization-processor%}) | Generates concise summaries of Excel workbooks. |
| [`CompleteContextQuestionProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%}) | Answers questions by sending the entire workbook content to the AI model. |
| [`PartialContextQuestionProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%}) | Answers questions by sending only relevant workbook parts to the AI model. |

## See Also

* [Set up prerequisites]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-prerequisites%})
* [Get started with document insights]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-getting-started%})
* [`SummarizationProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-summarization-processor%})
* [`PartialContextQuestionProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-partial-context-question-processor%})
* [`CompleteContextQuestionProcessor`]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-complete-context-question-processor%})
