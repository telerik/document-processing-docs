---
title: Convert Xlsx to PDF
description: Learn how to convert an XLSX file to PDF format by importing with XlsxFormatProvider and exporting with PdfFormatProvider in RadSpreadProcessing.
type: how-to 
page_title: Convert Xlsx to PDF
slug: convert-xlsx-to-pdf
position: 0
tags: radspreadprocessing, xlsx, pdf, excel, conversion, document, processing, export
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.2.511|RadSpreadProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This article shows how to convert an XLSX file to PDF with the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library.

## Solution

Import the file with `XlsxFormatProvider` and export it with `PdfFormatProvider`.

**Example 1: Convert XLSX to PDF**

```csharp
public static void ConvertXlsxToPdf(string path, string resultPath)
{
    var xlsxProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
    var pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();

    var docBytes = File.ReadAllBytes(path);
    var workbook = xlsxProvider.Import(docBytes);

    var resultBytes = pdfProvider.Export(workbook);
    File.WriteAllBytes(resultPath, resultBytes);
}
```

## See Also

* [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})

