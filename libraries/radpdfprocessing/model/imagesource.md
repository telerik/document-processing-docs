---
title: ImageSource
page_title: ImageSource
slug: radpdfprocessing-model-imagesource
tags: imagesource
published: True
position: 5
---

# ImageSource

**ImageSource** represents a single, constant set of pixels at a certain size. It can be used by multiple [Image]({%slug radpdfprocessing-model-image%}) objects in order to be drawn in a PDF file.

## Creating an ImageSource

The ImageSource class has several public constructor overloads and can be created from a [Stream](http://msdn.microsoft.com/en-us/library/system.io.stream(v=vs.110).aspx), [BitmapSource](http://msdn.microsoft.com/en-us/library/system.windows.media.imaging.bitmapsource(v=vs.110).aspx) object or using the [__EncodedImageData__](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html) class:

* __public ImageSource(Stream stream)__: Creates an __ImageSource__ object from a stream that contains image.

* __public ImageSource(Stream stream, FormatProviders.Pdf.Export.ImageQuality imageQuality)__: Creates an __ImageSource__ object from a stream and allows you to specify the image quality through the [ImageQuality enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.ImageQuality.html). More information about the ImageQuality and its behavior is available in [this article]({%slug radpdfprocessing-concepts-imagequality%}). This overload might throw an exception if the image format is not supported.

* __public ImageSource(BitmapSource bitmapSource)__: Creates a new __ImageSource__ object from a BitmapSource object. This overload is not available in the .NET Standard version of the PdfProcessing binaries.

* __public ImageSource(BitmapSource bitmapSource, FormatProviders.Pdf.Export.ImageQuality imageQuality)__: Creates an __ImageSource__ instance from a BitmapSource object and allows you to specify the image quality. This overload is not available in the .NET Standard version of the PdfProcessing binaries.

* __public ImageSource(EncodedImageData imageSourceInfo)__: Initializes a new instance of __ImageSource__ using the  [EncodedImageData class](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.EncodedImageData.html).
        

__Example 1__ illustrates how you can create an ImageSource using a __FileStream__.
        

#### __[C#] Example 1: Create ImageSource from Stream__

{{region cs-radpdfprocessing-model-imagesource_0}}
	using (FileStream source = File.Open(filename, FileMode.Open))
	{
	    ImageSource imageSource = new ImageSource(source);
	}
{{endregion}}


With the __EncodedImageData__ class you can create an __ImageSource__ with encoded image data. This way the image quality will not be reduced on import.

__Example 2__ demonstrates how you can create an __ImageSource__ using the __EncodedImageData__ class.

#### __[C#] Example 2: Create ImageSource from EncodedImageData__
{{region cs-radpdfprocessing-model-imagesource_1}}
	EncodedImageData imageData = new EncodedImageData(imageBytes, 8, 655, 983, ColorSpaceNames.DeviceRgb, new string[] { PdfFilterNames.DCTDecode });
	ImageSource imageSource = new ImageSource(imageData);
{{endregion}}

With the __EncodedImageData__ class you can also create an __ImageSource__ with encoded image data and set its transparency. The __EncodedImageData__ class provides a second constructor overload where you can set the alpha-channel bytes of the image as a second constructor parameter in order to apply transparency to this image.

#### __[C#] Example 3: Create ImageSource from EncodedImageData with transparency__
{{region cs-radpdfprocessing-model-imagesource_2}}
	EncodedImageData imageData = new EncodedImageData(imageBytes, alphaChannelBytes, 8, imageWidth, imageHeight, ColorSpaceNames.DeviceRgb, new string[] { PdfFilterNames.FlateDecode });
	ImageSource imageSource = new ImageSource(imageData);
{{endregion}}

## Properties

The properties exposed by the **ImageSource** class are as follows:

* **Width**: Gets the width of the image.
* **Height**: Gets the height of the image.
* **DecodeArray**: Gets or sets the decode array, which specifies a linear mapping of each component value to a number that would be appropriate as a component value in the color space of the image. It could be used to manipulate the tones of the image, depending on its color space.

## Methods

The ImageSource class exposes two methods, which could help you get the data from the ImageSource object.

> These methods are not available in the .NET Standard version of the PdfProcessing binaries.

* __BitmapSource GetBitmapSource()__: Gets the BitmapSource of the image.
* __EncodedImageData GetEncodedImageData()__: Returns the encoded image data. This method can be used if you need to directly export the images from the PDF document.

>tip This [example in our SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateDocumentWithImages) demonstrates how to insert JPEG and JPEG2000 images in a PDF document without requiring that you decode the images on import. This way the exported images will not be re-encoded and their image quality will be preserved.

## Extensions

__RadPdfProcessing__ exposes an extension method allowing you to convert every BitmapSource to an ImageSource that can be used for the creation of [Image]({%slug radpdfprocessing-model-image%}) elements. __Example 4__ shows how you can use the ToImageSource() extension method over a previously created bitmap.
        

#### __[C#] Example 4: Create ImageSource with extension method__

{{region cs-radpdfprocessing-model-imagesource_3}}
	BitmapImage bitmap = new BitmapImage();
	bitmap.BeginInit();
	bitmap.UriSource = new Uri(filename, UriKind.RelativeOrAbsolute);
	bitmap.EndInit();
	
	ImageSource imageSource = bitmap.ToImageSource();
	
	return imageSource;
{{endregion}}

>The code from __Example 4__ won't compile in Silverlight due to differences in the BitmapImage API for this platform. You could pass the image as a stream to the SetSource() method of BitmapImage instead.

## See Also

 * [Image]({%slug radpdfprocessing-model-image%})
 * [Adding SVG into a Document]({%slug radpdfprocessing-model-formsource-svg%})
 * [ImageSource API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource.html)
