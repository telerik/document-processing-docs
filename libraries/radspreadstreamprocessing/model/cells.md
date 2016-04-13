---
title: Cells
page_title: Cells
description: Cells
slug: radspreadstreamprocessing-model-cells
tags: cell
published: True
position: 5
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


>All formulas should be set in InvariantCulture. For example, the decimal separator should be “.”, the list separator should be “,”.


### Merge Cells

**Example 4** shows how several cells could be merged in a single one through [IWorksheetExporter]({%slug %}).

#### **[C#] Example 4: Setting a formula to a cell**

{{region [ADD NAME]}}
	using (IWorksheetExporter worksheet = row.CreateWorksheetExporter("Sheet 1")) 
	{ 
	   worksheet.MergeCells(3, 3, 10, 10);  
	}
{{endregion}}

>The merged cell range has the formatting and value of the top left cell of the range.

### Set a Format

Another method, exposed by **ICellExporter** - SetFormat() - enables you to change the appearance of a cell. The SetFomat() method accepts an argument of type SpreadCellFormat [API REF]. The next list describes the properties exposed by SpreadCellFormat:


- Number Format
	
	- **NumberFormat**: Gets or sets the number format.

- Alignment properties
	
	- **HorizontalAlignment**: Gets or sets the horizontal alignment. The property is of type [SpreadHorizontalAlignment][API REF].
	
	- **VerticalAlignment**: Gets or sets the vertical alignment. The property is of type [SpreadVerticalAlignment][API REF].
	
	- **Indent**: Gets or sets the indent.
	
	- **WrapText**: Gets or sets a value indicating if the text in a cell should be line-wrapped within the cell.

- Font properties
	
	- **ForeColor**: Gets or sets the fore color. The property is of type [SpreadThemableColor][API REF].
	
	- **FontFamily**: Gets or sets the font family. The property is of type [SpreadThemableFontFamily][API REF].
	
	- **FontSize**: Gets or sets the size of the font.
	
	- **IsBold**: Gets or sets a value indicating whether the text is bold.
	
	- **IsItalic**: Gets or sets a value indicating whether the text is italic.
	
	- **Underline**: Gets or sets the underline type. The property is of type [SpreadUnderlineType][API REF].

- Border properties
	
	- **LeftBorder**: Gets or sets the left border. The property is of type [SpreadBorder][API REF].
	
	- **RightBorder**: Gets or sets the right border. The property is of type [SpreadBorder][API REF].
	
	- **TopBorder**: Gets or sets the top border. The property is of type [SpreadBorder][API REF].
	
	- **BottomBorder**: Gets or sets the bottom border. The property is of type [SpreadBorder][API REF].
	
	- **DiagonalUpBorder**: Gets or sets the diagonal up border. The property is of type [SpreadBorder][API REF].
		
	- **DiagonalDownBorder**: Gets or sets the diagonal down border. The property is of type [SpreadBorder][API REF].

- Fill properties
	
	- **Fill**: Gets or sets the fill. The property could be of type [SpreadGradientFill][API REF] or [SpreadPatternFill][API REF].

In addition to the listed properties, the SpreadCellFormat class allows you to set a style to a cell. For more information on cell styles, check [this topic]({%slug %})

A SpreadCellFormat instance could be applied on multiple cells. However, if a property of the format changes, the new setting s will be applied to the cells formatted after the modification.


# See Also

* Rows
* Columns
* Worksheets
* 