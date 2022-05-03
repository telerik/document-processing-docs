---
title: Reference Ranges
page_title: Reference Ranges
slug: radspreadprocessing-features-formulas-cell-references
tags: cell,references
published: True
position: 2
---

# Reference Ranges



Apart from values, operators and functions, formulas can refer to other cells, ranges of cells, or even rows/columns. Using references in expressions is very convenient since they allow you to process data that is already in the workbook and thus avoid duplication of data. Further, when the value of the referred ranges changes, the formula that holds the reference updates automatically.
      

## References

To include a reference in a formula, simply specify the column letter of the cell followed by its row number, e.g. *A1, C15, BD12* etc. You can also use references to whole row or columns, e.g *A:A, A:D, 1:1, 1:2*. References can be used in expressions like variables; they can appear as standalone values, operands, and arguments of functions.
        

To display the sum of cells A1 and B1 in cell C1, you can invoke the __SetValue()__ method for cell C1 and pass the string *=A1+B1* as a parameter.
        

__Example 1__ creates a workbook with a single worksheet before setting the value of C1.
        

#### __[C#] Example 1: Set reference value__

{{region cs-radspreadprocessing-features-formulas-cell-references_0}}
	Workbook workbook = new Workbook();
	workbook.Worksheets.Add();
	workbook.ActiveWorksheet.Cells[0, 2].SetValue("=A1+B1");
{{endregion}}



References may optionally specify the worksheet of the referenced cell/range. To use such references in expressions, specify the worksheet name followed by exclamation mark and the name of the cell/range you would like to refer to. If the name of the worksheet contains symbols other than letters and digits, the name should be escaped using single quotes. First, the value should be surrounded with single quotes and if the name itself contains single quotes, these should be doubled. For instance, to create an absolute reference to cell A1 in *Sam'sSheet* worksheet, add to your formula the string *'Sam''sSheet'!A1*. If the worksheet is not specified, it is assumed that the referenced cell(s) is in the current worksheet.
        

__Example 2__ adds a worksheet to the workbook and renames the newly created instance. Moreover, the example sets the value of cell A1 in *Sheet1* to refer to cell B2 in the new sheet.
        

#### __[C#] Example 2: Set reference value from another sheet__

{{region cs-radspreadprocessing-features-formulas-cell-references_1}}
	workbook.Worksheets.Add();
	Worksheet sheet1 = workbook.Worksheets[0];
	Worksheet samsWorksheet = workbook.Worksheets[1];
	samsWorksheet.Name = "Sam'sWorksheet";
	
	sheet1.Cells[0, 0].SetValue("='Sam''sWorksheet'!B2");
{{endregion}}



Formulas can also refer to ranges of cells. References to cell ranges are constructed via the colon (:) operator – a binary operator that takes two cell references and returns a reference to all cells between the two operands, including these operands. For example, the value =SUM(A1:B2) adds the values of cells A1, A2, B1 and B2. Similarly, the expression __=PRODUCT(D3:F5)__ multiplies the contents of the cells D3, D4, D5, E3, E4, E5, F3, F4 and F5.

References to whole rows or columns should always contain a colon separating the starting point from the ending point, e.g. A:A, A:D, 1:1, 1:4.

__Example 3__ demonstrates how to add a reference to a cell range.
        

#### __[C#] Example 3: Set reference to cell range__

{{region cs-radspreadprocessing-features-formulas-cell-references_2}}
	sheet1.Cells[2, 2].SetValue("=SUM(A1:B2)");
	samsWorksheet.Cells[0, 0].SetValue("=PRODUCT(D3:F5)");
{{endregion}}



## Types of References

Based on whether a reference relates to the referenced range or the range that holds the reference, the reference falls in one of the following categories: absolute, relative, mixed. This relation also determines the behavior of the reference when the formula that contains it is copied.

### Absolute References

Absolute references require a dollar sign ($) to be placed before the column letter and row number, e.g. *$A$1, $BC$100, $D:$D, $4:$6*. References of this type are bound to the range they reference. When you copy the formula that holds the reference and paste it to another location, the reference still points to the same range. Also, if the formula is a subject to auto fill, the newly produced formulas contain references to one and the same range.
            

If cell B2 has the value =$A$1*12 and you copy and paste the contents of B2 in cell D10, the pasted formula will again point to A1 and, in fact, the string value of D10 will be exactly the same as in B2 =$A$1*12.

### Relative References

Unlike absolute references, relative references are based on their position relative to the range holding the reference. The relative reference is specified through the horizontal and vertical offset between the referenced range and the range that contains the reference using the latter as a starting point. Thus, when a formula holding relative reference is copied and pasted, the newly created formula points to a range with same horizontal and vertical offset as specified in the original expression.
            

For example, if cell C2 contains the value =A1 and you copy cell C2 and paste it in cell E4, the new value will point to a cell that is one row above and two columns to the left, i.e. the contents of E4 will be =C3. Also, if you apply an auto fill to the range C2:C5, starting from C2, the values of C3, C4 and C5 will be =A2, =A3, and =A4, respectively.
            

In certain cases, the newly created value might relate to a range that goes beyond the boundaries of the worksheet. For example, if B2 has the value =A1 and we paste its value in cell A2, the new expression will try to find a cell that is one row above and one column to the left of A2. Since such a cell does not exist, the value of A2 is changed to reference error (__#REF!__). This error indicates that the cell reference is not correct.

### Mixed References

A mixed reference specifies its row as absolute and its column as relative or vice versa. Upon copy/paste mixed range references keep their absolute part unchanged and translate only the relative part. For instance, if B1 contains the value =SUM(A$1:A1) and we paste the value in the range B1:B5, each of the newly produced values will hold the sum of all cells in the column A between A1 and the current row. Note that if you move the contents of B1 to a cell in another column, say E2, the new value will translate the columns of both references =SUM(D$1:D2).
            

### References to Whole Rows or Columns

SpreadProcessing supports references to whole columns and whole rows. You can use this functionality to include all the values from a row/column to a formula. The row and column references:
- are entered like other ranges, with a colon separating the starting point from the ending point;
- can refer to a single or to multiple rows/columns. Note that even for single row or column, the reference should be defined similarly to how you define ranges, e.g. you should use A:A to refer to column A.
- can also be absolute, relative or mixed references.

#### [C#] Example 4: Use reference to a column

{{region cs-radspreadprocessing-features-formulas-cell-references_3}}
	Workbook workbook = new Workbook();
	workbook.Worksheets.Add();
	workbook.ActiveWorksheet.Cells[1, 1].SetValue("=AVERAGE(A:A)");
{{endregion}}

#### [C#] Example 5: Use reference to multuple rows

{{region cs-radspreadprocessing-features-formulas-cell-references_4}}
	Workbook workbook = new Workbook();
	workbook.Worksheets.Add();
	workbook.ActiveWorksheet.Cells[0, 0].SetValue("=AVERAGE(1:5)");
{{endregion}}


## See Also

 * [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
 * [Errors]({%slug radspreadprocessing-features-formulas-errors%})
