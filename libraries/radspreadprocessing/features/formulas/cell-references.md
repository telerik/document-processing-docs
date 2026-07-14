---
title: Reference Ranges
description: Learn how to use cell and range references in formulas in RadSpreadProcessing to work with data already in the workbook.
page_title: Reference Ranges
slug: radspreadprocessing-features-formulas-cell-references
tags: references, formulas, spreadsheet, radspreadprocessing, cells, ranges, worksheet, absolute, spread, xlsx
published: True
position: 2
---

# Reference Ranges



Apart from values, operators, and functions, formulas can refer to other cells, ranges of cells, or even rows and columns. Using references in expressions is convenient because they allow you to process data that is already in the workbook and avoid duplication. When the value of the referred range changes, the formula that holds the reference updates automatically.
      

## References

To include a reference in a formula, specify the column letter of the cell followed by its row number (for example, *A1, C15, BD12*). You can also use references to whole rows or columns (for example, *A:A, A:D, 1:1, 1:2*). References can appear in expressions as standalone values, operands, and arguments of functions.
        

To display the sum of cells A1 and B1 in cell C1, invoke the `SetValue()` method for cell C1 and pass the string *=A1+B1* as a parameter.
        

**Example 1** creates a workbook with a single worksheet before setting the value of C1.
        

**Example 1: Set a formula that references cells in the same worksheet**

<snippet id='codeblock-cmn'/>



References may optionally specify the worksheet of the referenced cell or range. To use such references in expressions, specify the worksheet name followed by an exclamation mark and the name of the cell or range you want to refer to. If the name of the worksheet contains symbols other than letters and digits, escape the name with single quotes. First, surround the value with single quotes. If the name itself contains single quotes, double them. For instance, to create an absolute reference to cell A1 in *Sam'sSheet* worksheet, add the string *'Sam''sSheet'!A1* to your formula. If the worksheet is not specified, the referenced cells are assumed to be in the current worksheet.
        

**Example 2** adds a worksheet to the workbook and renames the newly created instance. The example also sets the value of cell A1 in *Sheet1* to refer to cell B2 in the new sheet.
        

**Example 2: Set a formula that references a cell in another worksheet**

<snippet id='codeblock-cmo'/>



Formulas can also refer to ranges of cells. References to cell ranges are constructed with the colon (:) operator, a binary operator that takes two cell references and returns a reference to all cells between the two operands, including those operands. For example, the value =SUM(A1:B2) adds the values of cells A1, A2, B1, and B2. Similarly, the expression `=PRODUCT(D3:F5)` multiplies the contents of cells D3, D4, D5, E3, E4, E5, F3, F4, and F5.

References to whole rows or columns must always contain a colon separating the starting point from the ending point (for example, A:A, A:D, 1:1, 1:4).

**Example 3** demonstrates how to add a reference to a cell range.
        

**Example 3: Set a formula that references a cell range**

<snippet id='codeblock-cmp'/>



## Types of References

Based on whether a reference relates to the referenced range or the range that holds the reference, the reference falls in one of the following categories: absolute, relative, or mixed. This relation also determines the behavior of the reference when the formula that contains it is copied.

### Absolute References

Absolute references require a dollar sign ($) before the column letter and row number (for example, *$A$1, $BC$100, $D:$D, $4:$6*). References of this type are bound to the range they reference. When you copy the formula that holds the reference and paste it to another location, the reference still points to the same range. Also, if the formula is subject to auto fill, the newly produced formulas contain references to the same range.
             

If cell B2 has the value =$A$1*12 and you copy and paste the contents of B2 in cell D10, the pasted formula still points to A1. The string value of D10 is exactly the same as in B2: =$A$1*12.

### Relative References

Unlike absolute references, relative references are based on their position relative to the range that holds the reference. The relative reference is specified through the horizontal and vertical offset between the referenced range and the range that contains the reference, using the latter as a starting point. When a formula that holds a relative reference is copied and pasted, the newly created formula points to a range with the same horizontal and vertical offset as specified in the original expression.
             

For example, if cell C2 contains the value =A1 and you copy cell C2 and paste it in cell E4, the new value points to a cell that is one row above and two columns to the left. The contents of E4 is =C3. Also, if you apply an auto fill to the range C2:C5 starting from C2, the values of C3, C4, and C5 are =A2, =A3, and =A4, respectively.
             

In certain cases, the newly created value might relate to a range that goes beyond the boundaries of the worksheet. For example, if B2 has the value =A1 and you paste its value in cell A2, the new expression tries to find a cell that is one row above and one column to the left of A2. Because such a cell does not exist, the value of A2 changes to a reference error (`#REF!`). This error indicates that the cell reference is not correct.

### Mixed References

A mixed reference specifies its row as absolute and its column as relative or vice versa. When you copy and paste mixed range references, the absolute part stays unchanged and only the relative part translates. For instance, if B1 contains the value =SUM(A$1:A1) and you paste the value in the range B1:B5, each of the newly produced values holds the sum of all cells in column A between A1 and the current row. If you move the contents of B1 to a cell in another column (for example, E2), the new value translates the columns of both references: =SUM(D$1:D2).
             

### References to Whole Rows or Columns

SpreadProcessing supports references to whole columns and whole rows. You can use this feature to include all the values from a row or column in a formula. The row and column references:

* Are entered like other ranges, with a colon separating the starting point from the ending point.
* Can refer to a single or to multiple rows and columns. Even for a single row or column, define the reference as a range (for example, use A:A to refer to column A).
* Can be absolute, relative, or mixed references.

**Example 4: Use a reference to a whole column**

<snippet id='codeblock-cmq'/>

**Example 5: Use a reference to multiple rows**

<snippet id='codeblock-cmr'/>


## See Also

* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
* [Errors]({%slug radspreadprocessing-features-formulas-errors%})
