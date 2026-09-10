---
title: Overview
description: Learn about RadSpreadStreamProcessing, the Telerik Document Processing library for importing and exporting large XLSX and CSV spreadsheet files with a low memory footprint.
page_title: Overview
slug: radspreadstreamprocessing-overview
tags: spread, stream, processing, spreadsheet, xlsx, csv, streaming, export, performance, memory
published: True
position: 0
---

# Overview

Telerik Document Processing includes the **RadSpreadStreamProcessing** library for importing and exporting large spreadsheet files with a low memory footprint. Use the `SpreadExporter` and `SpreadImporter` APIs to process XLSX and CSV documents sequentially. The library has no dependency on Microsoft Excel, Microsoft Office, or third-party UI components.

![Telerik RadSpreadStreamProcessing overview diagram showing streaming spreadsheet processing between CSV input and XLSX output](images/spread-stream-processing-overview.jpg)  

To skip this introductory article, see [how to get started with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%}).

>note If you do not yet have Telerik Document Processing installed, see [the first steps for installation]({%slug getting-started-first-steps%}).

![Telerik RadSpreadStreamProcessing worksheet example showing an Orders Log report with filters, shipping values, discounts, and color-coded status cells](images/SpreadStreamProcessing-Overview_01.png)

>tip You can find the code sample from the previous image in the [Document Processing SDK repository on GitHub](https://github.com/telerik/document-processing-sdk/tree/master/SpreadStreamProcessing/GenerateDocument).


## What Is Spread Streaming

Spread streaming is a document-processing approach that lets you create or read large spreadsheet documents with high performance and low memory use.

The library saves memory by writing spreadsheet content directly to a stream instead of keeping a full workbook model in memory. Exporters write content as you create worksheets, rows, and cells, and finalize the file when you dispose them.

During import, `RadSpreadStreamProcessing` parses only the required data chunk. This approach helps keep CPU and memory use low.

## Key Features

The library supports the following features:

* Generate large XLSX and CSV documents (1M+ rows).
* Create documents from scratch, or append worksheets to existing workbooks.
* [Export to XLSX and CSV files]({%slug radspreadstreamprocessing-export%}).
* [Import from XLSX and CSV files]({%slug radspreadstreamprocessing-import%}).
* Write directly to a stream, or read only the required data.
* Use less memory than [RadSpreadProcessing]({%slug radspreadprocessing-overview%}) for large-file scenarios.

* **Append** new worksheets to an existing workbook.

* **Grouping**: Organize data in sections, and show or hide the relevant ranges.
* Hidden [rows]({%slug radspreadstreamprocessing-model-rows%}) and [columns]({%slug radspreadstreamprocessing-model-columns%}): Set the hidden state of each row or column.
* [AutoFilter]({%slug radspreadstreamprocessing-features-autofilter%}): Show or hide rows based on column values. `AutoFilter` supports value, custom comparison, top or bottom N, and dynamic date filters.
* [Cell formatting]({%slug radspreadstreamprocessing-model-cells%}#set-a-format): Apply the required appearance to cells.
* [Cell styles]({%slug radspreadstreamprocessing-features-styling-cell-styles%}): Apply multiple format options in one step and keep formatting consistent.
* [Merge cells]({%slug radspreadstreamprocessing-model-cells%}#merge-cells): Merge adjacent cells across multiple rows and columns.

You can also control the view state of a sheet:

* [Set the scale factor]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#scale-a-document).
* [Control the selection and active cell]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#add-selection-to-a-document).
* [Show or hide gridlines]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#hide-grid-lines-and-row-or-column-headers).
* [Show or hide row and column headers]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#hide-grid-lines-and-row-or-column-headers).
* [Freeze panes]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#freeze-panes) to keep part of the worksheet visible while scrolling.
* [Change the first visible cell]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#change-the-first-visible-cell) to control the part of the sheet that appears when a viewer opens the document.

## RadSpreadStreamProcessing versus RadSpreadProcessing

The main differences between the two spreadsheet processing libraries include:

* `RadSpreadStreamProcessing` writes directly to a stream, while [RadSpreadProcessing]({%slug radspreadprocessing-overview%}) builds an in-memory document model. As a result, the streaming library uses much less memory.
* **RadSpreadStreamProcessing** does not run formula or layout-related calculations, so file generation is faster than with **RadSpreadProcessing**.

## When to Use RadSpreadStreamProcessing

Use the `RadSpreadStreamProcessing` library when you need to create or read large datasets with low memory use. You can also append data to an existing document stream. Export the generated document directly to a file or stream, for example, to send it to a client.

## Online Demos

The following demos show common `RadSpreadStreamProcessing` scenarios:

| Demo | Description |
|---|---|
| [SpreadStreamProcessing Large Document Export](https://demos.telerik.com/document-processing/spreadstreamprocessing) | With the SpreadStreamProcessing APIs, you can generate large XLSX and CSV files. |
| [SpreadStreamProcessing Import Document](https://demos.telerik.com/document-processing/spreadstreamprocessing/import_document) | This example shows how you can retrieve data from XLSX or CSV files using the SpreadStreamProcessing library. |

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Worksheet View Exporter]({%slug radspreadstreamprocessing-features-worksheetviewexporter%})
* [RadSpreadProcessing]({%slug radspreadprocessing-overview%})
