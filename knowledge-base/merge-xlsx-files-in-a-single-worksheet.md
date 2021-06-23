---
title: Merge Xlsx files in a single Workbook
description:  Merge several XSLX files in a single Workbook using SpreadProcessing.
type: how-to 
page_title:  Merge Xlsx files in a single Workbook
slug: merge-xlsx-files-in-a-single-worksheet
position: 0
tags: merge, xlsx, Excel, Workbook  
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|RadSpreadProcessing|2021.1.113|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description
 
You have a multiple Xlsx files and you want to merge them in single file. 

## Solution

You can iterate all files, import them, and copy their worksheets in a new Workbook. 

#### __[C#] Merge multiple worksheet in a single Workbook__

{{region kb-merge-xlsx-files-in-a-single-worksheet_0}}

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

{{endregion}}
