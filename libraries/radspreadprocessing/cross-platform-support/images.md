---
title: Exporting Images
page_title: Exporting Images
description: Check this topic to learn how you can handle the PDF export of spreadsheets with images in SpreadProcessing for .NET Standard.
slug: radspreadprocessing-cross-platform-images
tags: cross,platform,net,standard,images,pdf,spreadsheet,excel
platforms: core, blazor, xamarin, winui
published: True
position: 2
---

# Exporting Images in .NET Standard

.NET Standard specification does not define APIs for getting the image properties. SpreadProcessing needs to have access to GDI+ basic graphics functionality when exporting spreadsheets that contain images. That is why, to allow the library to get the image properties needed for **saving the workbook**, an implementation inheriting the **ImagePropertiesResolverBase** abstract class must be set to the **ImagePropertiesResolver** property of **SpreadExtensibilityManager**.

>note The **Telerik.Documents.ImageUtils** assembly provides a default implementation of the ImagePropertiesResolver class that could be used when exporting the document.

#### [C#] Example 1: Set the default implementation of the ImagePropertiesResolver class

{{region cs-radspreadprocessing-cross-platform_0}}

    ImagePropertiesResolverBase imagePropertiesResolver = new ImagePropertiesResolver();
    SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
{{endregion}}

#### [C#] Example 2: Windows Example: Create a custom implementation inheriting the ImagePropertiesResolverBase abstract class

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

#### [C#] Example 3: Set the custom implementation inheriting the ImagePropertiesResolverBase abstract class

{{region cs-radspreadprocessing-cross-platform_1}}

    ImagePropertiesResolverBase imagePropertiesResolver = new ImageInfo();
    SpreadExtensibilityManager.ImagePropertiesResolver = imagePropertiesResolver;
{{endregion}}



## See Also

 * [Cross-Platform Support]({%slug radspreadprocessing-cross-platform%})
 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
 * [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
 * [PdfProcessing Library Documentation]({%slug radpdfprocessing-overview%})
