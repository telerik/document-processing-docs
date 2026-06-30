---
title: ImageSource
description: Learn how to create and use ImageSource objects in RadPdfProcessing to represent pixel data for images drawn in PDF documents.
page_title: ImageSource
slug: radpdfprocessing-model-imagesource
tags: imagesource, pdf, pixels, radpdfprocessing, jpeg, bitmap, images, source
published: True
position: 5
---

# ImageSource

`ImageSource` represents a single, constant set of pixels at a certain size. Multiple [Image]({%slug radpdfprocessing-model-image%}) objects can use it to draw in a PDF file.

## Creating an ImageSource

The `ImageSource` class has several public constructor overloads. You can create it from a [Stream](https://learn.microsoft.com/en-us/dotnet/api/system.io.stream), [BitmapSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.bitmapsource) object, or by using the [`EncodedImageData`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html) class:

* `public ImageSource(Stream stream)`: Creates an `ImageSource` object from a stream that contains an image.

* `public ImageSource(Stream stream, FormatProviders.Pdf.Export.ImageQuality imageQuality)`: Creates an `ImageSource` object from a stream and allows you to specify the image quality through the [ImageQuality enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html). For more information about the `ImageQuality` and its behavior, see the [ImageQuality]({%slug radpdfprocessing-concepts-imagequality%}) article. This overload can throw an exception if the image format is not supported.

* `public ImageSource(BitmapSource bitmapSource)`: Creates a new `ImageSource` object from a `BitmapSource` object. This overload is not available in the .NET Standard version of the PdfProcessing packages.

* `public ImageSource(BitmapSource bitmapSource, FormatProviders.Pdf.Export.ImageQuality imageQuality)`: Creates an `ImageSource` instance from a `BitmapSource` object and allows you to specify the image quality. This overload is not available in the .NET Standard version of the PdfProcessing packages.

* `public ImageSource(EncodedImageData imageSourceInfo)`: Initializes a new instance of `ImageSource` using the [`EncodedImageData`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html) class.

**Example 1** shows how to create an `ImageSource` using a `FileStream`.

#### **Example 1: Create ImageSource from Stream**

<snippet id='libraries-pdf-model-imagesource-image-source-from-stream'/>


With the `EncodedImageData` class you can create an `ImageSource` with encoded image data. This way the image quality is not reduced on import.

**Example 2** demonstrates how to create an `ImageSource` using the `EncodedImageData` class.

#### **Example 2: Create ImageSource from EncodedImageData**
<snippet id='libraries-pdf-model-imagesource-image-source-from-encoded-image-data'/>

With the `EncodedImageData` class you can also create an `ImageSource` with encoded image data and set its transparency. The `EncodedImageData` class provides a second constructor overload where you can set the alpha-channel bytes of the image as a second constructor parameter to apply transparency to this image.

#### **Example 3: Create ImageSource from EncodedImageData with transparency**
<snippet id='libraries-pdf-model-imagesource-transparency-image-source-from-encoded-image-data'/>

## Properties

The `ImageSource` class exposes the following properties:

| Property | Description |
|---|---|
| `Width` | Gets the width of the image. |
| `Height` | Gets the height of the image. |
| `DecodeArray` | Gets or sets the decode array, which specifies a linear mapping of each component value to an appropriate component value in the color space of the image. You can use it to manipulate the tones of the image. |

## Methods

The `ImageSource` class exposes two methods that help you get the data from the `ImageSource` object.

> These methods are not available in the .NET Standard version of the PdfProcessing packages.

| Method | Description |
|---|---|
| `GetBitmapSource()` | Gets the `BitmapSource` of the image. |
| `GetEncodedImageData()` | Returns the encoded image data. Use this method to directly export images from the PDF document. |

>tip The [CreateDocumentWithImages example in the SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateDocumentWithImages) demonstrates how to insert JPEG and JPEG2000 images in a PDF document without decoding the images on import. The exported images are not re-encoded and their image quality is preserved.

## Extensions

RadPdfProcessing exposes an extension method that allows you to convert every `BitmapSource` to an `ImageSource` that you can use for the creation of [Image]({%slug radpdfprocessing-model-image%}) elements. **Example 4** shows how to use the `ToImageSource()` extension method over a previously created bitmap.

#### **Example 4: Create ImageSource with extension method**

<snippet id='libraries-pdf-model-imagesource-image-source-extensions'/>

> The code from **Example 4** does not compile in Silverlight due to differences in the `BitmapImage` API for this platform. You can pass the image as a stream to the `SetSource()` method of `BitmapImage` instead.

## See Also

* [Image]({%slug radpdfprocessing-model-image%})
* [Adding SVG FormSource into a Document]({%slug radpdfprocessing-model-formsource-svg%})
* [ImageSource API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource.html)
