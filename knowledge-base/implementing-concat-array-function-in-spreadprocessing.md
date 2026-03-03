---
title: Implementing Custom Functions with a Cells Range as an Argument in SpreadProcessing
description: Learn how to implement your own custom function accepting an array argument in SpreadProcessing.
type: how-to
page_title: Implementing Custom Functions with a Cells Range as an Argument in SpreadProcessing
meta_title: Implementing Custom Functions with a Cells Range as an Argument in SpreadProcessing
slug: implementing-concat-array-function-in-spreadprocessing
tags: spread,telerik, document, processing,excel, formula, function, concat, array
res_type: kb
ticketid: 1710562
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article is expected to show a sample approach for defining a custom function which accepts a range of cells as an argument. For simplicity of the example and better understanding, we will use the [CONCAT](https://support.microsoft.com/en-us/office/concat-function-9b1a9a3f-94ff-41af-9736-694cbd6b4ca2) function which is expected to join several text items into one text item. It is listed in the [supported functions]({%slug radspreadprocessing-features-formulas-functions%}) by RadSpreadProcessing.

>note This approach can be adopted to other functions' implementation.

## Solution

1. Unregister the built-in implementation for the custom function (if such exists).
1. Implement your custom function.
1. Register the custom function using the FunctionManager.RegisterFunction() method.

#### Custom Function Implementation

```csharp
        static void Main(string[] args)
        {
            FunctionManager.UnregisterFunction("CONCAT"); // Unregister built-in CONCAT to test our custom one. (Optional: only if you want to override built-in behavior.)
            FunctionManager.RegisterFunction(new ConcatRawFunction());
  
            string inputFilePath = "InitialWorkbook.xlsx";
            Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
            XlsxFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

            using (Stream input = new FileStream(inputFilePath, FileMode.Open))
            {
                workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
            }

            string concatFormula = "=CONCAT(E4,G4)";
            CellSelection cell = workbook.ActiveWorksheet.Cells[10, 3];
            cell.SetValue(concatFormula);
      
            ICellValue cellValue = cell.GetValue().Value;
            CellValueFormat cellFormat = cell.GetFormat().Value;
            string formattedValue = cellValue.GetResultValueAsString(cellFormat);
        }

        public sealed class ConcatRawFunction : FunctionBase
        {

            public override string Name => "CONCAT";
            public override FunctionInfo FunctionInfo =>
                new FunctionInfo(
                    Name,
                    FunctionCategory.Text,
                    "Demo: get the full range defined by two single-cell refs (e.g., E4 and G4).",
                    new[]
                    {
                new ArgumentInfo("firstRef", "First single-cell reference.", ArgumentType.Reference),
                new ArgumentInfo("secondRef", "Second single-cell reference.", ArgumentType.Reference),
                    }
                );

            protected override RadExpression EvaluateOverride(FunctionEvaluationContext<RadExpression> context)
            {
                if (context.Arguments.Length != 2)
                    return ErrorExpressions.ValueError;

                // 1) Extract the references as CellReferenceRangeExpression
                var refExpr1 = context.Arguments[0] as CellReferenceRangeExpression;
                var refExpr2 = context.Arguments[1] as CellReferenceRangeExpression;

                if (refExpr1 == null || refExpr2 == null)
                    return ErrorExpressions.ValueError; // not references

                // For single-cell references, each expression will have exactly one range of size 1.
                var range1 = refExpr1.CellReferenceRanges.FirstOrDefault();
                var range2 = refExpr2.CellReferenceRanges.FirstOrDefault();
                if (range1 == null || range2 == null)
                    return ErrorExpressions.ReferenceError;

                // 2) Convert to concrete CellRange to get row/column indexes
                var cell1 = range1.ToCellRange(); // has FromIndex/ToIndex (both same for single cell)
                var cell2 = range2.ToCellRange();

                // Normalize to a bounding rectangle (top-left -> bottom-right)
                int fromRow = Math.Min(cell1.FromIndex.RowIndex, cell2.FromIndex.RowIndex);
                int fromCol = Math.Min(cell1.FromIndex.ColumnIndex, cell2.FromIndex.ColumnIndex);
                int toRow = Math.Max(cell1.ToIndex.RowIndex, cell2.ToIndex.RowIndex);
                int toCol = Math.Max(cell1.ToIndex.ColumnIndex, cell2.ToIndex.ColumnIndex);


                var range = new CellRange(fromRow, fromCol, toRow, toCol);

                // Iterate values via row/col indices (CellSelection itself is not IEnumerable)
                var ws = context.Worksheet;
                var sb = new StringBuilder();

                for (int r = range.FromIndex.RowIndex; r <= range.ToIndex.RowIndex; r++)
                {
                    for (int c = range.FromIndex.ColumnIndex; c <= range.ToIndex.ColumnIndex; c++)
                    {
                        var value = ws.Cells[r, c].GetValue().Value; // returns ICellValue
                        sb.Append(value?.RawValue?.ToString() ?? string.Empty);
                    }
                }

                return new StringExpression(sb.ToString());

            }
        }
```

## See Also

- [Custom Functions]({%slug radspreadprocessing-features-formulas-custom-functions%})
