---
title: Using XlsxFormatProvider
page_title: Import and Export to Excel File Format Using XlsxFormatProvider
description: Learn how to import and export XLSX workbook files by using the XlsxFormatProvider class in RadSpreadProcessing, with code examples for common scenarios.
slug: radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider
tags: xlsx, format, provider, xlsx, spreadsheet, radspreadprocessing, excel, import, export, workbook
published: True
position: 2
---

# Using XlsxFormatProvider

`XlsxFormatProvider` imports and exports XLSX workbook files in `RadSpreadProcessing`. An XLSX file is a ZIP package that follows the Office Open XML specification. The provider preserves workbook data such as worksheets, formula values, formatting, and hyperlinks.

To use `XlsxFormatProvider`, reference one of the following packages:

* `Telerik.Documents.Spreadsheet.FormatProviders.OpenXml` for cross-platform projects.
* `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml` for Windows-only projects.

>note Starting with **Q2 2025** the Zip Library is no longer used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It is replaced by the System.IO.Compression. The Telerik Zip Library continues to ship as a standalone library so clients can still use it separately.

After you reference the required package, create an instance of `XlsxFormatProvider` to import and export XLSX files. The provider is in the `Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx` namespace. `XlsxFormatProvider` implements the `IWorkbookFormatProvider` interface from the `Telerik.Documents.Spreadsheet.FormatProviders` namespace. The class also exposes `ImportSettings` and `ExportSettings` properties of type `XlsxImportSettings` and `XlsxExportSettings`.

>note For more examples and end-to-end scenarios, see [how to import, export, save, and load `RadSpreadProcessing` workbooks]({%slug import-export-save-load-workbook%}).

## Import

The following example shows how to import an XLSX file through a `FileStream`. The code verifies that a file with the specified name exists. The sample then creates an `XlsxFormatProvider` instance and passes the `FileStream` to its `Import()` method.

#### __Example 1: Import an XLSX Workbook__

<snippet id='codeblock-cow'/>

## Export

The following example shows how to export an existing `Workbook` to an XLSX file. The snippet creates a new workbook with a single worksheet. It then creates an `XlsxFormatProvider` instance and calls its `Export()` method. The `Export()` method accepts a `Stream`, so you can use any `Stream` implementation.

#### __Example 2: Create a Workbook and Export It to an XLSX File Stream__

<snippet id='codeblock-cox'/>

#### __Example 3: Export a Workbook to a Memory Stream__

<snippet id='codeblock-coy'/>

*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Resolve Exporting Corrupted Excel Files with SpreadProcessing]({%slug resolving-excel-file-corruption-warning-after-spreadprocessing-export%})
* [Opening Excel Files Locked by Another User/Process with Telerik SpreadProcessing]({%slug spreadprocessing-open-locked-files-read-only%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
