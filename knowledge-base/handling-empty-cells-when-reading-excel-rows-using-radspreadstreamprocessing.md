---
title: Traversing Documents with Empty Cells When Reading Excel Rows Using RadSpreadStreamProcessing
description: Learn how to handle empty cells when reading Excel rows using RadSpreadStreamProcessing to maintain data alignment with the Excel file.
type: how-to
page_title: Traversing Documents with Empty Cells When Reading Excel Rows Using RadSpreadStreamProcessing
meta_title: Traversing Documents with Empty Cells When Reading Excel Rows Using RadSpreadStreamProcessing
slug: handling-empty-cells-when-reading-excel-rows-using-radspreadstreamprocessing
tags: spread,stream,processing, telerik, document, excel, rows, empty, cells, datatable
res_type: kb
ticketid: 1680377
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I am using RadSpreadStreamProcessing to read an Excel file. The issue arises when reading rows that contain empty cells. Empty cells are skipped, causing misalignment of data with columns. For example, when a row has blank values in the first columns, the value of the subsequent column with data shifts to the wrong column index.

This knowledge base article also answers the following questions:
- How to read Excel rows with empty cells using RadSpreadStreamProcessing?
- How to maintain column alignment when reading Excel rows with empty cells?
- How to insert DBNull.Value for empty cells in imported Excel rows?

## Solution

To ensure empty cells are correctly handled and data aligns with the columns, adjust the reading logic to account for skipped cells. Use the following code snippet:

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
                // Define columns based on the first row
                if (rowImporter.RowIndex == 0)
                {
                    var cellIndex = 0;
                    foreach (ICellImporter cell in rowImporter.Cells)
                    {
                        while (cellIndex < cell.ColumnIndex)
                        {
                            dt.Columns.Add("Column_" + cellIndex);
                            cellIndex++;
                        }
                        dt.Columns.Add(cell.Value?.ToString() ?? "Column_" + cellIndex);
                        cellIndex++;
                    }
                }
                else
                {
                    var newRow = dt.NewRow();
                    var cellIndex = 0;
                    foreach (ICellImporter cell in rowImporter.Cells)
                    {
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

### Explanation

1. **Define Columns**: During iteration of the first row (header row), add columns to the `DataTable`. If columns are skipped, add placeholder columns named "Column_X".
2. **Insert DBNull.Value for Empty Cells**: For subsequent rows, check for skips in cell indices. Insert `DBNull.Value` for every skipped cell index before adding the next non-empty cell value.
3. **Add Rows**: Append the constructed row to the `DataTable`.

This logic ensures that all cells, including empty ones, are accounted for, maintaining alignment with the Excel file's structure.

## See Also

- [SpreadStreamProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadstreamprocessing/overview)
- [RadSpreadStreamProcessing API Reference](https://docs.telerik.com/devtools/document-processing/api/radspreadstreamprocessing)
- [Reading Excel Rows with RadSpreadStreamProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadstreamprocessing/how-to/read-excel-rows)
