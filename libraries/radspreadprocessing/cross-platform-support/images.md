---
title: Exporting Images
page_title: Exporting Images
description: Check this topic to learn how you can handle the PDF export of spreadsheets with images in SpreadProcessing for .NET Standard.
slug: radspreadprocessing-cross-platform-images
tags: images, crossplatform, pdf, spreadsheet, radspreadprocessing, export, dotnet, standard, excel, xlsx
platforms: core, blazor, winui, maui
published: True
position: 2
---

# Exporting Images in .NET Standard

.NET Standard specification does not define APIs for getting the image properties. SpreadProcessing needs to have access to GDI+ basic graphics functionality when exporting spreadsheets that contain images. That is why, to allow the library to get the image properties needed for **saving the workbook**, an implementation inheriting the **ImagePropertiesResolverBase** abstract class must be set to the **ImagePropertiesResolver** property of **SpreadExtensibilityManager**.

>note The **Telerik.Documents.ImageUtils** package provides a default implementation of the ImagePropertiesResolver class that could be used when exporting the document.

#### Example 1: Set the default implementation of the ImagePropertiesResolver class

<snippet id='codeblock-cgc'/>

#### Example 2: Windows Example: Create a custom implementation inheriting the ImagePropertiesResolverBase abstract class

<snippet id='codeblock-cgd'/>

#### Example 3: Set the custom implementation inheriting the ImagePropertiesResolverBase abstract class

<snippet id='codeblock-cge'/>



## See Also

 * [Cross-Platform Support]({%slug radspreadprocessing-cross-platform%})
 * [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
 * [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
 * [PdfProcessing Library Documentation]({%slug radpdfprocessing-overview%})
