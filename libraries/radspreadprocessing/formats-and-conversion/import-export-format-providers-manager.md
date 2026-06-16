---
title: Format Providers Manager
description: Learn how to use the WorkbookFormatProvidersManager in RadSpreadProcessing to manage format providers for importing and exporting spreadsheet files.
page_title: Format Providers Manager
slug: radspreadprocessing-formats-and-conversion-format-providers-manager
tags: format, providers, spreadsheet, radspreadprocessing, manager, import, export, workbook, registration, xlsx, spread
published: True
position: 1
---

# Format Providers Manager

**RadSpreadProcessing** contains a [WorkbookFormatProvidersManager](https://www.telerik.com/document-processing-libraries/documentation/api/telerik.windows.documents.spreadsheet.formatproviders.workbookformatprovidersmanager) class that allows you to specify a set of format providers and import or export files letting the manager choose the appropriate format provider. The class also exposes methods that return all registered providers and supported file extensions.

## Registering and Unregistering Format Providers

The `WorkbookFormatProvidersManager` class contains two methods that allow you to register and unregister format providers respectively. The manager has the `csv` and `txt` format providers registered by default. The snippet in **Example 1** illustrates how to register the [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider %}).

> Some Format Providers require additional package references. Check the full list of the FormatProviders' additional reference requirements in [Format Providers - Additional package references]({%slug radspreadprocessing-formats-and-conversion-general-information%}#additional-package-references).

**Example 1: Register Provider**

<snippet id='codeblock-coa'/>

You can also unregister format providers using the `UnregisterFormatProvider()` method. **Example 2** demonstrates how to unregister the [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider %}).

**Example 2: Unregister Provider**

<snippet id='codeblock-coc'/>

## Import

The format providers manager exposes an `Import()` method that takes two arguments:

| Argument | Type | Description |
|---|---|---|
| *(first)* | `string` | Specifies the extension of the file to be imported. |
| *(second)* | `Stream` | Provides access to the file. |

The method tries to find a registered format provider that can handle the extension of the file you want to import. If such a provider is registered, the file is imported. If the manager does not have an appropriate format registered, an `UnsupportedFileFormatException` is thrown.

**Example 3** demonstrates how to present the user with an `OpenFileDialog` and try to import the selected file. You can use the `GetOpenFileDialogFilter()` method of the `FileDialogHelper` class to construct the correct filter for all registered format providers.

**Example 3: Import a File Using OpenFileDialog**

<snippet id='codeblock-coe'/>

> The OpenFileDialog class exposes a different API in Silverlight. The name of the file could be obtained through the File.Name property of `OpenFileDialog` and the stream you can get using `File.OpenRead()`.

You can achieve the same result through using the `OpenFile` command. The command executes exactly the same code as the previous example. Verify that you register the format providers you want to use before using the command.

## Export

The format providers manager contains an `Export()` method that takes three arguments:

| Argument | Type | Description |
|---|---|---|
| *(first)* | `Workbook` | The workbook to be exported. |
| *(second)* | `string` | Specifies the extension of the saved file. |
| *(third)* | `Stream` | The stream that will contain the data. |

The method attempts to find a provider that can handle a file of the specified extension. If such a provider is registered, the file is saved. If the manager does not have an appropriate registered provider, an `UnsupportedFileFormatException` is raised.

**Example 4** illustrates how to use the `Export()` method to save a file. The sample code presents the user with the SaveFileDialog. You can use the `GetOpenFileDialogFilter()` method of the `FileDialogHelper` class to construct the correct filter for all registered format providers.

**Example 4: Save a File Using SaveFileDialog**

<snippet id='codeblock-cog'/>

You can achieve the same result through using the `SaveFile` command. The command executes exactly the same code as the previous example. Verify that you register the format providers you want to use before using the command.

## Retrieve Registered Providers and Supported Extensions

RadSpreadProcessing now supports the following extensions: `.xlsx`, `.xls`, `.csv`, `.txt`, `.json` (export only), and `.pdf` (export only). The format providers available for them are respectively [XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}), [XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%}), [CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%}), [TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%}), [JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%}) (export only), and [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) (export only).

The `WorkbookFormatProvidersManager` class offers several approaches to retrieve the registered format providers. The class offers the `GetProviderByName()` static method that searches through the registered providers to find a provider with a specific name. The manager also exposes the `GetProviderByExtension()` method. The class also contains a static method `GetSupportedExtensions()` that returns an `IEnumerable` of the supported file extensions.

>note For more examples and application scenarios of importing and exporting a workbook to various formats using a format provider, check out the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

## See Also

* [Getting Started - First Steps]({%slug getting-started-first-steps%})
* [Format Providers - General Information]({%slug radspreadprocessing-formats-and-conversion-general-information%})
* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Create, Open and Save Workbooks]({%slug radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks%})
* [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%})
