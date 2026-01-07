---
title: Keeping Numeric Values When Importing DataTable to Excel Using DataTableFormatProvider
description: Learn how to retain numeric values when importing a DataTable into Excel using the DataTableFormatProvider in Telerik Document Processing.
type: how-to
page_title: Retain Numeric Values in Excel Import with DataTableFormatProvider
meta_title: Retain Numeric Values in Excel Import with DataTableFormatProvider
slug: retain-numeric-values-datatable-excel-datatableformatprovider
tags: spread, processing,telerik, document,datatable, table,formatprovider,worksheet,numeric, value
res_type: kb
ticketid: 1707296
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})'s `Import` method to import data from a `DataTable` to an Excel worksheet, numeric fields may appear as text in Excel. This occurs because the `DataTableFormatProvider` converts data into cells where numeric values are often treated as text, depending on their storage format.

This knowledge base article also answers the following questions:
- How to ensure numeric fields are retained as numbers in Excel using DataTableFormatProvider?
- What settings are available to control numeric data import in Telerik SpreadProcessing?
- How to configure DataTableFormatProvider to handle numeric values properly?

## Solution

The DataTableFormatProvider converts your DataTable into a worksheet. Each cell in RadSpreadProcessing exposes an [ICellValue]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) whose ValueType can be Empty, Boolean, Number, Text, or Formula. ICellValue has ValueType (what the cell contains) and ResultValueType (what the cell evaluates to, e.g., a formula’s result). If the importer writes strings for the cells, you’ll get ValueType = Text. Even if the text looks numeric (“1299.99”), it is still Text unless the cell’s value is actually stored as a number.

The DataTableFormatProvider  offers [ImportSettings]({%slug radspreadprocessing-formats-and-conversion-data-table-formatprovider-settings%}). The ImportSettings.**ShouldImportColumnHeaders** property controls whether the DataTable’s column names are written as a header row into the worksheet when you import with DataTableFormatProvider.

`true` - the first worksheet row contains the column names; your data starts from the next row.
`false` - no header row is created; your data starts from the first row at the import start position.

This setting affects where your data lands, how you index rows after import, and what the CellImported event reports for the worksheet row indices. By default, the headers are imported. They are represented as TextCellValue since they store the column name.

When you access your cell values, it is necessary to adjust the starting row index accordingly for the data rows. Hence, if you skip importing the headers by setting the **ShouldImportColumnHeaders** property to false, you can start from row index 0. Otherwise, start from index 1.

To retain numeric values as numbers in Excel, follow these steps:

1. Define the `DataTable` columns with explicit data types such as `int`, `double`, or `decimal` for numeric fields.
2. Use the `DataTableFormatProvider` to import the table into a workbook.
3. Identify the `ICellValue` of each cell after import, and confirm its `ValueType` is `Number` for numeric fields.
4. If necessary, adjust the `ImportSettings.ShouldImportColumnHeaders` property to control whether column headers are included as text rows.

Here is an example implementation:

```csharp
// Define the DataTable with explicit types for numeric fields
DataTable table = new DataTable("SampleTable");
table.Columns.Add("Id", typeof(int));          // numeric column
table.Columns.Add("Name", typeof(string));     // text column
table.Columns.Add("Price", typeof(double));    // numeric column
table.Columns.Add("Category", typeof(string)); // text column

// Add sample rows
table.Rows.Add(1, "Laptop", 1299.99, "Electronics");
table.Rows.Add(2, "Desk Chair", 199.50, "Furniture");
table.Rows.Add(3, "Notebook", 4.25, "Stationery");

DataTableFormatProvider provider = new DataTableFormatProvider();

// Optional: Skip importing column headers
provider.ImportSettings.ShouldImportColumnHeaders = false;

// Import the DataTable into a workbook and get the first worksheet
Workbook workbook = provider.Import(table);
Worksheet worksheet = workbook.Worksheets[0];

// Read and debug cell values to verify their ValueType
CellSelection cell = worksheet.Cells[0, 0];
ICellValue cellValue = cell.GetValue().Value;
Debug.WriteLine("Id ValueType: " + cellValue.ValueType); // Expected: Number

cell = worksheet.Cells[0, 1];
cellValue = cell.GetValue().Value;
Debug.WriteLine("Name ValueType: " + cellValue.ValueType); // Expected: Text

cell = worksheet.Cells[0, 2];
cellValue = cell.GetValue().Value;
Debug.WriteLine("Price ValueType: " + cellValue.ValueType); // Expected: Number
```

### Additional Notes

- Ensure columns in the `DataTable` are defined with appropriate types to avoid unintended type conversions.
- Headers are imported as text by default. Set `ShouldImportColumnHeaders` to `false` if you want to exclude them.

## See Also

- [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
- [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})