---
title: Performance Tips and Tricks
description: Improve RadSpreadProcessing performance by using recommended practices for layout updates, history, range operations, images, and cell values in large workbooks.
page_title: Performance Tips and Tricks
slug: radspreadprocessing-performance
tags: performance, spread, processing, spreadsheet, optimization, tips, memory, large, workbook, excel, xlsx
published: True
position: 10
---

# Performance Tips and Tricks

`RadSpreadProcessing` lets you prepare and modify tabular data. The library is optimized for performance, but large datasets can still slow workbook operations. The following tips help you improve speed and lower resource use.

Use the following techniques when you work with large workbooks:

* [Reduce Layout Updates Frequency](#reduce-layout-updates-frequency)
* [Reduce the Number of Undo Steps](#reduce-the-number-of-undo-steps)
* [Disabling History](#disabling-history)
* [Apply Values or Formatting on Large Range at Once](#apply-values-or-formatting-on-large-range-at-once)
* [Avoid Using the Additional Calculations Options Provided by the Shapes and Images](#avoid-using-the-additional-calculations-options-provided-by-the-shapes-and-images)
* [Avoid Cell Value Type Parsing](#avoid-cell-value-type-parsing)

## Reduce Layout Updates Frequency

Layout calculation determines column widths, row heights, text size, and other values that affect document layout. A layout update runs after each property change, and it can be expensive.

`RadSpreadProcessing` reduces layout recalculations internally, but large batch updates can still trigger extra work. If you generate a document before you display or export it, suspend layout updates until the batch operation ends. The following code snippet shows this approach.

**Example 1: Suspend layout updates during document generation**

<snippet id='codeblock-cfv'/>

If an exception occurs between the two method calls, `ResumeLayoutUpdate()` will not run. Use `UpdateScope` to make sure layout updates resume even when an exception occurs.

**Example 2: Suspend layout updates with UpdateScope**

<snippet id='codeblock-cfw'/>

## Reduce the Number of Undo Steps

Tracking undo steps is usually inexpensive, but repeated operations can still affect performance. If you do not need each change as a separate undo action, group related changes into one undo step. For example, when you set a background color for all even rows, you can save all changes in a single undo group.

**Example 3: Combine multiple changes in one undo group**

<snippet id='codeblock-cfx'/>

If an exception occurs between the two method calls, `EndUndoGroup()` will not run. Use `UpdateScope` to make sure the undo group closes correctly.

**Example 4: Combine undo operations with UpdateScope**

<snippet id='codeblock-cfy'/>

## Disabling History

As described in [Reduce the Number of Undo Steps](#reduce-the-number-of-undo-steps), history tracking can lower performance in large-generation scenarios. If you do not need history while you generate a document, turn it off temporarily. The following example toggles the `IsEnabled` Boolean property.

**Example 5: Disable history while generating a workbook**

<snippet id='codeblock-cfz'/>

If an exception occurs before you enable history again, later changes will not be recorded. Use `UpdateScope` to restore the previous state reliably.

**Example 6: Disable and restore history with UpdateScope**

<snippet id='codeblock-cga'/>

## Apply Values or Formatting on Large Range at Once

Applying the same value or formatting to thousands of cells one by one takes more time than updating a full range. Create a `CellRange` by using the row and column indexes of the start and end cells through the `CellRange(int fromRowIndex, int fromColumnIndex, int toRowIndex, int toColumnIndex)` constructor.

## Avoid Using the Additional Calculations Options Provided by the Shapes and Images

When you set properties on an image, some members recalculate other values to improve UI-oriented behavior. For details, see [how shapes and images work]({%slug radspreadprocessing-features-shapes-and-images%}). If you generate a document from scratch, these extra calculations are usually unnecessary. In this case, use the following properties of the shape classes:

* `Width`

* `Height`

* `RotationAngle`

Avoid the following methods when the `adjustCellIndex` parameter is `true`:

* `SetWidth()`

* `SetHeight()`

* `SetRotationAngle()`

## Avoid Cell Value Type Parsing

When you set a value in a cell, an internal parser determines the cell value type. If you already know the target type, set it explicitly. This bypasses parsing and improves performance.

The easiest way to do this is to use a `SetValue()` overload with the matching CLR type, such as `DateTime` or `double`. For formulas and text values, use `SetValueAsFormula()` and `SetValueAsText()`.

For more information, see [how cell value types work]({%slug radspreadprocessing-working-with-cells-cell-value-types%}).

## See Also

* [Workbook History]({%slug radspreadprocessing-features-history%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Shapes and Images]({%slug radspreadprocessing-features-shapes-and-images%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [Splitting Worksheet Sections into Separate Sheets with a Hybrid Approach]({%slug split-worksheet-sections-hybrid-spreadprocessing-spreadstreamprocessing%})
