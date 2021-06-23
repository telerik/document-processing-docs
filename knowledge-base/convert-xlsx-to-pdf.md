---
title: Convert Xlsx to PDF
description: This article demonstrates how you can convert an xlsx file to a PDF with the SpreadProcessing library.
type: how-to 
page_title: Convert Xlsx to PDF
slug: convert-xlsx-to-pdf
position: 0
tags: xlsx, pdf, Excel
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.2.511|RadSpreadProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This article demonstrates how you can convert a Xlsx  file to a PDF with the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library.

## Solution

The solution is to import the file with the XlsxFormatProvider and export it with the PdfFormatProvider. 

#### [C#] Convert Xlsx to PDF

{{region kb-convert-xlsx-topdf1}}

    public static void ConvertXlsxToPdf(string path, string resultPath)
    {
        var xlsxProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
        var pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
    
        var docBytes = File.ReadAllBytes(path);
        var workbook = xlsxProvider.Import(docBytes);
    
        var resultBytes = pdfProvider.Export(workbook);
        File.WriteAllBytes(resultPath, resultBytes);
    }

{{endregion}}

