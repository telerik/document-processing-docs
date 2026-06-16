---
title: General Information
description: Overview of the supported file formats, format providers, and package references for importing and exporting spreadsheet documents in RadSpreadProcessing.
page_title: General Information
slug: radspreadprocessing-formats-and-conversion-general-information
tags: formats, conversion, spreadsheet, radspreadprocessing, providers, csv, import, xlsx, spread
published: True
position: 0
---

# General Information

The `RadSpreadProcessing` document model allows you to open and save files of different formats. The following sections provide more details on the [supported formats](#supported-formats), [available format providers](#format-providers), the [additional package references](#additional-package-references) each provider requires, and the [Format Providers Manager](#format-providers-manager).

## Supported Formats

The following table lists the supported formats:

| Format | Description |
|---|---|
| `Xlsx` | Rich text format that exports the whole content of a workbook: worksheets, formula values, formatting, hyperlinks, and more. |
| `Xls` | Rich text format that exports the content of a workbook: worksheets, formula values, formatting, hyperlinks, and more. Supported in older applications. This format is not supported in Silverlight. |
| `Xlsm` | Rich text format that exports all that is included in the Xlsx format with the addition of macro instructions. |
| `Pdf` *(export only)* | Fixed format that preserves the content of a workbook in a manner independent from software or hardware. |
| `Csv` *(comma separated)* | Plain text format that saves the content of the cell in the active worksheet. The format strips all formatting and keeps only the result values of cells. These values are separated by a culture-dependent delimiter. |
| `Txt` *(tab delimited)* | Plain text format that preserves only the content of the cells in the active worksheet. The format does not save any formatting and keeps only the result values of the cells. These values are delimited through tabs. |
| `Json` *(export only)* | Structured text format that serializes worksheet data and metadata (values, number formats, named ranges, charts, active sheet info) to JSON. Styling is not preserved fully as in XLSX. |
| `DataTable` | Allows you to convert a `DataTable` from your database to a spreadsheet and vice versa. |

>note In **Q4 2024** Telerik Document Processing Libraries introduced a new timeout mechanism for importing and exporting documents. The **Import** and **Export** methods of all FormatProviders have a mandatory *TimeSpan?* timeout parameter after which the operation is cancelled.  


## Format Providers

The document model exposes separate format providers that work with each of the formats listed previously:

* [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider %}) for `.xlsx` files
* [XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider %}) for `.xls` files
* [XlsmFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider %}) for `.xlsm` files
* [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider %}) for `.pdf` files (export only)
* [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider %}) for comma separated `.csv` files
* [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider %}) for tab delimited `.txt` files
* [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider %}) for `DataTable` objects
* [JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider %}) for `.json` files (export only)

> Some FormatProviders require additional package references. Check them out in the [Additional Package References](#additional-package-references) section.
 
## Import and Export Methods

All of the listed providers implement the `IWorkbookFormatProvider` and `IBinaryWorkbookFormatProvider` interfaces and share a common API that enables import and export of files. To conform to the interfaces, each of the providers implements two methods that turn a `Stream` or `byte[]` into a workbook and save the contents of the workbook into a `Stream` or `byte[]`. In the [IWorkbookFormatProvider interface methods](#iworkbookformatprovider-interface-methods) and [IBinaryWorkbookFormatProvider interface methods](#ibinaryworkbookformatprovider-interface-methods) sections you can see the interface declarations and an example usage of the Import and Export methods.

### IWorkbookFormatProvider Interface Methods

<snippet id='codeblock-cnu'/>

**Example: Use the Import() and Export() Methods with Stream**

<snippet id='codeblock-cnv'/>


### IBinaryWorkbookFormatProvider Interface Methods

<snippet id='codeblock-cnw'/>

**Example: Use the Import() and Export() Methods with byte[] Array**

<snippet id='codeblock-cnx'/>

>note For more examples of importing and exporting workbooks, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## Additional Package References

Unlike the `CsvFormatProvider`, `TxtFormatProvider`, and `DataTableFormatProvider` classes, the other RadSpreadProcessing format providers require references to additional packages:

| Format Provider | Required Package |
|---|---|
| `XlsxFormatProvider` and `XlsmFormatProvider` | `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml` |
| `PdfFormatProvider` *(export only)* | `Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf` |
| `XlsFormatProvider` | `Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls` |
| `JsonFormatProvider` *(export only)* | `Telerik.Windows.Documents.Spreadsheet.FormatProviders.Json` |

>note *Starting with **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. The Telerik Zip Library will continue to ship as a standalone library so clients can still use it separately.


## Format Providers Manager

The document model of RadSpreadProcessing also contains a `WorkbookFormatProvidersManager` class, which exposes a whole set of useful static methods. The manager also allows you to specify a set of format providers you want to use. Then you can import and export a file and let the manager choose the appropriate format provider. You only need to specify the extension of the file that you open or save.

More information on the Format Providers Manager and the `WorkbookFormatProvidersManager` class can be found in the dedicated [Format Providers Manager]({%slug radspreadprocessing-formats-and-conversion-format-providers-manager %}) article.

## See Also

* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
