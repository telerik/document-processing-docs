---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radspreadprocessing-cross-platform
tags: cross,platform
platforms: netcore, blazor, xamarin
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor** and **UI for Xamarin** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadSpreadProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Spreadsheet.dll**

The following assemblies are required in order to be able to export to Xlsx and PDF formats:

* **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Documents.Spreadsheet.FormatProviders.Pdf.dll**
* **Telerik.Zip.dll**

To export to PDF format documents containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, you will need to add references to the following **.Net Standard** assembly:

* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **ImageSharp** and **TiffLibrary.ImageSharpAdapter**. In order to use this assembly, you will need to add references to [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) and [TiffLibrary.ImageSharpAdapter](https://www.nuget.org/packages/TiffLibrary.ImageSharpAdapter/).

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's New

In the .NET Framework version of SpreadProcessing, scenarios like text measuring and exporting images to PDF are something that comes out of the box. However, the .NET Standard doesn't specify APIs to provide these functionalities built in the library, so there are some differences in both versions of SpreadProcessing.

### New APIs

The [Limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadSpreadProcessing** library exposes a SpreadExtensibilityManager class used for providing extensibility mechanisms.

#### SpreadExtensibilityManager class

The new **SpreadExtensibilityManager** class is exposing the following properties:

* **ImagePropertiesResolver**: Gets or sets an *ImagePropertiesResolverBase* instance used to resolve image properties.

    > .NET Standard specification does not define APIs for getting the image properties. SpreadProcessing needs to have access to GDI+ basic graphics functionality. Thats why, to allow the library to get the image properties in order to export them an implementation inheriting the ImagePropertiesResolverBase abstract class have to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.
    
    >important If the ImagePropertiesResolver property is not set, an exception is thrown.

    The **Telerik.Documents.ImageUtils** assembly provides a default implementation of the ImagePropertiesResolver class that could be used when exporting the document.

    #### **[C#] Example 1: Set the default implementation of the ImagePropertiesResolver class**
    {{region cs-radspreadprocessing-cross-platform_0}}

        ImagePropertiesResolverBase imagePropertiesResolver = new ImagePropertiesResolver();
        SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
    {{endregion}}

    #### **[C#] Example 2: Windows Example: Create a custom implementation inheriting the ImagePropertiesResolverBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_0}}

        public class ImageInfo : ImagePropertiesResolverBase
        {
            public override Size GetImageSize(byte[] imageData)
            {
                MemoryStream stream = new MemoryStream(imageData);
                using (var image = new System.Drawing.Bitmap(stream))
                {
                    return new Size(image.Width, image.Height);
                }
            }
        }
    {{endregion}}

    #### **[C#] Example 3: Set the custom implementation inheriting the ImagePropertiesResolverBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_1}}

        ImagePropertiesResolverBase imagePropertiesResolver = new ImageInfo();
        SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
    {{endregion}}

* **TextMeasurer**: Gets or sets a *SpreadTextMeasurerBase* instance used to provide text measuring. The TextMeasurer has a *SimpleTextMeasurer* as a default value.

    > The SimpleTextMeasurer provides basic functionality for text measuring and it is not expected to be an all-purpose measurer.

    **Example 3** shows how to set a custom implementation inheriting the SpreadTextMeasurerBase abstract class to the TextMeasurer property of the SpreadExtensibilityManager

    #### **[C#] Example 4: Set custom implementation inheriting the SpreadTextMeasurerBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_2}}

        SpreadTextMeasurerBase customTextMeasurer = new TextInfo();
        SpreadExtensibilityManager.TextMeasurer = customTextMeasurer;
    {{endregion}}

## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:
* Exporting images when exporting a Workbook to a PDF format requires an implementation inheriting the ImagePropertiesResolverBase abstract class to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.
* In order to export to PDF format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).
* In order to **export to PDF** format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), the **FontsProvider** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

### Currently not supported
 - At this point, the charts are not supported for .NET Standard.

## See Also

 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
