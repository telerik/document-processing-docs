---
title: Iterate Through Worksheets
description: Learn how to iterate through all worksheets in a workbook using RadSpreadProcessing.
page_title: Iterate Through Worksheets
slug: radspreadprocessing-working-with-worksheets-iterate-through-worksheets
tags: worksheet, spreadsheet, radspreadprocessing, iterate, workbook, collection, loop, sheets
published: True
position: 4
---

# Iterate Through Worksheets

In a number of scenarios you may need to iterate through all worksheets in a given workbook. The API of the __Workbook__ class exposes a __Worksheets__ collection that allows you to retrieve worksheets both by name and index. Also, the collection allows you to iterate all worksheets effortlessly. The [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%}) article shows how to iterate the cells inside a worksheet respectively.
      
## 

__Example 1__ illustrates how to retrieve worksheets that have already been added to the workbook.      

#### __Example 1: Retrieve worksheet__

<snippet id='codeblock-csl'/>

__Example 2__ creates a new workbook with three worksheets. The code further iterates through all worksheets and sets the value of cell *A1* to the name of the corresponding worksheet. The example also sets the ForeColor and BackgrounFill of the cell.
        
#### __Example 2: Iterate worksheets__

<snippet id='codeblock-csm'/>

## See Also 

* [Iterating Used Cells]({%slug radspreadprocessing-working-with-cells-iterating-used-cells%})
* [What is a Cell?]({%slug radspreadprocessing-working-with-cells-what-is-cell%})
