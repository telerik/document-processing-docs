---
title: Settings
page_title: Settings
description: Learn how to configure the DataTableFormatProvider import and export settings for converting between DataTable and spreadsheet formats.
slug: radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings
tags: data, table, settings, spreadsheet, radspreadprocessing, worksheet, conversion, import, export, spread, datetime, format, preferreddatetimeformat
published: True
position: 2
---


# Settings

The `DataTableFormatProvider` exposes import and export settings that allow you to control how data is converted between `DataTable` and spreadsheet formats.

## Import Settings

* `PreferredDateTimeFormat`: Gets or sets the default format string when importing DateTime columns. When null, the current culture's short date pattern is used.
* `ShouldImportColumnHeaders`: Controls whether the column headers are imported.
* `StartCellIndex`: Gets or sets the index where the table starts in the Worksheet.

The following example demonstrates how to set `PreferredDateTimeFormat` to format `DateTime` values when importing a `DataTable`:

**Example 1: Specifying the format for DateTime values imported from a DataTable**

```csharp
DataTable dataTable = new DataTable("Dates");
dataTable.Columns.Add("Event", typeof(string));
dataTable.Columns.Add("Date", typeof(DateTime));
dataTable.Rows.Add("Project start", new DateTime(2026, 4, 15));
dataTable.Rows.Add("Review meeting", new DateTime(2026, 5, 1));
dataTable.Rows.Add("Release", new DateTime(2026, 6, 30));

Workbook workbook = new Workbook();
Worksheet worksheet = workbook.Worksheets.Add();

DataTableFormatProvider dataTableFormatProvider = new DataTableFormatProvider();
dataTableFormatProvider.ImportSettings.PreferredDateTimeFormat = "dd.MM.yyyy";
dataTableFormatProvider.ImportSettings.ShouldImportColumnHeaders = true;
dataTableFormatProvider.Import(dataTable, worksheet, TimeSpan.FromSeconds(10));
```

### The CellImported Event

The `CellImported` event is fired for each cell and allows you to change the cell properties.

The `CellImportedEventArgs` contains information about the current cell:

* `dataTableRowIndex`: The index of the row in the DataTable containing the cell for which the event occurs.
* `dataTableColumnIndex`: The index of the column in the DataTable containing the cell for which the event occurs.
* `worksheetRowIndex`: The index of the row in the Worksheet containing the cell for which the event occurs.
* `worksheetColumnIndex`: The index of the column in the Worksheet containing the cell for which the event occurs.
* `worksheet`: The worksheet where the data is imported.


**Example 2: Using the CellImported event to color imported cells in the second column**

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

**Example 3: Using the ColumnExporting event to allow null values in the fourth exported column**

<snippet id='codeblock-com'/>

## See Also

* [Using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})
* [Keeping Numeric Values When Importing DataTable to Excel Using DataTableFormatProvider]({%slug retain-numeric-values-datatable-excel-datatableformatprovider%})
