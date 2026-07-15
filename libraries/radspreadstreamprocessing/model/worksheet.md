---
title: Worksheet
description: Learn about the worksheet model in RadSpreadStreamProcessing, including how to create and work with worksheets in a workbook.
page_title: Worksheet
slug: radspreadstreamprocessing-model-worksheet
tags: worksheet, spread, stream, processing, spreadsheet, model, rows, cells, workbook, export
published: True
position: 2
---

# Worksheet

A worksheet is a collection of cells organized in rows and columns. The following sections explain how to export worksheets with `RadSpreadStreamProcessing`.

* [What Is a Worksheet](#what-is-a-worksheet)

* [IWorksheetExporter Interface](#iworksheetexporter-interface)

* [Using IWorksheetExporter](#using-iworksheetexporter)

 
## What Is a Worksheet

A worksheet is a collection of cells organized in rows and columns. It is the working surface you interact with to enter data. Each worksheet contains up to 1048576 rows and 16384 columns and serves as a giant table that allows you to organize information. Typically, a workbook contains several worksheets with related content and only one of the worksheets is active at a time.



## IWorksheetExporter Interface

In `RadSpreadStreamProcessing`, a worksheet can be exported through the [`IWorksheetExporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorksheetExporter.html). This interface defines members that allow you to create and skip rows or columns and merge cells.

### Using IWorksheetExporter

You can create a concrete instance of `IWorksheetExporter` through the `CreateWorksheetExporter()` method of [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}). **Example 1** demonstrates how to add a worksheet to a workbook.

**Example 1: Create a worksheet exporter named My sheet**

<snippet id='codeblock-dlx'/>

>`IWorksheetExporter` inherits from [`IDisposable`](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

>tip A worksheet must contain at least one row. Otherwise, an exception is thrown.

## See Also

* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})