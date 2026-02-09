---
title: Conversion Tools
page_title: Conversion Tools
description: Telerik Document Processing Agent Tools expose document processing conversion capabilities to agentic workflows.
slug: agent-tools-conversion-document-api
tags: ai, dpl, document, processing, agent, tool, telerik, convert, api
published: True
position: 4
---

# Conversion Tools

## ConvertDocumentsAgentTool

The **ConvertDocumentsAgentTool** class provides an agent‑tool wrapper around Telerik’s document conversion engine, enabling automated file conversions within AI‑driven workflows. Typical use cases include converting DOCX → PDF or XLSX → CSV.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>ConvertDocument</td><td><pre>CallToolResult ConvertDocument(
    FileDescriptor sourceFile,
    FileDescriptor destinationFile)</pre></td><td>Performs format transformations or direct copies of supported file types.</td></tr>
</table>

### Supported Formats

The tool handles conversions for the following file types:

- Flow documents: .docx, .doc (import only), .rtf, .html
- Fixed documents: .pdf
- Spreadsheet documents: .xlsx, .xls, .xlsm, .csv
- Text documents: .txt

>important The Telerik Document Processing libraries provide converting from one document format to another that is **valid and compatible** with the input format. See: [Supported Formats]({%slug introduction%}#supported-formats).

## MergeDocumentsAgentTool

**MergeDocumentsAgentTool** is an agent tool designed to merge multiple documents of varying formats into a single combined output file. It acts as a wrapper around Telerik’s internal MergeDocumentsTool, exposing a tool-enabled method suitable for AI‑driven workflows using Agent Tools.
This class supports merging files directly from the file system, avoiding the use of any document import utilities, and maintains a consistent output directory location.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>MergeDocuments</td><td><pre>CallToolResult MergeDocuments(
    FileDescriptor[] sourceFilePaths,
    FileDescriptor destinationFilePath)</pre></td><td>Merges multiple source files—specified by their disk paths and formats—into a single destination document.</td></tr>
</table>

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})
* [Overview]({%slug agent-tools-overview%}) 