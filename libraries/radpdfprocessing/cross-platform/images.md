---
title: Images
page_title: Images
slug: radpdfprocessing-cross-platform-images
tags: cross,platform
platforms: blazor, core, xamarin, winui
published: True
position: 2
---

# Images

Means for converting images, and scaling their quality are readily available in the .NET Framework version of the RadPdfProcessing library. In contrast, the .NET Standard one does not provide such functionality and requires some manual settings to achieve this. The **FixedExtensibilityManager** class is exposed specifically to address this need. 
More information on how to configure it can be found in the code samples later in this article.

## Exporting Images

To reduce file size, PDF supports only a number of compression filters like Jpeg and Jpeg2000 compression of color and grayscale images. So to allow the library to export images different than Jpeg and Jpeg2000 these images have to be converted to the one of the supported image formats. The **.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the **FixedExtensibilityManager**.
        
The **Telerik.Documents.ImageUtils** assembly provides a default implementation of the JpegImageConverter class that could be used when exporting the document. The default implementation depends on the [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) library to convert images to Jpeg format.
>important Telerik.Documents.ImageUtils.dll is not available for Xamarin. A custom converter can be implemented by inheriting **Telerik.Windows.Documents.Extensibility.JpegImageConverterBase**.

#### **[C#] Example 3: Set the default implementation of the JpegImageConverter class**
    {{region cs-radpdfprocessing-cross-platform_3}}

       Telerik.Windows.Documents.Extensibility.JpegImageConverterBase jpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
       Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = jpegImageConverter;
    {{endregion}}


The following example depends on the [Magick.NET](https://www.nuget.org/packages/Magick.NET-Q16-AnyCPU/) library to convert images to Jpeg format.
    
#### **[C#] Example 4: Create a custom implementation inheriting the JpegImageConverterBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_2}}

        internal class CustomJpegImageConverter : Telerik.Windows.Documents.Extensibility.JpegImageConverterBase
        {
            public override bool TryConvertToJpegImageData(byte[] imageData, ImageQuality imageQuality, out byte[] jpegImageData)
            {
                string[] magickImageFormats = Enum.GetNames(typeof(MagickFormat)).Select(x => x.ToLower()).ToArray();
                string imageFormat;
                if (this.TryGetImageFormat(imageData, out imageFormat) && magickImageFormats.Contains(imageFormat.ToLower()))
                {
                    using (MagickImage magickImage = new MagickImage(imageData))
                    {
                        magickImage.Format = MagickFormat.Jpeg;
                        magickImage.Alpha(AlphaOption.Remove);
                        magickImage.Quality = (int)imageQuality;

                        jpegImageData = magickImage.ToByteArray();
                    }
    
                    return true;
                }
    
                jpegImageData = null;
                return false;
            }
        }
    {{endregion}}
    
#### **[C#] Example 5: Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager**
    {{region cs-radpdfprocessing-cross-platform_3}}
    
        JpegImageConverterBase customJpegImageConverter = new CustomJpegImageConverter();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = customJpegImageConverter;
    {{endregion}}

>important If the JpegImageConverter property is not set, an exception is thrown.

>note A complete SDK example could be found on our [GitHub repository](https://github.com/telerik/document-processing-sdk).