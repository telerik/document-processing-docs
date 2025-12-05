---
title: Images
description: Discover how to work with images in Telerik RadPdfProcessing for cross-platform .NET applications.
page_title: Images
slug: radpdfprocessing-cross-platform-images
tags: cross, platform, image, blazor, core, xamarin, winui, maui, net, standard, linux, ios 
platforms: blazor, core, xamarin, winui, maui
published: True
position: 2
---

# Images

Means for converting images, and scaling their quality are readily available in the **.NET Framework** version of the RadPdfProcessing library. In contrast, the **.NET Standard** one does not provide such functionality and requires some manual settings to achieve this. The `FixedExtensibilityManager` class is exposed specifically to address this need. 
More information on how to configure it can be found in the code samples later in this article.

## Exporting Images

To reduce file size, PDF supports only a number of compression filters like Jpeg and Jpeg2000 compression of color and grayscale images. So to allow the library to export images different than Jpeg and Jpeg2000, these images should be additionally processed. The **.NET Standard** specification does not define APIs for converting/processing images or scaling their quality. That is why, to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, PdfProcessing comes with two extensibility points exposed by the static `FixedExtensibilityManager` class - **ImagePropertiesResolver** and **JpegImageConverter**.

>caution If neither **ImagePropertiesResolver** and **JpegImageConverter** are set, an InvalidOperationException is thrown during export of document.

## Requirements

To export images different than Jpeg and Jpeg2000 or ImageQuality different than High you will need to add references to the following .Net Standard packages:

|NuGet package|Description|
|----|----|
|**Telerik.Documents.ImageUtils**|This package is currently not available in UI for Xamarin.|
|**SkiaSharp.NativeAssets.*** (version {{site.skiasharpversion}})|May differ according to the used platform. For **Linux** use <b>SkiaSharp.NativeAssets.Linux.NoDependencies|
|**SkiaSharp.Views.Blazor** and **wasm-tools**|For Blazor Web Assembly.|

>important With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

## ImagePropertiesResolver 

This property enables you to set a resolver implementation that can parse the image raw data to separate its colors and alpha channel. While this implementation can be used for any type of supported image, it is required when working with PNG images so their transparency can be preserved in the generated PDF document. The resolver gets the image bytes as they are and does not take into consideration the [Image Quality](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagequality) set through the [Export Settings](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings).

### Default Implementation for ImagePropertiesResolver

PdfProcessing comes with a default implementation for such resolver called `ImagePropertiesResolver`. The built-in logic depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to parse the image data. To use the default functionality, you should set an instance of the ImagePropertiesResolver class to the `FixedExtensibilityManager.ImagePropertiesResolver` property.

>note View Implementation [Requirements](#requirements).

#### **[C#] Example 1: Set the default implementation of the ImagePropertiesResolver class**
   
<snippet id='pdf-image-property-resolver'/>

### Custom Implementation for ImagePropertiesResolver

In case you have specific requirements and the default ImagePropertiesResolver doesn't fit them, you can implement custom logic that can handle them. To achieve that, you should:

1\. Inherit the `Telerik.Windows.Documents.Core.Imaging.ImagePropertiesResolverBase` class
   
2\. Implement its members
   
3\. Assign an instance of the custom implementation to the `FixedExtensibilityManager.ImagePropertiesResolver` property 

## JpegImageConverter 

The `JpegImageConverter` property uses an implementation of the `JpegImageConverterBase` abstract class to convert an image to Jpeg. This implementation should be passed to the JpegImageConverter property of the of FixedExtensibilityManager.
       
> If you have both the `ImagePropertiesResolver` and `JpegImageConverter` properties set, the `ImagePropertiesResolver` is prioritized and used to parse the image.

### Default Implementation for JpegImageConverter

The **Telerik.Documents.ImageUtils** package provides a default implementation of the JpegImageConverter class that could be used when exporting a document. The default implementation depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to convert images to Jpeg format.

>note View Implementation [Requirements](#requirements).

#### **[C#] Example 2: Set the default implementation of the JpegImageConverter class**

<snippet id='pdf-jpeg-image-converter'/>

### Custom Implementation for JpegImageConverter

This example shows a sample approach how to implement a custom image converter. It depends on the [SixLabors.ImageSharp](https://www.nuget.org/packages/sixlabors.imagesharp/) library. This approach can be followed with other image processing libraries as well according to the specific requirements.

#### Required NuGet Packages

* SixLabors.ImageSharp - version **3.1.12**
* SixLabors.ImageSharp.Drawing - version **2.1.7**

The following `using`/`imports` statements are required in the project:

* using SixLabors.ImageSharp; 

* using SixLabors.ImageSharp.Formats.Jpeg;

* using SixLabors.ImageSharp.Formats.Png;

* using SixLabors.ImageSharp.PixelFormats;

* using SixLabors.ImageSharp.Processing;

#### **[C#] Example 3: Create a custom implementation inheriting the JpegImageConverterBase abstract class**

<snippet id='pdf-custom-sixlabors-imagesharp-converter'/>

#### **[C#] Example 4: Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager**

<snippet id='pdf-set-custom-image-converter'/>

>note A complete SDK example of a custom implementation JpegImageConverterBase is available on our [GitHub repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CustomJpegImageConverter). 

## See Also

 * [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
 * [Fonts]({%slug radpdfprocessing-cross-platform-fonts%}) 