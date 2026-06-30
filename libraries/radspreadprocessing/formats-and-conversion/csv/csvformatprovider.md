---
title: Using CsvFormatProvider
description: Learn how to import and export CSV files using the CsvFormatProvider in RadSpreadProcessing.
page_title: Using CsvFormatProvider
slug: radspreadprocessing-formats-and-conversion-csv-csvformatprovider
tags: csv, format, provider, spreadsheet, radspreadprocessing, csv, import, export, workbook, delimiter, spread
published: True
position: 1
---

# Using CsvFormatProvider

`CsvFormatProvider` makes it easy to import and export CSV files. CSV is a plain text format, meaning that it keeps only the contents of the worksheet without its formatting. Exporting a file to CSV strips all styling and saves only the cell result value with the respective format applied. The provider exports only the contents of the active worksheet. Exporting multiple worksheets into a single CSV file is not supported.

To import and export CSV files, use the `CsvFormatProvider` class that appears in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv` namespace. The `CsvFormatProvider` implements the `IWorkbookFormatProvider` interface which is contained in the `Telerik.Windows.Documents.Spreadsheet.FormatProviders` namespace.

>note For more examples and application scenarios of importing and exporting a Workbook to various formats using a FormatProvider, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Import

**Example 1** shows how to import a CSV file using a `FileStream`. The code assures that a file with the specified name exists. Further, the sample instantiates a `CsvFormatProvider` and passes a `FileStream` to its `Import()` method.

**Example 1: Import CSV File**

<snippet id='libraries-spread-formats-and-conversion-csv-csvformatprovider-1'/>

## Export

**Example 2** demonstrates how to export an existing Workbook to a CSV file. The snippet creates a new workbook with a single worksheet. Further, it creates a `CsvFormatProvider` and invokes its `Export()` method:

**Example 2: Export CSV File**

<snippet id='libraries-spread-formats-and-conversion-csv-csvformatprovider-2'/>


## See Also

* [IWorkbookFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.IWorkbookFormatProvider.html)
* [CsvFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider.html)
* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Automatic Output Stream Clearing on Export]({%slug common-export-output-stream-clearing%})
