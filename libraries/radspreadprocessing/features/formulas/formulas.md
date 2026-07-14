---
title: General Information
description: Learn about formulas in RadSpreadProcessing, including values, operators, functions, and cell references used in algebraic expressions.
page_title: General Information
slug: radspreadprocessing-features-formulas-general-information
tags: formulas, spreadsheet, radspreadprocessing, expressions, operators, functions, cells, calculation, spread, xlsx
published: True
position: 0
---

# General Information



A formula is an algebraic expression that contains values, operators, functions, and references to cells. The following list describes the compound parts of formulas:
      

* **Values**: Expressions can contain numbers, booleans, strings, and arrays. For example, all of the following formulas represent valid expressions that contain values of different type: *=3+4, ="Rad"&"Spreadsheet", =AND(TRUE, FALSE), =SUM({1, 2; 3, 4})*.
          

* **Operators**: Formulas can include arithmetic, comparison, cell reference, and text operators. Examples of expressions that use operators are: *=-1+2, =B1<=4, =SUM(A1:B4), ="Rad"&"Spreadsheet"*. For more information about the supported operators, see the [Operator]({%slug radspreadprocessing-features-formulas-operators%}) article.
          

* **Cell references**: Formulas can contain references to cells or ranges of cells. For example, the expression *=B1+B2* adds the values of cells B1 and B2 of the current worksheet, while the formula *=SUM(B1:B5)* sums up the values of all cells between B1 and B5. For more information about cell references, see the [Cell References]({%slug radspreadprocessing-features-formulas-cell-references%}) article.
          

* **Built-in functions**: You can use a large set of predefined functions that can be directly included in expressions. Examples of formulas that use built-in functions are: *=ABS(-5), =COS(PI()), =AND(B1, B2)<>OR(C1, C2)*. You can find the full list in the [Functions]({%slug radspreadprocessing-features-formulas-functions%}) article.
          

## Get and Set Formulas in Cells

To set the value of a cell to a formula, use the `SetValue()` method of the [CellSelection]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) class and pass the formula string as an argument. To produce a formula value, the string you enter must start with either `=` (equal) or `–` (minus) sign. Otherwise, the method treats the input as plain text.
        
> The examples in this topic use numbers for simplicity. The formula works the same way with numbers or with cell references.

**Example 1** creates a workbook from scratch and adds a worksheet. The code then assigns the value =3+4 to cell A1.
        

**Example 1: Set a formula value in a worksheet cell**

<snippet id='codeblock-cmx'/>



In addition to entering formulas in cells, you can retrieve and inspect formula values. If you get the value of Cell[0, 0], the result is an object of type `FormulaCellValue`. Like other cell values, the `FormulaCellValue` class inherits from `CellValueBase` and conforms to the `ICellValue` interface. The class exposes several important properties and useful methods that allow you to get information about both the entered value and its result value.
        

A closer look at the value of cell A1 reveals that the two methods `GetValueAsString()` and `GetResultValueAsString()` return the original string of the expression and the string of the computed result, respectively. Similarly, `FormulaCellValue` offers information about the `CellValueType` of its value and result value through the `ValueType` and `ResultValueType` properties.
        

**Example 2: Inspect the formula expression and result value**

<snippet id='codeblock-cmy'/>



## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
