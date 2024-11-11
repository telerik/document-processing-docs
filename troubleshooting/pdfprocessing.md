---
title: Troubleshooting PdfProcessing
page_title: Troubleshooting PdfProcessing
description: Troubleshooting PdfProcessing
slug: troubleshooting-pdfprocessing
tags: pdfprocessing, document, processing, troubleshooting, telerik, pdf, image, resolver, converter
published: True
position: 1
---

# Troubleshooting PdfProcessing

This article provides solutions to common issues that you may observe when working with the [PdfProcessing]({%slug radpdfprocessing-overview%}) library.

## Issue: "InvalidOperationException: 'FixedExtensibilityManager.ImagePropertiesResolver and FixedExtensibilityManager.JpegImageConverter cannot be both null.

You get this error when exporting PDF files containing [unsupported images]({%slug radpdfprocessing-cross-platform-images%}) in a [.NET Standard]({%slug distribute-telerik-document-processing-libraries-net-versions%}) environment.

The **.NET Standard** version of the [RadPdfProcessing]({%slug radpdfprocessing-overview%}) library has limitations in handling image conversion and quality scaling compared to the **.NET Framework** version. Unlike the **.NET Framework**, which includes built-in image processing capabilities, **.NET Standard** requires manual configuration to process non-JPEG/JPEG2000 images or to adjust image quality. Without the required configurations, attempting to export unsupported images or quality levels will cause an **InvalidOperationException**.

### Solution

In order to successfully export images different than **Jpeg** and **Jpeg2000** and **ImageQuality** different than **High** you will need to reference the **Telerik.Documents.ImageUtils** assembly/NuGet package in your project. The library also exposes the **FixedExtensibilityManager** class with two specific extensibility points: [ImagePropertiesResolver]({%slug radpdfprocessing-cross-platform-images%}#imagepropertiesresolver) and [JpegImageConverter]({%slug radpdfprocessing-cross-platform-images%}#jpegimageconverter). You would have to set the [ImagePropertiesResolver]({%slug radpdfprocessing-cross-platform-images%}#imagepropertiesresolver)/[JpegImageConverter]({%slug radpdfprocessing-cross-platform-images%}#jpegimageconverter) property or create a custom one inheriting the **ImagePropertiesResolverBase**/**JpegImageConverterBase** class.

#### **[C#] Example 1: Set the default implementation of the ImagePropertiesResolver class**
    {{region cs-troubleshooting_pdfprocessing_0}}

        Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
    {{endregion}}

#### **[C#] Example 2: Set the default implementation of the JpegImageConverter class**
    {{region cs-troubleshooting_pdfprocessing_1}}

       Telerik.Windows.Documents.Extensibility.JpegImageConverterBase defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
       Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;
    {{endregion}}

#### **[C#] Example 3: Create a custom implementation inheriting the JpegImageConverterBase abstract class**
    {{region cs-troubleshooting_pdfprocessing_2}}

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
    {{endregion}}


You can read more about the [requirements]({%slug radpdfprocessing-cross-platform-images%}#requirements) and implementation in the [PdfProcessing Cross-Platform Images]({%slug radpdfprocessing-cross-platform-images%}) article.

## See Also

* [PdfProcessing Cross-Platform Overview]({%slug radpdfprocessing-cross-platform%})
* [PdfProcessing Cross-Platform Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Create Custom ImagePropertiesResolver in .Net Standard]({%slug create-custom-image-properties-resolver-net-standard%})
* [Create Custom JpegImageConverter in .Net Standard]({%slug create-custom-jpeg-image-converter-net-standard%})
