---
title: Troubleshooting PdfProcessing
page_title: Troubleshooting PdfProcessing
description: Learn how to resolve common PdfProcessing issues such as InvalidOperationException for image export in .NET Standard environments.
slug: troubleshooting-pdfprocessing
tags: troubleshooting, radpdfprocessing, pdf, image, telerik, exceptions, resolver, converter
published: True
position: 1
---

# Troubleshooting PdfProcessing

This article provides solutions to common issues that you may observe when working with the [PdfProcessing]({%slug radpdfprocessing-overview%}) library.

## Issue: InvalidOperationException for ImagePropertiesResolver and JpegImageConverter

You get this error when exporting PDF files that contain [unsupported images]({%slug radpdfprocessing-cross-platform-images%}) in a [.NET Standard]({%slug distribute-telerik-document-processing-libraries-net-versions%}) environment.

The **.NET Standard** version of the [RadPdfProcessing]({%slug radpdfprocessing-overview%}) library has limitations in image conversion and quality scaling compared to the **.NET Framework** version. Unlike **.NET Framework**, which includes built-in image processing capabilities, **.NET Standard** requires manual configuration to process non-JPEG/JPEG2000 images or to adjust image quality. Without the required configurations, exporting unsupported images or quality levels causes an `InvalidOperationException`.

### Solution

To successfully export images other than **Jpeg** and **Jpeg2000** or with `ImageQuality` other than **High**, reference the `Telerik.Documents.ImageUtils` NuGet package in your project. The library also exposes the `FixedExtensibilityManager` class with two specific extensibility points: [ImagePropertiesResolver]({%slug radpdfprocessing-cross-platform-images%}#imagepropertiesresolver) and [JpegImageConverter]({%slug radpdfprocessing-cross-platform-images%}#jpegimageconverter). You must set the [ImagePropertiesResolver]({%slug radpdfprocessing-cross-platform-images%}#imagepropertiesresolver)/[JpegImageConverter]({%slug radpdfprocessing-cross-platform-images%}#jpegimageconverter) property or create a custom implementation that inherits the `ImagePropertiesResolverBase`/`JpegImageConverterBase` class.

#### **Example 1: Set the Default Implementation of the ImagePropertiesResolver Class**

```csharp

        Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
```

#### **Example 2: Set the Default Implementation of the JpegImageConverter Class**
    
```csharp

       Telerik.Windows.Documents.Extensibility.JpegImageConverterBase defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
       Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;
```

#### **Example 3: Create a Custom Implementation That Inherits the JpegImageConverterBase Abstract Class**

```csharp

        internal class CustomJpegImageConverter : Telerik.Windows.Documents.Extensibility.JpegImageConverterBase
        {
            public override bool TryConvertToJpegImageData(byte[] imageData, ImageQuality imageQuality, out byte[] jpegImageData)
            {
                IMagickFormatInfo? formatInfo = MagickFormatInfo.Create(imageData);
                if (formatInfo != null && formatInfo.SupportsReading)
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
```

You can read more about the [requirements]({%slug radpdfprocessing-cross-platform-images%}#requirements) and implementation in the [PdfProcessing Cross-Platform Images]({%slug radpdfprocessing-cross-platform-images%}) article.

## See Also

* [PdfProcessing Cross-Platform Overview]({%slug radpdfprocessing-cross-platform%})
* [PdfProcessing Cross-Platform Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Create Custom ImagePropertiesResolver in .Net Standard]({%slug create-custom-image-properties-resolver-net-standard%})
* [Create Custom JpegImageConverter in .Net Standard]({%slug create-custom-jpeg-image-converter-net-standard%})
