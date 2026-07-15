---
title: Image
description: Learn how to work with Image content elements in RadPdfProcessing to add and configure images in PDF documents.
page_title: Image
slug: radpdfprocessing-model-image
tags: image, pdf, imagesource, radpdfprocessing, content, model, graphics, embedded
published: True
position: 4
---

# Image

`Image` is a content element that contains an [ImageSource]({%slug radpdfprocessing-model-imagesource%}) and represents an image. You can add it to the `Content` collection of an `IContainerElement` such as [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

## Public API

| **Property**          | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `ImageSource`       | Specifies the [ImageSource]({%slug radpdfprocessing-model-imagesource%}) that the Image object visualizes. |
| `Width`             | The width of the image.                                                                     |
| `Height`            | The height of the image.                                                                    |
| `Position`          | The [Position]({%slug radpdfprocessing-concepts-position%}) of the image inside the `IContainerElement`. |
| `AlphaConstant`     | Specifies the constant shape or constant opacity value for nonstroking operations.   |

| **Method**            | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| `GetBitmapSource` (not available in .NET Standard) | Creates a [BitmapSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.bitmapsource) from the image element.|
| `Clone` (starting with Q2 2025)                | Creates a deep copy of this document element.                                                  |

### Working with an Image

You can edit an `Image` element using the properties the class exposes. The properties are listed in the [Public API](#public-api) section.

>note Starting with **Q3 2024** RadPdfProcessing provides support for SVG FormSource (vector graphics image format): [Adding SVG FormSource into a Document]({%slug radpdfprocessing-model-formsource-svg%}).

**Example 1** shows how to initialize an `Image` object, assign an `ImageSource` to it, and add it to a previously defined container (page).

**Example 1: Create image**

<snippet id='pdf-create-image'/>

Once you [export]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) the `RadFixedDocument`, the following document with an image is created:

![RadPdfProcessing Image in RadFixedPage](images/pdf-processing-image.png)

**Example 2** demonstrates how to use one of the factory methods of the `ContentElementCollection` to create a new image and insert it into the respective container.

**Example 2: Add image to container**

<snippet id='pdf-image-source'/>

>tip There are other methods that allow adding an image to a document by passing image size, format, and source. You can use them through the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class.

The `Image` class also exposes the `GetBitmapSource()` method, which allows you to obtain a [BitmapSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.bitmapsource) instance representing the image.

> The `GetBitmapSource()` method is not available in the .NET Standard version of the PdfProcessing packages.

**Obtain BitmapSource**

<snippet id='pdf-obtain-botmap-source'/>

## See Also

* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [Position]({%slug radpdfprocessing-concepts-position%})
* [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%})
* [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%})
* [Change File Size of a PDF with Images Through ImageCompression and ImageQuality]({%slug pdfprocessing-change-file-size-through-image-quality-and-compression%})
* [Adding Images with a Shadow in PDF Documents]({%slug add-shadow-image-radpdfprocessing%})
* [Splitting a Large Image Across Multiple PDF Pages]({%slug split-export-large-image-multiple-pdf-pages-radpdfprocessing%})
* [Adding a Barcode to a PDF Document Using PdfProcessing and the WinForms BarcodeView]({%slug add-barcode-to-pdf-telerik%})
* [Adding an Image Border in PdfProcessing]({%slug pdf-image-border%})
* [Adding a .HEIC Image to PDF Documents in PdfProcessing]({%slug convert-heic-images-to-jpg%})
* [Copying Images from RadFixedDocument to Windows Clipboard]({%slug extract-images-radfixeddocument-windows-clipboard-to-ms-word%})
