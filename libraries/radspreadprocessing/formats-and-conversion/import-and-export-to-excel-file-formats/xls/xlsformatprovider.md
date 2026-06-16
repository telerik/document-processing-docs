---
title: Using XlsFormatProvider
page_title: Import and Export to Excel 97-2003 File Format Using XlsFormatProvider
description: Learn how to import and export Excel 97-2003 (XLS) workbook files by using the XlsFormatProvider class in RadSpreadProcessing.
slug: radspreadprocessing-formats-and-conversion-xls-xlsformatprovider
tags: xls, format, provider, xls, spreadsheet, radspreadprocessing, excel, import, export, workbook
published: True
position: 2
platforms: core, mvc, ajax, blazor, wpf, winforms, winui
---

# Using XlsFormatProvider

`XlsFormatProvider` makes it easy to import and export XLS (Excel 97-2003 Workbook) files. The functionality is available starting with R3 2020.

>The `XlsFormatProvider` requires references to the following packages:
        
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls for .NET Framework projects
>* Telerik.Documents.Spreadsheet.FormatProviders.Xls for .NET Standard projects

After you reference these packages, create an instance of the `XlsFormatProvider` to import and export Excel 97-2003 Workbook files. This provider appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls` namespace. `XlsFormatProvider` implements the `IWorkbookFormatProvider` interface, which in turn appears in `Telerik.Windows.Documents.Spreadsheet.FormatProviders`. Depending on whether you work with the concrete class or the interface, include either the first or both namespaces.
      

>note For more examples and application scenarios of importing and exporting a workbook to various formats, see the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Import

The following example shows how to import an XLS file through a `FileStream`. The code verifies that a file with the specified name exists. The sample creates an `XlsFormatProvider` instance and passes a `FileStream` to its `Import()` method.
        

**Example 1: Import XLS (Excel 97-2003 Workbook) File**

<snippet id='codeblock-coq'/>



## Export

The following example demonstrates how to export an existing workbook to an XLS file. The snippet creates a new workbook with a single worksheet. The example then creates an `XlsFormatProvider` instance and invokes its `Export()` method. The `Export()` method accepts a parameter of type `Stream` so you can work with any of its inheritors.
        

**Example 2: Export Spreadsheet Document to XLS (Excel 97-2003 Workbook) File**

<snippet id='codeblock-cor'/>


**Example 3: Export Spreadsheet Document to a Stream and byte[]**

<snippet id='codeblock-cos'/>


*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.


## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
