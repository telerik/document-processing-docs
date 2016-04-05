---
title: Formatting Cells
page_title: Formatting Cells
description: Formatting Cells
slug: radspreadstreamprocessing-features-styling-formatting-cells
tags: formatting, cell, styles
published: True
position: 1
---

# Cell Formats




# Cell Styles

A cell style is a predefined set of formatting options, such as cell borders, fonts, font sizes and number formats. Using cell styles allows you to apply multiple format options in one step and also offers an easy approach to achieve consistency in cell formatting. **RadSpreadStreamProcessing** offers a number of built-in cell styles that you can modify or apply directly. Its API allows you to duplicate an existing style or create a new one according to your preferences.

## Cell Style Properties

A cell style is represented by the **SpreadCellStyle** class. The properties of the class can be categorized in five groups: number, alignment, font, border and fill. Following are all properties distributed in their corresponding groups:

- Number group
	
	- **NumberFormat**: Gets or sets the number format.

- Alignment group
	
	- **HorizontalAlignment**: Gets or sets the horizontal alignment. The property is of type [SpreadHorizontalAlignment][API REF].
	
	- **VerticalAlignment**: Gets or sets the vertical alignment. The property is of type [SpreadVerticalAlignment][API REF].
	
	- **Indent**: Gets or sets the indent.
	
	- **WrapText**: Gets or sets a value indicating if the text in a cell should be line-wrapped within the cell.

- Font group
	
	- **ForeColor**: Gets or sets the fore color. The property is of type [SpreadThemableColor][API REF].
	
	- **FontFamily**: Gets or sets the font family. The property is of type [SpreadThemableFontFamily][API REF].
	
	- **FontSize**: Gets or sets the size of the font.
	
	- **IsBold**: Gets or sets a value indicating whether the text is bold.
	
	- **IsItalic**: Gets or sets a value indicating whether the text is italic.
	
	- **Underline**: Gets or sets the underline type. The property is of type [SpreadUnderlineType][API REF].

- Border group
	
	- **LeftBorder**: Gets or sets the left border. The property is of type [SpreadBorder][API REF].
	
	- **RightBorder**: Gets or sets the right border. The property is of type [SpreadBorder][API REF].
	
	- **TopBorder**: Gets or sets the top border. The property is of type [SpreadBorder][API REF].
	
	- **BottomBorder**: Gets or sets the bottom border. The property is of type [SpreadBorder][API REF].
	
	- **DiagonalUpBorder**: Gets or sets the diagonal up border. The property is of type [SpreadBorder][API REF].
		
	- **DiagonalDownBorder**: Gets or sets the diagonal down border. The property is of type [SpreadBorder][API REF].

- Fill group
	
	- **Fill**: Gets or sets the fill. The property could be of type [SpreadGradientFill][API REF] or [SpreadPatternFill][API REF].

In addition to the properties above, the SpreadCellStyle class exposes five Boolean properties that indicate whether the groups above will be applied:

- ApplyNumberFormat

- ApplyAlignment

- ApplyFont

- ApplyBorder

- ApplyFill

- ApplyProtection


When you apply a style to a cell with locally set properties, the end result is an addition of the style properties to the cell's local properties. The end result of such an addition of styles depends on which elements (groups) of the style have been selected as being part of the style. You can select a group to be part of the style by setting the appropriate property to *true*.

**Example 1** shows what applying the Number group looks like.

#### **[C#] Example 1: Get a built-in style and apply a number group**

{{region [ADD NAME]}}
	
	SpreadCellStyle style = workbook.CellStyles.GetByName("Good");
	style.ApplyNumberFormat = true;
{{endregion}}

Through the API you can add, modify or remove styles from the **CellStyles** collection of [IWorkbookExporter]({%slug %}).

## Create a Style

Creating a new style is pretty straight-forward. All you have to do is invoke the Add() method of workbook's CellStyles collection. The method returns an object of type SpreadCellStyle, which you can manipulate. 

#### **[C#] Example 2: Create SpreadCellStyle and apply it to a cell**

{{region [ADD NAME]}}

	SpreadBorder border = new SpreadBorder(SpreadBorderStyle.Thick, new SpreadThemableColor(new SpreadColor(255, 0, 0)));
	SpreadCellStyle style = workbook.CellStyles.Add("MyStyle");
	
	style.TopBorder = border;
	style.BottomBorder = border;
	style.DiagonalDownBorder = border;
	style.DiagonalUpBorder = border;
	style.LeftBorder = border;
	style.RightBorder = border;
	style.Fill = SpreadPatternFill.CreateSolidFill(new SpreadColor(255, 0, 0));
	style.FontFamily = new SpreadThemableFontFamily(SpreadThemeFontType.Major);
	style.FontSize = 22;
	style.ForeColor = new SpreadThemableColor(new SpreadColor(0, 255, 0));
	style.Underline = SpreadUnderlineType.DoubleAccounting;
	style.IsBold = true;
	style.IsItalic = true;
	style.HorizontalAlignment = SpreadHorizontalAlignment.Fill;
	style.Indent = 5;
	style.VerticalAlignment = SpreadVerticalAlignment.Top;
	style.WrapText = false;

	cell.SetFormat(new SpreadCellFormat() 
	{ 
	    CellStyle = style 
	});
{{endregion}}

## Modify a Style

Modifying a style is even easier than creating one. All you need to do is retrieve the style from the CellStyles collection and set the properties you need.

**Example 3** obtains the Bad style from the cell styles collection of a workbook and modifies it.

#### **[C#] Example 3: Modify a built-in style**

{{region [ADD NAME]}}

	SpreadCellStyle style = workbook.CellStyles.GetByName("Bad"); 
	style.IsBold = true;
{{endregion}}

## Remove a Style

Removing a style is as easy as removing an object from a list, you simply invoke the **Remove()** method, which returns a Boolean value. If such style exists in the collection, the method will return true.


#### **[C#] Example 4: Remove a built-in style**

{{region [ADD NAME]}}

	bool isRemoved = workbook.CellStyles.Remove("Bad"); 
{{endregion}}

# See Also

* Cells
* Workbook