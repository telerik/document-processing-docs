---
title: Export
description: Learn how to export spreadsheet documents to XLSX and CSV with RadSpreadStreamProcessing and understand the streaming export workflow.
page_title: RadSpreadStreamProcessing Export Overview
slug: radspreadstreamprocessing-export
tags: export, spread, stream, processing, xlsx, csv, spreadsheet, streaming, workbook, worksheet
published: True
position: 5
components: [spreadstreamprocessing]
---

# Export

Use RadSpreadStreamProcessing when you need to export large spreadsheet documents directly to a stream with a low memory footprint. The library is optimized for forward-only writing, which makes it suitable for server-side generation and high-volume export scenarios.

## Supported Export Formats

RadSpreadStreamProcessing can export spreadsheet documents to these formats:

* XLSX
* CSV

Choose `XLSX` when you need a workbook file that preserves spreadsheet structure. Choose `CSV` when you need a text-based export of worksheet data.

## How the Streaming Export Works

RadSpreadStreamProcessing writes document content directly to the target stream as you create each workbook element. To support that behavior, the exporter types implement `IDisposable` and write their corresponding content and settings when they are disposed.

Because of this streaming model, you must create and dispose elements in the correct order. The export process is sequential, so once an element is written to the stream, the library does not keep the entire document in memory for later restructuring.

This predefined creation and disposal sequence is described in [Getting Started with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%}#create-a-spreadsheet-document).

## Typical Export Workflow

In most scenarios, the export flow looks like this:

1. Open the target `Stream`.
2. Create an [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}) for the desired format.
3. Create worksheets, rows, and cells in the required order.
4. Dispose each element when you finish writing to it.
5. Dispose the `IWorkbookExporter` to finalize the document.

## Setting Export Format

The supported formats follow different output patterns, so you must choose the export format when you start creating the document, which means when you instantiate [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}).

>note
>
> Starting with **R3 2017**, the encoding used to export CSV documents is **UTF-8 with BOM**.

**Example 1: Create an IWorkbookExporter that writes CSV content to the target stream**

<snippet id='codeblock-dkm'/>

Creating `IWorkbookExporter` starts writing the file by using the `Stream` instance that you pass to the `CreateWorkbookExporter()` method. Writing finishes when the [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}) instance is disposed.

## Configuring CSV Export Settings

By default, the CSV export separates the values with a comma (`,`). To use a different delimiter, for example, the semicolon (`;`) that is common in cultures where the comma is the decimal separator, pass a `SpreadCsvExportSettings` instance to the `SpreadExporter.CreateCsvExporter()` method.

| Member | Description |
|---|---|
| `SpreadCsvExportSettings.Delimiter` | Gets or sets the character that separates the fields in each record. The default value is a comma (`,`). |
| `SpreadExporter.CreateCsvExporter(Stream, SpreadCsvExportSettings, SpreadExportMode)` | Creates an `IWorkbookExporter` that writes CSV content by using the specified settings. The `SpreadExportMode` parameter is optional and defaults to `SpreadExportMode.Create`. When you pass `null` for the settings, the defaults are used. |

The delimiter is applied to the separators between the values of each row, including the separators for skipped cells. Values that contain the delimiter, a double quote (`"`), or a line break are enclosed in double quotes. The quote character is not configurable.

**Example 2: Export a CSV document that uses a semicolon as a delimiter**

```csharp
SpreadCsvExportSettings settings = new SpreadCsvExportSettings
{
    Delimiter = ';'
};

using (Stream stream = File.Open("output.csv", FileMode.Create, FileAccess.ReadWrite))
using (IWorkbookExporter workbook = SpreadExporter.CreateCsvExporter(stream, settings))
{
    using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("Sheet1"))
    {
        using (IRowExporter row = worksheet.CreateRowExporter())
        {
            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue("Name");
            }

            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue("Price; USD");
            }
        }
    }
}
```

The previous code produces the line `Name;"Price; USD"`.

## What to Verify After Export

After the export finishes, verify these points:

* The output stream contains the expected file format.
* The workbook structure is complete and no elements were skipped because of an incorrect creation or disposal order.
* CSV output uses the expected UTF-8 with BOM encoding when you export to CSV.

## Next Steps

Continue with the article that matches your next task:

1. Read [Getting Started]({%slug radspreadstreamprocessing-getting-started%}) for the full workbook, worksheet, row, and cell creation sequence.
2. Read [Workbook]({%slug radspreadstreamprocessing-model-workbook%}) for details about `IWorkbookExporter` and workbook-level export behavior.
3. Review the [SpreadStreamProcessing Large Document Export Demo](https://demos.telerik.com/document-processing/spreadstreamprocessing) to see streaming export in a larger scenario.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [SpreadStreamProcessing Large Document Export Demo](https://demos.telerik.com/document-processing/spreadstreamprocessing)
