---
title: Cells
page_title: Cells
slug: radspreadstreamprocessing-model-cells
tags: cell
published: True
position: 5
---

# Cells

This article will help you get familiar with the concept of a cell and its features.


## What is a Cell

A cell is the basic data unit in a worksheet. Cells are organized in rows and columns and can also be referred as an intersection point of a column and a row. Cells are identified by a letter and number combination that indicates the letter of their column and the number of their row. For example, the top left cell is referred to as A1 and the bottom right cell is – XFD1048576.

## ICellExporter and ICellImporter Interface

In **RadSpreadStreamProcessing**, a cell could be exported through the [**ICellExporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.ICellExporter.html). It defines several methods allowing you to set different values and formats to a cell.

If you need to read the cell data and its properties, you should use the [**ICellImporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.ICellImporter.html).

## Using ICellExporter

A concrete instance of ICellExporter could be created through the **CreateCellExporter()** method of [IRowExporter]({%slug radspreadstreamprocessing-model-rows%}). **Example 1** demonstrates how you can add a cell to a row.


#### **Example 1: Using ICellExporter**


```csharp
	using (ICellExporter cell = row.CreateCellExporter())
	{
	}
```

>ICellExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.


### Set a Value
With **ICellExporter** you can set different values to a cell as well as modify its format. 

The **SetValue()** method exposes several overloads allowing you to set values from the types listed below:

* **string**
* **double**
* **bool**
* **DateTime**

> In order to visualize a value as a date or time, you will need to set an appropriate Number format of the cell. Otherwise, it will be treated as a number.

#### **Example 2: Setting a value to a cell**

```csharp
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetValue(123.456);
	}
```


### Set a Formula

In order to allow you setting a formula as a value of a cell, ICellExporter defines the SetFormula() method. This method accepts a string, representing the formula as a parameter. **Example 4** shows how you could use it.

#### **Example 4: Setting a formula to a cell**

```csharp
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetFormula("=Sum(A1, B2)");
	}
```


>All formulas should be set in **InvariantCulture**. For example, the decimal separator should be “.”, the list separator should be “,”.


### Skip Cells

The cells in a document are exported one by one from left to right starting from the one with index [0, 0] or, in other words, A1. In order to export a cell with a bigger index, you will need to export all the previous cells or skip them.

In some cases you may need to skip several cells and start filling the data in the next one. The [**IRowExporter**]({%slug radspreadstreamprocessing-model-rows%}) interface declares a method that allows you to implement such scenario. **Example 3** shows how to skip 5 cells and set a value and a vertical alignment to the sixth one.

#### **Example 3: Skip cells**

```csharp
	row.SkipCells(5);
	using (ICellExporter cell = row.CreateCellExporter())
	{
	    cell.SetValue("Aligned cell");
	    cell.SetFormat(new SpreadCellFormat()
	    {
	        VerticalAlignment = SpreadVerticalAlignment.Center
	    });
	}
```

### Merge Cells

**Example 5** shows how several cells could be merged in a single one through [IWorksheetExporter]({%slug  radspreadstreamprocessing-model-worksheet%}).

#### **Example 5: Merge cells**

```csharp
	using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("Sheet 1")) 
	{
	    worksheet.MergeCells(3, 3, 10, 10);
	}
```

>important Due to the importance of the order the content is inserted in a document, the Merge operation must be the last operation before disposing IWorksheetExporter.

>The merged cell range has the formatting and value of the top left cell of the range.

### Set a Format

Another method, exposed by **ICellExporter** - SetFormat() - enables you to change the appearance of a cell. The SetFomat() method accepts an argument of type [SpreadCellFormat](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadCellFormat.html). The next list describes the properties exposed by SpreadCellFormat:


- Number Format
	
	- **NumberFormat**: Gets or sets the number format.

- Alignment properties
	
	- **HorizontalAlignment**: Gets or sets the horizontal alignment. The property is of type [SpreadHorizontalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadHorizontalAlignment.html).
	
	- **VerticalAlignment**: Gets or sets the vertical alignment. The property is of type [SpreadVerticalAlignment](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadVerticalAlignment.html).
	
	- **Indent**: Gets or sets the indent.
	
	- **WrapText**: Gets or sets a value indicating if the text in a cell should be line-wrapped within the cell.

- Font properties
	
	- **ForeColor**: Gets or sets the fore color. The property is of type [SpreadThemableColor](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableColor.html).
	
	- **FontFamily**: Gets or sets the font family. The property is of type [SpreadThemableFontFamily](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableFontFamily.html).
	
	- **FontSize**: Gets or sets the size of the font.
	
	- **IsBold**: Gets or sets a value indicating whether the text is bold.
	
	- **IsItalic**: Gets or sets a value indicating whether the text is italic.
	
	- **Underline**: Gets or sets the underline type. The property is of type [SpreadUnderlineType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadUnderlineType.html).

- Border properties
	
	- **LeftBorder**: Gets or sets the left border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	- **RightBorder**: Gets or sets the right border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	- **TopBorder**: Gets or sets the top border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	- **BottomBorder**: Gets or sets the bottom border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
	
	- **DiagonalUpBorder**: Gets or sets the diagonal up border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).
		
	- **DiagonalDownBorder**: Gets or sets the diagonal down border. The property is of type [SpreadBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html).

- Fill properties
	

#### **Example 6: Format cells**
```csharp
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
```

In addition to the listed properties, the SpreadCellFormat class allows you to set a style to a cell. For more information on cell styles, check [this topic]({%slug radspreadstreamprocessing-features-styling-cell-styles%})

#### **Example 7: Set the value format to string, date or a number**

```csharp
	using (ICellExporter cell = row.CreateCellExporter())
	{
		SpreadCellFormat format = new SpreadCellFormat()
		{
			NumberFormat = "@",
			IsBold = true
		};
		cell.SetFormat(format);
		cell.SetValue("test");
	}

	using (ICellExporter cell = row.CreateCellExporter())
	{
		SpreadCellFormat format = new SpreadCellFormat()
		{
			NumberFormat = "dd/mm/yyyy",
			IsBold = true
		};
		cell.SetFormat(format);
		cell.SetValue(DateTime.Now.ToOADate());
	}

	using (ICellExporter cell = row.CreateCellExporter())
	{
		SpreadCellFormat format = new SpreadCellFormat()
		{
			NumberFormat = "#,##0.00",
			IsBold = true
		};
		cell.SetFormat(format);
		cell.SetValue(42370.12);
	}

```

A SpreadCellFormat instance could be applied on multiple cells. However, if a property of the format changes, the new settings will be applied to the cells formatted after the modification.

## Read a Cell

### Using ICellImporter

A concrete instance of ICellImporter could be obtained through the Cells collection of [IRowImporter]({%slug radspreadstreamprocessing-model-rows%}). **Example 8** demonstrates how you can read the cells of a row.

#### **Example 8: Create ICellImporter**

```csharp

	foreach (ICellImporter cell in rowImporter.Cells)
	{
		string value = cell.Value;

		SpreadCellFormat format = cell.Format;
		SpreadCellStyle style = cell.Format.CellStyle;
	}
```

The ICellImporter interface exposes the following properties:

* **RowIndex**: Gets the index of the row the cell appears in.
* **ColumnIndex**: Gets the index of the column the cell appears in.
* **Format**: Gets the formatting applied to the cell. The property is of type [SpreadCellFormat](https://docs.telerik.com/devtools/document-processing/api/telerik.documents.spreadsheetstreaming.spreadcellformat).
* **Value**: A string property that allows you get the value of the cell.
* **ValueType**: Gets the value type of the cell. This property is enumeration of type [CellValueType](https://docs.telerik.com/devtools/document-processing/api/telerik.documents.spreadsheetstreaming.cellvaluetype)



## See Also

* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
