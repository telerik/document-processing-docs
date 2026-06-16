---
title: Cell Styles
description: Learn how to create, apply, and modify cell styles in RadSpreadProcessing to apply consistent formatting to spreadsheet cells.
page_title: Cell Styles
slug: radspreadprocessing-features-styling-cell-styles
tags: cell, styles, spreadsheet, radspreadprocessing, formatting, cells, appearance, styles, workbook, xlsx, spread
published: True
position: 0
---

# Cell Styles

A cell style is a predefined set of formatting options, such as cell borders, fonts, font sizes, and number formats. Cell styles allow you to apply multiple format options in one step and also offer an easy approach to achieve consistency in cell formatting. The document model has several built-in cell styles that you can modify or apply directly. The API allows you to duplicate an existing style or create a new one according to your preferences.

>You can create cell styles that depend on the current document theme. Such styles update automatically when you change the selected document theme. For more information about document themes and dependent cell styles, see the [Document Themes]({%slug radspreadprocessing-features-styling-document-themes%}) article.

## Cell Style Properties

A cell style is represented by the `CellStyle` class. The properties of the class fall into five groups: number, alignment, font, border, and fill. The following list shows all properties distributed in their corresponding groups:

* Number group

	* `Format`

* Alignment group

	* `HorizontalAlignment`

	* `VerticalAlignment`

	* `Indent`

	* `IsWrapped`

	* `TextRotation` (supported in **XLSX** format only)

* Font group

	* `FontFamily`

	* `FontSize`

	* `IsBold`

	* `IsItalic`

	* `Underline`

	* `ForeColor`

* Border group

	* `LeftBorder`

	* `TopBorder`

	* `RightBorder`

	* `BottomBorder`

	* `DiagonalUpBorder`

	* `DiagonalDownBorder`

* Fill group

	* `Fill`

In addition to the properties listed, the `CellStyle` class exposes five Boolean properties that indicate whether the groups will be applied:

* `IncludeNumber`

* `IncludeAlignment`

* `IncludeFont`

* `IncludeBorder`

* `IncludeFill`

When you apply a style to a cell with locally set properties, the end result is an addition of the style properties to the local properties of the cell. The end result of such an addition depends on which elements (groups) of the style you selected as part of the style. You can select a group to be part of the style by setting the appropriate property to *true*.

**Example 1** shows what including the `Number` group looks like.

**Example 1: Include Number Group in CellStyle**

<snippet id='codeblock-cng'/>

Through the API you can add, modify, or remove styles from the `Styles` collection residing in the worksheet.

## Create Cell Style

To create a new style, invoke the `Add()` method of the workbook `Styles` collection. The method returns an object of type `CellStyle`, which you can manipulate. Setting several properties raises multiple UI updates. To avoid the additional overhead, enclose the code blocks that set the properties with the `BeginUpdate()` and `EndUpdate()` methods.

**Example 2** creates a new style and applies it to cell *A1*.

**Example 2: Create a Style**

<snippet id='codeblock-cnh'/>

## Modify Cell Style

To modify a style, retrieve it from the `Styles` collection and set the properties you need.

**Example 3** obtains the *Bad* style from the styles collection of a workbook and modifies it.

**Example 3: Modify a Style**

<snippet id='codeblock-cni'/>

## Copy Existing Cell Style

The API enables you to copy the properties of an existing style so you can modify it according to your preferences while keeping the original style untouched.

**Example 4: Copy an Existing Style and Modify Its Properties**

<snippet id='codeblock-cnj'/>

## Remove Cell Style

You can also remove a style from the `Styles` collection. Invoke the `Remove()` method, which returns a Boolean value. If such a style exists in the collection, the method returns *true*.

**Example 5: Remove a Style**

<snippet id='codeblock-cnk'/>

## See Also

* [Document Themes]({%slug radspreadprocessing-features-styling-document-themes%})
* [What is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [Retrieving Themable Cell Color in RadSpreadProcessing]({%slug retrieve-cell-color-radspreadprocessing%})
* [Preventing Excel from Extending Cell Formatting Below Formatted Range Using SpreadProcessing]({%slug preventing-cell-formatting-extension-spreadprocessing%})
