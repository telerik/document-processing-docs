---
title: Cell Styles
description: Learn how to use cell styles in RadSpreadStreamProcessing to apply consistent formatting to cells in exported spreadsheet documents.
page_title: Cell Styles
slug: radspreadstreamprocessing-features-styling-cell-styles
tags: cellstyles, spread, stream, processing, spreadsheet, formatting, cells, export, styles, xlsx
published: True
position: 1
---

# Cell Styles

A cell style is a predefined set of formatting options, such as cell borders, fonts, font sizes, and number formats. Cell styles allow you to apply multiple format options in one step and also offer an easy approach to achieve consistency in cell formatting. When you update a style, all cells that have already applied this style update with the new value. 


## Cell Style Properties

A cell style is represented by the `SpreadCellStyle` class. The properties of the class can be categorized in five groups: number, alignment, font, border, and fill. The following list shows all properties distributed in their corresponding groups:

* Number group
	
	* `NumberFormat`: Gets or sets the number format.

* Alignment group
	
	* `HorizontalAlignment`: Gets or sets the horizontal alignment. The property is of type [SpreadHorizontalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadHorizontalAlignment.html).
	
	* `VerticalAlignment`: Gets or sets the vertical alignment. The property is of type [SpreadVerticalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadVerticalAlignment.html).
	
	* `Indent`: Gets or sets the indent.
	
	* `WrapText`: Gets or sets a value indicating if the text in a cell is line-wrapped within the cell.

* Font group
	
	* `ForeColor`: Gets or sets the fore color. The property is of type [SpreadThemableColor](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableColor.html).
	
	* `FontFamily`: Gets or sets the font family. The property is of type [SpreadThemableFontFamily](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableFontFamily.html).
	
	* `FontSize`: Gets or sets the size of the font.
	
	* `IsBold`: Gets or sets a value indicating whether the text is bold.
	
	* `IsItalic`: Gets or sets a value indicating whether the text is italic.
	
	* `Underline`: Gets or sets the underline type. The property is of type [SpreadUnderlineType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadUnderlineType.html).

* Border group
	
	* `LeftBorder`: Gets or sets the left border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	* `RightBorder`: Gets or sets the right border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	* `TopBorder`: Gets or sets the top border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	* `BottomBorder`: Gets or sets the bottom border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	* `DiagonalUpBorder`: Gets or sets the diagonal up border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
		
	* `DiagonalDownBorder`: Gets or sets the diagonal down border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).

* Fill group
	
	* `Fill`: Gets or sets the fill. The property can be of type [SpreadGradientFill](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadGradientFill.html) or [SpreadPatternFill](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadPatternFill.html).

In addition to the previous properties, the `SpreadCellStyle` class exposes six Boolean properties that indicate whether the groups are applied:

* `ApplyNumberFormat`
* `ApplyAlignment`
* `ApplyFont`
* `ApplyBorder`
* `ApplyFill`
* `ApplyProtection`

When you apply a style to a cell with locally set properties, the result is an addition of the style properties to the cell local properties. The result of such an addition depends on which elements (groups) of the style you have selected as applied when using the particular style. You can select a group to be applied along with the style by setting the appropriate property to `true`.

**Example 1** shows what applying the Number group looks like.

**Example 1: Retrieve the built-in Good style and enable its number-format group**

<snippet id='codeblock-dkq'/>

Through the API you can add, modify, or remove styles from the `CellStyles` collection of [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}).


>If you want to set a particular property of a cell, you can do it through the [cell format]({%slug radspreadstreamprocessing-model-cells%}#set-a-format).

## Create a Style

To create a new style, invoke the `Add()` method of the workbook `CellStyles` collection. The method returns an object of type `SpreadCellStyle`, which you can manipulate. 

**Example 2: Create a custom cell style with borders, fill, font settings, and alignment, then apply it to a cell**

<snippet id='codeblock-dkr'/>

## Modify a Style

To modify a style, retrieve it from the `CellStyles` collection and set the properties you need.

**Example 3** obtains the Bad style from the cell styles collection of a workbook and modifies it.

**Example 3: Retrieve the built-in Bad style and make it bold**

<snippet id='codeblock-dks'/>


## See Also

* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})