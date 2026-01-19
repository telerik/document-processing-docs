---
title: Protect Specific Worksheet Cells Using RadSpreadProcessing
description: Learn how to lock only specific worksheet cells while keeping the rest editable using RadSpreadProcessing.
type: how-to
page_title: Protect Specific Cells in RadSpreadProcessing
slug: radspreadprocessing-protect-specific-worksheet-cells
tags: spread, processing, worksheet, protection, lock, cells, used, range, performance, document
res_type: kb
---

## Environment

| Version | Product | Author |
| ---- | ---- | ---- |
| 2025.4.1104 | RadSpreadProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

This article shows how to protect only certain cells in a [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) using [SpreadProcessing]({%slug radspreadprocessing-overview%}). The example demonstrates the most efficient way to keep all cells unlocked except the first row of a used range, which will remain locked and protected.

## Solution

In [SpreadProcessing]({%slug radspreadprocessing-overview%}), [Worksheet protection]({%slug radspreadprocessing-features-protection-worksheet%}) locks all cells by default. To protect only specific cells:

1. Protect the worksheet.
2. Unlock all columns (faster than iterating rows).
3. Determine the used cell range.
4. Lock only the first row cells within the used range.
5. Export the result.

Below is a complete example:

```csharp
Workbook workbook;
IWorkbookFormatProvider xlsxFormatProvider = new XlsxFormatProvider();

using (Stream input = new FileStream("input.xlsx", FileMode.Open))
{
    workbook = xlsxFormatProvider.Import(input, TimeSpan.FromSeconds(10));
}

Worksheet worksheet = workbook.ActiveWorksheet;

// Protect the worksheet (default options)
worksheet.Protect("telerik", WorksheetProtectionOptions.Default);

// Unlock all columns in the worksheet (empty ones included)
for (int columnIndex = 0; columnIndex <= SpreadsheetDefaultValues.ColumnCount - 1; columnIndex++)
{
    worksheet.Columns[columnIndex].SetIsLocked(false);
}

// Get the used cells range
CellRange usedCellRange = worksheet.UsedCellRange;

// Lock all first row cells of the used range
for (int columnIndex = usedCellRange.FromIndex.ColumnIndex; columnIndex <= usedCellRange.ToIndex.ColumnIndex; columnIndex++)
{
    CellSelection cell = worksheet.Cells[0, columnIndex];
    cell.SetIsLocked(true);
}

// Export to XLSX
string xlsxOutputPath = "output.xlsx";
using (Stream output = new FileStream(xlsxOutputPath, FileMode.Create))
{
    xlsxFormatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
}
```

### Key Points
* Protecting columns instead of rows is significantly faster because the maximum number of columns (16,384) is far smaller than the maximum number of rows (1,048,576).
* By unlocking all columns first, you can selectively lock only the cells you need before applying protection.

## See Also
* [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
* [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%})
