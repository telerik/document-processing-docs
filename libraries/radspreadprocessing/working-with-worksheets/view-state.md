---
title: Manage View State
page_title: Manage View State
description: Learn how to set the scale factor, tab color, selection state, and how to show or hide gridlines and row or column headers in the worksheet.
slug: radspreadprocessing-working-with-worksheets-view-state
tags: view, state, spreadsheet, radspreadprocessing, zoom, scroll, gridlines, worksheet, headers
published: True
position: 5
---

# Manage View State

**RadSpreadProcessing** enables you to apply different properties on the worksheet that affect its visualization when the document is rendered in an application. You can access these properties through the `ViewState` property of the `Worksheet` object.

The following sections describe the members of the `WorksheetViewState` class.

## ScaleFactor

Gets or sets the current scale factor of the worksheet. Use this property to zoom in or out according to your needs. The values you can apply are between 0.5 and 4, corresponding to 50% and 400% respectively.

**Example 1: Set the worksheet zoom level to 50 percent**

<snippet id='codeblock-cst'/>


## TopLeftCellIndex

Determines the top left cell visible on the screen. Use this property to make sure that the data you want to visualize when the worksheet is opened is in the user viewport.

**Example 2: Scroll the worksheet so cell C11 becomes the top-left visible cell**

<snippet id='codeblock-csu'/>

## SelectionState

Gets or sets the state of the selection inside the worksheet.

**Example 3** demonstrates how you can create two selection ranges (one from B3 to E9 and one from D6 to G13) and change the active cell inside that selection.

**Example 3: Set two selection ranges and make C6 the active cell**

<snippet id='codeblock-csv'/>

![Worksheet showing two selected ranges, B3:E9 and D6:G13, with cell C6 as the active cell](images/ViewState_Selection.png)

## IsSelected

Gets or sets a value indicating whether the sheet is selected.

## ShowGridLines

Gets or sets a boolean value determining whether the gridlines are visualized when the document is rendered.

**Example 4: Hide worksheet gridlines in the rendered view**

<snippet id='codeblock-csw'/>

## ShowRowColHeaders

Determines whether the headers of the rows and columns are visualized when the document is rendered.

**Example 5: Hide the row and column headers in the rendered view**

<snippet id='codeblock-csx'/>

![Worksheet view with row and column headers hidden and gridlines turned off, leaving only the active cell visible](images/ViewState_HideLinesHeaders.png)

## Pane

Gets or sets the pane of the worksheet. Applicable when the worksheet contains [frozen panes]({%slug radspreadprocessing-features-freeze-panes%}).

## CircleInvalidData

Gets or sets a value indicating whether to circle the not valid data. Applicable when using the [Data Validation]({%slug radspreadprocessing-features-data-validation%}) feature. This property is not preserved when exporting the document because there is no alternative representation in the supported formats. Its value is used only by viewers integrated with SpreadProcessing.

## FreezePanes

Allows you to freeze panes. For more information about this feature and its usage, refer to the [Freeze Panes]({%slug radspreadprocessing-features-freeze-panes%}) topic.

## TabColor

Sets the color of the worksheet tab.

**Example 6: Set the worksheet tab color to green**

<snippet id='codeblock-csy'/>

![Workbook with Sheet1 displayed using a green tab color while Sheet2 remains uncolored](images/ViewState_TabColor.png)

## IsInvalidated

Boolean property determining whether the view state must be updated.

## ViewType

Sets the view type. The supported values are `Normal`, `PageBreakPreview`, and `PageLayout`.

## See Also

* [Iterate Through Worksheets]({%slug radspreadprocessing-working-with-worksheets-iterate-through-worksheets%})
* [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%})
* [Add and Remove Worksheets]({%slug radspreadprocessing-working-with-worksheets-add-remove-worksheets%})
