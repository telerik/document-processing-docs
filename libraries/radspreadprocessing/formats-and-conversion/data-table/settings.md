---
title: Settings
page_title: Settings
description: This article shows the settings that you can use to control the DataTable import/export operations. 
slug: radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings
tags: data, table, settings, spreadsheet, radspreadprocessing, worksheet, conversion, import, export, spread
published: True
position: 2
---


# Import Settings

* __PreferredDateTimeFormat:__ This property gets or sets the default format string when importing DateTime columns.
* __ShouldImportColumnHeaders:__ Controls whether the column headers should be imported. 
* __StartCellIndex:__ Gets or sets the index where the table should start in the Worksheet.

## The CellImported event

The __CellImported__  event is fired for each cell and allows you to change the cell properties.

The __CellImportedEventArgs__ contains information about the current cell:
*  __dataTableRowIndex:__ The index of the row in the DataTable containing the cell for which the event occurs.
*  __dataTableColumnIndex:__ The index of the column in the DataTable containing the cell for which the event occurs.
*  __worksheetRowIndex:__ The index of the row in the Worksheet containing the cell for which the event occurs.
*  __worksheetColumnIndex:__ The index of the column in the Worksheet containing the cell that the event occurs for.
*  __worksheet:__ The worksheet where the data is imported.


#### __Example 1: Using the CellImported event to format the cells__

<snippet id='codeblock-col'/>

# Export Settings

* __HasHeaderRow:__ Gets or sets whether the header row of the worksheet should be exported.
* __ShouldSetDataTypes:__ Gets or sets whether the exporter should try to parse the data types from the spreadsheet. If false, only objects will be exported.
* __DataTableCulture:__ Gets or sets the DataTable culture. By default, the culture of the workbook is used.
* __RangeToExport:__ Gets or sets the cell range for which the data will be exported.

## The ColumnExporting event  

The __ColumnExporting__ event is fired for each column before the column is added to the table and allows you to change its properties.

The __ColumnExportingEventArgs__ object contains the current column instance and its index:
* __DataColumn:__ Gets the [DataColumn](https://docs.microsoft.com/en-us/dotnet/api/system.data.datacolumn?view=net-6.0) that is being exported.
* __ColumnIndex:__  Gets the index of the exported column. 

#### __Example 2: Using the ColumnExporting event to set the AllowDBNull property__

<snippet id='codeblock-com'/>

# See Also

* [Using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})
* [Keeping Numeric Values When Importing DataTable to Excel Using DataTableFormatProvider]({%slug retain-numeric-values-datatable-excel-datatableformatprovider%})
