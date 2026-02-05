---
title: Overview
page_title: Telerik Document Processing Agent Tools Overview
description: Telerik Document Processing Agent Tools provides document processing capabilities designed to be exposed to AI agents.
slug: agent-tools-overview
tags: ai, dpl, document, processing, agent, tool, telerik
published: True
position: 0
---

# Overview

|Minimum Version|Q1 2026|
|----|----|

The Agent Tools API provides document processing capabilities designed to be exposed to AI agents. This functionality is suitable for engineers who want to expose safe, composable document operations (Excel/PDF/Flow) to an LLM via tool calls.

## Required NuGet packages

* Telerik.Documents.AI.Tools.Core
* Telerik.Documents.AI.Tools.Spreadsheet.Core
* Telerik.Documents.AI.Tools.Fixed.Core
* Telerik.Documents.AI.Tools.Flow.Core
* Telerik.Documents.AI.Tools.Conversion.Core
* Telerik.Documents.AI.AgentTools.Spreadsheet
* Telerik.Documents.AI.AgentTools.Fixed
* Telerik.Documents.AI.AgentTools.Conversion

>important The packages have the same names for .NET Standard, .NET (Target OS: None) and .NET (Target OS: Windows).

## Base Classes and Interfaces

  - **AgentToolBase**&mdash;Provides a base class that serves as an abstract foundation for creating AI‑exposable tools within the Telerik Documents AI tooling ecosystem. It enables automatic discovery and conversion of specially annotated instance methods into AITool objects that can be consumed.
  - **IDocumentRepository**&mdash;base interface for all repositories. A repository is a place in memory where we keep the documents we currently work with. You can import and export documents from it and ask for a document via ID.
  - **IDocumentRepository&lt;TDocument&gt;**&mdash;The IDocumentRepository and IDocumentRepository&lt;TDocument&gt; interfaces define a consistent abstraction for managing documents across different file types (e.g., spreadsheets, PDFs, flow documents) within the Telerik Documents AI tooling ecosystem. These interfaces provide a unified set of operations for importing, exporting, retrieving, creating, and merging documents, enabling higher‑level AI tools or application services to interact with various document formats in a standardized way. Each repository explicitly reports the DocumentType it manages. This allows the system to route operations (such as conversions or multi-document workflows) to the correct repository based on file type:
    * **IFixedDocumentRepository** : IDocumentRepository&lt;RadFixedDocument&gt;&mdash;Provides a unified interface for managing PDF (Fixed) documents. Extends IDocumentRepository with PDF-specific capabilities.
    * **IFlowDocumentRepository** : IDocumentRepository&lt;RadFlowDocument&gt;&mdash;Provides a unified interface for managing Word (Flow) documents.
    * **IWorkbookRepository** : IDocumentRepository&lt;Workbook&gt;&mdash;Provides a unified interface for managing spreadsheet workbooks. Extends IDocumentProvider with spreadsheet-specific creation capabilities.
  - **DocumentRepositoryRegistry**&mdash;The DocumentRepositoryRegistry class serves as a lightweight, centralized lookup service for mapping document types to their corresponding document repository implementations. It enables higher‑level components—such as AI tools, file processing workflows, or conversion utilities—to dynamically resolve the appropriate repository at runtime based on the type of document being handled (e.g., workbook, PDF, flow document).

## Dependency Injection Extensions

If the user would like to use Dependency injection, Telerik Document Processing Libraries provide extension methods for registering Spreadsheet, Fixed, Flow document agent tools and related services with an IServiceCollection.

  - services.**AddSpreadsheetAgentTools()**&mdash;Adds Spreadsheet agent tools to the service collection.
  - services.**AddFixedAgentTools()**&mdash;Adds Fixed document agent tools to the service collection.
  - services.**AddFlowAgentTools()**&mdash;Adds Flow document agent tools to the service collection.

## See Also

* [Gettings Started with DPL Agent Tools]({%slug agent-tools-getting-started%})