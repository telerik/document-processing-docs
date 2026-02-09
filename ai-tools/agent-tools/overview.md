---
title: Overview
page_title: Agent Tools - Overview
description: Telerik Document Processing Agent Tools provide document processing capabilities designed to be exposed to AI agents.
slug: agent-tools-overview
tags: ai, dpl, document, processing, agent, tool, telerik, excel, pdf, word, docx, pdf, xlsx 
published: True
position: 0
---

# Agent Tools - Overview

The Agent Tools API provides document processing capabilities designed to be exposed to AI agents. This functionality is suitable for engineers who want to expose safe, composable document operations for spreadsheets, PDFs, and flow (Word) documents to an LLM via tool calls.

The API is built around two key concepts: **repositories** for managing documents in memory, and **agent tool classes** that provide specific document processing capabilities that can be directly exposed to AI agents.

## Base Classes and Interfaces

The Agent Tools API provides foundational types that enable document management and tool creation across all document types:

  - **AgentToolBase**: Base class for all agent tool classes. Provides an abstract foundation for creating AI-exposable tools within the Telerik Documents AI tooling ecosystem. It enables automatic discovery and conversion of specially annotated instance methods into AITool objects that can be consumed by AI frameworks.
  
  - **IDocumentRepository**: Base interface for all document repositories. A repository is an in-memory container where documents are stored and managed during processing. It provides operations to import and export documents and retrieve them via unique identifiers.
  
  - **IDocumentRepository&lt;TDocument&gt;**: Generic interface that extends IDocumentRepository to provide type-specific document management. Defines a consistent abstraction for managing documents across different file types (spreadsheets, PDFs, flow documents). Each repository explicitly reports the DocumentType it manages, allowing the system to route operations to the correct repository based on file type.
  
  - **DocumentRepositoryRegistry**: A centralized registry that maintains one repository for each document type (Workbook, Fixed, and Flow). Enables higher-level components to dynamically resolve the appropriate repository at runtime based on the document type being handled.

## Available Tools

* [Convert and Merge Tools]({%slug agent-tools-convert-merge-document-api%})
* [Spread (Excel)]({%slug agent-tools-spreadsheet-document-api%})
  * [Workbook Repositories]({%slug agent-tools-spreadsheet-document-api%}#repositories)
  * [Tools]({%slug agent-tools-spreadsheet-document-api%}#agent-tools)
* [Pdf]({%slug agent-tools-pdf-document-api%})
  * [Fixed Repositories]({%slug agent-tools-pdf-document-api%}#repositories)
  * [Tools]({%slug agent-tools-pdf-document-api%}#agent-tools)
* Flow (Word) - Supports only conversion and merging.

## Dependency Injection Support

The Agent Tools API provides optional dependency injection support for applications that use the IServiceCollection pattern. These extension methods simplify registration of agent tools and their dependencies.

>note Using dependency injection is **not required**. The agent tool classes and repositories can be instantiated and used directly without a DI container.

The following extension methods are available for registering agent tools with IServiceCollection:

  - **services.AddSpreadsheetAgentTools()**: Registers all spreadsheet agent tool classes (SpreadProcessingReadAgentTools, SpreadProcessingWriteAgentTools, SpreadProcessingWorksheetAgentTools, SpreadProcessingFileManagementAgentTools, and SpreadProcessingFormulaAgentTools) and their required dependencies, including the appropriate workbook repository.
  
  - **services.AddFixedAgentTools()**: Registers all fixed document agent tool classes (FixedDocumentFormAgentTools, FixedDocumentContentAgentTools, and FixedFileManagementAgentTools) and their required dependencies, including the fixed document repository.
  
  - **services.AddFlowAgentTools()**: Registers flow document repositories and related services for use with conversion and merge operations.

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})