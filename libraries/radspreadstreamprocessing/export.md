---
title: Export
description: Learn how to export spreadsheet documents to XLSX and CSV formats using RadSpreadStreamProcessing with streaming and minimal memory usage.
page_title: Export
slug: radspreadstreamprocessing-export
tags: export, spread, stream, processing, xlsx, csv, spreadsheet, streaming, workbook, worksheet
published: True
position: 5
---

# Export

With **RadSpreadStreamProcessing** you can export spreadsheet documents to the following file formats:

* XLSX
* CSV

## Specifics

The library dynamically writes the document content into a specified stream. To achieve this, each class responsible for exporting document elements implements `IDisposable` and writes the corresponding content and settings to the stream once disposed. 

The elements in **RadSpreadStreamProcessing** must be created and disposed in a predefined sequence, which is described in the [Getting Started article]({%slug radspreadstreamprocessing-getting-started%}#create-a-spreadsheet-document).

## Setting Export Format

The supported formats require different patterns when writing a document. Because each element is written to the stream once you finish with it instead of writing the whole document at once, you must specify the desired format when you start creating the document. In other words, you set the format when you instantiate [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}).

>Starting with R3 2017, the encoding used to export **CSV** documents is **UTF-8 with BOM**.

**Example 1: Specify Export Format**

<snippet id='codeblock-dkm'/>

Creating an `IWorkbookExporter` instance directly starts the file creation through the `Stream` instance passed as a parameter to the `CreateWorkbookExporter()` method. The document content writing completes once the [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}) instance is disposed.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [SpreadStreamProcessing Large Document Export Demo](https://demos.telerik.com/document-processing/spreadstreamprocessing)
