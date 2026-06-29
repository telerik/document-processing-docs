---
title: What is a Cell?
description: Learn how RadSpreadProcessing models worksheet cells, what data and formatting each cell stores, and which cell APIs to use next.
page_title: RadSpreadProcessing Worksheet Cell Overview
slug: radspreadprocessing-working-with-cells-what-is-cell
tags: cells, spreadsheet, radspreadprocessing, worksheet, model, concept, structure, properties, xlsx, spread
published: True
position: 0
---

# What is a Cell?

A cell is the smallest addressable unit in a RadSpreadProcessing worksheet. Use this article to understand how cells are identified, what information they store, and which related APIs and articles help you start working with them.

## Cell Addresses

A worksheet organizes cells into rows and columns. Each cell sits at the intersection of one row and one column and has a unique address in A1 notation.

For example, `A1` identifies the top-left cell in the worksheet, while `XFD1048576` identifies the last possible cell in an Excel-compatible worksheet. These addresses are useful when you read formulas, reason about ranges, or follow examples elsewhere in the documentation.

When you need to work with a single cell or a range of cells in code, continue with [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}).

## Cell Content and Properties

A cell can hold both data and the settings that control how that data appears. In practice, a cell commonly includes the following parts:

* Value data such as text, numbers, Boolean values, dates, or formulas.
* Formatting such as fonts, number formats, foreground and background colors, bold, italic, and underline.
* Layout settings such as horizontal and vertical alignment, text wrapping, indentation, and text rotation.
* Border and fill settings that control how the cell is outlined and shaded.

Cells can start empty and still carry formatting or other properties. When a cell contains a formula, the stored formula text and the displayed result are not always the same value. For details about supported value types and how the `Value` property behaves, see [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}).

## Cell Behavior in a Worksheet

Cells participate in worksheet operations that affect one cell, many cells, or an entire range. The most common behaviors include:

* Copying and pasting data, formulas, formatting, or column widths. For more information, see [Clipboard Support]({%slug radspreadprocessing-features-clipboard-support%}).
* Filling neighboring cells automatically with repeated, linear, exponential, date-based, or autofill series. For more information, see [Fill Data Automatically]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%}).
* Merging adjacent cells into a single visual region and unmerging them later. For more information, see [Merge and Unmerge Cells]({%slug radspreadprocessing-features-merge-unmerge-cells%}).
* Reading, setting, and clearing properties through `CellSelection`, which is the main API surface for working with one cell or many cells together.

This behavior matters because many RadSpreadProcessing APIs work with selections and ranges rather than with a standalone cell object. If your next task is to read or update content, formatting, or other properties, start with [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}).

## Next Articles for Common Tasks

Use the following table to move from the concept of a cell to the task you want to complete next.

| If you want to... | Read this next |
|---|---|
| Access a single cell or cell range | [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) |
| Understand supported data types and formulas | [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) |
| Read or update formatting and other properties | [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) |
| Populate neighboring cells automatically | [Fill Data Automatically]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%}) |
| Merge or unmerge a cell region | [Merge and Unmerge Cells]({%slug radspreadprocessing-features-merge-unmerge-cells%}) |

## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Clipboard Support]({%slug radspreadprocessing-features-clipboard-support%})

