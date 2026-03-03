---
title: Implementing TRANSPOSE(array) Function in SpreadProcessing
description: Learn how to implement  TRANSPOSE(array) function in Telerik Document Processing Libraries.
type: how-to
page_title: Implementing TRANSPOSE(array) Function in SpreadProcessing
meta_title: Implementing TRANSPOSE(array) Function in SpreadProcessing
slug: implementing-transpose-array-function-in-spreadprocessing
tags: spread,processing,telerik,document,formula, function,transpose,array
res_type: kb
ticketid: 1710562
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

If your original data is:
|A|B|C|
|----|----|----|
|Apple|Banana|Cherry|
|1|2|3|

then =[TRANSPOSE](https://support.microsoft.com/en-us/office/transpose-function-ed039415-ed8a-4a81-93e9-4b6dfac76027)(A1:C1) will produce: 

|A|B|C|
|----|----|----|
|Apple|1||
|Banana|2||
|Cherry|3||

In other words, a horizontal range becomes vertical and a vertical range becomes horizontal. This article demonstrates a sample approach of a custom implementation for the TRANSPOSE. 

## Solution
 

#### Custom TRANSPOSE Function

Create a custom `TRANSPOSE` function to transpose rows and columns.

```csharp
         static void Main(string[] args)
        {
            FunctionManager.RegisterFunction(new TransposeRawFunction());

            string inputFilePath = "Book1.xlsx";
            Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
            XlsxFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

            using (Stream input = new FileStream(inputFilePath, FileMode.Open))
            {
                workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
            }
            string concatFormula = "=TRANSPOSE(A1:C2)";
            int targetRow = 10;
            int targetCol = 3;
            CellSelection cell = workbook.ActiveWorksheet.Cells[targetRow, targetCol];
            cell.SetValue(concatFormula);

            FormulaCellValue cellValue = cell.GetValue().Value as FormulaCellValue;

            RadExpression expr = cellValue.Value; //If the function returns an array, the evaluated result is an ArrayExpression
            expr = expr.GetValue(); // forces evaluation to final expression
            if (expr is ArrayExpression arr)
            {
                int rows = arr.RowCount;
                int cols = arr.ColumnCount;  // 2D dimensions
                                             // Access each element as RadExpression: arr[r, c]

                for (int r = 0; r < rows; r++)
                {
                    for (int c = 0; c < cols; c++)
                    {
                        RadExpression itemExpr = arr[r, c].GetValue(); // evaluate element to a constant/ref

                        // Persist a concrete value text into the sheet (simple case):
                        workbook.ActiveWorksheet.Cells[targetRow + r, targetCol + c].SetValue(itemExpr.GetValueAsString().Replace("{", string.Empty).Replace("}", string.Empty));
                    }
                }
            }


            string outputFilePath = "exported.xlsx";
            File.Delete(outputFilePath);
            using (Stream output = new FileStream(outputFilePath, FileMode.Create))
            {
                formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
            }
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
        }

       public sealed class TransposeRawFunction : FunctionBase
        {
            // Use a custom name to avoid shadowing the built-in TRANSPOSE (if present).
            public override string Name => "TRANSPOSE";

            public override FunctionInfo FunctionInfo => new FunctionInfo(
                Name,
                FunctionCategory.LookupReference, // Matches the lookup/reference nature of TRANSPOSE
                "Transposes an array or range (rows become columns, columns become rows).",
                new[] { new ArgumentInfo("array", "Array or range to transpose.", ArgumentType.Array) }
            );

            protected override RadExpression EvaluateOverride(FunctionEvaluationContext<RadExpression> context)
            {
                if (context.Arguments.Length != 1)
                    return ErrorExpressions.ValueError;

                var arg = context.Arguments[0];

                // --- Case 1: Literal or computed array (ArrayExpression) -------------------------
                if (arg is ArrayExpression arr)
                {
                    int srcRows = arr.RowCount;   // available from ArrayExpression API
                    int srcCols = arr.ColumnCount; // available from ArrayExpression API  

                    // Transposed dimensions: rows = srcCols, cols = srcRows
                    var data = new CompressedExpressionCollection(srcCols, srcRows); // 2D sparse store  

                    for (int r = 0; r < srcRows; r++)
                        for (int c = 0; c < srcCols; c++)
                        {
                            // Swap indices (r,c) -> (c,r)
                            data[c, r] = arr[r, c];
                        }

                    return new ArrayExpression(data); // ArrayExpression ctor accepts CompressedExpressionCollection 
                }

                // --- Case 2: A reference/range (CellReferenceRangeExpression) -------------------
                if (arg is CellReferenceRangeExpression refExpr)
                {
                    // For simplicity, accept a single rectangular area only.
                    var area = refExpr.CellReferenceRanges.FirstOrDefault();
                    if (area == null || refExpr.CellReferenceRanges.Count != 1)
                        return ErrorExpressions.ValueError;

                    var src = area.ToCellRange(); // convert to concrete row/col indices  

                    int height = src.RowCount;
                    int width = src.ColumnCount;

                    // Transposed dimensions: rows = width, cols = height
                    var data = new CompressedExpressionCollection(width, height); // 2D sparse store  

                    // Build single-cell reference expressions to preserve dependencies.
                    // We'll use NameConverter to turn (row,col) -> "A1" and then parse it back to a 1x1 reference.  
                    for (int rOff = 0; rOff < height; rOff++)
                    {
                        int r = src.FromIndex.RowIndex + rOff;
                        for (int cOff = 0; cOff < width; cOff++)
                        {
                            int c = src.FromIndex.ColumnIndex + cOff;

                            string a1 = NameConverter.ConvertCellIndexToName(r, c); // e.g., "E4" 

                            if (!NameConverter.TryConvertNamesToCellReferenceRangeExpression(
                                    a1,
                                    context.Worksheet,    // current worksheet
                                    context.RowIndex,     // context position (for relative refs)
                                    context.ColumnIndex,
                                    out CellReferenceRangeExpression singleRef))
                            {
                                return ErrorExpressions.ReferenceError;
                            }

                            // place at transposed index (rOff, cOff) -> (cOff, rOff)
                            data[cOff, rOff] = singleRef;
                        }
                    }

                    return new ArrayExpression(data);
                }

                // --- Case 3: Scalar -> 1x1 array -----------------------------------------------
                var scalar = arg.GetValue(); // evaluate to a RadExpression  
                var one = new CompressedExpressionCollection(1, 1);
                one[0, 0] = scalar;
                return new ArrayExpression(one);
            }
        }
```

 
## See Also

- [SpreadProcessing Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/overview)
- [Supported Functions in SpreadProcessing](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/features/formulas/functions)
- [Feedback Portal for SpreadProcessing](https://feedback.telerik.com/document-processing)
