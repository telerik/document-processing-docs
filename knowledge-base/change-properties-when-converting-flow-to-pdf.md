---
title: Change Flow Document Properties when converting to PDF
description: Learn how to change the page size, orientation, and margins of a RadFlowDocument when converting from DOCX, RTF, TXT, or HTML to PDF format.
type: how-to troubleshooting
page_title:  Change Flow Document Properties when converting to PDF
slug: change-properties-when-converting-flow-to-pdf
position: 0
tags: radwordsprocessing, pdf, docx, html, margin, conversion, document, processing
res_type: kb
---

## Environment

|Version|Product|Author|
|----|----|----|
|2020.1.218|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library allows you to convert various document formats (DOCX, RTF, TXT, HTML) to PDF. When converting, you may need to change the document properties such as page size, orientation, or margins.

## Solution

Change the properties of the `RadFlowDocument` before exporting to PDF.

**Example 1: Change the RadFlowDocument Properties While Exporting**

```csharp
HtmlFormatProvider htmlProvider = new HtmlFormatProvider();
RadFlowDocument document = htmlProvider.Import(html);

foreach (var section in document.Sections)
{
    section.PageMargins = new Padding(150);
    section.PageSize = PaperTypeConverter.ToSize(PaperTypes.A4);
    section.Rotate(PageOrientation.Landscape);
}

PdfFormatProvider pdfProvider = new PdfFormatProvider();

using (Stream output = File.Create(save))
{              
    pdfProvider.Export(document, output);
}
```

## See Also

* [RadWordsProcessing Overview]({%slug radwordsprocessing-overview%})

