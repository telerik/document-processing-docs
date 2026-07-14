---
title: Resizing Rows and Columns
description: Learn how to resize rows and columns in RadSpreadProcessing, including setting custom dimensions and using the autofit feature.
page_title: Resizing Rows and Columns
slug: radspreadprocessing-working-with-rows-and-columns-resizing
tags: resizing, rows, columns, spreadsheet, radspreadprocessing, width, height, autofit, xlsx, spread, workbook
published: True
position: 2
---

# Resizing Rows and Columns



Worksheets in the RadSpreadProcessing document model consist of cells organized in rows and columns. The API of the model allows you to set the width of each column and the height of each row. Additionally, you can choose to use the autofit feature that sizes the rows and columns based on their current content. The following sections demonstrate the different options for changing row height and column width.

## Row Height

The height of a row is retrieved and changed through an instance of type `RowHeight`. The class exposes two properties: `Value`, which holds the height of the row, and `IsCustom` that indicates whether the height is set by the user. If the `IsCustom` property is set to `false`, the row height changes automatically in certain cases, for example when you increase the font size of a cell that contains a number value and its content no longer fits in the available size. However, if you increase the font size and the `IsCustom` property is set to `true`, the row height does not change and part of the cell content stays hidden.
        

To change the row height, create a `RowSelection` instance that includes the rows to be resized. The `RowSelection` class exposes `GetHeight()`, `SetHeight()`, and `ClearHeight()` methods that are used to manipulate the height of the selected rows.
        

The `GetHeight()` method returns a `RangePropertyValue<RowHeight>` instance that holds information about the height of all selected rows. The object exposes two properties that indicate the value of `RowHeight` for the cell range:

| Property | Description |
|---|---|
| `IsIndeterminate` | Indicates whether the value of `RowHeight` is consistent among all rows in the specified `RowSelection`. If the `RowHeight` has one and the same value for all rows, `IsIndeterminate` is `false`. However, if the value varies throughout the rows, `IsIndeterminate` is `true` and `Value` returns the default `RowHeight`. |
| `Value` | Holds the actual `RowHeight`. If `IsIndeterminate` is `false`, `Value` contains the `RowHeight` for the whole `RowSelection` region. If `IsIndeterminate` is `true`, `Value` is set to its default value. |
            

The `SetHeight()` method changes the height of rows. It takes a single argument of type `RowHeight` which specifies the new height. The `ClearHeight()` method resets the `RowHeight` of the selected rows to the default height. The default row height can be manipulated through the `GetDefaultHeight()` and `SetDefaultHeight()` methods exposed by the `Rows` class.
        

**Example 1** shows how to get and change the height of several rows.
        

**Example 1: Read the current height of rows 6 through 8 and increase it by 50 DIPs**

<snippet id='codeblock-crq'/>



## Auto Fit Rows Height

The autofit feature offers a handy approach for resizing multiple rows so that each of them chooses a height that fits its content. To autofit the height of rows, create a `RowSelection` instance that contains the rows that need to be resized and invoke the `AutoFitHeight()` method of the `RowSelection` object. **Example 2** shows how to fit the height of rows with indexes 6, 7, and 8.
        

**Example 2: Auto-fit the height of rows 6 through 8**

<snippet id='codeblock-crr'/>

> The expected behavior when calling the `AutoFitHeight` method on a row that contains merged and wrapped cells is to set the default [RowHeight](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.rowheight) value instead of calculating the row height according to its content. To measure the cell content, you can check the methods exposed by the [LayoutHelper class](#layouthelper-class). 

## Columns Width

The width of a column is retrieved and changed through an instance of type `ColumnWidth`. The class exposes two properties: `Value`, which holds the width of the column, and `IsCustom` that indicates whether the width is set by the user. If the `IsCustom` property is set to `false`, the column width changes automatically in certain cases, for example when you increase the font size of a cell that contains a number value and its content no longer fits in the available size. However, if you increase the font size and the `IsCustom` property is set to `true`, the column width does not change and part of the cell content stays hidden.
        

To change the column width, create a `ColumnSelection` instance that includes the columns to be resized. The `ColumnSelection` class exposes `GetWidth()`, `SetWidth()`, and `ClearWidth()` methods that are used to manipulate the width of the selected columns.
        

The `GetWidth()` method returns a `RangePropertyValue<ColumnWidth>` instance that holds information about the width of all selected columns. The object exposes two properties that indicate the value of the property for the cell range:

| Property | Description |
|---|---|
| `IsIndeterminate` | Indicates whether the value of `ColumnWidth` is consistent among all columns in the specified `ColumnSelection`. If the `ColumnWidth` has one and the same value for all columns, `IsIndeterminate` is `false`. However, if the value varies throughout the columns, `IsIndeterminate` is `true` and `Value` returns the default value. |
| `Value` | Holds the actual `ColumnWidth`. If `IsIndeterminate` is `false`, `Value` contains the `ColumnWidth` for the whole `ColumnSelection` region. If `IsIndeterminate` is `true`, `Value` is set to its default value. |
            

The `SetWidth()` method changes the width of columns. It takes a single argument of type `ColumnWidth` that specifies the new width. The `ClearWidth()` method resets the `ColumnWidth` of the selected columns to the default width. The default column width can be manipulated through the `GetDefaultWidth()` and `SetDefaultWidth()` methods exposed by the `Columns` class.
        

**Example 3** shows how to get and change the width of several columns.
        

**Example 3: Read the current width of columns F through H and increase it by 50 DIPs**

<snippet id='codeblock-crs'/>

## Auto Fit Columns Width

The autofit feature offers a handy approach for resizing multiple columns so that each of them chooses a width that fits its content. To autofit the columns, create a `ColumnSelection` instance that holds the columns to be resized, and invoke its `AutoFitWidth()` method. **Example 4** shows how to fit the column width of columns F to H.
        

**Example 4: Auto-fit the width of columns F through H**

<snippet id='codeblock-crt'/>


Another way to auto fit column widths is to use the `ExpandToFitNumberValuesWidth()` method. It affects cells that contain only number values and have a `ColumnWidth` with `IsCustom` property set to `true`. **Example 5** demonstrates the alternative way to fit the column width.
        

**Example 5: Expand columns F through H to fit numeric values only**

<snippet id='codeblock-cru'/>

> The unit type used to set the width of the columns and the height of the rows in RadSpreadProcessing is [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.

### Telerik RadSpreadProcessing Compared to MS Excel 

 On the other hand, MS Excel uses its [own measurement unit](https://learn.microsoft.com/en-sg/office/troubleshoot/excel/determine-column-widths), so to convert between pixel and MS Excel width you can use the following methods of the `UnitHelper` class in combination with the `SetWidth()` method:

| Method | Description |
|---|---|
| `PixelWidthToExcelColumnWidth` | Converts column width in pixels to MS Excel column width. |
| `ExcelColumnWidthToPixelWidth` | Converts MS Excel column width to pixel width. |

**Example 6** shows how to convert and set from pixel to MS Excel column width.    

**Example 6: Convert a 57-pixel width to Excel column width and apply it to column A**

<snippet id='codeblock-crv'/>

**Example 7** shows how to convert and set from MS Excel to pixel column width.    

**Example 7: Convert an Excel width of 8.11 to pixels and apply it to column A**

<snippet id='codeblock-crw'/>

The row height in MS Excel is measured in points so to set them you can convert this unit and set the exact number you are passing to the `SetHeight()` method for the height using the `UnitHelper` class.


## LayoutHelper Class

The [LayoutHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.layout.layouthelper) class exposes the following methods that help to calculate the size of the page content:

| Method | Description |
|---|---|
| `CalculateCellContentSize` | Calculates the size of the cell content. |
| `CalculateCellLayoutBox` | Creates, arranges, and returns the cell layout box. |

**Example 8** shows how to get the size of the cell content.

**Example 8: Calculate the rendered content size of a single cell**

<snippet id='codeblock-crx'/>

**Example 9** shows how to get the cell layout box.

**Example 9: Calculate the layout box of a single cell**

<snippet id='codeblock-cry'/>

## See Also

* [LayoutHelper](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.layout.layouthelper)
