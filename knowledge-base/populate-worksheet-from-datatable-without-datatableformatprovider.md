---
title: Populate Worksheet from DataTable Without DataTableFormatProvider
description: Learn how to export a DataTable to an Excel worksheet by manually iterating rows and columns using RadSpreadProcessing in C#.
type: how-to
page_title: How to Populate a Worksheet from a DataTable Without DataTableFormatProvider
meta_title: How to Populate a Worksheet from a DataTable Without DataTableFormatProvider
slug: populate-worksheet-from-datatable-without-datatableformatprovider
tags: radspreadprocessing, excel, xlsx, datatable, worksheet, cells, setvalue, document, processing, spreadsheet
res_type: kb
category: knowledge-base
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.3.826 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

While [DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%}) provides a fast, built-in way to import a `DataTable` into a worksheet, some scenarios require more control over the process. For example, you may want to:

* Apply custom cell formatting, font styling, or background fills during population.
* Handle custom data type conversions or format specific columns (such as dates, currencies, or decimals).
* Exclude specific columns or rows based on application logic.
* Populate data starting from arbitrary cell coordinates with custom row offsets.

This article demonstrates how to iterate a `DataTable` and assign its values directly to worksheet cells using `RadSpreadProcessing`.

## Solution

To populate a worksheet without `DataTableFormatProvider`, iterate through the columns to generate header cells, and then iterate through the rows to set the cell values using the `worksheet.Cells[rowIndex, columnIndex].SetValue(...)` method.

The following example demonstrates the complete implementation:

```csharp
using System;
using System.Data;
using System.IO;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx;
using Telerik.Windows.Documents.Spreadsheet.Model;

namespace SpreadProcessingDataTableExport
{
    class Program
    {
        static void Main(string[] args)
        {
            DataTable dataTable = GetSampleDataTable();

            Workbook workbook = new Workbook();
            Worksheet worksheet = workbook.Worksheets.Add();
            worksheet.Name = dataTable.TableName;

            // 1. Write column headers
            for (int col = 0; col < dataTable.Columns.Count; col++)
            {
                worksheet.Cells[0, col].SetValue(dataTable.Columns[col].ColumnName);
                // Optional: set header row formatting
                worksheet.Cells[0, col].SetIsBold(true);
            }

            // 2. Write data rows
            for (int row = 0; row < dataTable.Rows.Count; row++)
            {
                for (int col = 0; col < dataTable.Columns.Count; col++)
                {
                    object value = dataTable.Rows[row][col];
                    CellSelection cell = worksheet.Cells[row + 1, col];

                    if (value == null || value == DBNull.Value)
                    {
                        cell.SetValue(string.Empty);
                    }
                    else if (value is int intValue)
                    {
                        cell.SetValue(intValue);
                    }
                    else if (value is double doubleValue)
                    {
                        cell.SetValue(doubleValue);
                    }
                    else if (value is decimal decimalValue)
                    {
                        cell.SetValue(Convert.ToDouble(decimalValue));
                    }
                    else if (value is DateTime dateValue)
                    {
                        cell.SetValue(dateValue);
                        cell.SetFormat(new CellValueFormat("yyyy-MM-dd"));
                    }
                    else if (value is bool boolValue)
                    {
                        cell.SetValue(boolValue);
                    }
                    else
                    {
                        cell.SetValue(value.ToString());
                    }
                }
            }

            // 3. Auto-fit column widths
            worksheet.Columns[worksheet.UsedCellRange].AutoFitWidth();

            // 4. Export to XLSX
            IWorkbookFormatProvider formatProvider = new XlsxFormatProvider();
            string outputFilePath = "ExportedDataTable.xlsx";
            using (FileStream output = new FileStream(outputFilePath, FileMode.Create))
            {
                formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
            }
        }

        private static DataTable GetSampleDataTable()
        {
            DataTable table = new DataTable("Orders");
            table.Columns.Add("OrderId", typeof(int));
            table.Columns.Add("Customer", typeof(string));
            table.Columns.Add("OrderDate", typeof(DateTime));
            table.Columns.Add("Total", typeof(decimal));

            table.Rows.Add(101, "Acme Corp", new DateTime(2026, 1, 15), 1499.99m);
            table.Rows.Add(102, "Northwind", new DateTime(2026, 2, 20), 820.50m);
            table.Rows.Add(103, "Contoso", new DateTime(2026, 3, 5), 2310.00m);

            return table;
        }
    }
}
```
>note RadSpreadProcessing does not provide a dedicated format provider for `List<T>` or generic collections. To export a list or custom object collection to a worksheet, iterate the collection and assign cell values directly (see [Generating Excel Documents from IEnumerable Collections]({%slug generate-excel-files-from-ienumerable-collections%})) or load the collection into a `DataTable` before importing with `DataTableFormatProvider`.

## See Also

* [Using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})
* [Generating Excel Documents from IEnumerable Collections]({%slug generate-excel-files-from-ienumerable-collections%})
* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Processing Decimal Columns as Double when Importing a DataTable into a Workbook using RadSpreadProcessing]({%slug processing-decimal-columns-as-double-from-datatable%})
