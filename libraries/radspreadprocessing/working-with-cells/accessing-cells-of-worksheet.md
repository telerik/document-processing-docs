---
title: Accessing Cells of a Worksheet
description: Learn how to access and manipulate cells in RadSpreadProcessing worksheets using the CellSelection class.
page_title: Accessing Cells of a Worksheet
slug: radspreadprocessing-working-with-cells-accessing-cells-of-worksheet
tags: accessing,cells,worksheet,selection,workbook,xlsx,spreadprocessing,
published: True
position: 2
---

# Accessing Cells of a Worksheet

Each worksheet consists of cells organized in rows and columns. To manipulate the data and properties of the cells, you need to create and use an instance of the __CellSelection__ class that holds the desired cell region and then invoke the appropriate action for this __CellSelection__ instance. This class exposes a rich API that allows you to get, set and clear cell's value, colors, borders and style.    

The document model offers multiple ways to create a __CellSelection__ object. The following examples list all approaches you can use to retrieve a __CellSelection__ instance. Note that each example creates a new workbook, adds one worksheet and creates a selection for its cells.

Using a **CellIndex** object allows you to specify a single cell (identified by a row index and column index) from the sheet and create a CellSelection for this single cell. Then, you can get the [Value]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) of the cell.                

#### __Example 1: Create CellSelection using CellIndex__

<snippet id='codeblock-cpx'/>


#### __Example 2: Create CellSelection using CellRange__

<snippet id='codeblock-cpy'/>
            

#### __Example 3: Create CellSelection using multiple CellRange objects__

<snippet id='codeblock-cpz'/>


#### __Example 4: Create CellSelection using two CellIndex instances that specify a CellRange__

<snippet id='codeblock-cqa'/>


#### __Example 5:  Create CellSelection using two integers that indicate the CellIndex__

<snippet id='codeblock-cqb'/>
 

#### __Example 6: Create CellSelection using four integers that specify the CellRange__

<snippet id='codeblock-cqc'/>



Once you have a __CellSelection__ object you can get, set and clear the properties of the selected cells. More information about cell properties is available in the [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) article.
        
