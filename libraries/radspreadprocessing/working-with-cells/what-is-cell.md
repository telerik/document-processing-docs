---
title: What Is a Cell?
description: Learn what a cell represents in a RadSpreadProcessing worksheet, how it is addressed, and which cell tasks to use next.
page_title: What Is a Cell in RadSpreadProcessing Worksheets
slug: radspreadprocessing-working-with-cells-what-is-cell
tags: cells, spreadsheet, radspreadprocessing, worksheet, model, concept, structure, properties, xlsx, spread
published: True
position: 0
---

# What Is a Cell?

Use this article to understand what a cell represents in a RadSpreadProcessing worksheet. It explains how cell addresses work, what a cell can contain, and which related articles to use for common cell tasks.

## Cell Addresses

A cell is the smallest addressable data unit in a worksheet. It sits at the intersection of one row and one column, so every cell has a unique address.

The address combines the column letters and the row number:

| Address | Meaning |
|---|---|
| `A1` | The cell in the first column and first row |
| `C5` | The cell in the third column and fifth row |
| `XFD1048576` | The last address in an Excel-compatible worksheet |

When you work with the document model, you also use `CellIndex` to identify a single cell and `CellRange` to identify a rectangular group of cells.

## Cell Content and Formatting

A cell can store both data and the formatting that controls how that data appears.

Cells can contain the following information:

* Text, numbers, Boolean values, dates, and formulas. For details about supported value types, see [cell value types in RadSpreadProcessing]({%slug radspreadprocessing-working-with-cells-cell-value-types%}).
* Fonts, font sizes, foreground colors, background colors, borders, alignment, indentation, and rotation.
* Pattern fills and gradient fills that affect the visual appearance of the cell.
* Text wrapping that displays long content on multiple lines inside the same cell.

## Cell Access in Code

In RadSpreadProcessing, you usually do not manipulate a cell through a standalone cell object. Instead, you create a `CellSelection` that points to one cell or a cell range, and then call the appropriate APIs on that selection.

>note
>
> Use `CellSelection` even when you work with a single cell. Most value, formatting, and copy operations are exposed through the selection API.

To learn how to create a `CellSelection`, see [access cells in a worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}). To learn how to update values and formatting, see [get, set, and clear cell properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}).

## Common Cell Operations

After you select a cell or a cell range, you can perform these common tasks:

* Read, set, or clear cell values.
* Apply number formats, fonts, fills, borders, alignment, and text wrapping.
* Copy and paste data or formatting by using [clipboard support for worksheet cells]({%slug radspreadprocessing-features-clipboard-support%}).
* Fill neighboring cells automatically by using [automatic fill for repeated and series-based values]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%}).
* Merge adjacent cells or split them again by using [merge and unmerge worksheet cells]({%slug radspreadprocessing-features-merge-unmerge-cells%}).

## Next Steps

Use the article that matches your next task:

* [Access cells in a worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) to create `CellSelection` objects.
* [Review cell value types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) to understand how the `Value` property stores data.
* [Get, set, and clear cell properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) to update values, formats, and styling.
* [Insert and remove cells]({%slug radspreadprocessing-working-with-cells-insert-remove-cells%}) to change worksheet layout.
* [Iterate through used cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%}) to inspect populated worksheet content.

## See Also

* [Access cells in a worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Review cell value types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [Get, set, and clear cell properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})

