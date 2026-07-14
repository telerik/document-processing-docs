---
title: Add, Remove and Reorder Worksheets
description: Learn how to add, remove, and reorder worksheets inside a workbook using the Worksheets collection in RadSpreadProcessing.
page_title: Add, Remove and Reorder Worksheets
slug: radspreadprocessing-working-with-worksheets-add-remove-worksheets
tags: worksheet, spreadsheet, radspreadprocessing, add, remove, reorder, workbook, move
published: True
position: 1
---

# Add, Remove and Reorder Worksheets

The following sections describe how to add, remove, and reorder worksheets inside a workbook.

## Add Worksheets

To add a new worksheet to a workbook, use its `Worksheets` collection. The collection exposes an `Add()` method that does not take arguments and returns the instance of the newly created worksheet. By default, worksheets are assigned the first available name in the sequence Sheet1, Sheet2, Sheet3, and so on. You can change the name of the worksheet through the `Worksheet.Name` property. For more information about renaming a worksheet, refer to [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%}).

**Example 1** creates a workbook from scratch and adds a single worksheet to it. Since this is the first worksheet in the workbook, it is also set as the active worksheet. All worksheets added after it do not become active.

**Example 1: Create a workbook and add a new worksheet through the Worksheets collection**

<snippet id='codeblock-cse'/>



## Remove Worksheets

The `Worksheets` collection of the workbook offers two methods for removing worksheets: `Remove()` and `RemoveAt()`. The `Remove()` method requires the worksheet name or the worksheet instance as an argument. The `RemoveAt()` method allows you to specify the index of the worksheet you want to remove.

**Example 2** creates a workbook and adds four worksheets. All worksheets have their default names: Sheet1, Sheet2, Sheet3, and Sheet4. The code further demonstrates how to remove three worksheets using the remove methods listed previously.

**Example 2: Add four worksheets and remove them by index, name, and worksheet instance**

<snippet id='codeblock-csf'/>


## Reorder Worksheets

To change the order in which worksheets appear inside the workbook, use the `Move()` method of the `Sheets` collection. The method allows you to move one or more consecutive sheets to a specified position. **Example 3** shows how to insert four sheets and move the last one to the first position in the collection. When the workbook is visualized, the fourth sheet is the first one visible in the sheet tabs.

**Example 3: Add four worksheets and move the fourth sheet to the first position**

<snippet id='codeblock-csg'/>