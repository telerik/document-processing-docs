---
title: Unsupported Image Format Exception Occurs When Using PdfStreamWriter
description: Learn how to resolve the unsupported image format exception when you add images to PDF files with PdfStreamWriter in RadPdfProcessing.
type: how-to
page_title: Fixing Unsupported Image Formats in PdfStreamWriter
meta_title: Fixing Unsupported Image Formats in PdfStreamWriter
slug: unsupported-image-format-pdfstreamwriter
tags: pdfstreamwriter, radfixeddocument, radfixedpage, imagepropertiesresolver, jpegimageconverter, telerik document processing
res_type: kb
ticketid: 1717910
---

# Unsupported Image Format Exception Occurs When Using PdfStreamWriter

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.810 | RadPdfProcessing | [Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova) |

## Description

When you add an image to a PDF document, PdfProcessing can throw
`NotSupportedImageFormatException: 'Not supported image format.'`. The exception
usually occurs for one of the following reasons:

* You create `ImageSource` with an overload that is not available for your target
  framework. For cross-platform projects, use the `ImageSource(Stream)`
  constructor.
* You export an image format other than JPEG or JPEG2000 without configuring the
  cross-platform image extensions.
* You pass a `RadFixedDocument` to `PdfStreamWriter`. The writer accepts a
  generated `RadFixedPage`, not a complete document.

## Solution

Use `RadFixedDocument` with `PdfFormatProvider` when you need to create or edit
a complete document. Use `PdfStreamWriter` when you need to write individual
pages with a low-memory streaming workflow.

### Configure Image Processing for Cross-Platform Projects

For cross-platform targets, add the `Telerik.Documents.ImageUtils` NuGet
package and the platform-specific `SkiaSharp.NativeAssets.*` package. The
ImageUtils package provides default implementations for
`ImagePropertiesResolver` and `JpegImageConverter`. Configure both
implementations before you create or export the image:

```csharp
Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
Telerik.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

Telerik.Documents.ImageUtils.JpegImageConverter defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
Telerik.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;
```

>important Configure the image extensions before export. If both
> `ImagePropertiesResolver` and `JpegImageConverter` remain `null`, export throws
> `InvalidOperationException`.

### Create a Complete PDF Document

Use `RadFixedDocument` and `PdfFormatProvider` when you need to add multiple
pages, edit document content, or access document-level properties:

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
        provider.Export(document, output, TimeSpan.FromSeconds(10));
    }
}
```

`ImageSource(Stream)` reads image data from the supplied stream. Keep the stream
open until the image is added and the document is exported.

### Write a Page with PdfStreamWriter

Use `PdfStreamWriter` for a low-memory workflow. Create a `RadFixedPage`, add the
image to that page, and pass the page to `WritePage`:

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

Do not pass `RadFixedDocument` to `WritePage`. To write an existing page, pass
its `RadFixedPage` instance instead.

If the exception continues, verify the following items:

1. Confirm that the input stream contains a valid image and that its position is
   set to `0` before you create `ImageSource`.
2. Use `ImageSource(Stream)` for cross-platform projects instead of a
   `BitmapSource` overload.
3. Reference `Telerik.Documents.ImageUtils` and the required native SkiaSharp
   package when the image format or image quality requires conversion.
4. Configure `FixedExtensibilityManager` before exporting the PDF.
5. Keep the image stream open until PdfProcessing finishes reading the image.

For package requirements and custom image processing implementations, see
[Images]({%slug radpdfprocessing-cross-platform-images%}).

## See Also

* [PdfStreamWriter overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [RadFixedDocument model]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage model]({%slug radpdfprocessing-model-radfixedpage%})
* [ImageSource constructors]({%slug radpdfprocessing-model-imagesource%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Cross-platform image processing]({%slug radpdfprocessing-cross-platform-images%})
