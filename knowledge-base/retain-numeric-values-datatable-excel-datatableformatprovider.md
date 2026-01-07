---
title: Keeping Numeric Values When Importing DataTable to Excel Using DataTableFormatProvider
description: Learn how to retain numeric values when importing a DataTable into Excel using the DataTableFormatProvider in Telerik Document Processing.
type: how-to
page_title: Retain Numeric Values in Excel Import with DataTableFormatProvider
meta_title: Retain Numeric Values in Excel Import with DataTableFormatProvider
slug: retain-numeric-values-datatable-excel-datatableformatprovider
tags: spreadprocessing,telerik document processing,datatableformatprovider,worksheet,numeric values
res_type: kb
ticketid: 1707296
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the [DataTableFormatProvider](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/data-table/overview)'s `Import` method to import data from a `DataTable` to an Excel worksheet, numeric fields may appear as text in Excel. This occurs because the `DataTableFormatProvider` converts data into cells where numeric values are often treated as text, depending on their storage format.

This knowledge base article also answers the following questions:
- How to ensure numeric fields are retained as numbers in Excel using DataTableFormatProvider?
- What settings are available to control numeric data import in Telerik SpreadProcessing?
- How to configure DataTableFormatProvider to handle numeric values properly?

## Solution

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

- [DataTableFormatProvider Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/data-table/overview)
- [ICellValue Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/working-with-cells/cell-value-types)
- [ImportSettings Class](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/data-table/settings)
