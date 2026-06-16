---
title: Cell Value Types
description: Learn about the different cell value types supported in RadSpreadProcessing and how to work with the Value property of cells.
page_title: Cell Value Types
slug: radspreadprocessing-working-with-cells-cell-value-types
tags: cell, values, spreadsheet, radspreadprocessing, types, numeric, text, formula, boolean
published: True
position: 5
---

# Cell Value Types

The following sections describe how to work with the `Value` property of the cells in the document model and focus on the different supported types of values. 

## Working with the Value Property of Cells

Cells are the atomic data units of a worksheet, and you will use their `Value` property frequently. The property is of type `ICellValue` — an interface that all five concrete value types implement: `EmptyCellValue`, `BooleanCellValue`, `NumberCellValue`, `FormulaCellValue`, and `TextCellValue`. The `ICellValue` interface exposes several properties and methods:
        
* `RawValue`: The property holds the string value entered by the user, as opposed to the result value displayed in the cell. For example, when the user enters the string "=1+2" in a cell, the Value of the cell becomes a *FormulaCellValue* instance with result value of "3" and RawValue of "=1+2".

* `ValueType` and `ResultValueType`: The two properties are of type `CellValueType` and provide information about the type of the Value and its result. For example, the `FormulaCellValue` with RawValue of "=1+2" has a *Formula* ValueType and a *Number* ResultValueType. Similarly, the string "=CONCATENATE("abc", "def")" produces a `FormulaCellValue` with *Formula* ValueType and *Text* ResultValueType.

* `GetValueAsString()` and `GetResultValueAsString()`: The two methods require a `CellValueFormat` argument that specifies how to present the Value and the ResultValue of the `ICellValue` object as strings.
            
To access the Value property of cells, first create a `CellSelection` object that designates the cell or region of cells you want to work with. Like all other properties of the worksheet cells, the Value property has three methods that respectively set, get, and clear its value: `SetValue()`, `GetValue()`, and `ClearValue()`.

The `SetValue()` method has multiple overloads that allow you to pass a double, a string, a Boolean value, a `DateTime` instance, or an `ICellValue` object.

>caution The Excel Number Formats differ from the .NET ones. The proper way to get the formatted cell value is to get the number format first using `CellSelection.GetFormat().Value`. Then, pass the retrieved `CellValueFormat` to the `ICellValue.GetResultValueAsString` method. This also calculates the formulas contained in the cell. Read more in the [Number Formatting]({%slug radspreadprocessing-features-number-formats%}) article.

#### Get Formatted Cell Value

   <snippet id='codeblock-cqd'/>

**Example 1** sets the Value of cell A1 to "Total".

**Example 1: Set String Value**

<snippet id='codeblock-cqe'/>



Another option for setting the cell value is to use the `Create()` method of the `CellValueFactory` class to produce an `ICellValue` and then assign the value using the `SetValue(ICellValue)` method. Similarly to `SetValue()`, the `Create()` method has multiple overloads that allow you to enter a string, double, or Boolean value.

**Example 2** creates a `NumberCellValue` with value 3.14 and assigns it to cell A1.

**Example 2: Create NumberCellValue**

<snippet id='codeblock-cqf'/>



If you now retrieve the Value of cell A1, the `GetValue()` method returns an instance of `NumberCellValue` with RawValue equal to "3.14" and both ValueType and ResultValueType equal to Number.

**Example 3** retrieves the value created in **Example 2**.

**Example 3: Retrieve Cell Value**

<snippet id='codeblock-cqg'/>



The `GetValue()` method does not return an `ICellValue` directly. Instead, it provides a `RangePropertyValue<ICellValue>` instance. The `RangePropertyValue` is used to determine whether the value of a region of cells is homogeneous. If you attempt to retrieve the value of the cell region A1:B2 and the values in these cells are different, the `RangePropertyValue` specifies that the values vary. The class exposes two properties that describe the values in the chosen cell range:

* `IsIndeterminate`: The Boolean property indicates whether the Value property is consistent among all cells in the specified `CellSelection`. If all cells have one and the same Value, `IsIndeterminate` is set to false. However, if the Value property varies throughout the cells in the `CellSelection`, the `IsIndeterminate` property is set to true and the `Value` property of the `RangePropertyValue<ICellValue>` instance is set to its default value — `EmptyCellValue`.

* `Value`: If the `IsIndeterminate` property is set to false, `Value` holds the `ICellValue` of the whole `CellSelection` region. If the `IsIndeterminate` property is set to true, then the cells in the `CellSelection` region contain different values and the Value property is set to its default — `EmptyCellValue`.

	**Example 4: Retrieve and Use IsIndeterminate and Value Properties**

	<snippet id='codeblock-cqh'/>


## Empty Cell Value

`EmptyCellValue` is the default cell value type. When you add an empty worksheet to the workbook, the Value property of all its cells is of type `EmptyCellValue`. The RawValue of an `EmptyCellValue` is an empty string and its ValueType is Empty.

If a cell already contains another value, you can set an empty value for it using the `ClearValue()` method.

**Example 5** clears the value of cell A1.

**Example 5: Clear Value**

<snippet id='codeblock-cqi'/>



## Boolean Cell Value

As its name suggests, the `BooleanCellValue` type contains a value of type bool. The RawValue of each `BooleanCellValue` is either "TRUE" or "FALSE" and the ValueType is Boolean. You can assign a `BooleanCellValue` to a cell using the `SetValue(bool)` overload.

**Example 6** sets the values of cells A1 and B1 to true and false `BooleanCellValue` instances, respectively.

**Example 6: Set Boolean Value**

<snippet id='codeblock-cqj'/>



Another way to assign cells Boolean values is through using the static `Create()` method of the `CellValueFactory` class to produce a `BooleanCellValue` and then passing this cell value instance to the `SetValue()` method.

**Example 7** illustrates how to create a `BooleanCellValue` using the `CellValueFactory` class.

**Example 7: Create a BooleanCellValue Using CellValueFactory**

<snippet id='codeblock-cqk'/>



## Number Cell Value

The `NumberCellValue` contains a value of type double. The **ValueType** of each `NumberCellValue` instance is **Number** and the **RawValue** is the string representation of the double it holds internally. The RawValue of the `NumberCellValue` may differ from the value that appears in the cell because a **cell value format** may be applied. For example, if two cells present to the user "50.00%" and "5.00E-01", they both contain a `NumberCellValue` with a RawValue "0.5". The values appear differently because percentage format has been applied to the first cell and scientific format to the second cell. In fact, **dates** are also number values presented in date format. For example, 16 September 2020 is the number 44090. You can find a detailed description of the possible number formats and examples of their automatic assignment in the [Number Formatting]({%slug radspreadprocessing-features-number-formats%}) article.

The `SetValue()` method has several overloads that produce a `NumberCellValue`. You can use `SetValue(double)` and pass the double value or `SetValue(DateTime)` and pass a `DateTime` instance that is internally converted to a number. Also, you can use `SetValue(string)` and pass the string representation of the number you want to set. The `SetValue(string)` method attempts to parse the string you provide to all values and turns it into a `TextCellValue` only if it cannot produce any of the other types of values.

**Example 8** shows how to set the value of cell A1 to 1.23.

**Example 8: Set Number Cell Value**

<snippet id='codeblock-cql'/>


## Date Values

You can use the `SetValue(string)` method to assign dates.

**Example 9** sets the value of cell A1 to 6 October 1987 (in culture "en-US"). Once set, the value of A1 is a `NumberCellValue` with RawValue 32056. Because the document model detects that this is a date string, a date format is automatically applied to the cell, so that the value appears as a date.

**Example 9: Set Date as Number Cell Value**

<snippet id='codeblock-cqm'/>



Contained double value:   32056      
Applied format:   m/d/yyyy

If you later access the value of the cell applied in **Example 9**, you get its double representation - 32056. To get the date that this value represents, you can use the `ConvertDoubleToDateTime()` method of the [FormatHelper](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Formatting.FormatHelper.html) class to convert the raw number to a date or the `GetValueAsString()` method, which returns the date as a string. Both approaches are demonstrated in **Example 10**.

**Example 10: Get Date Value**

<snippet id='codeblock-cqn'/>


## Formula Cell Value

The `FormulaCellValue` contains a value of type `RadExpression`, which represents an arithmetic expression built up by constants, operators, cell references, and functions. The CellValueType of `FormulaCellValue` instances is Formula and their RawValue starts with an equal sign (=).

There are a couple of approaches to set a `FormulaCellValue` to a cell: invoke the `SetValue()` method with a string, or pass an `ICellValue` instance retrieved through the `Create()` method of the `CellValueFactory` class to the `SetValue()` method. Both methods produce a `FormulaCellValue` only if the current `CellValueFormat` is not Text. If the format of the cell is Text, the `SetValue()` and `Create()` methods produce a `TextCellValue`. If you want to present formula values as strings, set the `CellValueFormat` property of the specified cell before you input the values.

You can set a `FormulaCellValue` through the `SetValue()` method by passing a string that starts with an equal sign (=).

**Example 11** shows how you can create a formula that refers to another cell.

**Example 11: Create Formula Referring to Another Cell**

<snippet id='codeblock-cqo'/>



After this code executes, the value of cell *A1* is the same as the value of cell A2. When the value of A2 is modified, the change is reflected in A1 automatically.

An expression can also contain a predefined function that performs a given calculation. The document model offers several built-in functions. You can read more about the available functions in the [Functions]({%slug radspreadprocessing-features-formulas-functions%}) article. If the current `CellValueFormat` of the cell is Text ("@"), the method produces a `TextCellValue` instead of a `FormulaCellValue`.

**Example 12** illustrates the use of the SUM built-in function.

**Example 12: Use Built-in Function**

<snippet id='codeblock-cqp'/>



Another way of setting a `FormulaCellValue` is passing an `ICellValue` object to the `SetValue()` method. Once again, the `CellValueFactory` `Create()` method is used. Unlike the `BooleanCellValue` and the `NumberCellValue`, you need to pass the `Worksheet` and the `CellIndex` instances as parameters. These two arguments are required in case the `RadExpression` contains references to cells in other worksheets. Additionally, this overload of the `Create()` method requires the current cell value format as a parameter, and based on its value, the method provides the new cell value format value that you must apply. If the current `CellValueFormat` is Text ("@"), the method produces a `TextCellValue` instead of a `FormulaCellValue`.

**Example 13** creates a `FormulaCellValue` using the `CellValueFactory` class.

**Example 13: Create FormulaCellValue**

<snippet id='codeblock-cqq'/>


Using the `SetValue()` method executes internal checks for the current cell value type using the current format and other conditions. If you are sure that the passed value is a formula, you can use the `SetValueAsFormula(string text)` method directly, which improves the performance.

**Example 14** shows how you can use the method.

**Example 14: Create FormulaCellValue Through SetValueAsFormula()**

<snippet id='codeblock-cqr'/>

Depending on your requirements, you can get the formula from the cell represented by its definition or by the evaluated result value. **Example 15** shows both possibilities.

**Example 15: Get the Value of a Cell Containing Formula**

<snippet id='codeblock-cqs'/>

## Text Cell Value

As its name suggests, the `TextCellValue` contains a value of type string and its ValueType is Text.

You can set a `TextCellValue` using the `SetValue(string)` method. Before producing a `TextCellValue`, the `SetValue()` method attempts to parse the incoming string to all other cell value types. If you pass the string "true", the cell is assigned a `BooleanCellValue`. If you want the cell to contain the string "true", pass the `SetValue(string)` method the string "=true".

**Example 16** sets the value of cell A1 to the string "some test".

**Example 16: Set TextCellValue**

<snippet id='codeblock-cqt'/>



If you want to avoid the default parsing of the input string and always produce a `TextCellValue`, set the `CellValueFormat` of the cells to Text ("@") and then enter the values.

**Example 17** enters the string "=1+2" into a cell. Because of the applied cell value format, the cell is assigned a `TextCellValue` instead of a `FormulaCellValue`.

**Example 17: Explicitly Apply Text Value Type**

<snippet id='codeblock-cqu'/>



You can achieve the same result using the `Create()` method of the `CellValueFactory` class. **Example 18** enters the string "=1+2" into a cell and applies cell value format.

**Example 18: Create TextCellValue**

<snippet id='codeblock-cqv'/>


If you are sure that the value is a string and need to create a text cell value, you can use the `SetValueAsText(string text)` method directly. This avoids the internal checks and parsing that are usually executed and improves the performance.

**Example 19** shows how to use the `SetValueAsText()` method.

**Example 19: Create TextCellValue Through SetValueAsText**

<snippet id='codeblock-cqw'/>



## See Also

 * [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
