---
title: Images
description: Discover how to work with images in Telerik RadPdfProcessing for cross-platform .NET applications.
page_title: Images
slug: radpdfprocessing-cross-platform-images
tags: images, crossplatform, pdf, jpeg, skiasharp, imagesharp, radpdfprocessing, dotnet
platforms: blazor, core, winui, maui
published: True
position: 2
---

# Images

The **.NET Framework** version of the RadPdfProcessing library provides built-in functionality for converting images and scaling their quality. The **.NET Standard** version does not provide such functionality and requires manual configuration. The `FixedExtensibilityManager` class is exposed to address this need. The code samples later in this article demonstrate how to configure it.

## Exporting Images

To reduce file size, PDF supports only a limited set of compression filters such as JPEG and JPEG2000 compression of color and grayscale images. To allow the library to export images other than JPEG and JPEG2000, you must process these images before export. The **.NET Standard** specification does not define APIs for converting or processing images or scaling their quality. To export images other than JPEG and JPEG2000, or to use `ImageQuality` other than High, PdfProcessing exposes two extensibility points through the static `FixedExtensibilityManager` class: `ImagePropertiesResolver` and `JpegImageConverter`.

>important On cross-platform targets, set `ImagePropertiesResolver` or `JpegImageConverter` before export. If both properties are `null`, export throws an `InvalidOperationException`.

## Requirements

To export images other than JPEG and JPEG2000, or to use `ImageQuality` other than High, add references to the following .NET Standard packages:

|NuGet package|Description|
|----|----|
|**Telerik.Documents.ImageUtils**|Provides default image resolver and JPEG converter implementations.|
|**SkiaSharp.NativeAssets.*** (version {{site.skiasharpversion}})|May differ according to the used platform. For **Linux** use **SkiaSharp.NativeAssets.Linux.NoDependencies**.|
|**SkiaSharp.Views.Blazor** and **wasm-tools**|For Blazor WebAssembly.|


## ImagePropertiesResolver

The `ImagePropertiesResolver` property accepts a resolver that parses image data into color and alpha information. On cross-platform targets, the resolver is required for formats such as PNG when you need transparency preserved in the exported PDF. The resolver reads the image bytes and does not apply the `ImageQuality` value from the [export settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings).

### Default Implementation for ImagePropertiesResolver

PdfProcessing provides a default implementation called `ImagePropertiesResolver`. The built-in logic depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to parse the image data. To use the default functionality, set an instance of the `ImagePropertiesResolver` class to the `FixedExtensibilityManager.ImagePropertiesResolver` property.

>note View the implementation [Requirements](#requirements).

#### __Example 1: Set the default ImagePropertiesResolver implementation__

<snippet id='pdf-image-property-resolver'/>

### Custom Implementation for ImagePropertiesResolver

If you have specific requirements and the default `ImagePropertiesResolver` does not fit them, you can implement custom logic. To achieve this:

1. Inherit the `Telerik.Documents.Core.Imaging.ImagePropertiesResolverBase` class.
2. Implement its members.
3. Assign an instance of the custom implementation to the `FixedExtensibilityManager.ImagePropertiesResolver` property.

## JpegImageConverter

The `JpegImageConverter` property uses an implementation of the `JpegImageConverterBase` abstract class to convert an image to JPEG. Pass this implementation to the `JpegImageConverter` property of the `FixedExtensibilityManager`.

>note If you have both the `ImagePropertiesResolver` and `JpegImageConverter` properties set, `ImagePropertiesResolver` takes priority and is used to parse the image.

### Default Implementation for JpegImageConverter

The **Telerik.Documents.ImageUtils** package provides a default implementation of the `JpegImageConverter` class that you can use when exporting a document. The default implementation depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to convert images to JPEG format.

>note View the implementation [Requirements](#requirements).

#### __Example 2: Set the default JpegImageConverter implementation__

<snippet id='pdf-jpeg-image-converter'/>

### Custom Implementation for JpegImageConverter

The following example demonstrates how to implement a custom image converter. It depends on the [SixLabors.ImageSharp](https://www.nuget.org/packages/sixlabors.imagesharp/) library. You can follow this approach with other image processing libraries according to your specific requirements.

### Required NuGet Packages

* SixLabors.ImageSharp - version **3.1.12**
* SixLabors.ImageSharp.Drawing - version **2.1.7**

The following `using`/`imports` statements are required in the project:

* using SixLabors.ImageSharp;
* using SixLabors.ImageSharp.Formats.Jpeg;
* using SixLabors.ImageSharp.Formats.Png;
* using SixLabors.ImageSharp.PixelFormats;
* using SixLabors.ImageSharp.Processing;

#### __Example 3: Create a custom JpegImageConverterBase implementation__

<snippet id='pdf-custom-sixlabors-imagesharp-converter'/>

#### __Example 4: Assign a custom image converter__

<snippet id='pdf-set-custom-image-converter'/>

>note A complete SDK example of a custom `JpegImageConverterBase` implementation is available on the [GitHub repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CustomJpegImageConverter).

## See Also

* [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
* [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Converting DOCX with TIFF Images to PDF in .NET Standard]({%slug docx-tiff-pdf-telerik-wordsprocessing%})
