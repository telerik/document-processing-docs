---
title: Iterating Used Cells
description: Learn how to access and iterate only the used cells in a RadSpreadProcessing worksheet using cell range filtering and property definitions.
page_title: Iterating Used Cells
slug: radspreadprocessing-working-with-cells-iterating-used-cells
tags: cells, spreadsheet, radspreadprocessing, iterate, used, range, worksheet, selection
published: True
position: 3
---

# Iterating Used Cells

You can access only the cells that are used in a worksheet and iterate through them.

* [Working With The Whole Range of Used Cells](#working-with-the-whole-range-of-used-cells)
* [Working With a Filtered Range](#working-with-a-filtered-range)

## Working With The Whole Range of Used Cells 

The [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) class allows you to get all the cells that are used. A cell is considered used when it has any property applied to it, no matter whether it is a value or a foreground. The `UsedCellRange` property of the `Worksheet` class returns a cell range that starts from cell `A1` and holds all cells containing data or formatting. **Example 1** shows how to get this range of cells and iterate through it.


**Example 1: Iterate through every cell inside Worksheet.UsedCellRange**

<snippet id='codeblock-crh'/>


## Working With a Filtered Range

You can get only the cells that have a particular property applied and ignore the others. Often, the property you need is the value of a cell. With the `GetUsedCellRange()` method of [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) you can pass an IEnumerable&lt;[IPropertyDefinition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.IPropertyDefinition-1.html)&gt; object to get the used cell range holding only the cells with specific property definitions. **Example 2** shows how to get the used cell range of cells with a value and iterate through it to process each value.

**Example 2: Iterate only the used cells that contain values**

<snippet id='codeblock-cri'/>

>tip For more information on working with the values of the cells, check the [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) and [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) topics.

The following table lists the property definitions defined by the [CellPropertyDefinitions class](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.CellPropertyDefinitions.html), which you can use to filter the used cell range:

| Property | Description |
|---|---|
| `AllPropertyDefinitions` | Gets all property definitions. Same behavior as `UsedCellRange` — no filtering is applied. |
| `BottomBorderProperty` | Gets all cells that have a defined bottom border. |
| `TopBorderProperty` | Gets all cells that have a defined top border. |
| `LeftBorderProperty` | Gets all cells that have a defined left border. |
| `RightBorderProperty` | Gets all cells that have a defined right border. |
| `DiagonalDownBorderProperty` | Gets all cells that have a defined diagonal down border. |
| `DiagonalUpBorderProperty` | Gets all cells that have a defined diagonal up border. |
| `DataValidationRuleProperty` | Gets all cells that have a data validation rule applied. |
| `FillProperty` | Gets all cells that have a defined fill color. |
| `FontFamilyProperty` | Gets all cells that have a font family applied. |
| `FontSizeProperty` | Gets all cells that have a font size applied. |
| `ForeColorProperty` | Gets all cells that have a fore color applied. |
| `FormatProperty` | Gets all cells that have a specific number format defined. |
| `HorizontalAlignmentProperty` | Gets all cells that have horizontal alignment applied. |
| `VerticalAlignmentProperty` | Gets all cells that have vertical alignment applied. |
| `IndentProperty` | Gets all cells that have indentation applied. |
| `IsBoldProperty` | Gets all cells that are bold. |
| `IsItalicProperty` | Gets all cells that have italic font style applied. |
| `IsLockedProperty` | Gets all cells that are locked and will be protected when protection is applied. |
| `IsWrappedProperty` | Gets all cells that have text wrapping applied. |
| `StyleNameProperty` | Gets all cells that have a style applied. |
| `UnderlineProperty` | Gets all cells that have underlining applied. |
| `ValueProperty` | Gets all cells that have a value. |


## See Also 

* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})