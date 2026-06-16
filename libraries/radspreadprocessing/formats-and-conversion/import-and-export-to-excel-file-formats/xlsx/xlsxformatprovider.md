---
title: Using XlsxFormatProvider
page_title: Import and Export to Excel File Format Using XlsxFormatProvider
description: Learn how to import and export XLSX Excel Workbook files using the XlsxFormatProvider class in RadSpreadProcessing with code examples.
slug: radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider
tags: xlsx, format, provider, xlsx, spreadsheet, radspreadprocessing, excel, import, export, workbook
published: True
position: 2
---

# Using XlsxFormatProvider

`XlsxFormatProvider` makes it easy to import and export XLSX (Excel Workbook) files. An XLSX file is a group of zipped files that conform to the Office Open XML schema. The format allows you to export all parts of a workbook: worksheets, formula values, formatting, hyperlinks, and more.

>Unlike the CSV and TXT format providers, the `XlsxFormatProvider` requires references to the following package:
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml

>note Starting with **Q2 2025** the Zip Library is no longer used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It is replaced by the System.IO.Compression. The Telerik Zip Library continues to ship as a standalone library so clients can still use it separately.

Once you reference the required package, create an instance of `XlsxFormatProvider` to import and export XLSX (Excel Workbook) files. This provider appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx` namespace. `XlsxFormatProvider` implements the `IWorkbookFormatProvider` interface, which in turn appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders` namespace. Depending on whether you want to work with the concrete class or the interface, you need to include either the first or both namespaces.

>note For more examples and application scenarios of importing and exporting a workbook to various formats using a format provider, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Import

The following example shows how to import an XLSX file using a FileStream. The code verifies that a file with the specified name exists. The sample then creates an `XlsxFormatProvider` instance and passes a FileStream to its `Import()` method.

**Example 1: Import XLSX (Excel Workbook) File**

<snippet id='codeblock-cow'/>

## Export

The following example demonstrates how to export an existing Workbook to an XLSX file. The snippet creates a new workbook with a single worksheet. It then creates an `XlsxFormatProvider` and calls its `Export()` method. The `Export()` method accepts a parameter of type `Stream` so you can work with any of its inheritors.

**Example 2: Export Spreadsheet Document to XLSX (Excel Workbook) File**

<snippet id='codeblock-cox'/>

**Example 3: Export Spreadsheet Document to a Stream and Byte Array**

<snippet id='codeblock-coy'/>

*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Resolve Exporting Corrupted Excel Files with SpreadProcessing]({%slug resolving-excel-file-corruption-warning-after-spreadprocessing-export%})
* [Opening Excel Files Locked by Another User/Process with Telerik SpreadProcessing]({%slug spreadprocessing-open-locked-files-read-only%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
