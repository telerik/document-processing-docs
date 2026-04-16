---
title: Cell Styles
description: Learn how to create, apply, and modify cell styles in RadSpreadProcessing to apply consistent formatting to spreadsheet cells.
page_title: Cell Styles
slug: radspreadprocessing-features-styling-cell-styles
tags: cell,styles
published: True
position: 0
---

# Cell Styles



A cell style is a predefined set of formatting options, such as cell borders, fonts, font sizes and number formats. Using cell styles allows you to apply multiple format options in one step and also offers an easy approach to achieve consistency in cell formatting. The document model has a number of built-in cell styles that you can modify or apply directly. Its API allows you to duplicate an existing style or create a new one according to your preferences.
      

>You can create cell styles that depend on the current document theme. Such styles are updated automatically when you change the selected document theme. You can read more about document themes and dependent cell styles in the [Document Themes]({%slug radspreadprocessing-features-styling-document-themes%}) article.
        

## Cell Style Properties

A cell style is represented by the __CellStyle__ class. The properties of the class can be categorized into five groups: number, alignment, font, border and fill. Following are all properties distributed in their corresponding groups:
        

* Number group

	* Format

* Alignment group

	* HorizontalAlignment

	* VerticalAlignment

	* Indent

	* IsWrapped

	* TextRotation (supported in **XLSX** format only)

* Font group

	* FontFamily
	
	* FontSize
	
	* IsBold
	
	* IsItalic
	
	* Underline
	
	* ForeColor

* Border group

	* LeftBorder
	
	* TopBorder
	
	* RightBorder
	
	* BottomBorder
	
	* DiagonalUpBorder
	
	* DiagonalDownBorder

* Fill group

	* Fill

In addition to the properties above, the __CellStyle__ class exposes five Boolean properties that indicate whether the groups above will be applied:
        

* IncludeNumber

* IncludeAlignment

* IncludeFont

* IncludeBorder

* IncludeFill

When you apply a style to a cell with locally set properties, the end result is an addition of the style properties to the cell's local properties. The end result of such an addition of styles depends on which elements (groups) of the style have been selected as being part of the style. You can select a group to be part of the style by setting the appropriate property to *true*.
        

__Example 1__ shows what including the __Number__ group looks like.
        

#### __Example 1: Include Number group in CellStyle__

<snippet id='codeblock-cng'/>



Through the API you can add, modify or remove styles from the __Styles__ collection residing in the worksheet.
        

## Create Cell Style

Creating a new style is pretty straight-forward. All you have to do is invoke the __Add()__ method of workbook's __Styles__ collection. The method returns an object of type __CellStyle__, which you can manipulate. Note that setting several properties raises multiple UI updates. To avoid the additional overhead, you can enclose the code blocks that set the properties with the __BeginUpdate()__ and __EndUpdate()__ methods.
        

__Example 2__ creates a new style and applies it to cell *A1*.
        

#### __Example 2: Create a style__

<snippet id='codeblock-cnh'/>



## Modify Cell Style

Modifying a style is even easier than creating one. All you need to do is retrieve the style from the __Styles__ collection and set the properties you need.


__Example 3__ obtains the *Bad* style from the styles collection of a workbook and modifies it.


#### __Example 3: Modify a style__

<snippet id='codeblock-cni'/>

## Copy Existing Cell Style

The API enables you to copy the properties of an existing style so you can modify it according to your preferences while keeping the original style untouched.

#### __Example 4: Copy an existing style and modify its properties__

<snippet id='codeblock-cnj'/>

## Remove Cell Style

You can also remove a style from the __Styles__ collection. It is as easy as removing an object from a list, you simply invoke the __Remove()__ method, which returns a Boolean value. If such style exist in the collection, the method will return *true*.
        
#### __Example 5: Remove a style__

<snippet id='codeblock-cnk'/>



## See Also

 * [Document Themes]({%slug radspreadprocessing-features-styling-document-themes%})
 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [Retrieving Themable Cell Color in RadSpreadProcessing]({%slug retrieve-cell-color-radspreadprocessing%})
 * [Preventing Excel From Extending Cell Formatting Below Formatted Range Using SpreadProcessing]({%slug preventing-cell-formatting-extension-spreadprocessing%})
