---
title: Settings
description: Learn about the export settings available for the PdfFormatProvider in RadSpreadProcessing to customize PDF output.
page_title: Settings
slug: radspreadprocessing-format-and-conversion-pdf-settings
tags: pdf, format, provider, settings, spreadsheet, radspreadprocessing, export, configuration, margins
published: True
position: 3
---

# Settings

`PdfFormatProvider` allows you to export PDF documents. Several settings allow you to customize the export.

## PdfExportSettings

`PdfExportSettings` controls how a `Workbook` is exported to PDF. Use `PdfExportSettings` to specify the following properties:

| Property | Description |
|---|---|
| `ExportWhat` | Enumeration specifying whether to export the Active Sheet, the Entire Workbook, or the current Selection. |
| `IgnorePrintArea` | Boolean value indicating whether to ignore print area when exporting worksheets. |
| `IncludeHiddenSheets` | Boolean value indicating whether to include the hidden sheets or to skip them. Default value is `false`. |
| `SelectedRanges` | A list of ranges specifying which areas of the active worksheet to export. Use the `ExportWhat.Selection` option to export exactly this `SelectedRanges` from the current worksheet, ignoring `PrintArea` and `PageBreaks` from `WorksheetPageSetup`. |
| `PdfFileSettings` | A property of type `PdfExportSettings` related to the [RadPdfProcessing library]({%slug radpdfprocessing-overview%}). Allows you to control the image quality, encryption, compliance level, and other PDF format-related properties. More information is available in the [export settings article for RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}). |
| `ChartRenderer` | A property of type [IPdfChartRenderer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.formatproviders.pdf.export.ipdfchartrenderer) that gets or sets the renderer used to render charts. Not relevant for the .NET Standard version of the Telerik Document Processing libraries. Read more in the [Export Chart to PDF]({%slug radspreadprocessing-features-charts-pdf-export%}) article. |

The following example shows how to export the Entire Workbook without ignoring the `PrintArea` property in all worksheets.

**Example 1: Export Entire Workbook**

<snippet id='codeblock-coz'/>

The following example shows how to export only two selected ranges from the active worksheet, ignoring print areas and page breaks.

**Example 2: Export two explicit cell ranges from the active worksheet**

<snippet id='codeblock-cpa'/>

>To specify file export settings to the `PdfFormatProvider`, you need to add both the Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export and Telerik.Windows.Documents.Flow.FormatProviders.Pdf.Export namespaces. In Example 3 the *Fixed* alias corresponds to the `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export` namespace.

Another export option is to specify settings specific to the PDF format for the exported document. The following example demonstrates how to use the `PdfFileSettings` property to export a PDF/A-compliant document.

**Example 3: Configure PdfFileSettings to export a PDF/A-2b compliant document**

<snippet id='codeblock-cpb'/>

## See Also

* [PdfProcessing Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [PdfProcessing PDF/A Compliancy]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
