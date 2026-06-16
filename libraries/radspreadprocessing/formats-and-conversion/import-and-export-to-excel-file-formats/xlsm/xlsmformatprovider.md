---
title: Using XlsmFormatProvider
page_title: Import and Export to Xlsm File Format Using XlsmFormatProvider
description: Learn how to import and export macro-enabled XLSM (Excel Workbook) files by using the XlsmFormatProvider class in RadSpreadProcessing.
slug: radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider
tags: xlsm, format, provider, xlsm, spreadsheet, radspreadprocessing, excel, import, export, macros
published: True
position: 1

---

# Using XlsmFormatProvider


`XlsmFormatProvider` makes it easy to import and export XLSM (Excel Workbook that supports macros) files. An XLSM file is a group of zipped files that conform to the Office Open XML schema. The format allows you to export all parts of a workbook: worksheets, formula values, formatting, hyperlinks, and more.

> Currently, macros are only preserved during import and export. They cannot be executed or changed in the code.

>Unlike the CSV and TXT format providers, the `XlsmFormatProvider` requires references to the following packages:
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.

>note Starting with **Q2 2025**, the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by System.IO.Compression. The Telerik Zip Library will continue to ship as a standalone library so you can still use it separately.

After you reference these packages, create an instance of the `XlsmFormatProvider` to import and export XLSM (Excel Workbook) files. This provider appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsm` namespace. `XlsmFormatProvider` implements the `IWorkbookFormatProvider` interface, which in turn appears in `Telerik.Windows.Documents.Spreadsheet.FormatProviders`. Depending on whether you work with the concrete class or the interface, include either the first or both namespaces.

>note For more examples and application scenarios of importing and exporting a workbook to various formats, see the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.


## Import

The following example shows how to import an XLSM file through a `FileStream`. The code verifies that a file with the specified name exists. The sample creates an `XlsmFormatProvider` instance and passes a `FileStream` to its `Import()` method.
        

**Example 1: Import XLSM (Excel Workbook) File**

<snippet id='codeblock-cot'/>

## Export

The following example demonstrates how to export an existing workbook to an XLSM file. The snippet creates a new workbook with a single worksheet. The example then creates an `XlsmFormatProvider` instance and invokes its `Export()` method. The `Export()` method accepts a parameter of type `Stream` so you can work with any of its inheritors.

>Exporting a workbook created with RadSpreadProcessing produces a file with empty macros (VBA Project).

**Example 2: Export Spreadsheet Document to XLSM (Excel Workbook) File**

<snippet id='codeblock-cou'/>


**Example 3: Export Spreadsheet Document to a Stream and byte[]**

<snippet id='codeblock-cov'/> 

## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})