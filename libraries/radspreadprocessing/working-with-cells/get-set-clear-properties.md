---
title: Get, Set and Clear Cell Properties
description: Learn how to get, set, and clear cell properties such as values, borders, fill, format, and styles in RadSpreadProcessing.
page_title: Get, Set and Clear Cell Properties
slug: radspreadprocessing-working-with-cells-get-set-clear-properties
tags: cells, spreadsheet, radspreadprocessing, properties, formatting, values, borders, fill, xlsx, spread, workbook
published: True
position: 4
---

# Get, Set and Clear Cell Properties



Cells are the atomic parts of a worksheet and its basic data units. Each cell can be assigned a value, borders, fill, format, style, and much more. The following sections describe the properties offered by cells and demonstrate how to retrieve and change them.

* [Get, Set and Clear Methods](#get,-set-and-clear-methods)

* [Cell Properties](#cell-properties)

* [Value Property](#value-property)

* [Borders Property](#borders-property)

* [Fill Property](#fill-property)

* [Indent Property](#indent-property)

## Get, Set and Clear Methods

To access cell properties, create a `CellSelection` object that contains the region of cells you want to change. For more information about retrieving `CellSelection` instances, see the [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) article.

**Example 1** creates a selection for cells in the range A1:F6.

**Example 1: Create CellSelection**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-1'/>



Once you have a `CellSelection` instance, you can set and retrieve the properties of its cells. Each property is manipulated through three methods that get, set, and clear the value of the property, respectively. Typically, the set methods take a single argument, which indicates the value to be set. Similarly, the clear methods have no parameters and reset the properties to their default values. The get methods, however, require more attention.

With one minor exception, the get methods of all cell properties return an object of type `RangePropertyValue<T>`. The class exposes two properties that indicate the value of the property for the cell range:

* `IsIndeterminate`: Indicates whether the value of the retrieved property is consistent among all cells in the specified `CellSelection`. If the property has one and the same value for all cells, `IsIndeterminate` is set to false. However, if the value of the retrieved property varies throughout the cells in the `CellSelection`, the `IsIndeterminate` property is set to true and the `Value` property of the `RangePropertyValue<T>` class is set to its default value.

* `Value`: Contains the value of the retrieved property. If the `IsIndeterminate` property is set to false, `Value` contains the value of the retrieved property for the whole `CellSelection` region. If the `IsIndeterminate` property is set to true, the `Value` property is set to its default value.
            

## Cell Properties

Cells in `RadSpreadProcessing` offer several properties that allow you to change their content and appearance. The following list outlines all cell properties:
        

* Value

* Border

* Fill

* FontFamily

* FontSize

* ForeColor

* Format

* HorizontalAlignment

* Indent

* IsBold

* IsItalic

* IsWrapped

* IsStrikethrough

* VerticalTextAlignment ((none, superscript, or subscript))

* StyleName

* Underline

* VerticalAlignment

* IsLocked

* TextRotation

As already mentioned, the `CellSelection` class exposes methods that get, set, and clear each of the properties listed previously. The names of the methods are constructed through the concatenation of the action the method executes (Get, Set, Clear) and the name of the property. For example, the methods that get, set, and clear the `IsBold` property are `GetIsBold()`, `SetIsBold()`, and `ClearIsBold()`.

**Example 2** illustrates how to use these methods on the region A1:F6.

**Example 2: Use GetIsBold(), SetIsBold() and ClearIsBold() Methods**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-2'/>

Using the previous approach you can set the value of almost all cell properties. There are a few exceptions to the general get, set, and clear rule, and each of them is described in one of the following sections.

>When using `GetFontSize()` and `SetFontSize()` methods, keep in mind that the measurement units used in `RadSpreadProcessing` are [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert them to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class. For more information, go to the [Measurement Units]({%slug radspreadprocessing-working-with-rows-and-columns-resizing%}#measurement-units) help topic.
 
**Example 3** demonstrates how to apply basic text formatting to worksheet cells. The first cell applies a strikethrough effect, while the following cells illustrate vertical text alignment by rendering text as superscript and subscript respectively.

**Example 3: Using SetIsStrikethrough and SetVerticalTextAlignment**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-3'/>

<img style="border: 1px solid gray;" src="images/set-strikethrough-superscript-subscript-text.png" alt="Set Strikethrough Superscript Subscript-text" /> 

## Value Property

The `Value` property uses an instance of `ICellValue` to retrieve and change its value. The property supports the following types of cell values, all of which conform to the `ICellValue` interface: *EmptyCellValue*, *NumberCellValue*, *BooleanCellValue*, *TextCellValue*, *FormulaCellValue*. Similarly to the other properties, `Value` has three methods that control the property: `GetValue()`, `SetValue()`, and `ClearValue()`. For more information about different value types, see the [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%}) article.

The `GetValue()` method retrieves the value of the property and returns an instance of `RangePropertyValue<ICellValue>`. The `Value` property of the `RangePropertyValue` instance returns the actual value of the selected region.

**Example 4** illustrates how to retrieve the value of cell B2.

**Example 4: Retrieve Value of Cell**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-4'/>



As the document model supports different types of cell values, the `CellSelection` class offers multiple overloads of the `SetValue()` method that allow you to produce different types of values. For example, if you choose the method that accepts a double instance, the `Value` of the cell is an instance of `NumberCellValue`. The `SetValue()` method has three more overloads that take `DateTime`, string, and `ICellValue`, respectively.

**Example 5** demonstrates how to set the value of a given selection.

**Example 5: Set Value of CellSelection**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-5'/>



## Borders Property

The `Borders` property uses a `CellBorders` object for getting and setting its property value. The `CellBorders` class contains eight instances of type `CellBorder` that describe respectively the left, top, right, bottom, inside horizontal, inside vertical, diagonal up, and diagonal down borders. In turn, the `CellBorder` object holds information about the style and color of the border. The `GetBorders()` method returns an instance of `RangePropertyValue<CellBorders>`.

**Example 6** demonstrates how to set the value of the Borders of the regions B2:C4 and E2:F4.

**Example 6: Set Value of Borders**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-6'/>



The result of **Example 6** is demonstrated in the following figure.

#### Figure 1: Resulting Borders
![Rad Spread Processing Working With Cells Get Set Clear Properties 01](images/RadSpreadProcessing_Working_With_Cells_Get_Set_Clear_Properties_01.png)

## Fill Property

The `Fill` property uses an `IFill` object for getting and setting its property value. The document model supports two types of fills represented through the `PatternFill` and `GradientFill` classes, both of which conform to the `IFill` interface.

As its name suggests, the `PatternFill` object fills the background of a region of cells using a repeated pattern of shapes. To create a `PatternFill` instance, specify the type of the pattern, the background color, and the pattern color of the fill. You can choose between [eighteen types of patterns](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.PatternType.html), such as HorizontalStripe, DiagonalCrossHatch, Gray75Percent, and many more. The `PatternFill` object also allows you to set the background of a cell to a solid color.

**Example 7** creates two `PatternFill` objects with a DiagonalStripe and Solid PatternType respectively.

**Example 7: Create and Set PatternFill**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-7'/>



The result of **Example 7** is illustrated in the following figure.

#### Figure 2: Applied PatternFill
![Rad Spread Processing Working With Cells Get Set Clear Properties 02](images/RadSpreadProcessing_Working_With_Cells_Get_Set_Clear_Properties_02.png)

The `GradientFill` sets the background of a region of cells to a gradual blending of two colors. To create a `GradientFill`, specify a [GradientType](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.GradientType.html) and the two colors that blend.

**Example 8** assigns the region A1:F1 a smooth horizontal green gradient.

**Example 8: Create and Set GradientFill**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-8'/>



The result of **Example 8** is illustrated in the following figure.

#### Figure 3: Applied GradientFill
![Rad Spread Processing Working With Cells Get Set Clear Properties 03](images/RadSpreadProcessing_Working_With_Cells_Get_Set_Clear_Properties_03.png)

## Indent Property

In addition to the `GetIndent()`, `SetIndent()`, and `ClearIndent()` methods, `CellSelection` offers two more methods that increase and decrease the value of the `Indent` property. Those methods are `IncreaseIndent()` and `DecreaseIndent()` and neither of them takes arguments. **Example 9** shows how to use the methods.

**Example 9: Increase and Decrease Indent**

<snippet id='libraries-spread-working-with-cells-get-set-clear-properties-9'/>



## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
* [Cell Value Types]({%slug radspreadprocessing-working-with-cells-cell-value-types%})
* [PatternType Enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.PatternType.html)
* [GradientType Enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Spreadsheet.Model.GradientType.html)
