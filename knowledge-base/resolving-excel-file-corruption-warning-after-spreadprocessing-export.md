---
title: Fixing Corrupt Excel Files After Export Using Telerik SpreadProcessing
description: Resolving issues where exported Excel files using Telerik SpreadProcessing show corruption warnings after upgrading to version 2025.2.520.
type: how-to
page_title: Resolving Excel File Corruption Warning After SpreadProcessing Export
meta_title: Resolving Excel File Corruption Warning After SpreadProcessing Export
slug: resolving-excel-file-corruption-warning-after-spreadprocessing-export
tags: telerik-document-processing, spreadprocessing, excel-export, memory-stream, corrupted-file
res_type: kb
ticketid: 1695962
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Exporting an Excel file using Telerik SpreadProcessing shows a corruption warning when opening the file in Excel. This issue occurs when reusing the same `MemoryStream` for both import and export operations without resetting or truncating the stream. The problem started after upgrading to version 2025.2.520 due to changes in the library that replaced `Telerik.Zip` with `System.IO.Compression`. 

This knowledge base article also answers the following questions:
- How to fix "Excel found unreadable content" errors after export?
- Why does my exported Excel file open with a corruption warning?
- How to resolve MemoryStream issues with Telerik SpreadProcessing?

## Solution

To ensure the exported files are not corrupted, reset or truncate the `MemoryStream` before export, or use a new stream. Follow these steps:

1. **Reset and Truncate the Stream:**
   Before exporting, truncate the `MemoryStream` to remove residual content and reset its position. Use the following code:

   ```csharp
   XlsxFormatProvider formatProvider = new XlsxFormatProvider();
   using (Workbook workbook = formatProvider.Import(memoryStream))
   {
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

### Additional Notes:
- If you are not explicitly using the [RadZipLibrary](https://docs.telerik.com/devtools/document-processing/libraries/radziplibrary/overview), you can safely remove its reference in your project. Starting with version 2025.2.520, Telerik Document Processing Libraries use `System.IO.Compression` internally.

## See Also

- [Telerik SpreadProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/spreadprocessing/overview)
- [RadZipLibrary Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radziplibrary/overview)
- [Release Notes for Telerik Document Processing Libraries 2025.2.520](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history/progress-telerik-document-processing-2025-2-520-changelog)
