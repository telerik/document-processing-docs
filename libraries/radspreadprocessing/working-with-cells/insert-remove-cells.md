---
title: Insert and Remove Cells
description: Learn how to insert and remove cells in RadSpreadProcessing worksheets by shifting surrounding cell contents.
page_title: Insert and Remove Cells
slug: radspreadprocessing-working-with-cells-insert-remove-cells
tags: cells, spreadsheet, radspreadprocessing, insert, remove, shift, worksheet, range, xlsx, spread
published: True
position: 1
---

# Insert and Remove Cells



Worksheets in the document model consist of cells organized in rows and columns. Each worksheet allows you to insert and remove cells through shifting the contents of the surrounding cells in a specified direction.

* [Insert Cells](#insert-cells)
* [Remove Cells](#remove-cells)

## Insert Cells

To insert cells, create a `CellSelection` instance that indicates where the new cells are to be inserted in the worksheet. Also, specify the direction of the shift.

When you perform a cell insertion, all values that appear to the right or below the `CellSelection` region including the selected region are shifted. There are two shift directions: right and down. When you choose to shift cells to the right, all cells that appear to the right of the selected region including the selected region are shifted, causing no loss of data. Similarly, choosing to shift the values down moves all values in the selected region columns downwards and expands the `UsedCellRange`.

The `CellSelection` class exposes an `Insert()` method that takes one argument which indicates the direction of the shift. Also, the class offers a `CanInsertOrRemove()` method that determines if the insertion is possible. **Example 1** shows how to insert cells using these methods.

**Example 1: Insert Cells**

<snippet id='libraries-spread-working-with-cells-insert-remove-cells-1'/>

## Remove Cells

To remove cells, create a `CellSelection` object that indicates the region of cells you want to remove. Also, specify the direction of the shift.

When you remove cells, all values that appear to the right or below the `CellSelection` region are shifted. There are two shift directions: left and up. When you choose to shift cells to the left, all cells that appear to the right of the selected region are shifted to the left. Similarly, choosing to shift the values up moves all values in the selected region columns upwards.

The `CellSelection` class exposes a `Remove()` method that takes one argument which indicates the direction of the shift. The class also offers a `CanInsertOrRemove()` method that determines if the removal is possible. **Example 2** shows how to remove cells using these methods.

**Example 2: Remove Cells**

<snippet id='libraries-spread-working-with-cells-insert-remove-cells-2'/>


