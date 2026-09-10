---
title: Dynamic Array Formulas
description: Learn how dynamic array formulas work in RadSpreadProcessing, including spill behavior, spill state inspection, new operators, and how to write custom array-aware functions.
page_title: Dynamic Array Formulas
slug: radspreadprocessing-features-formulas-dynamic-array-formulas
tags: dynamic, array, formulas, spill, spreadsheet, radspreadprocessing, xlsx, excel, operators, functions, calculation
published: True
position: 6
---

# Dynamic Array Formulas

A **dynamic array formula** is a formula whose result is an array of values. Instead of returning a single value, the formula engine writes the result into a rectangular block of cells starting from the **anchor cell** (the cell that contains the formula) and expanding downward and to the right automatically. The cells that receive the overflow values are called **spill cells**. This behavior is part of the modern dynamic array model introduced in Excel 365/2019, and RadSpreadProcessing supports it for faithful round-tripping of modern XLSX files.

Dynamic array formulas differ from the older **CSE (Ctrl+Shift+Enter) array formulas**:

| Feature | CSE array formulas | Dynamic array formulas |
|---|---|---|
| Entry | Ctrl+Shift+Enter | Enter (standard) |
| Result range | Fixed, user-defined | Automatically determined |
| Spill behavior | None | Spills automatically |
| Excel visualization | `{=formula}` | `=formula` |
| XLSX `t` attribute | `array` with fixed `ref` | `array` with dynamic `ref` |

SpreadProcessing supports both legacy CSE array formulas (round-tripped from existing XLSX files) and fully dynamic array formulas.

## Spill Behavior

When a formula evaluates to an array result, the engine attempts to write each element to the corresponding spill cell:

* **Available cells**: If all target cells are empty (or already owned by this anchor), the values are written and the anchor's spill range becomes *Active*.
* **Blocked cells**: If any target cell contains a value that was not written by this anchor, the engine does not overwrite that cell. Instead, the anchor cell returns a `#SPILL!` error and the spill range becomes *Blocked*.
* **Size unknown**: If the engine cannot determine the dimensions of the result (for example, because the formula produces an infinite or circularly dependent sequence), the anchor returns a `#CALC!` error.

When a spill range **shrinks** on recalculation (for example, because fewer rows of data now satisfy a condition), the cells that are no longer part of the range are automatically cleared.

When you call `SetValue()` on a cell that is currently a spill cell, the write is allowed. On the next recalculation, the anchor detects the block and transitions to `#SPILL!`.

## Inspecting the Spill State of a Worksheet

Every `Worksheet` exposes a `WorksheetSpillState` property that provides access to all spill ranges in that worksheet.

**Example 1: Enumerate all spill ranges in a worksheet**

<snippet id='libraries-spreadprocessing-features-formulas-dyamicarrayformulas-enumerateworksheetspillranges'/>

## SpillRange and SpillRangeState

The `SpillRange` class describes a single dynamic array formula and its current spill area. It exposes the following members:

| Member | Type | Description |
|---|---|---|
| `AnchorIndex` | `CellIndex` | The cell that contains the array formula producing the spill. |
| `ActiveCellRange` | `CellRange` | The rectangular range currently occupied by the spill, including the anchor cell. |
| `State` | `SpillRangeState` | The current state of the spill range. |

The `SpillRangeState` enumeration has four values:

| Value | Description |
|---|---|
| `Active` | The formula has spilled its values into the neighboring cells. |
| `Blocked` | The target range contains a cell that the formula does not own. The anchor cell returns `#SPILL!`. |
| `Inactive` | The spill range has just been created and has not yet written any values. |
| `Dormant` | The spill range is dormant. A later expression update may cause it to become `Active` again. |

**Example 2: Check whether a specific cell is blocked**

<snippet id='libraries-spreadprocessing-features-formulas-dyamicarrayformulas-checkcellisblocked'/>

## Dynamic Array Operators

Two new unary operators extend the formula language to work with dynamic arrays:

### `@`: Implicit Intersection Operator

The `@` (at sign) operator is a **unary prefix operator** with the highest precedence. It resolves an array or range expression to a **single value** based on the row and column position of the formula cell. This matches Excel's implicit intersection behavior for compatibility with pre-dynamic-array formulas.

For **range** arguments (e.g. `=@A1:A10` in cell B3), the operator returns the element that intersects the formula cell's row or column, in this example, A3.

For **non-range (computed or literal) arrays** (e.g. `=@{10;20;30}`), the `@` operator always returns the **first element** (`10`) regardless of the formula cell's position.

In the XLSX format, the implicit intersection operator is stored as `_xlfn.SINGLE(inner)`.

### `#`: Spill Range Operator

The `#` (hash) operator is a **postfix operator** that follows a cell reference. It resolves to the **entire spill range** owned by the anchor cell at that reference. For example, `=SUM(A1#)` sums all values in the spill range that starts at A1.

If the referenced cell is not the anchor of a spill range, or if the operand is a multi-cell range reference or a union, the operator returns a `#REF!` error.

In the XLSX format, the spill range operator is stored as `_xlfn.ANCHORARRAY(inner)`.

**Example 3: Using the `#` operator in a formula**

<snippet id='libraries-spreadprocessing-features-formulas-dyamicarrayformulas-usingspillrangeoperator'/>

The following table summarizes both operators:

| Operator | Syntax | Description | XLSX representation |
|---|---|---|---|
| `@` | `@expression` | Implicit intersection: returns a single value from a range (based on formula cell position) or the first element of a non-range array. | `_xlfn.SINGLE(inner)` |
| `#` | `cellRef#` | Spill range: resolves to the entire spill range of the anchor cell. Returns `#REF!` for multi-cell references, unions, or non-anchor cells. | `_xlfn.ANCHORARRAY(inner)` |

## Custom Functions and Array Lifting

When you create a custom function by inheriting from `FunctionBase`, you can control how the function behaves when one of its arguments is an array:

### `LiftsOverArrays`

Override the `LiftsOverArrays` property and return `true` to make the `FunctionBase` infrastructure automatically evaluate your function **element-wise** over any multi-element array argument. The results are collected into an array that is then spilled by the formula engine.

Use this for pure scalar functions where applying the function pointwise matches the expected dynamic-array behavior. For example, a custom `DOUBLE` function that multiplies a number by two would naturally lift: `=DOUBLE({1;2;3})` would return `{2;4;6}` and spill into three cells.

<snippet id='libraries-spreadprocessing-features-formulas-dyamicarrayformulas-liftsoverarrays'/>

### `IsSpillingArgument`

Override `IsSpillingArgument(int argumentIndex, RadExpression argument)` to control which arguments can cause the function to produce a multi-element array result. The default implementation returns `true` for arguments that can potentially produce a multi-element array (such as range references), and `false` for scalar constants. Override this method when only specific arguments drive spilling and others should always be treated as scalars:

<snippet id='libraries-spread-features-customfunctions-isspillingargument'/>

For a full guide on creating custom functions, see [Custom Functions]({%slug radspreadprocessing-features-formulas-custom-functions%}).

## New Error Values

Two new error values are introduced together with dynamic array support:

| Error | Constant | Description |
|---|---|---|
| `#SPILL!` | `ErrorExpressions.SpillError` | The array formula cannot spill because one or more target cells are blocked by non-empty content that the formula does not own. |
| `#CALC!` | `ErrorExpressions.CalcError` | The calculation engine cannot determine the result size, for example because the dimensions are infinite or unbounded. |

Both error values behave like the existing errors in `ErrorExpressions` and can appear as the result value of a `FormulaCellValue`. For the full list of errors, see [Errors]({%slug radspreadprocessing-features-formulas-errors%}).

## Import and Export (XLSX)

SpreadProcessing reads and writes the OOXML attributes that represent dynamic array formulas:

* The `t="array"` attribute on the `<f>` element marks a formula as an array formula.
* The `ref` attribute on `<f>` specifies the anchor cell of the array formula.
* The `cm` attribute on `<c>` elements stores cell metadata index values used for dynamic arrays.
* The cell metadata records that `cm` points to are round-tripped without data loss.

When you import an XLSX file that was saved by Excel with dynamic array formulas, SpreadProcessing preserves the full formula structure, including spill ownership information, and recalculates spill ranges on the next calculation pass.

## Limits

The `SpreadsheetDefaultValues.MaxSpillCellCount` constant defines the maximum number of cells a dynamic array formula is allowed to spill into. If a formula result exceeds this limit, the anchor cell returns a `#SPILL!` error.

The value of `MaxSpillCellCount` is **1,048,576 cells**, the maximum number of rows in a worksheet (one full column).

## See Also

* [Formulas: General Information]({%slug radspreadprocessing-features-formulas-general-information%})
* [Operators]({%slug radspreadprocessing-features-formulas-operators%})
* [Errors]({%slug radspreadprocessing-features-formulas-errors%})
* [Custom Functions]({%slug radspreadprocessing-features-formulas-custom-functions%})
* [Functions]({%slug radspreadprocessing-features-formulas-functions%})
* [What Is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
