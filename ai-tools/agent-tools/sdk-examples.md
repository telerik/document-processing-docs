---
title: Developer Focused Examples
page_title: Agent Tools - Developer Focused Examples
sdk_example: true
description: Find developer-focused SDK examples that demonstrate Telerik Document Processing Agent Tools in console, WPF, and ASP.NET Core applications.
slug: agent-tools-sdk-examples
tags: sdk, examples, demos, agent, tools, ai, telerik, repository, developer
published: True
position: 6
---

# Developer Focused Examples

The [Telerik Document Processing SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/) provides additional demos for the document processing libraries. The examples demonstrate specific use-case scenarios that can help you get started quickly.

For the complete list of SDK examples for **Agent Tools**, see the [AITools examples in the SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/AITools).

## Available Examples

The following table summarizes the examples in the AITools folder:

| Example | Description |
|---|---|
| [AgentTools](https://github.com/telerik/document-processing-sdk/tree/master/AITools/AgentTools) | A console application that registers the spreadsheet, PDF, and flow agent tools through dependency injection. It runs prompt scenarios that create spreadsheets and PDF documents, fill PDF forms, convert spreadsheets to PDF, and merge documents. |
| [AgentToolsAnalyzeSpreadsheet](https://github.com/telerik/document-processing-sdk/tree/master/AITools/AgentToolsAnalyzeSpreadsheet) | A WPF application that integrates `RadSpreadsheet` from Telerik UI for WPF with an AI chat. It uses the read and formula tools to analyze the loaded workbook through natural language. |
| [AgentToolsEditSpreadsheet](https://github.com/telerik/document-processing-sdk/tree/master/AITools/AgentToolsEditSpreadsheet) | A WPF application that integrates `RadSpreadsheet` from Telerik UI for WPF with an AI chat. It uses the read, formula, worksheet, and write tools to edit the loaded workbook through natural language. |
| [AgentToolsInPdfViewerWPF](https://github.com/telerik/document-processing-sdk/tree/master/AITools/AgentToolsInPdfViewerWPF) | A WPF application that integrates `RadPdfViewer` from Telerik UI for WPF with an AI chat. It uses the PDF agent tools to analyze and edit the displayed document through natural language. |
| [PerUserIsolatedStorage](https://github.com/telerik/document-processing-sdk/tree/master/AITools/PerUserIsolatedStorage) | An ASP.NET Core Web API that isolates the document repositories of each authenticated user. For more information about this pattern, see [Multi-User AI Agent Sessions]({%slug agent-tools-multi-user-scenario%}). |

>note The examples use Azure OpenAI as the AI provider. To run them, you need an Azure OpenAI resource with a deployed model and the respective endpoint and key.

## See Also

* [Agent Tools Overview]({%slug agent-tools-overview%})
* [Get Started with Agent Tools]({%slug agent-tools-getting-started%})
* [Multi-User AI Agent Sessions]({%slug agent-tools-multi-user-scenario%})
