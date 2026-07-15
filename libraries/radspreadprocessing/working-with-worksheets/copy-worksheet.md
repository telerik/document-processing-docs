---
title: Copy a Worksheet
page_title: Copy a Worksheet
description: Learn how to copy a worksheet between workbooks using the CopyFrom method of the Worksheet class in RadSpreadProcessing.
slug: radspreadprocessing-working-with-worksheets-copy-worksheet
tags: worksheet, spreadsheet, radspreadprocessing, copy, workbook, clone, transfer, move
published: True
position: 5
---

# Copy a Worksheet

In some scenarios you may need to copy a specific worksheet and apply modifications to it. Starting with Q1 2016, the `Worksheet` class exposes API that allows you to copy a sheet to the same or another `Workbook`.

The `CopyFrom(Worksheet source)` method of a worksheet copies the passed *source* sheet into the one the method is called for. This clones all content and formatting from the source.

**Example 1** illustrates how to copy a specific worksheet from a source workbook into a new sheet in the desired target workbook.

**Example 1: Add a new target worksheet and copy the source worksheet into it**

<snippet id='codeblock-csh'/>

>If the sheet that you are copying is in a document where a [DocumentTheme]({%slug radspreadprocessing-features-styling-document-themes%}) has been applied, the theme is not copied. Themes are information preserved in the `Workbook` and you may need to transfer them separately.

You can copy a worksheet both into a newly created worksheet and an existing one. If you copy the content into an existing worksheet, all previously available content in the target is removed and replaced with the copied content. The only exception is the [Name]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%}) of the sheet, which is not transferred.

**Example 2** demonstrates a more complex scenario in which a sheet is copied into an existing workbook. If the workbook contains a worksheet with the same name, the sheet to clone is copied into it. Otherwise, a new worksheet is created and its `Name` is copied from the source document.

**Example 2: Copy a worksheet into an existing workbook, reusing a matching sheet name when available**

<snippet id='codeblock-csj'/>


## See Also

* [Iterate Through Worksheets]({%slug radspreadprocessing-working-with-worksheets-iterate-through-worksheets%})
* [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%})
* [Add and Remove Worksheets]({%slug radspreadprocessing-working-with-worksheets-add-remove-worksheets%})
