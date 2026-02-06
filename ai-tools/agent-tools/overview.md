---
title: Overview
page_title: Agent Tools - Overview
description: Telerik Document Processing Agent Tools provide document processing capabilities designed to be exposed to AI agents.
slug: agent-tools-overview
tags: ai, dpl, document, processing, agent, tool, telerik, excel, pdf, word, docx, pdf, xlsx 
published: True
position: 0
---

# gent Tools - Overview

The Agent Tools API provides document processing capabilities designed to be exposed to AI agents. This functionality is suitable for engineers who want to expose safe, composable document operations for spreadsheets, PDFs, and flow documents to an LLM via tool calls.

The API is built around two key concepts: **repositories** for managing documents in memory, and **agent tool classes** that provide specific document processing capabilities that can be directly exposed to AI agents.

## Base Classes and Interfaces

The Agent Tools API provides foundational types that enable document management and tool creation across all document types:

  - **AgentToolBase**: Base class for all agent tool classes. Provides an abstract foundation for creating AI-exposable tools within the Telerik Documents AI tooling ecosystem. It enables automatic discovery and conversion of specially annotated instance methods into AITool objects that can be consumed by AI frameworks.
  
  - **IDocumentRepository**: Base interface for all document repositories. A repository is an in-memory container where documents are stored and managed during processing. It provides operations to import and export documents and retrieve them via unique identifiers.
  
  - **IDocumentRepository&lt;TDocument&gt;**: Generic interface that extends IDocumentRepository to provide type-specific document management. Defines a consistent abstraction for managing documents across different file types (spreadsheets, PDFs, flow documents). Each repository explicitly reports the DocumentType it manages, allowing the system to route operations to the correct repository based on file type.
  
  - **DocumentRepositoryRegistry**: A centralized registry that maintains one repository for each document type (Workbook, Fixed, and Flow). Enables higher-level components to dynamically resolve the appropriate repository at runtime based on the document type being handled.

## Spreadsheet Processing API

The Spreadsheet Processing API provides comprehensive tools for working with Excel workbooks, organized into repositories and specialized agent tool classes.

### Repositories

  - **IWorkbookRepository**: Interface for managing spreadsheet workbooks, extending IDocumentRepository&lt;Workbook&gt; with spreadsheet-specific capabilities.
  
  - **InMemoryWorkbookRepository**: A repository implementation that maintains multiple workbooks in memory simultaneously. Suitable for scenarios requiring concurrent access to multiple spreadsheet documents.
  
  - **SingleWorkbookRepository**: A simplified repository implementation designed to work with a single workbook. Provides a streamlined option for scenarios focused on analyzing or modifying one workbook at a time.

### Agent Tool Classes

  - **SpreadProcessingReadAgentTools**: Provides read-only operations for extracting and analyzing data from spreadsheets, including filtering, finding values, retrieving cell ranges, querying styles, and accessing worksheet information.
  
  - **SpreadProcessingWriteAgentTools**: Provides write operations for modifying cell content, formulas, and styles, as well as auto-fitting columns and rows, and managing cell merging.
  
  - **SpreadProcessingWorksheetAgentTools**: Provides operations for managing worksheets within a workbook, including adding, deleting, and renaming worksheets.
  
  - **SpreadProcessingFileManagementAgentTools**: Provides file-level operations for creating, listing, importing, and exporting workbooks.
  
  - **SpreadProcessingFormulaAgentTools**: Provides specialized operations for working with formulas, including calculating formulas without modifying documents, listing all formulas, and retrieving formula information.

## Fixed Document (PDF) API

The Fixed Document API provides tools for working with PDF documents, organized into repositories and specialized agent tool classes.

### Repositories

  - **IFixedDocumentRepository**: Interface for managing PDF documents, extending IDocumentRepository&lt;RadFixedDocument&gt; with PDF-specific capabilities.
  
  - **InMemoryFixedDocumentRepository**: A repository implementation that maintains multiple PDF documents in memory simultaneously.

### Agent Tool Classes

  - **FixedDocumentFormAgentTools**: Provides operations for working with PDF forms, including retrieving form field information and filling form fields.
  
  - **FixedDocumentContentAgentTools**: Provides operations for adding content segments to PDF documents.
  
  - **FixedFileManagementAgentTools**: Provides file-level operations for creating, listing, importing, and exporting PDF documents.

## Flow Document (Word) API

The Flow Document API provides repositories for managing Word documents, primarily for use with conversion and merge operations. Agent tool classes specific to Flow documents are not yet available, but the repository infrastructure is in place.

### Repositories

  - **IFlowDocumentRepository**: Interface for managing Word documents, extending IDocumentRepository&lt;RadFlowDocument&gt; with flow document-specific capabilities.
  
  - **InMemoryFlowDocumentRepository**: A repository implementation that maintains multiple Word documents in memory simultaneously.

## Document Conversion and Merging API

The Conversion API provides cross-document-type operations for converting between formats and merging documents.

### Agent Tool Classes

  - **ConvertDocumentsAgentTool**: Provides operations for converting documents between different formats (e.g., Excel to PDF, Word to PDF).
  
  - **MergeDocumentsAgentTool**: Provides operations for merging multiple documents into a single document.

## Dependency Injection Support

The Agent Tools API provides optional dependency injection support for applications that use the IServiceCollection pattern. These extension methods simplify registration of agent tools and their dependencies.

>note Using dependency injection is **not required**. The agent tool classes and repositories can be instantiated and used directly without a DI container.

The following extension methods are available for registering agent tools with IServiceCollection:

  - **services.AddSpreadsheetAgentTools()**: Registers all spreadsheet agent tool classes (SpreadProcessingReadAgentTools, SpreadProcessingWriteAgentTools, SpreadProcessingWorksheetAgentTools, SpreadProcessingFileManagementAgentTools, and SpreadProcessingFormulaAgentTools) and their required dependencies, including the appropriate workbook repository.
  
  - **services.AddFixedAgentTools()**: Registers all fixed document agent tool classes (FixedDocumentFormAgentTools, FixedDocumentContentAgentTools, and FixedFileManagementAgentTools) and their required dependencies, including the fixed document repository.
  
  - **services.AddFlowAgentTools()**: Registers flow document repositories and related services for use with conversion and merge operations.

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})