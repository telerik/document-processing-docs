---
title: Cross-Platform Support
page_title: Cross-Platform Support
slug: radpdfprocessing-cross-platform
tags: cross,platform
platforms: blazor, core, xamarin, winui
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor**, **UI for Xamarin**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadPdfProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Zip.dll**

To export images different than Jpeg and Jpeg2000 or ImageQuality different than High you will need to add references to the following **.Net Standard** assembly:

* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>
> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## Fonts and Images

The .NET Framework version of PdfProcessing comes with out-of-the-box functionality to read fonts, convert images, and scale their quality. The .NET Standard specification, however does not specify APIs to provide such functionalities built in the library.
In order to provide the necessary extensibility mechanisms for working with fonts and images, the .NET Standard version of **RadPdfProcessing** exposes the **FixedExtensibilityManager** class. Code samples on how to configure the **FixedExtensibilityManager** are present later in this article.

### Setting and Exporting Fonts

PdfProcessing needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the FontsProviderBase abstract class and set this implementation to the <u>FontsProvider</u> property of the **FixedExtensibilityManager**.

The code snippets below show how to create a custom <u>FontsProvider</u> implementation and how to set it.

#### **[C#] Example 1: Creating custom implementation by inheriting the FontsProviderBase abstract class**
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
	
	>important If the FontsProvider property is not set, a default font will be used when exporting the document.
	
### Importing images

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


## Additional settings required

### Signatures

* Since R1 2022 SP1 digital signatures are supported in Net Standard as well. More information is available [here]({%slug radpdfprocessing-features-digital-signature%}).


## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
