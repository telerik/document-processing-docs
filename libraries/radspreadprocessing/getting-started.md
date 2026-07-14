---
title: Getting Started
description: Learn how to get started with RadSpreadProcessing, add the required NuGet references, and create your first spreadsheet document.
page_title: Getting Started
slug: radspreadprocessing-getting-started
tags: spread, processing, spreadsheet, nuget, workbook, excel, started, worksheet, xlsx
published: True
position: 1
---

# Getting Started

The `RadSpreadProcessing` library enables you to create, import, and export spreadsheet documents programmatically.

>note If you still do not have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites.

## Package References

You can find the required references in the [SpreadProcessing NuGet packages]({%slug available-nuget-packages%}#spreadprocessing-packages) section.

## Creating a Workbook

The document model allows you to instantiate a new [workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and populate it with any data you want.

The following example creates a workbook and adds a worksheet to it.

**Example 1: Create a workbook and add a worksheet**

<snippet id='codeblock-cfs'/>

You can then create a [CellSelection]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) and set a value for the selected cells. The following example creates a cell and assigns a string value to it.

**Example 2: Create a cell and set a string value**

<snippet id='codeblock-cft'/>

## Exporting

The `RadSpreadProcessing` library supports a variety of formats to which you can export the contents of a workbook using [FormatProviders]({%slug radspreadprocessing-formats-and-conversion-general-information%}). The following example exports the previously created workbook to `.xlsx` format.

For more examples and application scenarios of importing and exporting a Workbook to various formats, check the [Import/Load and Export/Save RadSpreadProcessing Workbook]({%slug import-export-save-load-workbook%}) knowledge base article.

**Example 3: Export a workbook to XLSX**

<snippet id='codeblock-cfu'/>

>More information about the import and export features of RadSpreadProcessing is available in the [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-general-information%}).

For more complete examples, go to the [Developer Focused Examples]({%slug radspreadprocessing-sdk-examples%}) section of the library.

## Using RadSpreadsheet

`RadSpreadsheet` is a UI control part of the Telerik UI for WPF/Silverlight suites. The document model explained in this section of the documentation and all its features are shared between the `RadSpreadProcessing` library and `RadSpreadsheet`. [This help section](https://docs.telerik.com/devtools/wpf/controls/radspreadsheet/overview.html) contains information about all UI-specific features of `RadSpreadsheet`.

## See Also

* [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
* [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-general-information%})
* [Import/Load and Export/Save RadSpreadProcessing Workbook KB]({%slug import-export-save-load-workbook%})
* [Getting Started with RadSpreadProcessing Volume 1](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-volume-1)
* [Getting started with RadSpreadProcessing Vol2](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol2)
* [Getting Started with RadSpreadProcessing Vol3](https://www.telerik.com/blogs/getting-started-with-radspreadprocessing-vol3)
* [SpreadProcessing Document Generation Demo](https://demos.telerik.com/document-processing/spreadprocessing/generate_documents)
