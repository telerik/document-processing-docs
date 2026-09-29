---
title: Images
description: Learn how to configure image conversion and JPEG 2000 decoding in Telerik RadPdfProcessing for cross-platform .NET applications.
page_title: Images
slug: radpdfprocessing-cross-platform-images
tags: images, crossplatform, pdf, jpeg, skiasharp, imagesharp, radpdfprocessing, dotnet
platforms: blazor, core, winui, maui
published: True
position: 2
---

# Images

The **.NET Framework** version of the RadPdfProcessing library provides built-in functionality for converting images and scaling their quality. The **.NET Standard** version does not provide such functionality and requires manual configuration. The `FixedExtensibilityManager` class exposes extensibility points for image conversion and JPEG 2000 decoding.

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

## Decoding JPEG 2000 Images

PDF files can store JPEG 2000 image data with the JPXDecode filter. To decode these images, add the optional decoder package that matches your target:

| Target | NuGet package |
|---|---|
| .NET Standard and cross-platform .NET | **Telerik.Documents.JpxDecodeUtils** |
| .NET Framework and .NET for Windows | **Telerik.Windows.Documents.JpxDecodeUtils** |

Register one `JpxImageDecoder` instance before you import, render, or export PDF documents that require JPX decoding. The `FixedExtensibilityManager.JpxImageDecoder` property is global, so configure it once during application startup.

#### __Example 5: Register the JPX decoder__

```csharp
using Telerik.Documents.Extensibility;
using Telerik.Documents.JpxDecodeUtils;

if (FixedExtensibilityManager.JpxImageDecoder == null)
{
    FixedExtensibilityManager.JpxImageDecoder = new JpxImageDecoder();
}
```

The decoder limits estimated peak memory for each image to 256 MB by default. Set `JpxImageDecoder.MaximumDecodedBytes` to a positive value when your application needs a different limit.

#### __Example 6: Configure the JPX decoded-memory limit__

```csharp
using Telerik.Documents.Extensibility;
using Telerik.Documents.JpxDecodeUtils;

JpxImageDecoder decoder = new JpxImageDecoder
{
    MaximumDecodedBytes = 128L * 1024L * 1024L
};

FixedExtensibilityManager.JpxImageDecoder = decoder;
```

You can also create a custom decoder by inheriting `JpxImageDecoderBase` and implementing `TryDecodeJpxImageData()`. Return the decoded samples and image metadata through `JpxImageDecodeResult`.

If JPX processing requires a decoder and none is registered, RadPdfProcessing throws `JpxImageDecoderNotConfiguredException`. Attach the same handler to the import and export exception events to skip unsupported JPX images. Leave other exceptions unhandled.

#### __Example 7: Handle a missing decoder during import and export__

```csharp
using System;
using System.IO;
using Telerik.Documents.Fixed.Exceptions;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.Model;

PdfFormatProvider provider = new PdfFormatProvider();
EventHandler<DocumentUnhandledExceptionEventArgs> skipMissingDecoder = (sender, args) =>
{
    if (args.Exception is JpxImageDecoderNotConfiguredException)
    {
        args.Handled = true;
    }
};

provider.ImportSettings.DocumentUnhandledException += skipMissingDecoder;
provider.ExportSettings.DocumentUnhandledException += skipMissingDecoder;

using (FileStream input = File.OpenRead("input.pdf"))
{
    RadFixedDocument document =
        provider.Import(input, TimeSpan.FromSeconds(10));
    using (FileStream output = File.OpenWrite("output.pdf"))
    {
        provider.Export(document, output, TimeSpan.FromSeconds(10));
    }
}
```

When the handler marks the exception as handled, import skips the JPX image or export omits it. The remaining document content stays available.

## See Also

* [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
* [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Handling Document Exceptions]({%slug radpdfprocessing-handling-exceptions%})
* [Converting DOCX with TIFF Images to PDF in .NET Standard]({%slug docx-tiff-pdf-telerik-wordsprocessing%})
