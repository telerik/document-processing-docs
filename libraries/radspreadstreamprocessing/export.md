---
title: Export
page_title: Export
description: Export
slug: radspreadstreamprocessing-export
tags: export
published: True
position: 4
---

# Export

With **RadSpreadStreamProcessing** you can export spreadsheet documents to the following file formats:

* XLSX

* CSV

## Specifics

The library writes dynamically the document content into a specified stream. To achieve this, each of the classes responsible for exporting the elements of the document implement **IDisposable** and writes the corresponding content and settings to the stream once it is disposed. 

This is why the elements in **RadSpreadStreamProcessing** must be created and disposed following a predefined sequence, which is described in the [Getting Started article]({%slug radspreadstreamprocessing-getting-started%}#create-a-spreadsheet-document).

## Setting Export Format

The supported formats require to follow different patterns when writing a document and because each element is written in the stream once you are done with it instead of writing the whole document at once, the desired format must be specified when you start creating the document. In other words, when instantiating [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}).

>As of R3 2017, the encoding used to export **CSV** documents is **UTF-8 with BOM**.

#### **Example 1: Specify export format**

{{region radspreadstreamprocessing-export_0}}

	IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Csv, stream);     
{{endregion}}

Writing the document content finishes once the [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}) instance is disposed.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})