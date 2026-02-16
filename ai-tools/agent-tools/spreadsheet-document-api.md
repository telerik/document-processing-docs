---
title: Spreadsheet Tools
page_title: Spreadsheet Tools
description: Telerik Document Processing Agent Tools provides a set of Spreadsheet document APIs exposing document processing capabilities to agentic workflows.
slug: agent-tools-spreadsheet-document-api
tags: ai, dpl, document, processing, agent, tool, telerik, spreadsheet, api
published: True
position: 2
---

# Spreadsheet Tools

Telerik Document Processing provides a set of Spreadsheet document APIs exposing document processing capabilities (analysis, transformation, metadata extraction, and manipulation) optimized for consumption in agentic workflows within .NET AI applications. 

>note Learn how to integrate the Agent Tools in your application: [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%}).

## Repositories

A repository is a place in memory where we keep the documents we currently work with. The available repositories for managing workbooks are:

|Repository|Description|
|----|----|
|**IWorkbookRepository**|Provides a unified interface for managing spreadsheet workbooks. Extends IDocumentRepository with spreadsheet-specific creation capabilities.|
|**InMemoryWorkbookRepository**|Repository for multi-document orchestration scenarios. Manages multiple workbooks in memory with support for creation and import.|
|**SingleWorkbookRepository**|Provider for single-document analysis scenarios. Wraps an existing Workbook instance and does not support document creation.|

## Agent Tools

### SpreadProcessingReadAgentTools

Provides read-only agent tools for querying and analyzing spreadsheet content without modifying the underlying document. It is designed for safe analysis-only scenarios, enabling agents to:

  - Inspect used ranges and worksheet metadata.
  - Read small cell ranges for display/inspection.
  - Find all occurrences of text/patterns with sampling.
  - Extract unique values from ranges.
  - Explore workbook and cell styles (names and properties).
  - Filter rows by exact match and aggregate results.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>FilterAndExtract</td><td><pre>CallToolResult FilterAndExtract(
    int filterColumnIndex,
    List<string> filterValues,
    List<int> columnsToReturn,
    string worksheetName = null,
    string documentId = null,
    int maxSampleRows = 5)</pre></td><td>Filters rows where the filter column matches any exact value from filterValues. Returns: Aggregated counts grouped by the values in columnsToReturn. Up to maxSampleRows sample rows (for verification) without reading the entire dataset.</td></tr>
<tr><td>GetUsedCellRange</td><td><pre>CallToolResult GetUsedCellRange(
    string worksheetName = null,
    string documentId = null)
</pre></td><td>Returns the used range of the target (or active) worksheet as top-left and bottom-right zero-based indices. Useful for sizing, previews, and deriving safe subranges for reads.</td></tr>
<tr><td>FindAll</td><td><pre>CallToolResult FindAll(
    string findWhat,
    Range[] searchRanges,
    string worksheetName = null,
    string documentId = null,
    int maxSampleLocations = 10)
</pre></td><td>Searches for findWhat across the specified ranges (or entire sheet if none provided). Case-insensitive.</td></tr>
<tr><td>GetUniqueValues</td><td><pre>CallToolResult GetUniqueValues(
    Range range,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Returns all distinct values within the specified zero-based range. Great for categories, tags, or validating domain values in a column.</td></tr>
<tr><td>GetCellValues</td><td><pre>CallToolResult GetCellValues(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Reads raw cell values from a small range and returns them as a string (for display/inspection).</td></tr>
<tr><td>ListAvailableStyles</td><td><pre>CallToolResult ListAvailableStyles(
    string documentId = null)</pre></td><td>Lists all style names defined in the workbook.</td></tr>
<tr><td>GetStyleProperties</td><td><pre>CallToolResult GetStyleProperties(
    List<string> styleNames,
    string documentId = null)</pre></td><td>Returns detailed properties (font, border, alignment, fill, protection) for the specified existing style names.
Use ListAvailableStyles first to discover valid names.</td></tr>
<tr><td>GetCellStyles</td><td><pre>CallToolResult GetCellStyles(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Returns a 2D array of style names applied over the specified range. For spreadsheet formats only.</td></tr>
<tr><td>GetWorksheetNames</td><td><pre>CallToolResult GetWorksheetNames(
    string documentId = null)</pre></td><td>Returns a list of worksheet names in the workbook.</td></tr>
<tr><td>GetWorkbookStyles</td><td><pre>CallToolResult GetWorkbookStyles(
    string documentId = null)</pre></td><td>Returns all cell styles defined in the workbook including their detailed formatting properties.</td></tr>
</table>

### SpreadProcessingWriteAgentTools

Exposes a set of methods designed for automations and AI agents to modify spreadsheet content and formatting in a controlled way.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>SetCellValues</td><td><pre>public CallToolResult SetCellValues(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    List<List<string>> values,
    string documentId = null,
    string worksheetName = null)</pre></td><td>Writes values (or formulas) to a rectangular range.</td></tr>
<tr><td>SetCellFormula</td><td><pre>public CallToolResult SetCellFormula(
    int rowIndex,
    int columnIndex,
    string formula,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Writes a single-cell formula.</td></tr>
<tr><td>SetCellStyles</td><td><pre>public CallToolResult SetCellStyles(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    List&lt;List&lt;string&gt;&gt; styleNames,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Applies named styles to a rectangular range.</td></tr>
<tr><td>AutoFitColumnsWidth</td><td><pre>public CallToolResult AutoFitColumnsWidth(
    int fromColumnIndex,
    int toColumnIndex,
    string worksheetName = null,
    string documentId = null)
</pre></td><td>Auto-fits widths for a contiguous range of columns.</td></tr>
<tr><td>AutoFitRowsHeight</td><td><pre>public CallToolResult AutoFitRowsHeight(
    int fromRowIndex,
    int toRowIndex,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Auto-fits heights for a contiguous range of rows.</td></tr>
<tr><td>MergeCells</td><td><pre>public CallToolResult MergeCells(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Merges a rectangular range into a single cell.</td></tr>
<tr><td>UnmergeCells</td><td><pre>public CallToolResult UnmergeCells(
    int fromRowIndex,
    int fromColumnIndex,
    int toRowIndex,
    int toColumnIndex,
    string worksheetName = null,
    string documentId = null)</pre></td><td>Reverses merging, restoring individual cells.</td></tr>
</table>

### SpreadProcessingWorksheetAgentTools

Provides worksheet management tools for creating, deleting, and renaming worksheets in a workbook. These tools modify the workbook structure only (they do not alter cell content, formatting, or data). It is designed to be used as part of agent/execution pipelines and exposes high-level operations through [Tool]-annotated methods for agent frameworks.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>AddWorksheets</td><td><pre>public CallToolResult AddWorksheets(
string[] worksheetNames, 
tring documentId = null)</pre></td><td>Adds one or more new worksheets to a workbook. Each worksheet name must be unique within the target workbook.</td></tr>
<tr><td>DeleteWorksheet</td><td><pre>public CallToolResult DeleteWorksheet(
string worksheetName, 
string documentId = null)</pre></td><td>Deletes a worksheet from a workbook by name. The workbook must always retain at least one worksheet; the last remaining worksheet cannot be deleted.</td></tr>
<tr><td>RenameWorksheet</td><td><pre>public CallToolResult RenameWorksheet(
    string currentWorksheetName, 
    string newWorksheetName, 
    string documentId = null)</pre></td><td>Renames an existing worksheet. The new name must be unique within the workbook.</td></tr>
</table>

### SpreadProcessingFileManagementAgentTools 

Provides document lifecycle management tools for spreadsheet workbooks—creating, listing, exporting, and importing in a way that is aligned with the Telerik AI Tools agent model.
This class serves as a high-level agent tool wrapper that delegates core operations to an internal FileManagementTools instance backed by an IWorkbookRepository. The repository acts as the central document store (in-memory, file-based, or custom). Exports/Imports integrate with the file system via the configured outputDir.

<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>CreateWorkbook</td><td><pre>public CallToolResult CreateWorkbook(
string documentId,
string[] worksheetNames)</pre></td><td>Creates a new workbook in the repository with one or more worksheets. If documentId is null/empty, a unique ID is generated. Worksheet names must be unique within the workbook.</td></tr>
<tr><td>ListWorkbooks</td><td><pre>public CallToolResult ListWorkbooks()</pre></td><td>Returns a list of all workbooks known to the repository. Useful for discovery and for obtaining documentId values for subsequent operations.</td></tr>
<tr><td>ExportWorkbook</td><td><pre>public CallToolResult ExportWorkbook(
string filePath,
DocumentFormat format,
string documentId = null)</pre></td><td>Exports a repository workbook to the specified filePath using format. If documentId is not supplied, the repository’s current/default document is exported (if such concept is supported by your IWorkbookRepository).</td></tr>
<tr><td>ImportWorkbook</td><td><pre>public CallToolResult ImportWorkbook(
string filePath,
DocumentFormat format,
string documentName = null)</pre></td><td>Imports a workbook from a given file into the repository. If documentName is not provided, a unique ID is generated.</td></tr>
</table>

### SpreadProcessingFormulaAgentTools

Provides read-only formula and calculation tools for spreadsheets handled through Telerik’s SpreadProcessing stack. It enables you to:

- Evaluate spreadsheet formulas/expressions without modifying the underlying document.
- Discover all available formulas/expressions.
- Retrieve syntax and parameter information for one or more formulas before using them.


<table>
<tr><th>Tool</th><th style="width:40%;">Signature</th><th>Description</th></tr>
<tr><td>CalculateFormulaWithoutChangingTheDocument</td><td><pre>public CallToolResult CalculateFormulaWithoutChangingTheDocument(
string formula,
string documentId = null)</pre></td><td>Evaluates a formula string (e.g., =SUM(A1:A10) or =(A1+A2)/2) without changing the document. Use this for any calculation, aggregation, count, or analysis instead of iterating raw cells.</td></tr>
<tr><td>ListAllFormulas</td><td><pre>public CallToolResult ListAllFormulas(
string documentId = null)</pre></td><td>Returns all supported formulas/expressions along with their category and description. Ideal for discovery and UI pickers.</td></tr>
<tr><td>GetFormulaInfo</td><td><pre>public CallToolResult GetFormulaInfo(
List<string> formulaNames,
string documentId = null)</pre></td><td>Fetches description, syntax, and parameter metadata for the specified formula names.</td></tr>
</table>

## See Also

* [Getting Started with DPL Agent Tools]({%slug agent-tools-getting-started%})
* [Overview]({%slug agent-tools-overview%})
* [RadSpreadProcessing]({%slug radspreadprocessing-overview%})