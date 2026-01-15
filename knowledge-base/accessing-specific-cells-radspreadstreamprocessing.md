---
title: Accessing Specific Cells in RadSpreadStreamProcessing
description: Learn how to access specific cells in the RadSpreadStreamProcessing library for efficient data processing.
type: how-to
page_title: How to Retrieve Specific Cells Using RadSpreadStreamProcessing
meta_title: How to Retrieve Specific Cells Using RadSpreadStreamProcessing
slug: accessing-specific-cells-radspreadstreamprocessing
tags: spread,processing,telerik, document ,stream,cell, access,performance
res_type: kb
ticketid: 1707561
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadSpreadStreamProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

[RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}) does not provide direct cell access like `Worksheet.Cell[rowIndex,columnIndex]`. It is optimized for high-performance scenarios, working with flat worksheet data. Accessing specific cells requires iterating through all cells and mapping them to their respective indices. For formatted documents and advanced features, RadSpreadProcessing is the recommended solution.

This knowledge base article also answers the following questions:
- How can I access specific cells using RadSpreadStreamProcessing?
- Is it possible to retrieve cell values directly in RadSpreadStreamProcessing?
- How to process formatted data with Telerik's spreadsheet libraries?

## Solution

To access specific cells using RadSpreadStreamProcessing:

1. [Iterate through all cells]({%slug radspreadstreamprocessing-import%}#read-file-data) and populate a dictionary where the key is the cell index (e.g., `SheetName!AK36`) and the value is the cell's content.
2. Use the dictionary to retrieve cell values.

Here is an example of how to build a dictionary for cell indexing:

```csharp
static void Main(string[] args)
{
    string pFile = "Sample.xlsx";

    Dictionary<string, string> cellsMap = BuildCellMapFromImporter(pFile);
    string cellValue = cellsMap.TryGetValue("Sheet1!AK36", out string val) ? val : "(not found)";
    Console.WriteLine(cellValue);
}

static Dictionary<string, string> BuildCellMapFromImporter(string xlsxPath)
{
    var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

    using (var fs = new FileStream(xlsxPath, FileMode.Open, FileAccess.Read, FileShare.Read))
    using (IWorkbookImporter wbImporter = SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, fs))
    {
        foreach (var wsImporter in wbImporter.WorksheetImporters)
        {
            string sheetName = wsImporter.Name;
            foreach (var rowImporter in wsImporter.Rows)
            {
                int rowIndex = rowImporter.RowIndex;
                foreach (var cell in rowImporter.Cells)
                {
                    int columnIndex = cell.ColumnIndex;
                    string cellAddress = $"{sheetName}!{IndexToColumnLetter(columnIndex)}{rowIndex + 1}";
                    string value = cell.Value;
                    map[cellAddress] = value;
                }
            }
        }
    }

    return map;
}

static string IndexToColumnLetter(int colIndex)
{
    int n = colIndex + 1;
    var chars = new Stack<char>();
    while (n > 0)
    {
        n--;
        chars.Push((char)('A' + (n % 26)));
        n /= 26;
    }
    return new string(chars.ToArray());
}
```

### Key Points:
- `ICellImporter.Value` returns the raw stored value or cached formula result.
- The `ICellImporter.Format.NumberFormat` provides the effective number format.
- For advanced formatting, use RadSpreadProcessing.

RadSpreadStreamProcessing is ideal for scenarios requiring high performance and low memory usage but lacks direct cell access or advanced formatting capabilities.

## See Also

- [RadSpreadStreamProcessing Overview]({%slug radspreadstreamprocessing-overview%})
- [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
