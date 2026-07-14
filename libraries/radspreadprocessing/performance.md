---
title: Performance Tips and Tricks
description: Tips and best practices for maximizing the performance of RadSpreadProcessing when working with large amounts of spreadsheet data.
page_title: Performance Tips and Tricks
slug: radspreadprocessing-performance
tags: performance, spread, processing, spreadsheet, optimization, tips, memory, large, workbook, excel, xlsx
published: True
position: 10
---

# Performance Tips and Tricks

`RadSpreadProcessing` allows you to prepare and modify tabular data. Even though the library was built with performance in mind, working with large amounts of data slows it down. The following tips help you get the most from the component in terms of performance.

* [Reduce Layout Updates Frequency](#reduce-layout-updates-frequency)

* [Reduce the Number of Undo Steps](#reduce-the-number-of-undo-steps)

* [Disabling History](#disabling-history)

* [Apply Values or Formatting on Large Range at Once](#apply-values-or-formatting-on-large-range-at-once)

* [Avoid Using the Additional Calculations Options Provided by the Shapes and Images](#avoid-using-the-additional-calculations-options-provided-by-the-shapes-and-images)

* [Avoid Cell Value Type Parsing](#avoid-cell-value-type-parsing)

## Reduce Layout Updates Frequency

Calculating the layout is an operation that computes the width of each column, the height of each row, the size of the text contained in the cells, and many other elements used for positioning the UI. The layout update triggers each time a property changes and is a fairly heavy operation.

Internally there are many mechanisms used to lower the number of calculations, but sometimes they are not enough. For example, if you want to generate a document and then show it, you do not need to trigger any layout updates other than the one after you finish creating the document. The following code snippet suspends layout updates during document generation and resumes them afterward.

**Example 1: Suspend layout updates during document generation**

<snippet id='codeblock-cfv'/>

If an exception is thrown between the two method calls, the resuming of the layout update will not execute and the UI will stop updating. You can ensure the layout update resumes regardless of exceptions by using `UpdateScope`. The following code snippet shows this approach.

**Example 2: Suspend layout updates with UpdateScope**

<snippet id='codeblock-cfw'/>

## Reduce the Number of Undo Steps

Preserving information about the steps in the undo stack is usually not a time consuming operation, but even the lightest operation performed thousands of times may slow down your application. If you do not need to preserve each step in the document generation process as a separate undo step, you can combine a series of actions into one undo step. For example, if you want to set background color to the even rows in your table, you have to set the fill for each row separately. This way each background setting is preserved as a separate undo step. The following code combines those actions into a single undo group.

**Example 3: Combine multiple changes in one undo group**

<snippet id='codeblock-cfx'/>

If an exception is thrown between the two method calls, the ending of the undo group will not execute. All the following actions will not be added to the history and the UI will stop updating. You can ensure the undo group closes regardless of exceptions by using `UpdateScope`. The following code snippet shows how to do that.

**Example 4: Combine undo operations with UpdateScope**

<snippet id='codeblock-cfy'/>

## Disabling History

As described in the [Reduce the Number of Undo Steps section](#reduce-the-number-of-undo-steps), preserving the history steps can lower the performance of `RadSpreadProcessing`. If you do not want to preserve History while generating your document, you can turn the feature off. The following example toggles the `IsEnabled` Boolean property of the history.

**Example 5: Disable history while generating a workbook**

<snippet id='codeblock-cfz'/>

If an exception is thrown before enabling the history, it will not be enabled and the subsequent history steps will not be preserved. To ensure that the history is enabled, use the `UpdateScope` class. The following example shows how to achieve this.

**Example 6: Disable and restore history with UpdateScope**

<snippet id='codeblock-cga'/>

## Apply Values or Formatting on Large Range at Once

Setting the same values to thousands of cells one by one takes more time than setting the same values to an entire cell range. Create a `CellRange` using the row and column indices of the start and end cells.

`public CellRange(int fromRowIndex, int fromColumnIndex, int toRowIndex, int toColumnIndex)`

## Avoid Using the Additional Calculations Options Provided by the Shapes and Images

When setting the properties of an image you have created, keep in mind that some of the members may cause recalculation of other properties to make the images more convenient to use in a UI context. You can read more about what calculations are performed in the [Shapes and Images]({%slug radspreadprocessing-features-shapes-and-images%}) article. If you are generating a document from scratch, the recalculation of other properties will most likely be an unnecessary burden for your application. In this case, use the properties of the shape classes:

* `Width`

* `Height`

* `RotationAngle`

Avoid using the methods for setting the same properties with the `adjustCellIndex` parameter set to `true`:

* `SetWidth()`

* `SetHeight()`

* `SetRotationAngle()`

## Avoid Cell Value Type Parsing

When setting values to cells, the cell value type is determined by an internal parsing mechanism. If you are sure what cell value type the passed value must produce, set it specifically. This bypasses the parsing and increases the performance of the application.

The easiest way to achieve this is by using the `SetValue()` overload with the respective CLR type (`DateTime`, `Double`, and others) or in the case of formula value type and text value type, the `SetValueAsFormula()` and `SetValueAsText()` methods respectively.

More information about cell value types is available in the [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) article.

## See Also

* [History]({%slug radspreadprocessing-features-history%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Shapes and Images]({%slug radspreadprocessing-features-shapes-and-images%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [Splitting Worksheet Sections into Separate Sheets with a Hybrid Approach]({%slug split-worksheet-sections-hybrid-spreadprocessing-spreadstreamprocessing%})
