---
title: Handling Empty Cells with RadSpreadStreamProcessing During Excel Import
description: This article demonstrates how to manage empty cells when importing an Excel file into a DataTable using RadSpreadStreamProcessing.
type: how-to
page_title: How to Handle Empty Cells with RadSpreadStreamProcessing in Excel Import
slug: handle-empty-cells-radspreadstreamprocessing
tags: radspreadstreamprocessing, document processing, excel, xlsx, import, datatable, empty cells
res_type: kb
ticketid: 1678225
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>RadSpreadStreamProcessing for Document Processing</td>
</tr>
</tbody>
</table>

## Description

When importing an Excel file into a DataTable using RadSpreadStreamProcessing, empty cells are skipped, resulting in misalignment of the data with the columns. This article explains how to correctly handle empty cells during the import process, ensuring data is accurately represented in the DataTable.

This knowledge base article also answers the following questions:
- How to import an Excel file into a DataTable with empty cells using RadSpreadStreamProcessing?
- How to ensure data integrity when empty cells are present in an Excel import?
- What approach can be used to include empty cells during Excel file import into a DataTable?

## Solution

To handle empty cells correctly and maintain the alignment of data with the columns in the DataTable, manually verify when a skip in the cells occurs. Calculate how many cells this skip is and insert the same amount of DBNull.Value entries in the DataTable. This approach ensures that the structure of the DataTable accurately reflects the structure of the Excel file, including the empty cells.

The following code snippet demonstrates how to implement this solution:

```csharp
DataTable dt = new DataTable();
string fileName = "Book1.xlsx";
using (System.IO.FileStream fs = new System.IO.FileStream(fileName, FileMode.Open))
{
    using (IWorkbookImporter workBookImporter = SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, fs))
    {
        foreach (IWorksheetImporter worksheetImporter in workBookImporter.WorksheetImporters)
        {
            foreach (IRowImporter rowImporter in worksheetImporter.Rows)
            {
                if (rowImporter.RowIndex == 0)
                {
                    foreach (ICellImporter cell in rowImporter.Cells)
                    {
                        dt.Columns.Add(cell.Value);
                    }
                }
                else
                {
                    var newRow = dt.NewRow();
                    var cellIndex = 0;
                    foreach (ICellImporter cell in rowImporter.Cells)
                    {
                        // Fill in DBNull.Value for skipped cells
                        while (cellIndex < cell.ColumnIndex)
                        {
                            newRow[cellIndex] = DBNull.Value;
                            cellIndex++;
                        }
                        newRow[cellIndex] = cell.Value;
                        cellIndex++;
                    }
                    dt.Rows.Add(newRow);
                }
            }
        }
    }
}
```

This code iterates through each cell in the imported rows. If a cell is skipped due to being empty, it inserts `DBNull.Value` for each skipped position before inserting the next non-empty cell's value. This method ensures that each cell, including the empty ones, is accounted for in the DataTable, preserving the data's alignment with the Excel file's structure.

## See Also

- [RadSpreadStreamProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadstreamprocessing/overview)
- [Import and Export to Excel File Formats](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/import-and-export-to-excel-file-formats/xls/xlsformatprovider)
- [Using DataTableFormatProvider](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/formats-and-conversion/data-table/using-data-table-format-provider#export)
