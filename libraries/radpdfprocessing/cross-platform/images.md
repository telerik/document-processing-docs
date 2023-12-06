---
title: Images
page_title: Images
slug: radpdfprocessing-cross-platform-images
tags: cross,platform
platforms: blazor, core, xamarin, winui, maui
published: True
position: 2
---

# Images

Means for converting images, and scaling their quality are readily available in the .NET Framework version of the RadPdfProcessing library. In contrast, the .NET Standard one does not provide such functionality and requires some manual settings to achieve this. The `FixedExtensibilityManager` class is exposed specifically to address this need. 
More information on how to configure it can be found in the code samples later in this article.

## Exporting Images

To reduce file size, PDF supports only a number of compression filters like Jpeg and Jpeg2000 compression of color and grayscale images. So to allow the library to export images different than Jpeg and Jpeg2000, these images should be additionally processed. The **.NET Standard** specification does not define APIs for converting/processing images or scaling their quality. That is why, to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, PdfProcessing comes with two extensibility points exposed by the static `FixedExtensibilityManager` class - **ImagePropertiesResolver** and **JpegImageConverter**.

> If neither **ImagePropertiesResolver** and **JpegImageConverter** are set, an InvalidOperationException is thrown during export of document.

## ImagePropertiesResolver 

This property enables you to set a resolver implementation that can parse the image raw data to separate its colors and alpha channel. While this implementation can be used for any type of supported image, it is required when working with PNG images so their transparency can be preserved in the generated PDF document. The resolver gets the image bytes as they are and does not take into consideration the [Image Quality](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#imagequality) set through the [Export Settings](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/settings#export-settings).

### Default Implementation for ImagePropertiesResolver

PdfProcessing comes with a default implementation for such resolver called `ImagePropertiesResolver`. The built-in logic depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to parse the image data. To use the default functionality, you should set an instance of the ImagePropertiesResolver class to the `FixedExtensibilityManager.ImagePropertiesResolver` property.

>note View Implementation [Requirements](#requirements).

#### **[C#] Example 1: Set the default implementation of the ImagePropertiesResolver class**
    {{region cs-radpdfprocessing-cross-platform-images_0}}

        Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
    {{endregion}}

### Custom Implementation for ImagePropertiesResolver

In case you have specific requirements and the default ImagePropertiesResolver doesn't fit them, you can implement custom logic that can handle them. To achieve that, you should:
1. inherit the `Telerik.Windows.Documents.Core.Imaging.ImagePropertiesResolverBase` class
1. implement its members
1. assign an instance of the custom implementation to the `FixedExtensibilityManager.ImagePropertiesResolver` property 

## JpegImageConverter 

The `JpegImageConverter` property uses an implementation of the `JpegImageConverterBase` abstract class to convert an image to Jpeg. This implementation should be passed to the JpegImageConverter property of the of FixedExtensibilityManager.
       
> If you have both the `ImagePropertiesResolver` and `JpegImageConverter` properties set, the `ImagePropertiesResolver` is prioritized and used to parse the image.

### Default Implementation for JpegImageConverter

The **Telerik.Documents.ImageUtils** assembly provides a default implementation of the JpegImageConverter class that could be used when exporting a document. The default implementation depends on the [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/) library to convert images to Jpeg format.

>note View Implementation [Requirements](#requirements).

#### **[C#] Example 2: Set the default implementation of the JpegImageConverter class**
    {{region cs-radpdfprocessing-cross-platform_3}}

       Telerik.Windows.Documents.Extensibility.JpegImageConverterBase defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
       Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;
    {{endregion}}

### Custom Implementation for JpegImageConverter

The following example depends on the [Magick.NET](https://www.nuget.org/packages/Magick.NET-Q16-AnyCPU/) library to convert images to Jpeg format.
    
#### **[C#] Example 3: Create a custom implementation inheriting the JpegImageConverterBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_2}}

        internal class CustomJpegImageConverter : Telerik.Windows.Documents.Extensibility.JpegImageConverterBase
        {
            public override bool TryConvertToJpegImageData(byte[] imageData, ImageQuality imageQuality, out byte[] jpegImageData)
            {
                MagickFormatInfo formatInfo = MagickFormatInfo.Create(imageData);
                if (formatInfo != null && formatInfo.IsReadable)
                {
                    using (MagickImage magickImage = new MagickImage(imageData))
                    {
                        magickImage.Alpha(AlphaOption.Remove);
                        magickImage.Quality = (int)imageQuality;

                        jpegImageData = magickImage.ToByteArray(MagickFormat.Jpeg);
                    }

                    return true;
                }

                jpegImageData = null;
                return false;
            }
        }
    {{endregion}}
    
#### **[C#] Example 4: Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager**
    {{region cs-radpdfprocessing-cross-platform_3}}
    
        JpegImageConverterBase customJpegImageConverter = new CustomJpegImageConverter();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = customJpegImageConverter;
    {{endregion}}


>note A complete SDK example of a custom implementation JpegImageConverterBase is available on our [GitHub repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CustomJpegImageConverter).

## Requirements

<table>
<thead>
	<tr>
		<th>Requirements</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Documents.ImageUtils</b> assembly
        <br><sub><i>This assembly is not available in UI for Xamarin.</i></sub></td>
	</tr>
    <tr>
		<td><b>SkiaSharp.NativeAssets.*</b> assembly
        <br><sub><i>May differ according to the used platform. For <b>Linux</b> use <b>SkiaSharp.NativeAssets.Linux.NoDependencies</b></i></sub></td>
	</tr>
    <tr>
		<td><b>SkiaSharp.Views.Blazor</b> and <b>wasm-tools</b>
        <br><sub><i>For Blazor Web Assembly.</i></sub></td>
	</tr>
</tbody> 
</table>

>important With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.
