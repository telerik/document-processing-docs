---
title: Using DataTableFormatProvider
page_title: Using DataTableFormatProvider
description: Learn how to convert a DataTable to a worksheet and export a worksheet to a DataTable by using the DataTableFormatProvider in RadSpreadProcessing.
slug: radspreadprocessing-formats-and-conversion-using-data-table-format-provider
tags: data, table, spreadsheet, radspreadprocessing, worksheet, conversion, import, export, provider, spread
published: True
position: 1
---

# Using the DataTableFormatProvider

The `DataTableFormatProvider` allows you to convert an existing [DataTable](https://learn.microsoft.com/en-us/dotnet/api/system.data.datatable?view=net-5.0) to a worksheet and vice versa. The following sections show how to use this format provider to import and export data tables.

To use the `DataTableFormatProvider`, reference the `Telerik.Windows.Documents.Spreadsheet` package.

>note Starting with Q1 2026, the `DataTableFormatProvider` supports the [timeout mechanism]({%slug timeout-mechanism-in-dpl%}) that was previously introduced for the rest of the providers.

## Import

The following example shows how to import a `DataTable`. The sample creates a `DataTableFormatProvider` instance and passes the table to its `Import` method.

**Example 1: Import a DataTable and create a new workbook from it**

<snippet id='codeblock-con'/>

You can also import the data from a `DataTable` to an existing worksheet.

**Example 2: Import a DataTable into an existing worksheet**

<snippet id='codeblock-coo'/>

## Export

The following example demonstrates how to export an existing worksheet to a `DataTable`. The snippet assumes that you already have a workbook with some data.

**Example 3: Export the active worksheet from an existing workbook to a DataTable**

<snippet id='codeblock-cop'/>

## See Also

* [Settings]({%slug radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings%})
* [Converting PDF Table Content to DataTable]({%slug convert-pdf-table-to-datatable%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Processing Decimal Columns as Double when Importing a DataTable into a Workbook using RadSpreadProcessing]({%slug processing-decimal-columns-as-double-from-datatable%})
