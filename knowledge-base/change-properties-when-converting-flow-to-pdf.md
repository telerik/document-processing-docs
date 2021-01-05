---
title: Change Flow Document Properties when converting to PDF
description:  Change Flow Document Properties when converting to PDF
type: how-to troubleshooting
page_title:  Change Flow Document Properties when converting to PDF
slug: change-properties-when-converting-flow-to-pdf
position: 0
tags: pdf, html, docx, page, margin  
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|RadWordsProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library allows you to convert various documents formats (docx, rtf, txt, html) to PDF. When converting you may need to modify the document properties (page size or orientation, margins).

## Solution 

Change the properties of the RadFlowDocument.

#### __C# Change the RadFlowDocument properties while exporting.__ 

{{region change-properties-when-converting-flow-to-pdf1}}
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


{{endregion}}
 