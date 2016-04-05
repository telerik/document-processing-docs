---
title: Cells
page_title: Cells
description: Cells
slug: radspreadstreamprocessing-model-cells
tags: cell
published: True
position: 0
---

# Cells

This article will help you get familiar with the concept of a cell and its features.

## What is a Cell

A cell is the basic data unit in a worksheet. Cells are organized in rows and columns and can also be referred as an intersection point of a column and a row. Cells are identified by a letter and number combination that indicates the letter of their column and the number of their row. For example, the top left cell is referred to as A1 and the bottom right cell is – XFD1048576.

## ICellExporter Interface

In **RadSpreadStreamProcessing**, the row is represented by the **ICellExporter** interface [API REF]. It defines several methods allowing you to set different values and formats to a cell.

A concrete instance of ICellExporter could be created through the CreateCellExporter() method of [IRowExporter]({slug radspreadstreamprocessing-rows}). **Example 1** demonstrates how you can add a cell to a row and set it a value.


#### **[C#] Example 1: Using ICellExporter**


{{region [ADD NAME]}}
	using (ICellExporter cell = row.CreateCellExporter()) 
	{ 
	    cell.SetValue(DateTime.Now); 
	}
{{endregion}}

>ICellExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.

## Working with Cells

### Set a Value
With **ICellExporter** you can set different values to a cell as well as modify its format. 

The **SetValue()** method exposes several overloads allowing you to set values from the types listed below:

* **string**
* **double**
* **bool**
* **DateTime**

#### **[C#] Example 2: Setting a value to a cell**

{{region [ADD NAME]}}
	using (ICellExporter cell = row.CreateCellExporter()) 
	{ 
	    cell.SetValue(123.456); 
	}
{{endregion}}


### Set a Formula

In order to allow you setting a formula as a value of a cell, ICellExporter defines the SetFormula() method. This method accepts a string, representing the formula as a parameter. **Example 3** shows how you could use it.

#### **[C#] Example 3: Setting a formula to a cell**

{{region [ADD NAME]}}
	using (ICellExporter cell = row.CreateCellExporter()) 
	{ 
	    cell.SetFormula("=Sum(A1, B2)");  
	}
{{endregion}}


### Set a Format

Another method, exposed by **ICellExporter** - SetFormat() - enables you to change the appearance of a cell. The SetFomat() method accepts an argument of type SpreadCellFormat [API REF]. For more details on how you could use the different format settings, please check [this article]({%slug %})


### Merge Cells

**Example 4** shows how several cells could be merged in a single one through [IWorksheetExporter]({%slug %}).

#### **[C#] Example 4: Setting a formula to a cell**

{{region [ADD NAME]}}
	using (IWorksheetExporter worksheet = row.CreateWorksheetExporter("Sheet 1")) 
	{ 
	   worksheet.MergeCells(3, 3, 10, 10);  
	}
{{endregion}}

# See Also

* Rows
* Columns
* Worksheets
* 