---
title: How to change the file size of PDF with images
description: Learn how to change the file size of a PDF with images by changing the image compression and image quality
type: how-to
page_title: How to change the file size of a PDF with images
slug: pdfprocessing-change-file-size-through-image-quality-and-compression
tags: pdf, pdfprocessing, fixed, size, reduce, change, image, compression, quality 
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.305 | RadPdfProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

This article shows how to change the file size of a PDF with images by changing the image compression and image quality.

## Solution

The size of the exported PDF file depends on the value of the [ImageQuality]({%slug radpdfprocessing-concepts-imagequality%}) and [ImageCompression](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagecompression) properties of the [PDF Export Setting](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings). You can try different combinations with these values in order to achieve different results. 

This example showcases all four __ImageCompression__ options and how each option behaves with a different __ImageQuiality__. In general, lowering the image quality will lower the file size.

>The result file sizes seen in the comments are based on a sample document and should be just used as reference.

```csharp
    using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
    using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export;
    using Telerik.Windows.Documents.Fixed.Model;

    //Required in .NET Standard
    //Telerik.Windows.Documents.Extensibility.JpegImageConverterBase defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
    //Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;

    RadFixedDocument document;
    PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();

    using (Stream input = File.OpenRead("input.pdf"))
    {
        document = pdfFormatProvider.Import(input);
    }

    var settings = new PdfExportSettings();

    #region ImageCompression - None
    // 182,000 KB file size ||
    settings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.None };

    // ImageQuality has no effect if this is set
    #endregion

    #region ImageCompression - FlateDecode
    // 114,000 KB file size || default ImageQuality is High
    settings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.FlateDecode };

    // 114,000 KB file size - no difference with the default setting
    settings.ImageQuality = ImageQuality.High;

    // 71,000 KB file size
    settings.ImageQuality = ImageQuality.Medium;

    // 27,000 KB
    settings.ImageQuality = ImageQuality.Low;
    #endregion

    #region ImageCompression - Default
    //around 35,500 KB || default ImageQuality is High
    settings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.Default };

    //around 35,500 KB - no difference with the default setting
    settings.ImageQuality = ImageQuality.High;

    //around 1,000 KB file size
    settings.ImageQuality = ImageQuality.Low; 

    //around 3,600 KB file size
    settings.ImageQuality = ImageQuality.Medium;
    #endregion

    #region ImageCompression - DCTDecode
    // 34,500 KB file size || default ImageQuality is High
    settings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.DCTDecode };

    // 34,500 KB file size - no difference with the default setting
    settings.ImageQuality = ImageQuality.High;

    // 1,000 KB
    settings.ImageQuality = ImageQuality.Low;

    // 3,600 KB 
    settings.ImageQuality = ImageQuality.Medium;
    #endregion

    pdfFormatProvider.ExportSettings = settings;

    using (Stream output = File.OpenWrite("output.pdf"))
    {
        pdfFormatProvider.Export(document, output);
    }
```
## See Also

* [PdfProcessing ImageQuality]({%slug radpdfprocessing-concepts-imagequality%})
* [PdfProcessing ImageCompression](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagecompression)
* [PdfProcessing Export Settings](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings)
* [PdfProcessing .NET Standard Requirements]({%slug radpdfprocessing-cross-platform%})
* [PdfProcessing Image]({%slug radpdfprocessing-model-image%})
* [Optimizing and Reducing the Size of PDF Files with RadPdfProcessing]({%slug optimize-and-reduce-pdf-size-radpdfprocessing%})
