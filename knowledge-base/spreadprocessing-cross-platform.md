---
title: How to resolve SpreadProcessing Cross-Platform Differences Due To Limitations
description: Resolve layout, font, and image differences when you process Excel files with RadSpreadProcessing and/or export to PDF with RadPdfProcessing in Cross-Platform Apps.
type: troubleshooting
page_title: Resolve Cross-Platform Excel and PDF Export Differences | Telerik Document Processing
slug: spreadprocessing-cross-platform
tags: spreadprocessing, pdfprocessing, crossplatform, xlsx, pdf, fonts, textmeasuring, images, pagesetup, export
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.2.707 | RadSpreadProcessing/RadPdfProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

In cross-platform projects, you often use [`RadSpreadProcessing`]({%slug radspreadprocessing-overview%}) to work with Excel files and use [`PdfFormatProvider`]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) only for Excel to PDF conversion. In this setup, the XLSX result can look correct while the exported PDF result shows clipped text, fallback fonts, or image issues.

This article covers two scenarios:

* Working only with XLSX files through [`Workbook`]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and [`Worksheet`]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) APIs.
* Working with XLSX files and exporting to PDF through [`PdfFormatProvider`]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

## Cause

The cross-platform build does not expose OS-specific APIs for automatic font resolution, text measurement, and image processing. Because of this, XLSX processing and PDF export do not use identical rendering paths unless you configure the required extensibility points.

## Solution

### Apply Configuration Based on the Scenario

Use the following mapping:

| Scenario | Typical Effect | Action |
| --- | --- | --- |
| XLSX import, edit, and export only | Incorrect text fit, width, or row-height calculations in specific layouts | Configure [`SpreadExtensibilityManager.TextMeasurer`]({%slug radspreadprocessing-cross-platform-text-measure%}) |
| XLSX to PDF export | Missing symbols, fallback fonts, clipped text, image export issues, and page layout differences | Configure text measuring, fonts, images, and page setup before export |

### Configure Text Measuring for Both Scenarios

Set [`SpreadExtensibilityManager.TextMeasurer`]({%slug radspreadprocessing-cross-platform-text-measure%}) to improve text sizing:

```csharp
SpreadTextMeasurerBase fixedTextMeasurer = new SpreadFixedTextMeasurer();
SpreadExtensibilityManager.TextMeasurer = fixedTextMeasurer;
```

Text measuring affects both XLSX-only and XLSX to PDF workflows.

### Configure Fonts for XLSX to PDF Export

Set a [`FontsProviderBase`]({%slug radpdfprocessing-cross-platform-fonts%}) implementation to [`FixedExtensibilityManager`]({%slug radpdfprocessing-cross-platform%}) so the exporter can read and embed document fonts:

```csharp
FontsProviderBase fontsProvider = new FontsProvider();
FixedExtensibilityManager.FontsProvider = fontsProvider;
```

If fonts are not resolved, the PDF export pipeline falls back to standard PDF fonts and the result differs from the original XLSX file.

>important When you use `SpreadFixedTextMeasurer` for PDF export, also configure `FixedExtensibilityManager.FontsProvider` to avoid font fallback.

### Configure Image Processing for XLSX to PDF Export

If the workbook contains images that require conversion or metadata parsing, configure the image extensibility points described in:

* [Exporting Images in SpreadProcessing Cross-Platform]({%slug radspreadprocessing-cross-platform-images%})
* [Images in PdfProcessing Cross-Platform]({%slug radpdfprocessing-cross-platform-images%})

Without this setup, export can fail or produce different image output.

### Configure Page Setup and PDF Export Settings for XLSX to PDF

Before calling [`PdfFormatProvider`]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}), configure [`WorksheetPageSetup`]({%slug radspreadprocessing-features-worksheetpagesetup%}) and [`PdfExportSettings`]({%slug radspreadprocessing-format-and-conversion-pdf-settings%}) to control scaling, margins, paper size, and exported range:

```csharp
WorksheetPageSetup pageSetup = workbook.ActiveWorksheet.WorksheetPageSetup;
pageSetup.FitToPages = true;
pageSetup.FitToPagesWide = 1;
pageSetup.FitToPagesTall = 0;
```

### Handle Known Cross-Platform Limits

Chart export to PDF is not supported in .NET Standard for [`RadSpreadProcessing`]({%slug radspreadprocessing-cross-platform%}). If your workbook depends on chart visuals, use an alternative workflow such as pre-rendering charts outside the PDF export pipeline.

## See Also

* [SpreadProcessing Cross-Platform Support]({%slug radspreadprocessing-cross-platform%})
* [Text Measuring in SpreadProcessing]({%slug radspreadprocessing-cross-platform-text-measure%})
* [Exporting Images in SpreadProcessing Cross-Platform]({%slug radspreadprocessing-cross-platform-images%})
* [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
* [Fonts in PdfProcessing Cross-Platform]({%slug radpdfprocessing-cross-platform-fonts%})
* [Images in PdfProcessing Cross-Platform]({%slug radpdfprocessing-cross-platform-images%})
* [How to Implement a FontsProvider]({%slug pdfprocessing-implement-fontsprovider%})
* [Worksheet Page Setup]({%slug radspreadprocessing-features-worksheetpagesetup%})
* [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%})
