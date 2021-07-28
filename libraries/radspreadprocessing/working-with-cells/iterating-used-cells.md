---
title: Iterating Used Cells
page_title: Iterating Used Cells
slug: radspreadprocessing-working-with-cells-iterating-used-cells
tags: iterate, used,cells, range,of,a,worksheet
published: True
position: 3
---

# Iterating Used Cells

This topic shows how you can access only the cells that are used in a worksheet and iterate them.

* [Working With The Whole Range of Used Cells](#working-with-the-whole-range-of-used-cells)
* [Working With a Filtered Range](#working-with-a-filtered-range)

## Working With The Whole Range of Used Cells 

The [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) class enables you to obtain all the cells that are used. A cell is considered used when it has any property applied to it - not matter whether it will be a value or a foreground. The **UsedCellRange** property of the Worksheet class returns a cell range that starts from cell **A1** and holds all cells containing data or formatting. **Example 1** shows how to obtain this range of cells and iterate it.  


#### __[C#] Example 1: Iterate UsedCellRange__

{{region radspreadprocessing-working-with-cells-iterating-used-cells_0}}

	CellRange usedCellRange = worksheet.UsedCellRange;
	for (int rowIndex = usedCellRange.FromIndex.RowIndex; rowIndex <= usedCellRange.ToIndex.RowIndex; rowIndex++)
	{
	    for (int columnIndex = usedCellRange.FromIndex.ColumnIndex; columnIndex <= usedCellRange.ToIndex.ColumnIndex; columnIndex++)
	    {
	        CellSelection cell = worksheet.Cells[rowIndex, columnIndex];
	    }
	}
{{endregion}}


## Working With a Filtered Range

This section describes how you can obtain only the cells that have particular property applied to them and ignore the others. Often, the property that we are interested in is the value of a cell. With the **GetUsedCellRange()** method of [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) you can pass an IEnumerable&lt;[IPropertyDefinition](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.IPropertyDefinition-1.html)&gt; object to get the used cell range, holding only the cells with specific property definitions. **Example 2** demonstrates how to get the used cell range of cells with value and iterate it to process each value.

#### __[C#] Example 2: Obtain and iterate a filtered UsedCellRange__

{{region radspreadprocessing-working-with-cells-iterating-used-cells_1}}

	CellRange usedCellRangeWithValues = worksheet.GetUsedCellRange(new IPropertyDefinition[] { CellPropertyDefinitions.ValueProperty });
	for (int row = usedCellRangeWithValues.FromIndex.RowIndex; row <= usedCellRangeWithValues.ToIndex.RowIndex; row++)
	{
	    for (int column = usedCellRangeWithValues.FromIndex.ColumnIndex; column <= usedCellRangeWithValues.ToIndex.ColumnIndex; column++)
	    {
	        ICellValue value = worksheet.Cells[row, column].GetValue().Value;
	    }
	}
{{endregion}}

>tip For more information on working with the values of the cells, check the [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) and [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) topics.

Following is a list of the property definitions defined by the [CellPropertyDefinitions class](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.PropertySystem.CellPropertyDefinitions.html), which you can use to filter the used cell range:

* **AllPropertyDefinitions**: Gets all property definitions. It has the same behavior as the UsedCellRange property - no filtering is applied to the range.
* **BottomBorderProperty**: Gets all cells that have defined a bottom border.
* **TopBorderProperty**: Gets all cells that have applied a top border.
* **LeftBorderProperty**: Gets all cells that have applied a left border.
* **RightBorderProperty**: Gets all cells that have applied a right border.
* **DiagonalDownBorderProperty**: Gets all cells that have defined a diagonal down border.
* **DiagonalUpBorderProperty**: Gets all cells that have defined a diagonal up border.
* **DataValidationRuleProperty**: Gets all cells that have applied a data validation rule.
* **FillProperty**: Gets all cells that have defined fill color.
* **FontFamilyProperty**: Gets all cells that have applied font family.
* **FontSizeProperty**: Gets all cells that have applied font size.
* **ForeColorProperty**: Gets all cells that have applied fore color.
* **FormatProperty**: Gets all cells that have defined a specific number format.
* **HorizontalAlignmentProperty**: Gets all cells that have applied horizontal alignment.
* **VerticalAlignmentProperty**: Gets all cells that are vertically aligned.
* **IndentProperty**: Gets all cells that have applied indentation.
* **IsBoldProperty**: Gets all cells that are bold.
* **IsItalicProperty**: Gets all cells that have applied italic font style.
* **IsLockedProperty**: Gets all cells that are locked and will be protected when protection is applied.
* **IsWrappedProperty**: Gets all cells that have applied text wrapping.
* **StyleNameProperty**: Gets all cells that have applied a style.
* **UnderlineProperty**: Gets all cells that have underlining.
* **ValueProperty**: Gets all cells that have a value.


## See Also 

* [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
* [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})