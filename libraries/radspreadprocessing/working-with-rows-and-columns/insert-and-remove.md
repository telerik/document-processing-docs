---
title: Insert and Remove Rows and Columns
description: Learn how to insert and remove rows and columns in RadSpreadProcessing worksheets by shifting surrounding content.
page_title: Insert and Remove Rows and Columns
slug: radspreadprocessing-working-with-rows-and-columns-insert-and-remove
tags: rows, columns, spreadsheet, radspreadprocessing, insert, remove, worksheet, shift, xlsx, spread
published: True
position: 1
---

# Insert and Remove Rows and Columns



Worksheets in __RadSpreadProcessing__'s document model consist of cells organized in rows and columns. Each worksheet allows you to insert and remove rows and columns through shifting the contents of the surrounding rows and columns. This article demonstrates how to insert and remove rows and columns.
      

* [Insert Rows](#insert-rows)

* [Remove Rows](#remove-rows)

* [Insert Columns](#insert-columns)

* [Remove Columns](#remove-columns)

## Insert Rows

In order to insert rows, you need to create a __RowSelection__ instance that indicates where the new rows are to be inserted in the worksheet. Whenever rows insertion is performed, all values that appear down of the __RowSelection__ region including the selected region are shifted down, thus, causing no loss of data.
        

The __RowSelection__ class exposes __CanInsert()__ and __Insert()__ methods that indicate whether the insert is possible and perform the insert operation respectively. __Example 1__ shows how to insert rows using the two methods.
        

#### __Example 1: Insert rows__

<snippet id='codeblock-crm'/>



## Remove Rows

In order to remove rows, you need to create a __RowSelection__ instance that specifies the region of rows you would like to remove. Whenever you remove rows, all values that appear down of the __RowSelection__ region are shifted up.
        

The __RowSelection__ class exposes a __Remove()__ method that performs the removal of the selected rows. __Example 2__ shows how to remove rows.
        

#### __Example 2: Remove rows__

<snippet id='codeblock-crn'/>



## Insert Columns

In order to insert columns, you need to create a __ColumnSelection__ instance that specifies where the new columns are to be inserted in the worksheet. Whenever columns insertion is performed, all values that appear to the right of the __ColumnSelection__ region including the selected region are shifted right, thus, causing no loss of data.
        

The __ColumnSelection__ class exposes __CanInsert()__ and __Insert()__ methods that indicate whether the insert is possible and perform the insert operation respectively. __Example 3__ shows how to insert columns using the two methods.
        

#### __Example 3: Insert columns__

<snippet id='codeblock-cro'/>



## Remove Columns

In order to remove columns, you need to create a __ColumnSelection__ instance that indicates the region of columns you would like to remove. Whenever you remove columns, all values that appear to the right of the __ColumnSelection__ region are shifted to the left.
        

The __ColumnSelection__ class exposes a __Remove()__ method that executes the removal of the selected columns. __Example 4__ illustrates how to remove columns.
        

#### __Example 4: Remove columns__

<snippet id='codeblock-crp'/>

## See Also

* [Repeat Values]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%})
* [Insert and Remove Cells]({%slug radspreadprocessing-working-with-cells-insert-remove-cells%})



