---
title: Settings
page_title: Settings
description: This article shows the settings that you can use to control the DataTable import/export operations. 
slug: radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings
tags: datatable, workbook, worksheet, settings
published: True
position: 2
---


# Import Settings

* __PreferredDateTimeFormat:__ This property gets or sets the default format string when importing DateTime columns.
* __ShouldImportColumnHeaders:__ Controls whether the column headers should be imported. 
* __StartCellIndex:__ Get or sets the index where the table should start in the Worksheet.

## The CellImported event

The __CellImported__  event is fired for each cell and allows you to change the cell properties.

The __CellImportedEventArgs__ contains information about the current cell:
*  __dataTableRowIndex:__ The index of the row in the DataTable containing the cell that the event occurs for.
*  __dataTableColumnIndex:__ The index of the column in the DataTable containing the cell that the event occurs for.
*  __worksheetRowIndex:__ The index of the row in the Worksheet containing the cell that the event occurs for.
*  __worksheetColumnIndex:__ The index of the column in the Worksheet containing the cell that the event occurs for.
*  __worksheet:__ The worksheet where the data is imported.


#### __[C#] Example 1: Using the CellImported event to format the cells__

{{region cs-radspreadprocessing-formats-and-conversion-data-table-format-provider-settings_0}}
	private void ImportTable()
    {
        DataTable table = GetTable();
        DataTableFormatProvider provider = new DataTableFormatProvider();
        provider.ImportSettings.CellImported += ImportSettings_CellImported;

        Workbook workbook = new Workbook();
        Worksheet worksheet = workbook.Worksheets.Add();
    
        provider.Import(table, worksheet);
    
        this.radSpreadsheet.Workbook = workbook;
    }
    private void ImportSettings_CellImported(object sender, CellImportedEventArgs e)
    {
        if (e.DataTableColumnIndex == 1 && e.WorksheetRowIndex > 1)
        {
            e.Worksheet.Cells[e.WorksheetRowIndex, e.WorksheetColumnIndex].SetForeColor(new ThemableColor(Colors.Red));
        }
    }

{{endregion}}

# Export Settings

* __HasHeaderRow:__ Gets or sets whether the header row of the worksheet should be exported.
* __ShouldSetDataTypes:__ Gets or sets whether the exporter should try to parse the data types from the spreadsheet. If false only objects will be exported.
* __DataTableCulture:__ Get or sets the DataTable culture. By default the culture of the workbook is used.
* __RangeToExport:__ Get or sets the cell range for which the data will be exported.

# See Also

* [Using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})