---
title: Iterate Through Worksheets
description: Learn how to iterate through all worksheets in a workbook using the Worksheets collection of the Workbook class in RadSpreadProcessing.
page_title: Iterate Through Worksheets
slug: radspreadprocessing-working-with-worksheets-iterate-through-worksheets
tags: worksheet, spreadsheet, radspreadprocessing, iterate, workbook, collection, loop, sheets
published: True
position: 4
---

# Iterate Through Worksheets

In many scenarios you need to iterate through all worksheets in a given workbook. The API of the `Workbook` class exposes a `Worksheets` collection that allows you to retrieve worksheets both by name and index. The collection also allows you to iterate all worksheets. The [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%}) article shows how to iterate the cells inside a worksheet.

## Retrieving and Iterating Worksheets

**Example 1** illustrates how to retrieve worksheets that have already been added to the workbook.

**Example 1: Retrieve worksheets by index and by name from the Worksheets collection**

<snippet id='codeblock-csl'/>

**Example 2** creates a new workbook with three worksheets. The code further iterates through all worksheets and sets the value of cell *A1* to the name of the corresponding worksheet. The example also sets the `ForeColor` and `BackgroundFill` of the cell.

**Example 2: Iterate through all worksheets and label cell A1 with each worksheet name**

<snippet id='codeblock-csm'/>

## See Also

* [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%})
* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
