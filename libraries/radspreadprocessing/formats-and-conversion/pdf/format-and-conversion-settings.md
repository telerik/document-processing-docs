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



__PdfFormatProvider__ allows to export PDF documents. Additionally, there are a number of settings that allow you to modify the export. The current article outlines the available settings.
      

## 

__PdfExportSettings__ allow controlling how a __Workbook__ is exported to PDF. Using __PdfExportSettings__ you may specify:
        

| Property | Description |
|---|---|
| `ExportWhat` | Enumeration specifying whether to export the Active Sheet, the Entire Workbook, or the current Selection. |
| `IgnorePrintArea` | Boolean value indicating whether or not to ignore print area when exporting worksheets. |
| `IncludeHiddenSheets` | Boolean value indicating whether to include the hidden sheets or to skip them. Default value is `false`. |
| `SelectedRanges` | A list of ranges specifying which areas of the active worksheet should be exported. Using the `ExportWhat.Selection` option you may specify that you need to export exactly this `SelectedRanges` from the current worksheet, ignoring `PrintArea` and `PageBreaks` from `WorksheetPageSetup`. |
| `PdfFileSettings` | A property of type `PdfExportSettings` related to the [RadPdfProcessing library]({%slug radpdfprocessing-overview%}). Allows you to control the image quality, encryption, compliance level, and other PDF format-related properties. More information is available in the [export settings article for RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}). |
| `ChartRenderer` | A property of type [IPdfChartRenderer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.formatproviders.pdf.export.ipdfchartrenderer) that gets or sets the renderer used to render charts. Not relevant for the .NET Standard version of the Telerik Document Processing libraries. Read more in the [Export Chart to PDF]({%slug radspreadprocessing-features-charts-pdf-export%}) article. |


__Example 1__ shows how to export the Entire Workbook without ignoring the __PrintArea__ property in all worksheets.
        

#### __Example 1: Export entire workbook__

<snippet id='codeblock-coz'/>



__Example 2__ shows how to export only two selected ranges from the active worksheet, ignoring print areas and page breaks.
        

#### __Example 2: Export selection__

<snippet id='codeblock-cpa'/>


>In order to specify file export settings to the __PdfFormatProvider__ you need to add both the Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export and Telerik.Windows.Documents.Flow.FormatProviders.Pdf.Export namespaces. In Example 3 the *Fixed* alias corresponds to the __Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export__ namespace.


Another export option is to specify settings specific to the PDF format to the exported document. __Example 3__ demonstrates how to utilize the __PdfFileSettings__ property in order to export a PDF/A-compliant document.


#### __Example 3: Export PDF/A compliant document__

<snippet id='codeblock-cpb'/>


## See Also

* [PdfProcessing Export Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
* [PdfProcessing PDF/A Compliancy]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
