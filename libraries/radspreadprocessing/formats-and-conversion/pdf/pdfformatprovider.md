---
title: Using PdfFormatProvider
description: Learn how to export spreadsheet documents to PDF using the PdfFormatProvider in RadSpreadProcessing.
page_title: Using PdfFormatProvider
slug: radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: pdf, format, provider, spreadsheet, radspreadprocessing, export, workbook, document, conversion
published: True
position: 2
---

# Using PdfFormatProvider



`PdfFormatProvider` is part of SpreadProcessing and allows export to PDF format.

## Using PdfFormatProvider

`PdfFormatProvider` makes it easy to export a Workbook to PDF format. Each Worksheet exported to PDF is divided into pages according to its `WorksheetPageSetup`. For more information about paging a Worksheet, see the [Worksheet Page Setup]({%slug radspreadprocessing-features-worksheetpagesetup%}) article.

>note For more examples and application scenarios of importing and exporting a Workbook to various formats using a FormatProvider, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Prerequisites

To use `PdfFormatProvider`, add references to the following packages:

* **.NET Framework**, **{{site.dotnetversions}}** (or later) for Windows 
    * Telerik.Windows.Documents.Spreadsheet
    * Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf

* **.NET Standard 2.0 ({{site.dotnetversions}})** 
    * Telerik.Documents.Spreadsheet
    * Telerik.Documents.Spreadsheet.FormatProviders.Pdf
            

## Export

>note The **.NET Standard** specification does not define APIs for getting specific fonts. `PdfFormatProvider` needs access to the font data so that it can read it and add it to the PDF file. To allow the library to create and use fonts, you must provide an implementation of the `FontsProviderBase` abstract class and set this implementation to the `FontsProvider` property of `FixedExtensibilityManager`. For detailed information, check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

>note **.NET Standard**: To export images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, set the `JpegImageConverter` property inside the `FixedExtensibilityManager`. For more information, check the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.


**Example 1** shows how to use `PdfFormatProvider` to export a Workbook to a file.

**Example 1: PdfFormatProvider Export Example**

<snippet id='codeblock-cpc'/>

The result from the export method is a document that you can open in any application that supports PDF documents.

**Example 2: Export to RadFixedDocument**

<snippet id='codeblock-cpd'/>

>tip `RadFixedDocument` is the base class of the `RadPdfProcessing` library. For more information about the library and its features, see the [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%}).

## See Also

* [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%})
* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Export Worksheet to Image]({%slug spreadprocessing-export-worksheet-to-image-netstandard%})
* [Preserving the Font in PDF Export from Excel]({%slug preserve-font-boldness-pdf-export-radspreadprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})

