---
title: ImageQuality
page_title: ImageQuality
slug: radpdfprocessing-concepts-imagequality
tags: image, quality
published: True
position: 7
---

# ImageQuality 

This article explains how to use the ImageQuality enumeration to change the export of images in **RadPdfProcessing** and how it reflects the images in different scenarios.

* [Overview](#overview)

* [Using ImageQuality](#using-imagequality)

## Overview

The [ImageQuality enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html) allows you to control the quality of the images when exporting to PDF. Possible values for this property are High, Medium, and Low. Since Q1 2016, the **default value of ImageQuality is High**.


## Using ImageQuality

The quality of the images reflects the size of the PDF document. The higher the quality, the bigger the document size. This property can be set both in [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) and in the constructor of [ImageSource]({%slug radpdfprocessing-model-imagesource%}). 

>tipYou can download a runnable project, which demonstrates different approaches for working with images in __RadPdfProcessing__ from our [SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateDocumentWithImages).


### Set a Default Value for all Images in a Document
 
In order to specify the default **ImageQuality** value when exporting to PDF, you should use the [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

#### __Example 1: Set a default value for all images in a document__

<snippet id='pdf-image-quality'/>

> `PdfExportSettings.ImageQuality` property doesn't affect the quality of the images imported from a PDF document. Such images are preserved using `EncodedImageData` (see [ImageQuality and EncodedImageData Class](#imagequality-and-encodedimagedata-class)). `PdfExportSettings.ImageQuality` only affects the export quality of images created using an image stream or a `BitmapSource`.

### Specify the Image Quality of an Image

If you need some particular image to be exported with a different **ImageQuality** value, you should specify this value in the constructor of [ImageSource]({%slug radpdfprocessing-model-imagesource%}) in order to override the default one.

#### __Example 2: Set the image quality of an image__

<snippet id='pdf-image-source-quality'/>


### ImageQuality and EncodedImageData Class

When you construct an **ImageSource** object with [EncodedImageData](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html), the image is inserted in the PDF file as it is, without decoding and re-encoding the image data. As **RadPdfProcessing** does not process the image data in this case, the **PdfExportSettings.ImageQuality** property is not used for this specific image and setting a value won’t take effect.


### ImageQuality.High With JPEG and JPEG2000 Images

When **ImageQuality** of an image is set to **High**, **RadPdfProcessing** internally checks the image stream before processing it. If the image is JPEG or JPEG2000, it is inserted in the PDF file as it is, without processing the image pixels. This way, **RadPdfProcessing** provides fast and lossless quality export of JPEG and JPEG2000 files, which guarantees maximum quality in the exported document.

> JPEG2000 images in **RadPdfProcessing** can be inserted only with **ImageQuality.High**. Exporting them with lower ImageQuality value requires decoding JPEG2000 files, which is currently unsupported by the library. 

### ImageQuality in .NET Standard

**.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to allow the library to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the of **FixedExtensibilityManager**. For more information check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) help article.

## See also

* [ImageQuality API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html)
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
