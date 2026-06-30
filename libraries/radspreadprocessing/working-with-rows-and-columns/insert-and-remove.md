---
title: Insert and Remove Rows and Columns
description: Learn how to insert and remove rows and columns in RadSpreadProcessing worksheets by shifting surrounding content.
page_title: Insert and Remove Rows and Columns
slug: radspreadprocessing-working-with-rows-and-columns-insert-and-remove
tags: rows, columns, spreadsheet, radspreadprocessing, insert, remove, worksheet, shift, xlsx, spread
published: True
position: 1
---

# Insert and Remove Rows and Columns



Worksheets in the RadSpreadProcessing document model consist of cells organized in rows and columns. Each worksheet allows you to insert and remove rows and columns through shifting the contents of the surrounding rows and columns. The following sections show how to insert and remove rows and columns.
      

* [Insert Rows](#insert-rows)

* [Remove Rows](#remove-rows)

* [Insert Columns](#insert-columns)

* [Remove Columns](#remove-columns)

## Insert Rows

To insert rows, create a `RowSelection` instance that indicates where the new rows are to be inserted in the worksheet. When row insertion is performed, all values that appear below the `RowSelection` region including the selected region are shifted down, causing no loss of data.
        

The `RowSelection` class exposes `CanInsert()` and `Insert()` methods that indicate whether the insert is possible and perform the insert operation respectively. **Example 1** shows how to insert rows using the two methods.
        

**Example 1: Insert Rows**

<snippet id='libraries-spread-working-with-rows-and-columns-insert-and-remove-1'/>



## Remove Rows

To remove rows, create a `RowSelection` instance that specifies the region of rows you want to remove. When you remove rows, all values that appear below the `RowSelection` region are shifted up.
        

The `RowSelection` class exposes a `Remove()` method that performs the removal of the selected rows. **Example 2** shows how to remove rows.
        

**Example 2: Remove Rows**

<snippet id='libraries-spread-working-with-rows-and-columns-insert-and-remove-2'/>



## Insert Columns

To insert columns, create a `ColumnSelection` instance that specifies where the new columns are to be inserted in the worksheet. When column insertion is performed, all values that appear to the right of the `ColumnSelection` region including the selected region are shifted right, causing no loss of data.
        

The `ColumnSelection` class exposes `CanInsert()` and `Insert()` methods that indicate whether the insert is possible and perform the insert operation respectively. **Example 3** shows how to insert columns using the two methods.
        

**Example 3: Insert Columns**

<snippet id='libraries-spread-working-with-rows-and-columns-insert-and-remove-3'/>



## Remove Columns

To remove columns, create a `ColumnSelection` instance that indicates the region of columns you want to remove. When you remove columns, all values that appear to the right of the `ColumnSelection` region are shifted to the left.
        

The `ColumnSelection` class exposes a `Remove()` method that executes the removal of the selected columns. **Example 4** shows how to remove columns.
        

**Example 4: Remove Columns**

<snippet id='libraries-spread-working-with-rows-and-columns-insert-and-remove-4'/>

## See Also

* [Repeat Values]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%})
* [Insert and Remove Cells]({%slug radspreadprocessing-working-with-cells-insert-remove-cells%})



