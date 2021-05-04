---
title: Create Pdf from Image
description: The example is showing how create a pdf file from a single image
type: how-to
page_title: Create Pdf from Image
slug: pdfprocessing-create-pdf-from-image
position: 0
tags: pdf, image, create
ticketid: 1518025
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.1.325|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The example is showing how to create a PDF file by using an image. 

## Solution

In this example you will create a brand new PDF document, add a page to it, and draw the image using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})

#### __C#__

{{region kb-radpdfprocessing-editing-fixedcontenteditor}}

    var doc = new RadFixedDocument();
    var page = doc.Pages.AddPage();
    var editor = new FixedContentEditor(page);

    using (FileStream fs = new FileStream(@"..\..\telerik_logo.jpg", FileMode.Open))
    {
        editor.DrawImage(fs);
    }

    var provider = new PdfFormatProvider();
    File.WriteAllBytes(@"result.pdf", provider.Export(doc));


{{endregion}}

