---
title: Convert Docx to PDF
description: This article demonstrates how you can convert a docx file to a PDF with the WordsProcessing library.
type: how-to 
page_title: Convert Docx to PDF
slug: convert-docx-to-pdf
position: 0
tags: docx, pdf, word
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.3.909|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This article demonstrates how you can convert a Docx file to a PDF with the [WordsProcessing]({%slug radwordsprocessing-overview%}) library. In the [WordsProcessing Getting Started]({%slug radwordsprocessing-getting-started%}) article you can find all the required assembly references.

## Solution

The solution is to import the file with the DocxFormatProvider and export it with the PdfFormatProvider. 

#### Convert Docx to PDF

```csharp.

    public static void ConverDocxToPdf(string path, string resultPath)
    {
        var docxPRovider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
        var pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
    
        var docBytes = File.ReadAllBytes(path);
        var document = docxPRovider.Import(docBytes);
    
        var resultBytes = pdfProvider.Export(document);
        File.WriteAllBytes(resultPath, resultBytes);
    }

```

