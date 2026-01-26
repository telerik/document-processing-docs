---
title: Opening Excel Files Locked by Another User/Process with Telerik SpreadProcessing
description: Learn how to open Excel files locked by another user or process in read-only mode using Telerik SpreadProcessing.
type: how-to
page_title: How to Open Locked Excel Files in Read-Only Mode with Telerik SpreadProcessing
meta_title: How to Open Locked Excel Files in Read-Only Mode with Telerik SpreadProcessing
slug: spreadprocessing-open-locked-files-read-only
tags: telerik, document, processing, spread, file, access, locked, read, only, libraries, excel, xlsx, xlsm, xls
res_type: kb
ticketid: 1707647
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td>Telerik Document Processing SpreadProcessing</td>
</tr>
<tr>
<td> Version </td>
<td>2025.4.1104</td>
</tr>
</tbody>
</table>

## Description

This article shows how to open a file that is already opened by another user or process. Usually, an exception is received because the file is locked for exclusive access. The solution is to open the file in read-only mode without modifying it.

This knowledge base article also answers the following questions:
- How to open locked files in Telerik SpreadProcessing?
- How to handle locked file exceptions in SpreadProcessing?
- Can SpreadProcessing open files in read-only mode?

## Solution

To open a file locked by another user or process, load it into a `MemoryStream` using a read-only `FileStream`. This approach allows concurrent access and bypasses the file lock. Follow these steps:

1. Open the file using `FileStream` with `FileAccess.Read` and `FileShare.ReadWrite`.
2. Copy the file contents to a `MemoryStream`.
3. Use the `MemoryStream` with `XlsxFormatProvider` to import the workbook.

Here is the code example:

```csharp
// Import necessary namespaces
using Telerik.Windows.Documents.Spreadsheet.Model;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;

Workbook workbook;
XlsxFormatProvider formatProvider = new XlsxFormatProvider();

// Open file with read-only access and allow sharing for reading and writing
using (FileStream fileStream = new FileStream("file.xlsx", FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
{
    // Copy to memory stream to release file lock immediately
    using (MemoryStream memoryStream = new MemoryStream())
    {
        fileStream.CopyTo(memoryStream);
        memoryStream.Position = 0;

        workbook = formatProvider.Import(memoryStream, null);
    }
}
```

### Steps Explained:
1. The `FileStream` opens the file with read-only access (`FileAccess.Read`) and allows sharing (`FileShare.ReadWrite`).
2. The `MemoryStream` receives the file contents, enabling the file lock to be released.
3. The `XlsxFormatProvider` imports the workbook from the `MemoryStream`.

## See Also

- [SpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [XlsxFormatProvider Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/format-providers/openxml/xlsx)
- [FileStream Class in .NET](https://learn.microsoft.com/en-us/dotnet/api/system.io.filestream)
