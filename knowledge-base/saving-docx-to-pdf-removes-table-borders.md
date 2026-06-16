---
title: Saving DOCX to PDF Removes Table Borders
description: Learn how to resolve table borders that disappear when you save a DOCX file to PDF with PdfFormatProvider in RadWordsProcessing for Document Processing.
type: troubleshooting
page_title: Saving DOCX to PDF Removes Table Borders | Troubleshooting | RadWordsProcessing
slug: saving-docx-to-pdf-removes-table-borders
tags: radwordsprocessing, docx, pdf, table, border, document, processing, troubleshooting
res_type: kb
---

## Environment 
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
Table borders disappear when you save a DOCX file to PDF with the `PdfFormatProvider` in RadWordsProcessing.

The table in the DOCX file has standard Word border styles applied to all borders, including dotted lines. When you use the `PdfFormatProvider` to save the document as PDF, the borders become invisible and do not appear in the resulting PDF file. The borders still do not appear even if you set the table border width to 3pt.

|Table Borders in DOCX|Missing Table Borders in exported PDF| 
|----|----|
|![DOCX with table borders](images/saving-docx-to-pdf-removes-table-borders001.png) |![PDF without table borders](images/saving-docx-to-pdf-removes-table-borders002.png) |

## Cause

The `PdfFormatProvider` in RadWordsProcessing does not support all Word border styles. Dotted and other non-standard border types are not rendered during the PDF export.

## Solution
Currently, RadWordsProcessing has a limitation where the `PdfFormatProvider` does not support all border styles. You can apply a single border to the table elements in the `RadFlowDocument` before exporting to PDF as a workaround.

The following C# example shows the workaround:

```csharp
FileInfo templateItem = new FileInfo(@"test_table_with_dottedborders.docx");
DocxFormatProvider docxFormatProvider = new DocxFormatProvider();
PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();

RadFlowDocument wordDocument;

using (FileStream fileStream = templateItem.OpenRead())
{
    wordDocument = docxFormatProvider.Import(fileStream);
}

foreach (Section s in wordDocument.Sections)
{ 
    foreach (var b in s.Blocks)
    {
        Table t = b as Table;
        if (t != null)
        {
            t.Borders = new TableBorders(new Border(1, BorderStyle.Single, new ThemableColor(Colors.Black)));
        }
    }
}

string pdfSavePath = @"test_savedbyPdfFormatProvider.pdf";
File.Delete(pdfSavePath);

using (FileStream outputStreamPdf = new FileStream(pdfSavePath, FileMode.OpenOrCreate))
{
    pdfFormatProvider.Export(wordDocument, outputStreamPdf);
}
```

![PDF with table borders](images/saving-docx-to-pdf-removes-table-borders003.png)  

This workaround applies a single border with a width of 1pt and a black color to all table elements in the `RadFlowDocument`. You can modify the border properties as needed.

## See Also

* [Working with Tables in RadWordsProcessing]({%slug radwordsprocessing-model-table%})
