---
title: Optimizing and Reducing the Size of PDF Files with RadPdfProcessing
description: Learn how to optimize and reduce the size of PDF files through the compression and image quality settings when using RadPdfProcessing.
type: how-to
page_title: Optimizing and Reducing the Size of PDF Files with RadPdfProcessing
slug: optimize-and-reduce-pdf-size-radpdfprocessing
tags: radpdfprocessing, pdf, optimization, compression, image, font, document, processing
res_type: kb
ticketid: 1356271
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2024.2.426 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|

## Description

When you handle PDF files, you often need to optimize and reduce their size without compromising the content quality. This requires applying better compression to stream objects and adjusting image quality settings. This article shows how to:

* Compress the content inside a PDF document
* Fine-tune the settings to lower the image quality in a PDF for size optimization
* Optimize the font embedding in RadPdfProcessing

## Solution

To optimize and reduce the size of existing PDF files with RadPdfProcessing, follow these steps:

1. **Adjust Image Quality**: Set the [ImageQuality]({%slug radpdfprocessing-concepts-imagequality%}) to a lower setting to reduce the size of images within the PDF. Lower image quality results in smaller file sizes.

    ```csharp
    pdfFormatProvider.ExportSettings.ImageQuality = ImageQuality.Low;
    ```

    For more information on setting image quality, see the [ImageQuality documentation]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

2. **Apply Image Compression**: Specify the types of [ImageCompression]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) to use. `FlateDecode` is recommended for effective compression.

    ```csharp
    pdfFormatProvider.ExportSettings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.FlateDecode };
    ```

    For more information on image compression settings, see the [ImageCompression documentation]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

3. **Enable Stream Compression**: Stream compression reduces the size of non-image content in the same way as image compression.

    ```csharp
    pdfFormatProvider.ExportSettings.StreamCompression = new StreamFilterTypes[] { StreamFilterTypes.FlateDecode };
    ```

    For more information on stream compression, see the [StreamCompression documentation]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

4. **Optimize Font Embedding**: Starting with Q2 2024, you can use `FontEmbeddingType.Subset` to export only the necessary parts of TrueType Fonts (TTF). This reduces the PDF file size.

    ```csharp
    pdfFormatProvider.ExportSettings.FontEmbeddingType = FontEmbeddingType.Subset;
    ```

    For more information on font embedding types, see the [FontEmbeddingType documentation]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

## Notes

* Reduce the size of PDF files carefully. Lowering image quality and applying aggressive compression can affect the visual fidelity of the document.
* Always test the output PDF to ensure the optimizations meet your requirements.

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [PDF Format Provider Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [Change the File Size of PDF with Images]({%slug pdfprocessing-change-file-size-through-image-quality-and-compression%})
