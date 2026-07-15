---
title: Settings
page_title: Settings
description: Learn how to configure the DataTableFormatProvider import and export settings for converting between DataTable and spreadsheet formats.
slug: radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings
tags: data, table, settings, spreadsheet, radspreadprocessing, worksheet, conversion, import, export, spread
published: True
position: 2
---


# Settings

The `DataTableFormatProvider` exposes import and export settings that allow you to control how data is converted between `DataTable` and spreadsheet formats.

## Import Settings

* `PreferredDateTimeFormat`: Gets or sets the default format string when importing DateTime columns.
* `ShouldImportColumnHeaders`: Controls whether the column headers are imported.
* `StartCellIndex`: Gets or sets the index where the table starts in the Worksheet.

### The CellImported Event

The `CellImported` event is fired for each cell and allows you to change the cell properties.

The `CellImportedEventArgs` contains information about the current cell:

* `dataTableRowIndex`: The index of the row in the DataTable containing the cell for which the event occurs.
* `dataTableColumnIndex`: The index of the column in the DataTable containing the cell for which the event occurs.
* `worksheetRowIndex`: The index of the row in the Worksheet containing the cell for which the event occurs.
* `worksheetColumnIndex`: The index of the column in the Worksheet containing the cell for which the event occurs.
* `worksheet`: The worksheet where the data is imported.


**Example 1: Using the CellImported event to color imported cells in the second column**

<snippet id='codeblock-col'/>

## Export Settings

* `HasHeaderRow`: Gets or sets whether the header row of the worksheet is exported.
* `ShouldSetDataTypes`: Gets or sets whether the exporter tries to parse the data types from the spreadsheet. If false, only objects are exported.
* `DataTableCulture`: Gets or sets the DataTable culture. By default, the culture of the workbook is used.
* `RangeToExport`: Gets or sets the cell range for which the data is exported.

### The ColumnExporting Event

The `ColumnExporting` event is fired for each column before the column is added to the table and allows you to change its properties.

The `ColumnExportingEventArgs` object contains the current column instance and its index:

* `DataColumn`: Gets the [DataColumn](https://learn.microsoft.com/en-us/dotnet/api/system.data.datacolumn?view=net-6.0) that is being exported.
* `ColumnIndex`: Gets the index of the exported column.

**Example 2: Using the ColumnExporting event to allow null values in the fourth exported column**

<snippet id='codeblock-com'/>

## See Also

* [Using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})
* [Keeping Numeric Values When Importing DataTable to Excel Using DataTableFormatProvider]({%slug retain-numeric-values-datatable-excel-datatableformatprovider%})
