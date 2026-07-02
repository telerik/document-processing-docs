---
title: ImageQuality
description: Learn how to use the ImageQuality enumeration in RadPdfProcessing to control the quality of images when exporting to PDF.
page_title: ImageQuality
slug: radpdfprocessing-concepts-imagequality
tags: image, quality, pdf, jpeg, compression, export, radpdfprocessing, images, lossless
published: True
position: 7
---

# ImageQuality 

The `ImageQuality` enumeration controls how images are exported in **RadPdfProcessing** and how they appear in different scenarios.

* [Overview](#overview)

* [Using ImageQuality](#using-imagequality)

## Overview

The [ImageQuality enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html) allows you to control the quality of images when exporting to PDF. Possible values for this property are `High`, `Medium`, and `Low`. Starting with Q1 2016, the **default value of ImageQuality is High**.


## Using ImageQuality

The quality of the images affects the size of the PDF document. The higher the quality, the bigger the document size. You can set this property both in [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) and in the constructor of [ImageSource]({%slug radpdfprocessing-model-imagesource%}). 

>tip You can download a runnable project that demonstrates different approaches for working with images in **RadPdfProcessing** from the [SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateDocumentWithImages).


### Set a Default Value for All Images in a Document
 
To specify the default `ImageQuality` value when exporting to PDF, use the [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

**Set a default value for all images in a document**

<snippet id='pdf-image-quality'/>

> The `PdfExportSettings.ImageQuality` property does not affect the quality of images imported from a PDF document. Such images are preserved using `EncodedImageData` (see [ImageQuality and EncodedImageData Class](#imagequality-and-encodedimagedata-class)). `PdfExportSettings.ImageQuality` only affects the export quality of images created using an image stream or a `BitmapSource`.

### Specify the Image Quality of an Image

If you need a particular image to be exported with a different `ImageQuality` value, specify this value in the constructor of [ImageSource]({%slug radpdfprocessing-model-imagesource%}) to override the default one.

**Set the image quality of an image**

<snippet id='pdf-image-source-quality'/>


### ImageQuality and EncodedImageData Class

When you construct an `ImageSource` object with [EncodedImageData](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html), the image is inserted in the PDF file as-is, without decoding and re-encoding the image data. Because **RadPdfProcessing** does not process the image data in this case, the `PdfExportSettings.ImageQuality` property is not used for this specific image and setting a value has no effect.


### ImageQuality.High with JPEG and JPEG2000 Images

When `ImageQuality` of an image is set to `High`, **RadPdfProcessing** internally checks the image stream before processing it. If the image is JPEG or JPEG2000, it is inserted in the PDF file as-is, without processing the image pixels. This way, **RadPdfProcessing** provides fast and lossless quality export of JPEG and JPEG2000 files, which guarantees maximum quality in the exported document.

> JPEG2000 images in **RadPdfProcessing** can be inserted only with `ImageQuality.High`. Exporting them with a lower `ImageQuality` value requires decoding JPEG2000 files, which is not supported by the library. 

### ImageQuality in .NET Standard

The **.NET Standard** specification does not define APIs for converting images or scaling their quality. To allow the library to export images different than JPEG and JPEG2000 or `ImageQuality` different than `High`, you must provide an implementation of the `JpegImageConverterBase` abstract class. Pass this implementation to the `JpegImageConverter` property of `FixedExtensibilityManager`. For more information, see the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

## See Also

* [ImageQuality API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html)
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
