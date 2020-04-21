---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radspreadprocessing-cross-platform
tags: cross,platform
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

## Assembly References

In order to use the model of the **RadSpreadProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Spreadsheet.dll**

The following assemblies are required in order to be able to export to Xlsx and PDF formats:

* **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Documents.Spreadsheet.FormatProviders.Pdf.dll**
* **Telerik.Zip.dll**

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's New

In the .NET Framework version of SpreadProcessing, scenarios like text measuring and exporting images to PDF are something that comes out of the box. However, the .NET Standard doesn't specify APIs to provide these functionalities built in the library, so there are some differences in both versions of SpreadProcessing.

### New APIs

The [Limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadSpreadProcessing** library exposes a SpreadExtensibilityManager class used for providing extensibility mechanisms.

#### SpreadExtensibilityManager class

The new **SpreadExtensibilityManager** class is exposing two properties:

* **ImagePropertiesResolver**: Gets or sets an *ImagePropertiesResolverBase* instance used to resolve image properties.

    > .NET Standard specification does not define APIs for getting the image properties.
    SpreadProcessing needs to have access to GDI+ basic graphics functionality.
    Thats why, to allow the library to get the image properties in order to export them a custom implementation inheriting the ImagePropertiesResolverBase abstract class have to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.
    
    >important If the ImagePropertiesResolver property is not set, an exception is thrown.

    #### **[C#] Example 1: Windows Example: Creating custom implementation inheriting the ImagePropertiesResolverBase abstract class**
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

    #### **[C#] Example 2: Set the custom implementation inheriting the ImagePropertiesResolverBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_1}}

        ImagePropertiesResolverBase imagePropertiesResolver = new ImageInfo();
        SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
    {{endregion}}

* **TextMeasurer**: Gets or sets a *SpreadTextMeasurerBase* instance used to provide text measuring. The TextMeasurer has a *SimpleTextMeasurer* as a default value.

    > The SimpleTextMeasurer provides basic functionality for text measuring and it is not expected to be an all-purpose measurer.

    **Example 3** shows how to set a custom implementation inheriting the SpreadTextMeasurerBase abstract class to the TextMeasurer property of the SpreadExtensibilityManager

    #### **[C#] Example 3: Set custom implementation inheriting the SpreadTextMeasurerBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_2}}

        SpreadTextMeasurerBase customTextMeasurer = new TextInfo();
        SpreadExtensibilityManager.TextMeasurer = customTextMeasurer;
    {{endregion}}
    
    
## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:
* Exporting images when exporting a Workbook to a PDF format requires a custom implementation inheriting the ImagePropertiesResolverBase abstract class to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.

### Currently not supported
 - At this point, the charts are not supported for .NET Standard.
 - When exporting to PDF, **PNG** images are **not** supported for .NET Standard. Due to framework limitations, **only JPEG and JPEG2000 are supported**.

## See Also

 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
