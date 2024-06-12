---
title: Optimizing and Reducing the Size of PDF Files with RadPdfProcessing
description: Learn how to optimize and reduce the size of PDF files through the compression and image quality settings when using RadPdfProcessing.
type: how-to
page_title: How to Optimize PDF File Size with RadPdfProcessing
slug: optimize-and-reduce-pdf-size-radpdfprocessing
tags: pdfprocessing, document processing, pdf, optimize, reduce, size, compression, image, quality, font, embed
res_type: kb
ticketid: 1356271
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When handling PDF files, it's often necessary to optimize and reduce their size without compromising the content quality. This involves applying better compression to stream objects and adjusting image quality settings. This KB article shows how to:
- Compress the content inside a PDF document?
- Fine-tune the settings to lower the image quality in a PDF for size optimization
- Optimize the fonts' embedding in RadPdfProcessing

## Solution

To optimize and reduce the size of existing PDF files with RadPdfProcessing, follow these steps:

1. **Adjust Image Quality**: Set the [ImageQuality]({%slug radpdfprocessing-concepts-imagequality%}) to a lower setting to reduce the size of images within the PDF. Lower image quality results in smaller file sizes.

    ```csharp
    pdfFormatProvider.ExportSettings.ImageQuality = ImageQuality.Low;
    ```

    Additional information on setting image quality can be found in the official [ImageQuality documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagequality).

2. **Apply Image Compression**: Specify the types of [ImageCompression](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagecompression) to use. FlateDecode is recommended for effective compression.

    ```csharp
    pdfFormatProvider.ExportSettings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.FlateDecode };
    ```

    Learn more about image compression settings in the [ImageCompression documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagecompression).

3. **Enable Stream Compression**: Similar to image compression, stream compression can be applied to reduce the size of non-image content.

    ```csharp
    pdfFormatProvider.ExportSettings.StreamCompression = new StreamFilterTypes[] { StreamFilterTypes.FlateDecode };
    ```

    For more details on stream compression, visit the [StreamCompression documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#streamcompression).

4. **Optimize Font Embedding**: Starting from Q2 2024, you can use `FontEmbeddingType.Subset` to export only the necessary parts of True Type Fonts (TTF), which reduces the PDF file size.

    ```csharp
    pdfFormatProvider.ExportSettings.FontEmbeddingType = FontEmbeddingType.Subset;
    ```

    Further information on font embedding types can be found in the [FontEmbeddingType documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#fontembeddingtype).

## Notes

- Optimize and reduce the size of PDF files judiciously. Lowering image quality and applying aggressive compression can affect the visual fidelity of the document.
- Always test the output PDF to ensure the optimizations meet your requirements.

## See Also

- [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
- [PDF Format Provider Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
- [Change the file size of PDF with images]({%slug pdfprocessing-change-file-size-through-image-quality-and-compression%})
