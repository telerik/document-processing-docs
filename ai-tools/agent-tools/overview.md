---
title: Overview
page_title: Agent Tools - Overview
description: Learn how Telerik Document Processing Agent Tools expose licensed PDF, spreadsheet, Word, and conversion operations to AI agents through callable tools.
slug: agent-tools-overview
tags: agent, tools, ai, pdf, docx, xlsx, telerik, document
published: True
position: 0
---

# Agent Tools

|Minimum Version|Q1 2026|
|----|----|

The Agent Tools API exposes licensed document processing capabilities to AI agents through callable tools. Use it to build applications that process spreadsheets, PDFs, Word documents, and document conversions through tool calls.

The API is built around two concepts: **repositories** that manage documents in memory and **agent tool classes** that expose document operations to AI frameworks.

## License Requirements

Access to the **Telerik Document Processing** Agent Tools depends on your [Telerik license type](https://www.telerik.com/purchase.aspx?filter=web). The Agent Tools are included with any valid 30-day **Trial** or active **Subscription** license for Telerik products or bundles that include Document Processing Libraries entitlement.

## Base Classes and Interfaces

The Agent Tools API provides foundational types that enable document management and tool creation across all document types:

| Type | Description |
|---|---|
| `AgentToolBase` | Base class for agent tool classes. It discovers `[Tool]`-annotated instance methods and converts them to `AITool` objects. It validates the license before each tool invocation. |
| `IDocumentRepository` | Base interface for all document repositories. A repository stores documents in memory during processing and provides import, export, retrieval, merge, and cleanup operations. |
| `IDocumentRepository<TDocument>` | Generic interface that extends `IDocumentRepository` with type-specific document access. Each repository reports the `DocumentType` it manages so higher-level components can route operations correctly. |
| `DocumentRepositoryRegistry` | Central registry that maintains one repository for each document type: `Workbook`, `FixedDocument`, and `FlowDocument`. Higher-level components use it to resolve the correct repository at runtime. |

## Available Tools

* [Convert and merge tools]({%slug agent-tools-convert-merge-document-api%})
* [Spreadsheet (Excel) tools]({%slug agent-tools-spreadsheet-document-api%})
  * [Workbook repositories]({%slug agent-tools-spreadsheet-document-api%}#repositories)
  * [Read, write, worksheet, formula, and analysis tools]({%slug agent-tools-spreadsheet-document-api%}#agent-tools)
* [PDF tools]({%slug agent-tools-pdf-document-api%})
  * [Fixed-document repositories]({%slug agent-tools-pdf-document-api%}#repositories)
  * [Form, content, file-management, and read tools]({%slug agent-tools-pdf-document-api%}#agent-tools)
* Word document support for conversion and merging through shared repositories and conversion tools

## Dependency Injection Support

The Agent Tools API provides optional dependency injection support for applications that use the `IServiceCollection` pattern. These extension methods register the default in-memory repositories and their shared registry.

>note Using dependency injection is **not required**. You can instantiate repositories and agent tool classes directly without a DI container.

The following extension methods are available for registering repositories with `IServiceCollection`:

| Method | Description |
|---|---|
| `AddSpreadsheetAgentTools()` | Registers all spreadsheet agent tool classes (`SpreadProcessingReadAgentTools`, `SpreadProcessingWriteAgentTools`, `SpreadProcessingWorksheetAgentTools`, `SpreadProcessingFileManagementAgentTools`, and `SpreadProcessingFormulaAgentTools`) and their required dependencies, including the appropriate workbook repository. |
| `AddFixedAgentTools()` | Registers all fixed document agent tool classes (`FixedDocumentFormAgentTools`, `FixedDocumentContentAgentTools`, and `FixedFileManagementAgentTools`) and their required dependencies, including the fixed document repository. |
| `AddFlowAgentTools()` | Registers flow document repositories and related services for use with conversion and merge operations. |

## See Also

* [Get started with DPL Agent Tools]({%slug agent-tools-getting-started%})
* [Use spreadsheet agent tools]({%slug agent-tools-spreadsheet-document-api%})
* [Use PDF agent tools]({%slug agent-tools-pdf-document-api%})