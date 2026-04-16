---
title: Using CsvFormatProvider
page_title: Using CsvFormatProvider
slug: radspreadprocessing-formats-and-conversion-csv-csvformatprovider
tags: using,csvformatprovider
published: True
position: 1
---

# Using CsvFormatProvider



__CsvFormatProvider__ makes it easy to import and export CSV files. Note that CSV is a plain text format,meaning that it keeps only the contents of the worksheet without its formatting. Exporting a file to CSV strips all styling and saves only cell's result value with the respective format applied. Moreover, it exports only the contents of the active worksheet – no support for exporting multiple worksheets into a csv at once is available.
      

To import and export csv files, you need to use the __CsvFormatProvider__ class that appears in the Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv namespace. The __CsvFormatProvider__ implements the __IWorkbookFormatProvider__ interface which in turn is contained in the Telerik.Windows.Documents.Spreadsheet.FormatProviders namespace.

>note For more examples and application scenarios of Importing and Exporting a Workbook to various formats using a FormatProvider check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.
      

## Import

__Example 1__ shows how to import a CSV file using a __FileStream__. The code assures that a file with the specified name exists. Further, the sample instantiates a __CsvFormatProvider__ and passes a FileStream to its __Import()__ method.
        

#### __Example 1: Import CSV file__

<snippet id='codeblock-coi'/>



## Export

__Example 2__ demonstrates how to export an existing Workbook to a CSV file. The snippet creates a new workbook with a single worksheet. Further, it creates a __CsvFormatProvider__ and invokes its __Export()__ method:
        

#### __Example 2: Export CSV file__

<snippet id='codeblock-coj'/>


## See Also

* [IWorkbookFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider.html)
* [CsvFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider.html)
* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
