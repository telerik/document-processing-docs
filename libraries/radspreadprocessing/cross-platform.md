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
* [Assembly References](#assembly-references)

* [What's New](#whats-new)

* [Limitations in .Net Standard](#limitations-in-net-standard)

## Assembly References

In order to use the model of the **RadSpreadProcessing** library in your Cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Spreadsheet.dll**

The following assemblies are required in order to be able to export to Xlsx and PDF formats:

* **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Documents.Spreadsheet.FormatProviders.Pdf.dll**
* **Telerik.Zip.dll**

> Please note that for .NET Framework & .NET Core compatibility pack projects, the references contain "Windows" in their assembly names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's New

### New APIs

The [Limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadSpreadProcessing** library exposes a SpreadExtensibilityManager class used for providing extensibility mechanisms.

#### SpreadExtensibilityManager class

The new **SpreadExtensibilityManager** class is exposing two properties:

* **ImagePropertiesResolver**: Gets or sets an *ImagePropertiesResolverBase* instance used to resolve image properties.

    > .NET Standard specification does not define APIs for getting the image properties. Thus, in order to export them a custom implementation inheriting the ImagePropertiesResolverBase abstract class have to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager. Please, keep in mind this properties resolver does not have a default implementation.

    **Example 1** shows how you can create a custom implementation inheriting the ImagePropertiesResolverBase abstract class in Windows environment.

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

    **Example 2** shows how to set the custom implementation inheriting the ImagePropertiesResolverBase abstract class to the ImagePropertiesResolver property of the SpreadExtensibilityManager.

    #### **[C#] Example 2: Set the custom implementation inheriting the ImagePropertiesResolverBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_1}}

        ImagePropertiesResolverBase imagePropertiesResolver = new ImageInfo();
        SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
    {{endregion}}

* **TextMeasurer**: Gets or sets a *FlowTextMeasurerBase* instance used to provide text measuring. The TextMeasurer has a *SimpleTextMeasurer* as a default value, which provides basic functionality for text measuring.

    **Example 3** shows how to set a custom implementation inheriting the FlowTextMeasurerBase abstract class to the TextMeasurer property of the SpreadExtensibilityManager

    #### **[C#] Example 3: Set custom implementation inheriting the FlowTextMeasurerBase abstract class**
    {{region cs-radspreadprocessing-cross-platform_2}}

        FlowTextMeasurerBase customTextMeasurer = new TextInfo();
        SpreadExtensibilityManager.TextMeasurer = customTextMeasurer;
    {{endregion}}
    
    >tip The TextMeasurer must have a value. Otherwise, an exception is thrown.

## Limitations in .Net Standard

#### Additional settings required

Some functionalities require additional settings to be done:
* Exporting images when exporting a Workbook to a PDF format requires a custom implementation inheriting the ImagePropertiesResolverBase abstract class to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.

#### Currently not supported
At this point, the charts are not supported for .NET Standard.

## See Also

 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
