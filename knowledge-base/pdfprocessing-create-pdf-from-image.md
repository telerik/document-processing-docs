---
title: Create Pdf from Image
description: Learn how to create a PDF file from an image by using the FixedContentEditor and PdfFormatProvider classes in RadPdfProcessing.
type: how-to
page_title: Create Pdf from Image
slug: pdfprocessing-create-pdf-from-image
position: 0
tags: radpdfprocessing, pdf, image, creation, document, processing, fixed, convert
ticketid: 1518025
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2022.2.613|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This article shows how to create a PDF file from an image. 

## Solution

Create a new PDF document, add a page to it, and draw the image by using the [`FixedContentEditor`]({%slug radpdfprocessing-editing-fixedcontenteditor%}).

```csharp

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


```



## See Also

* [Getting Started with PdfProcessing]({%slug radpdfprocessing-getting-started%})
* [Cross-Platform Support | Images]({%slug radpdfprocessing-cross-platform-images%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})