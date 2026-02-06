---
title: Saving DOCX to PDF Removes Table Borders
description: This article provides a solution to the issue where table borders are removed when saving a DOCX file to PDF using the PDFFormatProvider in RadWordsProcessing for Document Processing.
type: troubleshooting
page_title: Saving DOCX to PDF Removes Table Borders | Troubleshooting | RadWordsProcessing
slug: saving-docx-to-pdf-removes-table-borders
tags: radwordsprocessing, docx, pdf, table, borders, pdfformatprovider
res_type: kb
---

## Environment 
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
Table borders are removed when saving a DOCX file to PDF using the PdfFormatProvider in RadWordsProcessing.

The table in the DOCX file has standard Word border styles applied to all borders, including dotted lines. However, when using the PdfFormatProvider to save the document as PDF, the borders become invisible and are not displayed in the resulting PDF file. Even when setting the table border width to 3pt, the borders still do not appear in the PDF file.

|Table Borders in DOCX|Missing Table Borders in exported PDF| 
|----|----|
|![DOCX with table borders](images/saving-docx-to-pdf-removes-table-borders001.png) |![PDF without table borders](images/saving-docx-to-pdf-removes-table-borders002.png) |

## Solution
Currently, there is a limitation in RadWordsProcessing where the PdfFormatProvider does not support all types of border styles. However, there is a workaround that can be used to apply a single border to the table elements in the RadFlowDocument before exporting it to PDF.

Here is an example in C# that demonstrates the workaround:

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

Please note that this workaround applies a single border with a width of 1pt and a black color to all table elements in the RadFlowDocument. You can modify the border properties as needed.
