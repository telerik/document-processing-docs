---
title: What Is a Worksheet?
description: Learn what a worksheet is in RadSpreadProcessing, how it fits in a workbook, and which worksheet features you use to organize spreadsheet data.
page_title: What Is a Worksheet in RadSpreadProcessing?
slug: radspreadprocessing-working-with-worksheets-what-is-worksheet
tags: worksheet, spreadsheet, radspreadprocessing, model, concept, excel, structure, workbook
published: True
position: 0
---

# What is a Worksheet?

A worksheet is a type of `Sheet` and the primary working surface in a `Workbook`. It organizes data in a grid of rows and columns, where each intersection forms a cell. A workbook can contain multiple worksheets with related content, and only one worksheet is active at a time.

Use a worksheet when you need to store values, formulas, formatting, hyperlinks, named ranges, and worksheet-specific view settings inside a spreadsheet document.

>note
>
> In [SpreadProcessing]({%slug radspreadprocessing-overview%}), `Worksheet` is the only `Sheet` type that is currently supported.

## How a Worksheet Fits in a Workbook

A `Workbook` acts as the container for one or more worksheets. Each worksheet holds its own grid data, formatting, names, protection settings, and view state. This structure lets you separate related information into multiple tabs while keeping the content in a single spreadsheet document.

## Worksheet Dimensions

Each worksheet provides a grid of **1,048,576 rows** and **16,384 columns**, which matches the capacity of an Excel worksheet. Rows use zero-based numeric indexes, and columns use zero-based column indexes. In a spreadsheet UI, rows are labeled with numbers and columns are labeled with letters from `A` through `XFD`.

## Key Features

The following table summarizes the main tasks that you can perform on a worksheet:

| Area | What You Can Do | Learn More |
|---|---|---|
| Cells | Insert, update, format, and delete cell content through the `Cells` property. | [What Is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%}) |
| Rows and columns | Insert, remove, resize, and manage worksheet structure. | [Working with Rows and Columns]({%slug radspreadprocessing-working-with-rows-and-columns-what-is-row-column%}) |
| Named ranges | Create and manage named ranges through the `Names` property. | [Named Ranges]({%slug radspreadprocessing-features-named-ranges%}) |
| Hyperlinks | Add links to web pages, workbook locations, or email addresses. | [Hyperlinks]({%slug radspreadprocessing-features-hyperlink%}) |
| Find and replace | Search for and replace text or numbers in worksheet content. | [Find and Replace]({%slug radspreadprocessing-features-find-and-replace%}) |
| Protection | Restrict editing and control which actions remain available. | [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%}) |
| View state | Control frozen panes, active cell, selection, and zoom. | [View State]({%slug radspreadprocessing-working-with-worksheets-view-state%}) |
| Visibility | Hide worksheets without removing them from the workbook. | [Sheets Visibility]({%slug radspreadprocessing-working-with-worksheets-sheets-visibility%}) |

Each worksheet also exposes several features that help you organize and query spreadsheet content:

* **Cells**: Each worksheet contains cells that hold values, formulas, and formatting.
* **Rows and columns**: Worksheet structure is organized into rows and columns that you can resize, insert, remove, and format.
* **Named ranges**: The `Names` property exposes a `NameCollection` that lets you define reusable worksheet references.
* **Hyperlinks**: A worksheet can contain links to websites, workbook locations, and email addresses.
* **Find and replace**: You can search worksheet content and replace matching values.
* **Protection**: You can prevent unwanted edits while leaving selected cells unlocked.
* **View state**: You can control worksheet-specific display settings such as the active cell, selection, frozen panes, and zoom.
* **Visibility**: You can hide a worksheet without deleting it from the workbook.

## How to Get the Used Cell Range

Use the `UsedCellRange` property when you need the smallest range that starts at `A1` and contains all cells with data or formatting. Use `GetUsedCellRange()` when you want to narrow the result to cells that match specific property definitions.

The `GetUsedCellRange()` overload accepts an `IEnumerable<`[`IPropertyDefinition`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.IPropertyDefinition-1.html)`>` parameter and returns only the used cells for those definitions.

The following example gets the used cell range for cells that contain a value.

#### Example 1: Get the Used Cell Range of Cells with a Value

<snippet id='libraries-spread-working-with-worksheets-what-is-worksheet'/>

>note
>
> For more information and additional examples, see [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%}).

## Next Steps

After you understand the role of a worksheet, continue with the article that matches your next task:

1. Read [What Is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%}) to work with worksheet content.
2. Read [Working with Rows and Columns]({%slug radspreadprocessing-working-with-rows-and-columns-what-is-row-column%}) to manage worksheet structure.
3. Read [View State]({%slug radspreadprocessing-working-with-worksheets-view-state%}) to control how a worksheet appears.
4. Read [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%}) to restrict editing.

## See Also

* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
* [Working with Rows and Columns]({%slug radspreadprocessing-working-with-rows-and-columns-what-is-row-column%})
* [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%})
* [Named Ranges]({%slug radspreadprocessing-features-named-ranges%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
* [View State]({%slug radspreadprocessing-working-with-worksheets-view-state%})
