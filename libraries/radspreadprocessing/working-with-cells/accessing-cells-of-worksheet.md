---
title: Accessing Cells of a Worksheet
description: Learn how to access and manipulate cells in RadSpreadProcessing worksheets using the CellSelection class.
page_title: Accessing Cells of a Worksheet
slug: radspreadprocessing-working-with-cells-accessing-cells-of-worksheet
tags: cells, spreadsheet, radspreadprocessing, cell, selection, worksheet, access, index, range
published: True
position: 2
---

# Accessing Cells of a Worksheet

Each worksheet consists of cells organized in rows and columns. To manipulate the data and properties of the cells, create and use an instance of the `CellSelection` class that holds the desired cell region and then invoke the appropriate action for this `CellSelection` instance. This class exposes a rich API that allows you to get, set, and clear cell values, colors, borders, and style.

The document model offers multiple ways to create a `CellSelection` object. The following examples list all approaches you can use to retrieve a `CellSelection` instance. Each example creates a new workbook, adds one worksheet, and creates a selection for its cells.

Use a `CellIndex` object to specify a single cell (identified by a row index and column index) from the sheet and create a `CellSelection` for this single cell. Then, you can get the [Value]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) of the cell.

**Example 1: Create CellSelection Using CellIndex**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-1'/>

**Example 2: Create CellSelection Using CellRange**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-2'/>

**Example 3: Create CellSelection Using Multiple CellRange Objects**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-3'/>

**Example 4: Create CellSelection Using Two CellIndex Instances That Specify a CellRange**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-4'/>

**Example 5: Create CellSelection Using Two Integers That Indicate the CellIndex**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-5'/>

**Example 6: Create CellSelection Using Four Integers That Specify the CellRange**

<snippet id='libraries-spread-working-with-cells-accessing-cells-of-worksheet-6'/>

Once you have a `CellSelection` object, you can get, set, and clear the properties of the selected cells. For more information about cell properties, see the [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) article.
        
