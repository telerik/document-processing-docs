---
title: Create Pdf from Image
description: The example is showing how create a pdf file from an image using PdfProcessing.
type: how-to
page_title: Create Pdf from Image
slug: pdfprocessing-create-pdf-from-image
position: 0
tags: pdf, image, create, convert, insert
ticketid: 1518025
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2022.2.613|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The example is showing how to create a PDF file by using an image. 

## Solution

In this example you will create a brand new PDF document, add a page to it, and draw the image using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}).

#### __C#__

{{region kb-radpdfprocessing-editing-fixedcontenteditor}}

	// If you are working in a .NET Core application, you will need to also provide an image resolver. You can use the default implementation provided in Telerik.Documents.ImageUtils:
	// Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
	// Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

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



## See Also

- [Getting Started with PdfProcessing]({%slug radpdfprocessing-getting-started%})
- [Cross-Platform Support | Images]({%slug radpdfprocessing-cross-platform-images%})
- [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})