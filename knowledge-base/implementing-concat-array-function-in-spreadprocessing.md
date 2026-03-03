---
title: Implementing CONCAT(array) Function in SpreadProcessing
description: Addressing import/export challenges in XLS workbooks using RadSpreadsheet, including missing comments, formula support, and image handling.
type: how-to
page_title: Implementing CONCAT(array) Function in SpreadProcessing
meta_title: Implementing CONCAT(array) Function in SpreadProcessing
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

CONCAT function is expected to join several text items into one text item and it is listed in the supported by RadSpreadProcessing functions. However,  if the passed range includes more than two cells, then the functionality for [array formulas](https://feedback.telerik.com/document-processing/1356134-spreadprocessing-support-for-array-formulas) is required. 
This article shows how to implement a custom function that concatenates all the cell values within a range, not simply two cell values. 

## Solution


#### Custom `CONCAT` Implementation

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

- [RadSpreadProcessing Supported Functions](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/features/formulas/functions)
- [Feedback Portal: Array Formulas](https://feedback.telerik.com/document-processing/1356134-spreadprocessing-support-for-array-formulas)
- [TRANSPOSE Function Documentation](https://support.microsoft.com/en-us/office/transpose-function-ed039415-ed8a-4a81-93e9-4b6dfac76027)
- [RadSpreadProcessing Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/overview)
