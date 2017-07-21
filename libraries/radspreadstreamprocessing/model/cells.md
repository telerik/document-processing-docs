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

* [What is a Cell](#what-is-a-cell)

* [ICellExporter Interface](#icellexporter-interface)

* [Using ICellExporter](#using-icolumnexporter)


## What is a Cell

A cell is the basic data unit in a worksheet. Cells are organized in rows and columns and can also be referred as an intersection point of a column and a row. Cells are identified by a letter and number combination that indicates the letter of their column and the number of their row. For example, the top left cell is referred to as A1 and the bottom right cell is – XFD1048576.

## ICellExporter Interface

In **RadSpreadStreamProcessing**, a cell could be exported through the [**ICellExporter** interface](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_ICellExporter.htm). It defines several methods allowing you to set different values and formats to a cell.

## Using ICellExporter

A concrete instance of ICellExporter could be created through the **CreateCellExporter()** method of [IRowExporter]({%slug radspreadstreamprocessing-model-rows%}). **Example 1** demonstrates how you can add a cell to a row.


#### **[C#] Example 1: Using ICellExporter**


{{region cs-radspreadstreamprocessing-model-cells_0}}
	using (ICellExporter cell = row.CreateCellExporter())
	{
	}
{{endregion}}

>ICellExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.


### Set a Value
With **ICellExporter** you can set different values to a cell as well as modify its format. 

The **SetValue()** method exposes several overloads allowing you to set values from the types listed below:

* **string**
* **double**
* **bool**
* **DateTime**

> In order to visualize a value as a date or time, you will need to set an appropriate Number format of the cell. Otherwise, it will be treated as a number.

#### **[C#] Example 2: Setting a value to a cell**

{{region cs-radspreadstreamprocessing-model-cells_1}}
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetValue(123.456);
	}
{{endregion}}


### Set a Formula

In order to allow you setting a formula as a value of a cell, ICellExporter defines the SetFormula() method. This method accepts a string, representing the formula as a parameter. **Example 4** shows how you could use it.

#### **[C#] Example 4: Setting a formula to a cell**

{{region cs-radspreadstreamprocessing-model-cells_3}}
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetFormula("=Sum(A1, B2)");
	}
{{endregion}}


>All formulas should be set in **InvariantCulture**. For example, the decimal separator should be “.”, the list separator should be “,”.


### Skip Cells

The cells in a document are exported one by one from left to right starting from the one with index [0, 0] or, in other words, A1. In order to export a cell with a bigger index, you will need to export all the previous cells or skip them.

In some cases you may need to skip several cells and start filling the data in the next one. The [**IRowExporter**]({%slug radspreadstreamprocessing-model-rows%}) interface declares a method that allows you to implement such scenario. **Example 3** shows how to skip 5 cells and set a value and a vertical alignment to the sixth one.

#### **[C#] Example 3: Skip cells**

{{region cs-radspreadstreamprocessing-model-cells_2}}
	row.SkipCells(5);
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetValue("Aligned cell");
	    cell.SetFormat(new SpreadCellFormat()
	    {
	        VerticalAlignment = SpreadVerticalAlignment.Center
	    });
	}
{{endregion}}

### Merge Cells

**Example 5** shows how several cells could be merged in a single one through [IWorksheetExporter]({%slug  radspreadstreamprocessing-model-worksheet%}).

#### **[C#] Example 5: Merge cells**

{{region cs-radspreadstreamprocessing-model-cells_4}}
	using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("Sheet 1")) 
	{
	    worksheet.MergeCells(3, 3, 10, 10);
	}
{{endregion}}

>important Due to the importance of the order the content is inserted in a document, the Merge operation must be the last operation before disposing IWorksheetExporter.

>The merged cell range has the formatting and value of the top left cell of the range.

### Set a Format

Another method, exposed by **ICellExporter** - SetFormat() - enables you to change the appearance of a cell. The SetFomat() method accepts an argument of type [SpreadCellFormat](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadCellFormat.htm). The next list describes the properties exposed by SpreadCellFormat:


- Number Format
	
	- **NumberFormat**: Gets or sets the number format.

- Alignment properties
	
	- **HorizontalAlignment**: Gets or sets the horizontal alignment. The property is of type [SpreadHorizontalAlignment](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadHorizontalAlignment.htm).
	
	- **VerticalAlignment**: Gets or sets the vertical alignment. The property is of type [SpreadVerticalAlignment](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadVerticalAlignment.htm).
	
	- **Indent**: Gets or sets the indent.
	
	- **WrapText**: Gets or sets a value indicating if the text in a cell should be line-wrapped within the cell.

- Font properties
	
	- **ForeColor**: Gets or sets the fore color. The property is of type [SpreadThemableColor](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadThemableColor.htm).
	
	- **FontFamily**: Gets or sets the font family. The property is of type [SpreadThemableFontFamily](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadThemableFontFamily.htm).
	
	- **FontSize**: Gets or sets the size of the font.
	
	- **IsBold**: Gets or sets a value indicating whether the text is bold.
	
	- **IsItalic**: Gets or sets a value indicating whether the text is italic.
	
	- **Underline**: Gets or sets the underline type. The property is of type [SpreadUnderlineType](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadUnderlineType.htm).

- Border properties
	
	- **LeftBorder**: Gets or sets the left border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).
	
	- **RightBorder**: Gets or sets the right border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).
	
	- **TopBorder**: Gets or sets the top border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).
	
	- **BottomBorder**: Gets or sets the bottom border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).
	
	- **DiagonalUpBorder**: Gets or sets the diagonal up border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).
		
	- **DiagonalDownBorder**: Gets or sets the diagonal down border. The property is of type [SpreadBorder](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadBorder.htm).

- Fill properties
	

#### **[C#] Example 6: Format cells**
{{region cs-radspreadstreamprocessing-model-cells_5}}
	SpreadBorder border = new SpreadBorder(SpreadBorderStyle.Thick, new SpreadThemableColor(new SpreadColor(255, 0, 0)));
	
	SpreadCellFormat cellFormat = new SpreadCellFormat()
	{
	    TopBorder = border,
	    BottomBorder = border,
	    DiagonalDownBorder = border,
	    DiagonalUpBorder = border,
	    LeftBorder = border,
	    RightBorder = border,
	    Fill = SpreadPatternFill.CreateSolidFill(new SpreadColor(255, 0, 0)),
	    FontFamily = new SpreadThemableFontFamily(SpreadThemeFontType.Major),
	    FontSize = 22,
	    ForeColor = new SpreadThemableColor(new SpreadColor(0, 255, 0)),
	    Underline = SpreadUnderlineType.DoubleAccounting,
	    IsBold = true,
	    IsItalic = true,
	    HorizontalAlignment = SpreadHorizontalAlignment.Fill,
	    Indent = 5,
	    VerticalAlignment = SpreadVerticalAlignment.Top,
	    WrapText = false
	};
	
	cell.SetFormat(cellFormat);
{{endregion}}
In addition to the listed properties, the SpreadCellFormat class allows you to set a style to a cell. For more information on cell styles, check [this topic]({%slug radspreadstreamprocessing-features-styling-cell-styles%})

A SpreadCellFormat instance could be applied on multiple cells. However, if a property of the format changes, the new settings will be applied to the cells formatted after the modification.


## See Also

* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
