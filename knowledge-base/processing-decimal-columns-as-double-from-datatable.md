---
title: Processing Decimal Columns as Double when Importing a DataTable into a Workbook using RadSpreadProcessing
description: Learn how to handle the scenario where decimal columns in a DataTable are imported as text in Telerik Document Processing and convert them to double for proper numeric treatment.
type: how-to
page_title: Handling Decimal Columns as Numbers when Importing a DataTable into a Workbook using RadSpreadProcessing
meta_title: Handling Decimal Columns as Numbers when Importing a DataTable into a Workbook using RadSpreadProcessing
slug: processing-decimal-columns-as-double-from-datatable
tags: spread,processing,telerik, document,decimal,double,datatable,worksheet
res_type: kb
ticketid: 1707296
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When importing a dataset into a worksheet using Telerik Document Processing [SpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview), columns defined as `decimal` in the dataset appear as text in the worksheet instead of numeric values. This happens because the import functionality checks if the data type is primitive and only interprets primitive types as numeric. Since `decimal` is not a primitive type, it is treated as text.

This knowledge base article also answers the following questions:
- How to convert decimal columns to double for proper import in Telerik Document Processing?
- How to ensure numeric semantics for decimal columns in SpreadProcessing?
- How to fix dataset column type issues in Telerik Document Processing SpreadProcessing?

## Solution

To process `decimal` columns as numeric values, clone the `DataTable`, change the column type from `decimal` to `double`, and import the modified table. Follow these steps:

1. Clone the original `DataTable`. 
2. Update the column type for `decimal` columns to `double`. 
3. Import the cloned table into the worksheet.

Example code implementation:

```csharp
using Telerik.Windows.Documents.Spreadsheet.Model;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.DataTable;

static void Main(string[] args)
{
    // Create the original DataTable
    DataTable table = new DataTable("SampleTable");
    table.Columns.Add("Id", typeof(decimal));          // numeric column
    table.Columns.Add("Name", typeof(string));         // text column
    table.Columns.Add("Price", typeof(decimal));       // numeric column
    table.Columns.Add("Category", typeof(string));     // text column
    table.Rows.Add(1, "Laptop", 1299.99, "Electronics");
    table.Rows.Add(2, "Desk Chair", 199.50, "Furniture");
    table.Rows.Add(3, "Notebook", 4.25, "Stationery");

    // Clone the table and update column types
    DataTable clonedTable = table.Clone();
    foreach (DataColumn column in clonedTable.Columns)
    {
        if (column.DataType == typeof(decimal))
            column.DataType = typeof(double);
    }
    foreach (DataRow row in table.Rows)
    {
        clonedTable.ImportRow(row);
    }

    // Import the cloned DataTable
    DataTableFormatProvider provider = new DataTableFormatProvider();
    provider.ImportSettings.ShouldImportColumnHeaders = true;
    Workbook workbook = provider.Import(clonedTable);

    // Save the workbook to an XLSX file
    string filePath = Path.Combine(Path.GetTempPath(), "ProcessedData.xlsx");
    XlsxFormatProvider fileFormatProvider = new XlsxFormatProvider();
    using (FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write))
    {
        fileFormatProvider.Export(workbook, fs);
    }
}
```

### Key Notes:
- The `DataTable.Clone()` method creates a copy of the schema, allowing you to modify column types without affecting the original data.
- Changing the column type ensures numeric semantics for `decimal` values during import.
- Use the `DataTableFormatProvider` to facilitate the import process.

## See Also

- [Telerik Document Processing SpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [DataTableFormatProvider Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/datatable-import-export)
- [API Reference for Workbook](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.workbook)
