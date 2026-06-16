---
title: Cell Value Types
description: Learn which cell value types RadSpreadProcessing supports, how the cell Value property works, and how to set, read, and format cell values.
page_title: RadSpreadProcessing Cell Value Types
slug: radspreadprocessing-working-with-cells-cell-value-types
tags: cell, values, spreadsheet, radspreadprocessing, types, numeric, text, formula, boolean
published: True
position: 5
---

# Cell Value Types

Use this article to understand how the `Value` property works in the RadSpreadProcessing document model and which value types a cell can store. It explains the `ICellValue` abstraction, the supported concrete value types, and the most common ways to set, read, and format cell values.

## Working with the Value Property of Cells

Cells are the atomic data units of a worksheet, so the `Value` property is one of the most frequently used cell members. The property is of type `ICellValue`, which is implemented by these five concrete types:

* `EmptyCellValue`
* `BooleanCellValue`
* `NumberCellValue`
* `FormulaCellValue`
* `TextCellValue`

In most scenarios, you start by creating a `CellSelection` that points to a single cell or a cell range. The `Value` property then exposes three common operations:

* `SetValue()`
* `GetValue()`
* `ClearValue()`

`SetValue()` provides multiple overloads, so you can pass a `double`, `string`, `bool`, `DateTime`, or an `ICellValue` instance directly.

## Key ICellValue Members

The `ICellValue` interface exposes several members that are useful when you need to inspect or format a cell value:

* `RawValue`: Stores the entered string value rather than the displayed result. For example, if you enter `=1+2`, the cell value becomes `FormulaCellValue`, the displayed result is `3`, and `RawValue` remains `=1+2`.
* `ValueType` and `ResultValueType`: Return `CellValueType` values that describe the stored value and the calculated result. For example, a formula with `RawValue` equal to `=1+2` has `ValueType` equal to `Formula` and `ResultValueType` equal to `Number`.
* `GetValueAsString()` and `GetResultValueAsString()`: Return formatted string representations of the cell value or its result and require a `CellValueFormat` argument.

## Quick Reference for Supported Value Types

| Value type | Stores | Typical input methods |
|---|---|---|
| `EmptyCellValue` | No value | `ClearValue()` |
| `BooleanCellValue` | `true` or `false` | `SetValue(bool)`, `CellValueFactory.Create(bool)` |
| `NumberCellValue` | Numeric values, including dates | `SetValue(double)`, `SetValue(DateTime)`, `SetValue(string)` when parsing succeeds |
| `FormulaCellValue` | Spreadsheet formulas | `SetValue(string)` with `=`, `CellValueFactory.Create(...)`, `SetValueAsFormula(string)` |
| `TextCellValue` | Text strings | `SetValue(string)`, text cell format, `SetValueAsText(string)` |

## How to Get a Formatted Cell Value

Excel number formats differ from .NET formats. To get the correctly formatted cell value, first read the number format by using `CellSelection.GetFormat().Value`, and then pass the retrieved `CellValueFormat` to `ICellValue.GetResultValueAsString()`.

>caution
>
> The proper way to get a formatted cell value is to read the number format first through `CellSelection.GetFormat().Value` and then pass that `CellValueFormat` to `ICellValue.GetResultValueAsString()`. This approach also calculates formulas contained in the cell. For more information, see [Number Formatting]({%slug radspreadprocessing-features-number-formats%}).

### Example: Get a Formatted Cell Value

<snippet id='codeblock-cqd'/>

## Set and Read Cell Values

Example 1 sets the value of cell `A1` to `Total`.

### Example 1: Set a String Value

<snippet id='codeblock-cqe'/>

Another option is to use the `Create()` method of `CellValueFactory` to produce an `ICellValue` instance and then pass that instance to `SetValue(ICellValue)`. Like `SetValue()`, `Create()` provides overloads for common value types such as `string`, `double`, and `bool`.

Example 2 creates `NumberCellValue` with value `3.14` and assigns it to cell `A1`.

### Example 2: Create NumberCellValue

<snippet id='codeblock-cqf'/>

If you retrieve the value of cell `A1`, `GetValue()` returns `NumberCellValue` with `RawValue` equal to `3.14` and both `ValueType` and `ResultValueType` equal to `Number`.

Example 3 retrieves the value created in Example 2.

### Example 3: Retrieve a Cell Value

<snippet id='codeblock-cqg'/>

## How RangePropertyValue<ICellValue> Works

`GetValue()` does not return `ICellValue` directly. Instead, it returns `RangePropertyValue<ICellValue>`, which is used to determine whether the selected cell range contains a single consistent value.

If you retrieve the value of a range such as `A1:B2` and the cells do not all share the same value, `RangePropertyValue<ICellValue>` reports that the range is not homogeneous.

The class exposes these two key properties:

* `IsIndeterminate`: Indicates whether the `Value` property is consistent across the selected cells. If all cells have the same value, `IsIndeterminate` is `false`. If values differ, it is `true`.
* `Value`: Holds the common `ICellValue` for the range when `IsIndeterminate` is `false`. If the range contains different values, `Value` falls back to the default `EmptyCellValue`.

### Example 4: Use IsIndeterminate and Value

<snippet id='codeblock-cqh'/>

## Empty Cell Value

`EmptyCellValue` is the default cell value type. When you add an empty worksheet to a workbook, all cells initially contain `EmptyCellValue`. Its `RawValue` is an empty string and its `ValueType` is `Empty`.

If a cell already contains another value, clear it by using `ClearValue()`.

### Example 5: Clear a Value

<snippet id='codeblock-cqi'/>

## Boolean Cell Value

`BooleanCellValue` stores a value of type `bool`. Its `RawValue` is either `TRUE` or `FALSE`, and its `ValueType` is `Boolean`. You can assign it directly by using `SetValue(bool)`.

Example 6 sets cells `A1` and `B1` to `true` and `false`.

### Example 6: Set a Boolean Value

<snippet id='codeblock-cqj'/>

You can also create `BooleanCellValue` explicitly by using `CellValueFactory.Create()` and then passing the result to `SetValue()`.

### Example 7: Create BooleanCellValue by Using CellValueFactory

<snippet id='codeblock-cqk'/>

## Number Cell Value

`NumberCellValue` stores a value of type `double`. Its `ValueType` is `Number`, and `RawValue` is the string representation of the internal numeric value.

The displayed cell content can differ from `RawValue` because of the applied number format. For example, `50.00%` and `5.00E-01` can both represent the same internal number `0.5`. Dates also use numeric cell values with a date format applied. For example, `16 September 2020` is stored internally as `44090`.

Use these `SetValue()` overloads to create `NumberCellValue`:

* `SetValue(double)`
* `SetValue(DateTime)`
* `SetValue(string)` when the string can be parsed as a numeric value

If `SetValue(string)` cannot parse the input as another supported type, it falls back to `TextCellValue`.

### Example 8: Set a Number Cell Value

<snippet id='codeblock-cql'/>

## Date Values

You can use `SetValue(string)` to assign dates.

Example 9 sets the value of cell `A1` to `6 October 1987` in the `en-US` culture. After assignment, the cell contains `NumberCellValue` with `RawValue` equal to `32056`. Because the document model detects a date string, it applies a date format automatically.

### Example 9: Set a Date as NumberCellValue

<snippet id='codeblock-cqm'/>

Contained double value:   32056
Applied format:   m/d/yyyy

If you later access the value from Example 9, you receive its numeric representation, `32056`. To convert that value back to a date, use `FormatHelper.ConvertDoubleToDateTime()` or call `GetValueAsString()` to get the formatted string.

### Example 10: Get a Date Value

<snippet id='codeblock-cqn'/>

## Formula Cell Value

`FormulaCellValue` stores a value of type `RadExpression`, which represents an arithmetic expression built from constants, operators, cell references, and functions. Its `CellValueType` is `Formula`, and its `RawValue` must start with `=`.

You can create `FormulaCellValue` in two common ways:

* Pass a string that starts with `=` to `SetValue()`.
* Create an `ICellValue` through `CellValueFactory.Create()` and pass it to `SetValue()`.

Both methods create `FormulaCellValue` only when the current `CellValueFormat` is not `Text`. If the cell format is `Text`, the value becomes `TextCellValue` instead.

### Example 11: Create a Formula That Refers to Another Cell

<snippet id='codeblock-cqo'/>

After this code runs, the value of cell `A1` matches the value of cell `A2`. When `A2` changes, `A1` updates automatically.

An expression can also contain a built-in function. For the full list of available functions, see [Functions]({%slug radspreadprocessing-features-formulas-functions%}). If the current `CellValueFormat` is `Text` (`@`), the method produces `TextCellValue` instead of `FormulaCellValue`.

### Example 12: Use a Built-In Function

<snippet id='codeblock-cqp'/>

You can also pass `ICellValue` to `SetValue()` after creating it with `CellValueFactory.Create()`. Unlike the Boolean and Number overloads, formula creation also requires `Worksheet` and `CellIndex` parameters because the expression can reference other cells and worksheets. This overload also takes the current cell format and can return an updated format to apply.

### Example 13: Create FormulaCellValue

<snippet id='codeblock-cqq'/>

`SetValue()` performs internal checks that consider the current cell format and other conditions. If you already know that the incoming text is a formula, use `SetValueAsFormula(string text)` directly to improve performance.

### Example 14: Create FormulaCellValue by Using SetValueAsFormula()

<snippet id='codeblock-cqr'/>

Depending on your requirements, you can read either the formula definition or the evaluated result value.

### Example 15: Get the Value of a Cell That Contains a Formula

<snippet id='codeblock-cqs'/>

## Text Cell Value

`TextCellValue` stores a `string`, and its `ValueType` is `Text`.

You can set `TextCellValue` by using `SetValue(string)`. Before the method creates `TextCellValue`, it first tries to parse the incoming string as other supported value types. For example, if you pass `true`, the cell becomes `BooleanCellValue`.

### Example 16: Set TextCellValue

<snippet id='codeblock-cqt'/>

If you want to skip the default parsing and always create `TextCellValue`, set the cell value format to `Text` (`@`) before you assign the value.

### Example 17: Explicitly Apply the Text Value Type

<snippet id='codeblock-cqu'/>

You can achieve the same result by using `CellValueFactory.Create()`.

### Example 18: Create TextCellValue

<snippet id='codeblock-cqv'/>

If you already know that the value must be text, use `SetValueAsText(string text)` directly to avoid the internal parsing checks and improve performance.

### Example 19: Create TextCellValue by Using SetValueAsText()

<snippet id='codeblock-cqw'/>

## Next Steps

Continue with the article that matches your next task:

1. Read [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) to work with `CellSelection` objects.
2. Read [Number Formatting]({%slug radspreadprocessing-features-number-formats%}) to control how numeric and date values are displayed.
3. Read [Functions]({%slug radspreadprocessing-features-formulas-functions%}) to build more advanced formulas.

## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})