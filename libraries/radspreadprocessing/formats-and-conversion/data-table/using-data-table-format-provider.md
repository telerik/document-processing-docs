---
title: Using DataTableFormatProvider
page_title: Using DataTableFormatProvider
description: Using DataTableFormatProvider articke describes how you can convert a DataTable to a worksheet and vice versa. 
slug: radspreadprocessing-formats-and-conversion-using-data-table-format-provider
tags: datatable, workbook, worksheet
published: True
position: 1
---

# Using the DataTableFormatProvider

The __DataTableFormatProvider__ allows you to easily convert existing [DataTable](https://docs.microsoft.com/en-us/dotnet/api/system.data.datatable?view=net-5.0) to a worksheet and vice versa. Below you can see how to use this format provider to import/export data tables.

## Import

__Example 1__ Shows how you can import a DataTable. The sample  instantiates a __DataTableFormatProvider__ and passes the table to its __Import__ method.   

#### __[C#] Example 1: Import DataTable __

{{region cs-radspreadprocessing-formats-and-conversion-using-data-table-format-provider_0}}

	DataTable table = GetTable();
	DataTableFormatProvider provider = new DataTableFormatProvider();
	
	Workbook workbook = provider.Import(table);

{{endregion}}

You can import the DataTable to and existing worksheet as well. 

#### __[C#] Example 2: Import DataTable to an existing Worksheet __

{{region cs-radspreadprocessing-formats-and-conversion-using-data-table-format-provider_1}}

	DataTable table = GetTable();
	DataTableFormatProvider provider = new DataTableFormatProvider();
	
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
	
	provider.Import(table, worksheet);

{{endregion}}

## Export

__Example 3__ demonstrates how you can export an existing Worksheet to Datatable. In the snipped we are assuming that you already have a Workbook wit some data. 

#### __[C#] Example 3: Export RadWorksheet to a DataTable __

{{region cs-radspreadprocessing-formats-and-conversion-using-data-table-format-provider_2}}
	
	Workbook workbook = GetWorkbook();
	DataTableFormatProvider provider = new DataTableFormatProvider();
	
	DataTable table = provider.Export(workbook.ActiveWorksheet);

{{endregion}}

# See Also

* [Settings]({%slug radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings%})