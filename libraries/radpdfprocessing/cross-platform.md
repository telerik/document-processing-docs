---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radpdfprocessing-cross-platform
tags: cross,platform
platforms: netcore, blazor, xamarin
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor** and **UI for Xamarin** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadPdfProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Zip.dll**

To export images different than Jpeg and Jpeg2000 or ImageQuality different than High you will need to add references to the following **.Net Standard** assembly:

* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **ImageSharp** and **TiffLibrary.ImageSharpAdapter**. In order to use this assembly, you will need to add references to [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) and [TiffLibrary.ImageSharpAdapter](https://www.nuget.org/packages/TiffLibrary.ImageSharpAdapter/).

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's New

In the .NET Framework version of PdfProcessing, scenarios like reading fonts and converting images or scaling their quality are something that comes out of the box. However, the .NET Standard specification doesn't specify APIs to provide such functionalities built in the library, so there are some differences in both versions of PdfProcessing described in this article.

### New APIs

The [limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadPdfProcessing** library exposes a FixedExtensibilityManager class used for providing extensibility mechanisms.

#### FixedExtensibilityManager class

The new **FixedExtensibilityManager** class is exposing the following properties:

* **FontsProvider**: Gets or sets a *FontsProviderBase* instance used to provide missing fonts.

    >note .NET Standard specification does not define APIs for getting specific fonts. PdfProcessing needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the FontsProviderBase abstract class and set this implementation to the FontsProvider property of FixedExtensibilityManager.
    
    >important If the FontsProvider property is not set, a default font will be used when exporting the document.

    #### **[C#] Example 1: Windows Example: Creating custom implementation inheriting the FontsProviderBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_0}}

        public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
        {
            public override byte[] GetFontData(FontProperties fontProperties)
            {
                string fontFileName = fontProperties.FontFamilyName + ".ttf";
                string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);
                string targetPath = Path.Combine(fontFolder, fontFileName);

                DirectoryInfo directory = new DirectoryInfo(fontFolder);
                FileInfo[] fontFiles = directory.GetFiles("*.ttf");
                if (fontFiles.Any(s => s.Name.Equals(fontFileName, StringComparison.InvariantCultureIgnoreCase)))
                {
                    using (FileStream fileStream = File.OpenRead(targetPath))
                    {
                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            fileStream.CopyTo(memoryStream);
                            return memoryStream.ToArray();
                        }
                    }
                }

                return null;
            }
        }
    {{endregion}}

    #### **[C#] Example 2: Set the custom implementation inheriting the FontsProviderBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_1}}

        Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
    {{endregion}}

* **JpegImageConverter**: Gets or sets a *JpegImageConverterBase* instance used to provide a Jpeg converted image data.

    >note To reduce file size, PDF supports only a number of compression filters like Jpeg and Jpeg2000 compression of color and grayscale images. So to allow the library to export images different than Jpeg and Jpeg2000 these images have to be converted to the one of the supported image formats. **.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the of **FixedExtensibilityManager**.
      
    >important If the JpegImageConverter property is not set, an exception is thrown.
    
    The **Telerik.Documents.ImageUtils** assembly provides a default implementation of the JpegImageConverter class that could be used when exporting the document. The default implementation depends on the [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) and [TiffLibrary.ImageSharpAdapter](https://www.nuget.org/packages/TiffLibrary.ImageSharpAdapter/) libraries to convert images to Jpeg format.

    >important Telerik.Documents.ImageUtils.dll is not available for Xamarin.


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

>note A complete SDK example could be found on our [GitHub repository](https://github.com/telerik/document-processing-sdk).

## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:

* In order to export specific fonts, the FontsProvider property inside the FixedExtensibilityManager have to be set.
* In order to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, the JpegImageConverter property inside the FixedExtensibilityManager must be set.

### Currently not supported

 - Referencing .Net Standard binaries you can add SignatureField but cannot sign or import signed documents.
 
## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
 * [PDF Format]({%slug radpdfprocessing-formats-and-conversion-pdf-pdf%})
