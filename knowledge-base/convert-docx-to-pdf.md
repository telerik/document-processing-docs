---
title: Convert Docx to PDF
description: Learn how to convert a DOCX file to PDF format by importing with DocxFormatProvider and exporting with PdfFormatProvider in the WordsProcessing library.
type: how-to 
page_title: Convert Docx to PDF
slug: convert-docx-to-pdf
position: 0
tags: radwordsprocessing, docx, pdf, conversion, word, document, processing, export
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.3.909|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This article shows how to convert a DOCX file to PDF with the [WordsProcessing]({%slug radwordsprocessing-overview%}) library. For the required assembly references, see the [WordsProcessing Getting Started]({%slug radwordsprocessing-getting-started%}) article.

## Solution

Import the file with the `DocxFormatProvider` and export it with the `PdfFormatProvider`:

```csharp
public static void ConvertDocxToPdf(string path, string resultPath)
{
    var docxProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
    var pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

    var docBytes = File.ReadAllBytes(path);
    var document = docxProvider.Import(docBytes);

    var resultBytes = pdfProvider.Export(document);
    File.WriteAllBytes(resultPath, resultBytes);
}
```

## See Also

* [WordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [WordsProcessing Getting Started]({%slug radwordsprocessing-getting-started%})

