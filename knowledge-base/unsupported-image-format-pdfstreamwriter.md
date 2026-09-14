---
title: Resolving Unsupported Image Format Exception in PdfStreamWriter
description: Learn how to resolve the "Not supported image format" exception when using PdfStreamWriter to add an image to a PDF document in Telerik Document Processing.
type: how-to
page_title: Fixing Image Format Issues in PdfStreamWriter for PDF
meta_title: Fixing Image Format Issues in PdfStreamWriter for PDF
slug: unsupported-image-format-pdfstreamwriter
tags: pdfstreamwriter, radfixeddocument, radfixedpage, imagepropertiesresolver, jpegimageconverter, telerik document processing
res_type: kb
ticketid: 1717910
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.810 | RadPdfProcessing | [Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova) |

## Description

When adding a JPEG image to a PDF document, the exception `NotSupportedImageFormatException: 'Not supported image format.'` may occur if the image is created through an unsupported `ImageSource` overload or the cross-platform image extensions are not configured. `PdfStreamWriter` supports generated [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) instances, but it does not accept a complete [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) as page content. Choose the export workflow that matches the required output.

This knowledge base article also answers the following questions:
- How to fix unsupported image format errors in PdfStreamWriter?
- Why does adding images fail in Telerik Document Processing PdfProcessing?
- How to properly use RadFixedDocument for image addition?

## Solution

To resolve the issue on cross-platform targets, configure the image extensions before exporting and create the image from a stream with a supported `ImageSource` constructor. The following setup assigns the default [ImagePropertiesResolver]({%slug radpdfprocessing-cross-platform-images%}) and [JpegImageConverter]({%slug radpdfprocessing-cross-platform-images%}) implementations:

```csharp
Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
Telerik.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

Telerik.Documents.ImageUtils.JpegImageConverter defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
Telerik.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;
```

Use the `RadFixedDocument` workflow when you need to create or edit the full document:

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();

using (Stream imageStream = File.OpenRead("path-to-your-image.jpg"))
{
    ImageSource imageSource = new ImageSource(imageStream);
    page.Content.AddImage(imageSource);

    PdfFormatProvider provider = new PdfFormatProvider();
    using (Stream output = File.OpenWrite("output.pdf"))
    {
        provider.Export(document, output, null);
    }
}
```

When you need the low-memory streaming workflow, create the page with the same image setup and pass the generated `RadFixedPage` to `PdfStreamWriter`:

```csharp
using (Stream imageStream = File.OpenRead("path-to-your-image.jpg"))
{
    RadFixedDocument document = new RadFixedDocument();
    RadFixedPage page = document.Pages.AddPage();
    page.Content.AddImage(new ImageSource(imageStream));

    using (Stream output = File.OpenWrite("output.pdf"))
    using (PdfStreamWriter writer = new PdfStreamWriter(output))
    {
        writer.WritePage(page);
    }
}
```

Do not pass a `RadFixedDocument` where `PdfStreamWriter` expects a `RadFixedPage`. Also verify that the input stream contains a supported image and that the required Telerik image packages and platform-specific dependencies are referenced. For more information, see [Images]({%slug radpdfprocessing-cross-platform-images%}).

By following these steps, the exception will be resolved, and the PDF document will be successfully generated with the image.

## See Also

- [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
- [RadFixedDocument Overview]({%slug radpdfprocessing-model-radfixeddocument%})
- [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
- [Image]({%slug radpdfprocessing-model-image%})
- [ImageSource]({%slug radpdfprocessing-model-imagesource%})
- [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
- [Cross-Platform Images]({%slug radpdfprocessing-cross-platform-images%})