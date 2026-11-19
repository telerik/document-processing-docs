---
title: Appending a Worksheet to an Existing XLSX with RadSpreadStreamProcessing
description: Learn how to append a worksheet to an existing XLSX workbook with RadSpreadStreamProcessing and open the stream with read and write access.
type: how-to
page_title: Appending XLSX Worksheets with RadSpreadStreamProcessing | Telerik Document Processing
slug: appending-worksheet-to-existing-xlsx-spreadstreamprocessing
tags: radspreadstreamprocessing, xlsx, worksheet, append, export
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadSpreadStreamProcessing | <a href="https://www.telerik.com/blogs/author/yoan-karamanov" target="_blank">Yoan Karamanov</a> |

## Description

**RadSpreadStreamProcessing** lets you add a worksheet to an existing XLSX workbook with `SpreadExportMode.Append`. The existing stream must support seeking, reading, and writing.

This knowledge base article also answers the following questions:

* How can I append a worksheet without replacing existing worksheets?
* Which stream capabilities does `SpreadExportMode.Append` require?
* How can I check existing worksheet names before I append a sheet?

## Solution

To append a worksheet, follow these steps:

1. Open the existing XLSX file with `FileMode.Open` and `FileAccess.ReadWrite`.
2. Create the workbook exporter with `SpreadDocumentFormat.Xlsx` and `SpreadExportMode.Append`.
3. Create a worksheet with a unique name, then dispose the worksheet and workbook exporters to finish writing.

The following example adds a `Summary` worksheet to an existing workbook:

```csharp
using System.IO;
using Telerik.Documents.SpreadsheetStreaming;

string filePath = "existing-workbook.xlsx";
string worksheetName = "Summary";

using (FileStream stream = File.Open(
    filePath,
    FileMode.Open,
    FileAccess.ReadWrite))
using (Telerik.Documents.SpreadsheetStreaming.IWorkbookExporter workbook =
    Telerik.Documents.SpreadsheetStreaming.SpreadExporter.CreateWorkbookExporter(
        Telerik.Documents.SpreadsheetStreaming.SpreadDocumentFormat.Xlsx,
        stream,
        Telerik.Documents.SpreadsheetStreaming.SpreadExportMode.Append))
{
    using (IWorksheetExporter worksheet =
        workbook.CreateWorksheetExporter(worksheetName))
    {
        using (IRowExporter row = worksheet.CreateRowExporter())
        {
            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue("Quarter");
            }

            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue("Total");
            }
        }

        using (IRowExporter row = worksheet.CreateRowExporter())
        {
            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue("Q1");
            }

            using (ICellExporter cell = row.CreateCellExporter())
            {
                cell.SetValue(1250);
            }
        }
    }
}
```

### Key Points

Before you append a worksheet, check these requirements:

* Open an existing XLSX file with a stream that supports seeking, reading, and writing.
* Call `IWorkbookExporter.GetSheetInfos()` and compare the proposed name with each returned `SheetInfo.Name`. `CreateWorksheetExporter()` throws an `ArgumentException` when the name already exists.
* Dispose `IWorksheetExporter` before `IWorkbookExporter`. The workbook exporter finalizes the XLSX package when you dispose it.

>important The default `SpreadExportMode.Create` mode replaces workbook content in the stream. Use `SpreadExportMode.Append` to keep existing worksheets.

## See Also

* [Workbook exporters and export modes]({%slug radspreadstreamprocessing-model-workbook%})
* [RadSpreadStreamProcessing basics]({%slug radspreadstreamprocessing-overview%})
