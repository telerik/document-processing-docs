---
title: Overview
page_title: Cross-Platform Support
description: Learn how to use SpreadProcessing for .NET Standard in your cross-platform applications.
slug: radspreadprocessing-cross-platform
tags: cross,platform,excel, spreadsheet, pdf, net standard
platforms: core, blazor, xamarin, winui, maui
published: True
position: 0
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor**, **UI for Xamarin**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

To use the model of **RadSpreadProcessing** in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:


| Assembly Name                            | Notes                                    |
|------------------------------------------|------------------------------------------|
| **Telerik.Documents.Core.dll**           |                                          |
| **Telerik.Documents.Spreadsheet.dll**    |                                          |
| **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.dll** | Required for working with XLSX files.    |
| **Telerik.Documents.Spreadsheet.FormatProviders.Xls.dll** | Required for working with XLS files.     |
| **Telerik.Documents.Fixed.dll**          | Required for exporting to PDF files.     |
| **Telerik.Documents.Spreadsheet.FormatProviders.Pdf.dll** | Required for exporting to PDF files.     |
| **Telerik.Zip.dll**                      | Required for working with XSLX, XLS and PDF files. |
| **Telerik.Documents.ImageUtils.dll** <br><sub>_This assembly is not available in UI for Xamarin._</sub> | Required when you need to export to PDF documents containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High. |

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **SkiaSharp**. In order to use this assembly, you will need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

> Note that for .NET Framework, {{site.dotnetversions}} with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's Different Between .NET Framework and .NET Standard versions of SpreadProcessing

In the .NET Framework version of SpreadProcessing, scenarios like text measuring and exporting images to PDF are something that comes out of the box. However, the .NET Standard doesn't specify APIs to provide these functionalities built in the library, so there are some differences in both versions of SpreadProcessing.

#### SpreadExtensibilityManager class

The [Limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadSpreadProcessing** library for .NET Standard exposes the SpreadExtensibilityManager class used for providing extensibility mechanisms.

The **SpreadExtensibilityManager** class has the following properties:

* **ImagePropertiesResolver**: Gets or sets an *ImagePropertiesResolverBase* instance used to resolve image properties when exporting to PDF. Check the [Export Images to PDF]({%slug radspreadprocessing-cross-platform-images%}) topic for more details.

* **TextMeasurer**: Gets or sets a *SpreadTextMeasurerBase* instance used to provide text measuring. Check the [Text Measuring]({%slug radspreadprocessing-cross-platform-text-measure%}) topic for more details.

## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:

* Exporting images when exporting a Workbook to a PDF format requires an implementation inheriting the ImagePropertiesResolverBase abstract class to be set to the ImagePropertiesResolver property inside the SpreadExtensibilityManager.

* In order to export to PDF format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

* In order to **export to PDF** format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), the [FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

### Currently not supported

 * At this point, **charts** are not supported for .NET Standard. They are skipped if a spreadsheet document with charts is imported and the users cannot create and insert charts in their documents through the API of SpreadProcessing.

## See Also

 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
