---
title: Import
description: Learn how to import and read spreadsheet documents from XLSX and CSV formats using the RadSpreadStreamProcessing library in your .NET applications.
page_title: Import
slug: radspreadstreamprocessing-import
tags: import, spread, stream, processing, xlsx, csv, spreadsheet, streaming, read, parse
published: True
position: 4
---

# Import

With `RadSpreadStreamProcessing` you can read spreadsheet documents from the following file formats:

* XLSX

* CSV

This functionality is available starting with R3 2022.

## Specifics

The library dynamically reads the document content. To achieve this, the `IWorksheetImporter` and `IWorkbookImporter` classes responsible for importing the elements of the document implement `IDisposable` and keep the corresponding content and settings in memory until disposed.

## Read File Data

To read the data from a file, parse the desired elements in sequence keeping the following order:

1. Read the Workbook

2. Read a Worksheet

3. Read Columns (optional)

4. Read Rows

5. Read Cells

**Example 1: Open an XLSX file and iterate through every worksheet, row, and cell importer**

<snippet id='codeblock-dkp'/>

Through the importer objects, you can access the properties of the different elements.

> Starting with R1 2023 SP1, there are separate properties for the formula and the value in the `ICellImporter`.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Handling Empty Cells with RadSpreadStreamProcessing]({%slug handle-empty-cells-radspreadstreamprocessing%})
* [SpreadStreamProcessing Import Document Demo](https://demos.telerik.com/document-processing/spreadstreamprocessing/import_document)