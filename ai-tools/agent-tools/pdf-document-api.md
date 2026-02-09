---
title: PDF Tools
page_title: PDF Tools
description: Telerik Document Processing Agent Tools provides a set of Fixed (PDF) document APIs exposing document processing capabilities to agentic workflows.
slug: agent-tools-pdf-document-api
tags: ai, dpl, document, processing, agent, tool, telerik, pdf, fixed, api
published: True
position: 3
---

# PDF Tools

Telerik Document Processing provides a set of fixed (PDF) document APIs exposing document processing capabilities (analysis, transformation, metadata extraction, and manipulation) optimized for consumption in agentic workflows within .NET AI applications.

>note Learn how to integrate the Agent Tools in your application: [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%}).

## Repositories

A repository is a place in memory where we keep the documents we currently work with. The available repositories for managing fixed (PDF) documents are:

|Repository|Description|
|----|----|
|**IFixedDocumentRepository**|Provides a unified interface for managing PDF (Fixed) documents. Extends IDocumentRepository with PDF-specific capabilities.|
|**InMemoryFixedDocumentRepository**|Repository for multi-document orchestration scenarios. Manages multiple PDF documents in memory with support for creation and import.|


## Agent Tools

### FixedDocumentFormAgentTools

Provides AI‑assistant–ready operations for inspecting and filling interactive form fields in PDF documents. It is built on top of the Telerik Documents AI Tooling framework and extends FixedDocumentAgentToolsBase to support workflows that involve:
- Reading PDF form structure and metadata
- Extracting field properties for analysis or downstream logic
- Filling form fields programmatically with user‑supplied values
- Saving new PDFs populated with partial or complete form data

This toolset enables intelligent agents, automation systems, and PDF‑processing pipelines to collaborate efficiently with interactive PDF forms.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>GetPdfFormFields</td><td><pre>CallToolResult GetPdfFormFields(
    string documentId = null)</pre></td><td>Extracts detailed, read‑only metadata about all interactive form fields in a PDF.</td></tr>
<tr><td>FillPdfFormFields</td><td><pre>CallToolResult FillPdfFormFields(
    string documentId,
    Dictionary<string, PdfFormFieldValue> fieldValues)</pre></td><td>Programmatically fills form fields and saves the completed form as a new PDF.
Partial completion is supported—only supply the fields you want to set, and all others remain untouched for manual fill‑in later.</td></tr>
</table>

### FixedDocumentContentAgentTools

Provides high-level agent tools for creating and manipulating PDF document content via structured content segments. It is designed to add multiple, heterogeneous content types—text, images, tables, and document structure breaks—in a single operation, preserving content flow and layout consistency by using one RadFixedDocumentEditor instance under the hood.
  
<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>AddContentSegmentsToPdf</td><td><pre>CallToolResult AddContentSegmentsToPdf(
    string documentId,
    ContentSegment[] contentSegments)</pre></td><td>Adds multiple content segments to an existing PDF document as one cohesive operation. Intended for agent-driven or automation scenarios where the content is provided as an array of segment objects.</td></tr>
</table>

### FixedFileManagementAgentTools 

Provides document lifecycle management tools for creating, listing, importing, and exporting fixed documents (PDFs). This agent tool sits on top of a repository abstraction and ensures fixed documents are discoverable and usable across tools. Export/import operations bridge between the in‑memory repository and the file system.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>CreateFixedDocument</td><td><pre>CallToolResult CreateFixedDocument(
    string documentId)</pre></td><td>Creates a new, empty fixed document (PDF) in the repository and returns its document ID. The PDF is not written to disk until ExportFixedDocument is called.</td></tr>
<tr><td>ListFixedDocuments</td><td><pre>CallToolResult ListFixedDocuments()</pre></td><td>Returns all fixed documents currently known to the repository, including document IDs and associated metadata.</td></tr>
<tr><td>ExportFixedDocument</td><td><pre>CallToolResult ExportFixedDocument(
    string filePath,
    string documentId)</pre></td><td>Writes the specified repository document to the file system as a PDF.</td></tr>
<tr><td>ImportFixedDocument</td><td><pre>CallToolResult ImportFixedDocument(
    string filePath,
    DocumentFormat format,
    string documentName = null)</pre></td><td>Loads a document from the file system and registers it in the repository, returning the assigned document ID. </td></tr>
</table>

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})
* [Overview]({%slug agent-tools-overview%})
* [RadPdfProcessing]({%slug radpdfprocessing-overview%})