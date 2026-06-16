---
title: What is a Worksheet?
description: Learn what a worksheet is in RadSpreadProcessing, how it fits in a workbook, and what features it provides for organizing spreadsheet data.
page_title: What is a Worksheet?
slug: radspreadprocessing-working-with-worksheets-what-is-worksheet
tags: worksheet, spreadsheet, radspreadprocessing, model, concept, excel, structure, workbook
published: True
position: 0
---

# What is a Worksheet?

A worksheet is a type of `Sheet` and the primary working surface in a `Workbook`. It organizes data in a grid of rows and columns, where each intersection forms a cell. A workbook can contain multiple worksheets with related content, and only one worksheet is active at a time.

>note In [SpreadProcessing]({%slug radspreadprocessing-overview%}), `Worksheet` is the only type of `Sheet` currently supported.

## Worksheet Dimensions

Each worksheet provides a grid of **1,048,576 rows** and **16,384 columns**, matching the capacity of an Excel worksheet. Rows are identified by zero-based numeric indexes and columns by zero-based column indexes. In the spreadsheet UI, rows are labeled with numbers (1, 2, 3, ...) and columns with letters (A, B, C, ..., XFD).

## Key Features

The following list summarizes the main features that a worksheet exposes:

* **Cells**: Each worksheet contains a large number of cells that can hold values and formatting options. The `Cells` property lets you insert, manipulate, and delete cells. For more information, refer to the article on [what a cell is]({%slug radspreadprocessing-working-with-cells-what-is-cell%}).

* **Rows and Columns**: Cells are organized in rows and columns. The worksheet API lets you insert, manipulate, and delete rows and columns, and adjust their height and width. For more information, refer to the article on [working with rows and columns]({%slug radspreadprocessing-working-with-rows-and-columns-what-is-row-column%}).

* **Named Ranges**: The `Worksheet` class exposes a `Names` property of type `NameCollection` that lets you create, update, and manage named ranges. For more information, refer to the [Names]({%slug radspreadprocessing-features-named-ranges%}) article.

* **Used Cell Range**: The `UsedCellRange` property returns the smallest cell range that starts from A1 and contains all cells with data or formatting. The `GetUsedCellRange()` method accepts an `IEnumerable<`[`IPropertyDefinition`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.IPropertyDefinition-1.html)`>` parameter and narrows the result to cells with specific property definitions.

  The following example demonstrates how to get the used cell range of cells with a value.

  **Example 1: Get the Used Cell Range of Cells with a Value**

  <snippet id='codeblock-csz'/>

  >note For more information and examples, refer to the article on [iterating used cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%}).

* **Hyperlinks**: Each worksheet can contain hyperlinks to web pages, specific cells in the workbook, or email addresses. For more information, refer to the [Hyperlinks]({%slug radspreadprocessing-features-hyperlink%}) article.

* **Find and Replace**: You can search for and replace text and numbers in the content of a worksheet. For more information, refer to the [Find and Replace]({%slug radspreadprocessing-features-find-and-replace%}) article.

* **Protection**: You can restrict users from modifying the content and structure of a worksheet. When protection is enabled, users can only edit cells explicitly marked as unlocked. You can also control which options remain available when protection is active. For more information, refer to the [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%}) article.

* **View State**: Each worksheet provides properties for controlling how it is displayed, including frozen rows and columns, the active cell, the current selection, and the zoom level. For more information, refer to the [View State]({%slug radspreadprocessing-working-with-worksheets-view-state%}) article.

* **Visibility**: Worksheets can be hidden from view without being removed from the workbook. For more information, refer to the [Sheets Visibility]({%slug radspreadprocessing-working-with-worksheets-sheets-visibility%}) article.

## See Also

* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
* [Working with Rows and Columns]({%slug radspreadprocessing-working-with-rows-and-columns-what-is-row-column%})
* [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%})
* [Named Ranges]({%slug radspreadprocessing-features-named-ranges%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
* [View State]({%slug radspreadprocessing-working-with-worksheets-view-state%})

*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.*
