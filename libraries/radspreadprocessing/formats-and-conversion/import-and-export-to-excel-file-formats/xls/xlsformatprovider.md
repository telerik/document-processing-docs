---
title: Using XlsFormatProvider
page_title: Import and Export to Excel 97-2003 File Format Using XlsFormatProvider
description: Import and Export to Excel 97-2003 File Format Using XlsFormatProvider.
slug: radspreadprocessing-formats-and-conversion-xls-xlsformatprovider
tags: xlsformatprovider,excel97-2003,workbook,xls,import,export,save
published: True
position: 2
platforms: core, mvc, ajax, blazor, wpf, winforms, xamarin, winui
---

# Using XlsFormatProvider

__XlsFormatProvider__ makes it easy to import and export to XLS (Excel 97-2003 Workbook) files. The functionality is available since R3 2020.

>The __XlsFormatProvider__ requires references to the following packages:
        
>* Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls for .NET Framework projects
>* Telerik.Documents.Spreadsheet.FormatProviders.Xls for .NET Standard projects

Once you reference the aforementioned packages, you need to create an instance of the __XlsFormatProvider__ in order to import and export Excel 97-2003 Workbook files. This provider appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls namespace. __XlsFormatProvider__ implements the __IWorkbookFormatProvider__ interface, which in turn appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders. Depending on the whether you would like to work with the concrete class or the interface, you would need to include either the first or both namespaces.
      

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Import

__Example 1__ shows how to import an XLS file using a FileStream. The code assures that a file with the specified name exists. Further, the sample instantiates an __XlsFormatProvider__ and passes a FileStream to its __Import()__ method.
        

#### __Example 1: Import XLS (Excel 97-2003 Workbook) file__

<snippet id='codeblock-coq'/>



## Export

__Example 2__ demonstrates how to export an existing Workbook to an XLS file. The snippet creates a new workbook with a single worksheet. Further, the example creates an __XlsFormatProvider__ and invokes its __Export()__ method. Note that the __Export()__ method accepts a parameter of type __Stream__ so you can work with any of its inheritors.
        

#### __Example 2: Export spreadsheet document to XLS (Excel 97-2003 Workbook) file__

<snippet id='codeblock-cor'/>


#### __Example 3: Export spreadsheet document to a Stream and byte[]__

<snippet id='codeblock-cos'/>


*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.


## See Also

* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
