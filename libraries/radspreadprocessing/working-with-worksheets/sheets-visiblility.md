---
title: Sheets Visibility
description: Learn how to control the visibility of worksheet sheets in RadSpreadProcessing by using the SheetVisibility property or the Hide and Unhide methods.
page_title: Sheets Visibility
slug: radspreadprocessing-working-with-worksheets-sheets-visibility
tags: worksheet, spreadsheet, radspreadprocessing, visibility, hidden, show, hide, sheets, grouping
published: True
position: 6
---

# Sheets Visibility

Sheets Visibility is a mechanism that allows you to show and hide sheets in a workbook. The following sections describe how to hide and unhide sheets.

## Hiding Sheets

There are two available options when hiding sheets. The first option is to set the sheet `Visibility` property exposed both by the `SheetCollection` and `WorksheetCollection` classes. This property is of type `SheetVisibility`, an enum describing the visibility states of sheets:

| Value | Description |
|---|---|
| `Visible` | The sheet is visible. |
| `Hidden` | The sheet is hidden. Designed for UI purposes. |
| `VeryHidden` | The sheet is very hidden. Can only be set through the API. |

**Example 1: Set the SheetVisibility to Hidden or VeryHidden**

<snippet id='libraries-spread-working-with-worksheets-sheets-visiblility-1'/>

The other option is to use the `Hide` method exposed by both the `SheetCollection` and `WorksheetCollection` classes. The `Hide` method provides several overloads and supports hiding a sheet by passing:

* A sheet at the specified index
* A specified sheet
* An active sheet (available on `SheetCollection` only)

**Example 2: Hide Sheets Using the Hide Method**

<snippet id='libraries-spread-working-with-worksheets-sheets-visiblility-2'/>


## Unhiding Sheets

As with hiding, you can unhide sheets both through setting the sheet `Visibility` property, or by using the `Unhide` method exposed by the `SheetCollection` and `WorksheetCollection` classes.

The following code snippets show the two approaches.

**Example 3: Set the SheetVisibility to Visible**

<snippet id='libraries-spread-working-with-worksheets-sheets-visiblility-3'/>

The `Unhide` method provides two overloads and supports unhiding a sheet by:

* A sheet at the specified index
* A specified sheet

**Example 4: Unhide Sheets Using the Unhide Method**

<snippet id='libraries-spread-working-with-worksheets-sheets-visiblility-4'/>

## See Also

* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
* [Add, Remove and Reorder Worksheets]({%slug radspreadprocessing-working-with-worksheets-add-remove-worksheets%})
* [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%})
* [Iterate Through Worksheets]({%slug radspreadprocessing-working-with-worksheets-iterate-through-worksheets%})
* [Copy a Worksheet]({%slug radspreadprocessing-working-with-worksheets-copy-worksheet%})

