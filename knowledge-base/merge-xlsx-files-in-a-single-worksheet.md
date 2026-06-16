---
title: Merging Multiple XLSX Files into a Single Workbook
description: Learn how to merge multiple XLSX files into a single workbook by importing and copying worksheets with RadSpreadProcessing.
type: how-to
page_title: Merging Multiple XLSX Files into a Single Workbook
slug: merge-xlsx-files-in-a-single-worksheet
position: 0
tags: radspreadprocessing, xlsx, excel, merge, workbook, document, processing, spreadsheet
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2021.1.113 | RadSpreadProcessing |[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

You have multiple XLSX files and you want to merge them into a single file.

## Solution

Iterate all files, import them, and copy their worksheets into a new `Workbook`:

**Example 1: Merge Multiple Worksheets into a Single Workbook**

```csharp
List<string> files = new List<string>();
files.Add("Book1.xlsx");
files.Add("Book2.xlsx");

var provider = new XlsxFormatProvider();

var workbook = new Workbook();

foreach (string fileName in files)
{
    var newSheet = workbook.Worksheets.Add();
    newSheet.Name = fileName;
    var currentFile = File.ReadAllBytes(fileName);
    var importedXlsx = provider.Import(currentFile);
    newSheet.CopyFrom(importedXlsx.Worksheets[0]);
}

var resultXlsx = provider.Export(workbook);
File.WriteAllBytes("result.xlsx", resultXlsx);
```

## See Also

* [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
* [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
