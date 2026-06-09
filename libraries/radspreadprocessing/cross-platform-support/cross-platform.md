---
title: Overview
page_title: Cross-Platform Support
description: Learn how to use SpreadProcessing for .NET Standard in your cross-platform applications.
slug: radspreadprocessing-cross-platform
tags: crossplatform, spreadsheet, dotnet, standard, radspreadprocessing, pdf, excel, blazor
platforms: core, blazor, winui, maui
published: True
position: 0
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** and **.NET Standard** support. A set of packages built against .NET Core and .NET Standard is available for you to reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the packages through the **UI for ASP.NET Core**, **UI for Blazor**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the previously mentioned suites.

## Package References

To use the model of `RadSpreadProcessing` in your cross-platform project, add references to the following .NET Standard packages:

| Package Name                            | Notes                                    |
|------------------------------------------|------------------------------------------|
| **Telerik.Documents.Core**           |                                          |
| **Telerik.Documents.Spreadsheet**    |                                          |
| **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml** | Required for working with XLSX files.    |
| **Telerik.Documents.Spreadsheet.FormatProviders.Xls** | Required for working with XLS files.     |
| **Telerik.Documents.Fixed**          | Required for exporting to PDF files.     |
| **Telerik.Documents.Spreadsheet.FormatProviders.Pdf** | Required for exporting to PDF files.     |
| ~~Telerik.Zip~~*                      | ~~Required for working with XSLX, XLS and PDF files.~~ |
| **Telerik.Documents.ImageUtils** | Required when you need to export to PDF documents containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High. |

>note *Starting with Q2 2025, the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries (PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing). It will be replaced by `System.IO.Compression`. Telerik will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

>note The **Telerik.Documents.ImageUtils** package depends on **SkiaSharp**. To use this package, add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2), SkiaSharp replaced ImageSharp as the required dependency.

> Note that for .NET Framework, {{site.dotnetversions}} with Windows Compatibility Pack projects, the references contain "Windows" in their names (for example, **Telerik.Windows.Documents.Core**)

## Differences Between .NET Framework and .NET Standard Versions of SpreadProcessing

In the .NET Framework version of SpreadProcessing, scenarios such as text measuring and exporting images to PDF work without additional configuration. However, .NET Standard does not specify APIs to provide these features built in the library, so there are some differences between the two versions.

### SpreadExtensibilityManager Class

The [Limitations in .NET Standard](#limitations-in-net-standard) require some additional settings. The `RadSpreadProcessing` library for .NET Standard exposes the `SpreadExtensibilityManager` class used for providing extensibility mechanisms.

The `SpreadExtensibilityManager` class has the following properties:

| Property | Description |
|---|---|
| `ImagePropertiesResolver` | Gets or sets an `ImagePropertiesResolverBase` instance used to resolve image properties when exporting to PDF. See [Export Images to PDF]({%slug radspreadprocessing-cross-platform-images%}) for more details. |
| `TextMeasurer` | Gets or sets a `SpreadTextMeasurerBase` instance used to provide text measuring. See [Text Measuring]({%slug radspreadprocessing-cross-platform-text-measure%}) for more details. |

## Limitations in .NET Standard

### Additional Settings Required

Some features require additional settings:

* Exporting images when exporting a Workbook to PDF format requires an implementation inheriting the `ImagePropertiesResolverBase` abstract class to be set to the `ImagePropertiesResolver` property inside the `SpreadExtensibilityManager`.

* To export to PDF format documents containing images different than Jpeg and Jpeg2000 or `ImageQuality` different than High, set the `JpegImageConverter` property inside the `FixedExtensibilityManager`. For more information, check the `FixedExtensibilityManager` in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

* To export to PDF format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), set the [FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) property inside the `FixedExtensibilityManager`. For more information, check the `FixedExtensibilityManager` in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

### Not Supported

* Exporting [charts]({%slug radspreadprocessing-features-charts%}) to [PDF format]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) is not supported for .NET Standard.

## See Also

* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
