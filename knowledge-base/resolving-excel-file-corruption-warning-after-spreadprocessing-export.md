---
title: Resolve Exporting Corrupted Excel Files With SpreadProcessing
description: Resolve corrupted Excel files exported with SpreadProcessing in versions 2025.2.520 and newer.
type: how-to
page_title: Resolve Exporting Corrupted Excel Files With SpreadProcessing
meta_title: Resolve Exporting Corrupted Excel Files With SpreadProcessing
slug: resolving-excel-file-corruption-warning-after-spreadprocessing-export
tags: telerik, document, processing, spread, excel, export, memory, stream, corrupted, file
res_type: kb
ticketid: 1695962
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Exporting an Excel file using Telerik [SpreadProcessing]({%slug radspreadprocessing-overview%}) shows a corruption warning when opening the file in Excel. 

This issue occurs when reusing the same `MemoryStream` for both import and export operations without resetting or truncating the stream. The issue originates in version 2025.2.520, where `Telerik.Zip` was replaced with `System.IO.Compression`.

This knowledge base article shows how to fix the "Excel found unreadable content" error after export.

## Solution

To ensure the exported files are not corrupted, reset or truncate the `MemoryStream` before export, or use a new stream. Follow these steps:

1. **Reset and Truncate the Stream:**
   Before exporting, truncate the `MemoryStream` to remove residual content and reset its position. Use the following code:

   ```csharp
   XlsxFormatProvider formatProvider = new XlsxFormatProvider();
   using (Stream memoryStream = new FileStream("path to your document", FileMode.Open))
   {
       Workbook workbook = formatProvider.Import(memoryStream)
       memoryStream.SetLength(0);    // Truncate stream to remove previous content
       memoryStream.Position = 0;    // Reset position to start
       formatProvider.Export(workbook, memoryStream);
       formatProvider = null;
   }
   ```

2. **Use a New MemoryStream for Export:**
   Alternatively, create a new `MemoryStream` for exporting to avoid residual data issues:

   ```csharp
   XlsxFormatProvider formatProvider = new XlsxFormatProvider();
   using (Workbook workbook = formatProvider.Import(memoryStream))
   {
       using (MemoryStream newMemoryStream = new MemoryStream())
       {
           formatProvider.Export(workbook, newMemoryStream);
           // Use newMemoryStream for further processing
       }
       formatProvider = null;
   }
   ```

## See Also

- [SpreadProcessing]({%slug radspreadprocessing-overview%}) 
- [Release Notes for Telerik Document Processing Libraries 2025.2.520](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history/progress-telerik-document-processing-2025-2-520-changelog)
