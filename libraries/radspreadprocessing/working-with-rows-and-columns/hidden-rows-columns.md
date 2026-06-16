---
title: Hidden Rows and Columns
description: Learn how to hide and show rows and columns in RadSpreadProcessing worksheets and understand the relationship with height and width properties.
page_title: Hidden Rows and Columns
slug: radspreadprocessing-working-with-rows-and-columns-hiding
tags: hidden, rows, columns, spreadsheet, radspreadprocessing, visibility, worksheet, display, xlsx, spread
published: True
position: 3
---

# Hidden Rows and Columns


The API of the workbook model allows you to set the hidden state of each row or column. The following sections describe how to get, set, and clear the hidden state:


* [Get, Set and Clear the Hidden State](#get-set-and-clear-the-hidden-state)

* [Relationship with the Height and Width Properties](#relationship-with-the-height-and-width-properties)

* [Relationship with the AutoFit Method](#relationship-with-the-autoFit-method)


## Get, Set and Clear the Hidden State

To set the hidden state of the rows or columns, create a `RowSelection` or a `ColumnSelection` instance from the rows or columns you want to manipulate. This instance exposes the `GetHidden()`, `SetHidden()`, and `ClearHidden()` methods that you can use to change the hidden state of the selection.

The `GetHidden()` method returns a `RangePropertyValue` instance which summarizes the information about the hidden state of all selected rows or columns. The object exposes two properties:

* **IsIndeterminate**: Indicates whether the hidden state is consistent among all rows or columns in the selection. If all rows or columns have one and the same hidden state, `IsIndeterminate` is set to `false`. However, if the hidden state varies, the `IsIndeterminate` property is set to `true` and the `Value` property of the `RangePropertyValue` class returns the default value of the hidden state, which is `false`.  

* **Value**: Holds the actual hidden state. If the `IsIndeterminate` property is set to `false`, `Value` contains the hidden state shared by the entire region. If the `IsIndeterminate` property is set to `true`, this indicates that the state is not the same for all rows or columns in the selection and the `Value` property is set to its default value.

The `SetHidden()` method changes the hidden state of the rows and columns. It takes an argument of type `bool` which specifies the new state. The `ClearHidden()` method resets the hidden state of the selected rows or columns to the default.

**Example 1** shows how to get and change the hidden state of several rows using the `RowSelection` class. The code checks if all the rows in the selection are visible and only then hides them. If the selection contains any hidden rows, the hidden state is cleared which makes all rows visible.

**Example 1: Change Row Hidden State**

<snippet id='codeblock-crj'/>


## Relationship with the Height and Width Properties

When the hidden state property of a `RowSelection` or a `ColumnSelection` is set, this does not affect [the height or width properties]({%slug radspreadprocessing-working-with-rows-and-columns-resizing%}). The opposite is also true. If the height or width of a row or column is set to zero, this does not change its hidden state in the model.

**Example 2** shows how you can set the width of a group of columns without affecting the hidden state.

**Example 2: Change Column Width**

<snippet id='codeblock-crk'/>

## Relationship with the AutoFit Method

Like setting the height or width through the `SetHeight()` and `SetWidth()` methods, using the [Auto Fit methods]({%slug radspreadprocessing-working-with-rows-and-columns-resizing%}) does not affect the hidden state of the rows or columns. It does, however, affect the underlying height and width.

**Example 3** demonstrates this by hiding a row, autofitting it, and then checking its hidden state.

**Example 3: Auto Fit on Hidden Rows**

<snippet id='codeblock-crl'/>


## See Also

* [Resizing Rows and Columns]({%slug radspreadprocessing-working-with-rows-and-columns-resizing%})
* [ColumnSelection API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.ColumnSelection.html)
* [RowSelection API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.RowSelection.html)