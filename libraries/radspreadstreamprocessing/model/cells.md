---
title: Cells
description: Learn about cells in RadSpreadStreamProcessing, including how to define and configure cell content and properties.
page_title: Cells
slug: radspreadstreamprocessing-model-cells
tags: cells, spread, stream, processing, spreadsheet, model, content, properties, row, worksheet
published: True
position: 5
---

# Cells

A cell is the basic data unit in a worksheet. The following sections describe how to export and import cells using `RadSpreadStreamProcessing`.


## What Is a Cell

A cell is the basic data unit in a worksheet. Cells are organized in rows and columns and can also be referred to as an intersection point of a column and a row. Cells are identified by a letter and number combination that indicates the letter of their column and the number of their row. For example, the top left cell is referred to as A1 and the bottom right cell is XFD1048576.

## ICellExporter and ICellImporter Interface

In `RadSpreadStreamProcessing`, a cell can be exported through the [`ICellExporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.ICellExporter.html). It defines several methods that allow you to set different values and formats to a cell.

If you need to read the cell data and its properties, use the [`ICellImporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.ICellImporter.html).

## Using ICellExporter

You can create a concrete instance of `ICellExporter` through the `CreateCellExporter()` method of [IRowExporter]({%slug radspreadstreamprocessing-model-rows%}). **Example 1** demonstrates how to add a cell to a row.


**Example 1: Using ICellExporter**


<snippet id='codeblock-dle'/>

>`ICellExporter` inherits from [IDisposable](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.


### Set a Value

With `ICellExporter` you can set different values to a cell and modify its format.

The `SetValue()` method exposes several overloads that allow you to set values from the following types:

* `string`
* `double`
* `bool`
* `DateTime`

> To visualize a value as a date or time, you need to set an appropriate number format of the cell. Otherwise, it is treated as a number.

**Example 2: Setting a Value to a Cell**

<snippet id='codeblock-dlf'/>


### Set a Formula

To allow you to set a formula as a value of a cell, `ICellExporter` defines the `SetFormula()` method. This method accepts a string that represents the formula as a parameter. **Example 4** shows how to use it.

**Example 4: Setting a Formula to a Cell**

<snippet id='codeblock-dlg'/>


>All formulas must be set in `InvariantCulture`. For example, the decimal separator must be ".", and the list separator must be ",".


### Skip Cells

The cells in a document are exported one by one from left to right starting from the one with index [0, 0] or, in other words, A1. To export a cell with a bigger index, you need to export all the previous cells or skip them.

In some cases you may need to skip several cells and start filling the data in the next one. The [`IRowExporter`]({%slug radspreadstreamprocessing-model-rows%}) interface declares a method that allows you to implement such a scenario. **Example 3** shows how to skip 5 cells and set a value and a vertical alignment to the sixth one.

**Example 3: Skip Cells**

<snippet id='codeblock-dlh'/>

### Merge Cells

**Example 5** shows how to merge several cells into a single one through [IWorksheetExporter]({%slug  radspreadstreamprocessing-model-worksheet%}).

**Example 5: Merge Cells**

<snippet id='codeblock-dli'/>

>important Due to the importance of the order the content is inserted in a document, the Merge operation must be the last operation before disposing `IWorksheetExporter`.

>The merged cell range has the formatting and value of the top left cell of the range.

### Set a Format

Another method exposed by `ICellExporter`—`SetFormat()`—enables you to change the appearance of a cell. The `SetFormat()` method accepts an argument of type [`SpreadCellFormat`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadCellFormat.html). The following table describes the properties exposed by `SpreadCellFormat`:

| Property | Description |
|---|---|
| `NumberFormat` | Gets or sets the number format. |
| `HorizontalAlignment` | Gets or sets the horizontal alignment. Of type [`SpreadHorizontalAlignment`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadHorizontalAlignment.html). |
| `VerticalAlignment` | Gets or sets the vertical alignment. Of type [`SpreadVerticalAlignment`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadVerticalAlignment.html). |
| `Indent` | Gets or sets the indent. |
| `WrapText` | Gets or sets a value indicating whether the text in a cell is line-wrapped within the cell. |
| `ForeColor` | Gets or sets the fore color. Of type [`SpreadThemableColor`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableColor.html). |
| `FontFamily` | Gets or sets the font family. Of type [`SpreadThemableFontFamily`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadThemableFontFamily.html). |
| `FontSize` | Gets or sets the size of the font. |
| `IsBold` | Gets or sets a value indicating whether the text is bold. |
| `IsItalic` | Gets or sets a value indicating whether the text is italic. |
| `Underline` | Gets or sets the underline type. Of type [`SpreadUnderlineType`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadUnderlineType.html). |
| `LeftBorder` | Gets or sets the left border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |
| `RightBorder` | Gets or sets the right border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |
| `TopBorder` | Gets or sets the top border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |
| `BottomBorder` | Gets or sets the bottom border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |
| `DiagonalUpBorder` | Gets or sets the diagonal up border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |
| `DiagonalDownBorder` | Gets or sets the diagonal down border. Of type [`SpreadBorder`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadBorder.html). |

**Example 6: Format Cells**

<snippet id='codeblock-dlj'/>

In addition to the listed properties, the `SpreadCellFormat` class allows you to set a style to a cell. For more information on cell styles, see the [Cell Styles]({%slug radspreadstreamprocessing-features-styling-cell-styles%}) topic.

**Example 7: Set the Value Format to String, Date, or a Number**

<snippet id='codeblock-dlk'/>

You can apply a `SpreadCellFormat` instance on multiple cells. However, if a property of the format changes, the new settings apply to the cells formatted after the modification.

## Read a Cell

### Using ICellImporter

You can get a concrete instance of `ICellImporter` through the `Cells` collection of [IRowImporter]({%slug radspreadstreamprocessing-model-rows%}). **Example 8** demonstrates how to read the cells of a row.

**Example 8: Create ICellImporter**

<snippet id='codeblock-dll'/>

The `ICellImporter` interface exposes the following properties:

| Property | Description |
|---|---|
| `RowIndex` | Gets the index of the row the cell appears in. |
| `ColumnIndex` | Gets the index of the column the cell appears in. |
| `Format` | Gets the formatting applied to the cell. Of type [`SpreadCellFormat`](https://docs.telerik.com/devtools/document-processing/api/telerik.documents.spreadsheetstreaming.spreadcellformat). |
| `Value` | A string property that allows you to get the value of the cell. |
| `ValueType` | Gets the value type of the cell. Of type [`CellValueType`](https://docs.telerik.com/devtools/document-processing/api/telerik.documents.spreadsheetstreaming.cellvaluetype). |



## See Also

* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
