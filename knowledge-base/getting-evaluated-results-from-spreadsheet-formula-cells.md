---
title: Getting Evaluated Results from Spreadsheet Formula Cells
description: Learn how to get evaluated formula results from RadSpreadProcessing cells as typed values instead of reading formula text from RawValue.
type: how-to
page_title: Getting Formula Results from RadSpreadProcessing Cells | Telerik Document Processing
slug: spreadprocessing-getting-evaluated-results-from-spreadsheet-formula-cells
tags: radspreadprocessing, spreadsheet, formula, cell-value, calculation
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadSpreadProcessing | <a href="https://www.telerik.com/blogs/author/yoan-karamanov" target="_blank">Yoan Karamanov</a> |

## Description

**RadSpreadProcessing** stores a formula cell as a `FormulaCellValue`. Its `RawValue` property contains the formula text, not the calculated result.

Use `GetResultValueAsCellValue()` to get the calculated result as an `ICellValue`. This lets your application inspect the result type or use a numeric result in calculations.

This knowledge base article also answers the following questions:

* How can I get the calculated result from a formula cell?
* Why does `FormulaCellValue.RawValue` contain the formula instead of the result?
* How can I get a formatted string from a formula cell?

## Solution

To read a calculated value, follow these steps:

1. Get the cell's `ICellValue` from `CellSelection.GetValue().Value`.
2. Check that the value is a `FormulaCellValue`.
3. Call `GetResultValueAsCellValue()` and inspect the returned `ICellValue`.

The following example adds a formula to cell `C1`, then prints its result type and value:

```csharp
using System;
using Telerik.Documents.Spreadsheet.Model;

class Program
{
    static void Main()
    {
        Telerik.Documents.Spreadsheet.Model.Workbook workbook =
            new Telerik.Documents.Spreadsheet.Model.Workbook();
        Worksheet worksheet = workbook.Worksheets.Add();

        worksheet.Cells[0, 0].SetValue(8);
        worksheet.Cells[0, 1].SetValue(12);
        worksheet.Cells[0, 2].SetValue("=A1+B1");

        ICellValue cellValue = worksheet.Cells[0, 2].GetValue().Value;
        if (!(cellValue is FormulaCellValue formulaValue))
        {
            throw new InvalidOperationException("Cell C1 does not contain a formula.");
        }

        ICellValue resultValue = formulaValue.GetResultValueAsCellValue();
        Console.WriteLine($"{resultValue.ValueType}: {resultValue.RawValue}");

        if (resultValue is NumberCellValue numberValue)
        {
            Console.WriteLine(numberValue.Value);
        }
    }
}
```

For the formula `=A1+B1`, the example prints `Number: 20` and then `20`.

### Key Points

`GetResultValueAsCellValue()` returns an `ICellValue` that represents the formula result. Use its `ValueType` to decide how to handle the result:

* `NumberCellValue` represents a numeric result. Read its `Value` property to access the number.
* `ErrorCellValue` represents a recognized formula error.
* `TextCellValue` represents a text result.
* Call `GetResultValueAsString()` with a `CellValueFormat` when you need formatted text.

## See Also

* [Formula entry and calculated result strings]({%slug radspreadprocessing-features-formulas-general-information%})
* [Cell value types and number formatting]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
