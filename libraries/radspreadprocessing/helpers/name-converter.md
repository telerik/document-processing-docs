---
title: Name Converter
description: Learn how to use the NameConverter utility class in RadSpreadProcessing to convert between cell names and index-based references.
page_title: Name Converter
slug: radspreadprocessing-name-converter
tags: name, converter, cells, spreadsheet, radspreadprocessing, index, reference, utility, conversion
published: True
position: 0
---

# Name Converter

The [NameConverter](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.utilities.nameconverter) is a static class that provides methods for name conversion (for example, converting cell names to indexes and vice versa).

## Methods

The following table lists the available methods:

| Method | Description |
|---|---|
| [`ConvertRowIndexToName`](#convert-row-index-to-name) | Converts the row index to a name. |
| [`ConvertRowNameToIndex`](#convert-row-name-to-index) | Converts the row name to an index. |
| [`ConvertColumnIndexToName`](#convert-column-index-to-name) | Converts the column index to a name. |
| [`ConvertColumnNameToIndex`](#convert-column-name-to-index) | Converts the column name to an index. |
| [`ConvertCellIndexToName`](#convert-cell-index-to-name) | Converts the cell index to a name. |
| [`TryConvertNamesToCellReferenceRangeExpression`](#try-convert-names-to-cell-reference-range-expression) | Tries to convert the cell range names to cell reference ranges. |
| [`ConvertCellReferenceToName`](#convert-cell-reference-to-name) | Converts the cell reference to a name. |
| [`ConvertCellRangeToName`](#convert-cell-range-to-name) | Converts the cell range to a name. |
| [`TryConvertNameToCellRange`](#try-convert-name-to-cell-range) | Tries to convert the name to a cell range. |
| [`ConvertCellIndexesToName`](#convert-cell-indexes-to-name) | Converts the cell indexes to a name. |
| [`ConvertCellNameToIndex`](#convert-cell-name-to-index) | Converts the cell name to a cell index. |
| [`TryConvertCellNameToIndex`](#try-convert-cellName-to-index) | Tries to convert the cell name to an index. |
| [`IsValidA1CellName`](#is-valid-a1-cell-name) | Determines whether the name of the cell is valid. |

### Convert Row Index to Name

The `ConvertRowIndexToName` method converts the row index to a name.

**Example 1: Convert row index 0 to its worksheet row name**

<snippet id='codeblock-cph'/>

### Convert Row Name to Index

The `ConvertRowNameToIndex` method converts the row name to an index.

**Example 2: Convert row name 1 to its zero-based row index**

<snippet id='codeblock-cpi'/>

### Convert Column Index to Name

The `ConvertColumnIndexToName` method converts the column index to a name.

**Example 3: Convert column index 0 to its worksheet column name**

<snippet id='codeblock-cpj'/>

### Convert Column Name to Index

The `ConvertColumnNameToIndex` method converts the column name to an index.

**Example 4: Convert column name A to its zero-based column index**

<snippet id='codeblock-cpk'/>

### Convert Cell Index to Name

The `ConvertCellIndexToName` method converts the cell index to a name. This method exposes two overloads.

**Example 5: Convert a CellIndex for row 0, column 0 to cell name A1**

<snippet id='codeblock-cpl'/>

**Example 6: Convert row 0 and column 0 directly to cell name A1**

<snippet id='codeblock-cpm'/>

### Try Convert Names to Cell Reference Range Expression

The `TryConvertNamesToCellReferenceRangeExpression` method tries to convert the cell range names to cell reference ranges.

**Example 7: Convert the range name A1:F11 to a CellReferenceRangeExpression**

<snippet id='codeblock-cpn'/>

### Convert Cell Reference to Name

The `ConvertCellReferenceToName` method converts the cell reference to a name.

**Example 8: Convert the from and to cell references from a range expression back to names**

<snippet id='codeblock-cpo'/>

### Convert Cell Range to Name

The `ConvertCellRangeToName` method converts the cell range to a name.

**Example 9: Convert two CellIndex values into the range name A1:F11**

<snippet id='codeblock-cpp'/>

### Try Convert Name to Cell Range

The `TryConvertNameToCellRange` method converts the name to a cell range.

**Example 10: Convert the range name A1:F11 back to a CellRange**

<snippet id='codeblock-cpq'/>

### Convert Cell Indexes to Name

The `ConvertCellIndexesToName` method converts the cell indexes to a name.

**Example 11: Convert four cell indexes directly into the range name A1:F11**

<snippet id='codeblock-cpr'/>

### Convert Cell Name to Index

The `ConvertCellNameToIndex` method converts the cell name to a cell index. This method exposes two overloads.

**Example 12: Convert cell name A1 to row and column indexes**

<snippet id='codeblock-cps'/>

**Example 13: Convert cell name A1 and capture absolute row and column flags**

<snippet id='codeblock-cpt'/>

### Try Convert Cell Name to Index

The `TryConvertCellNameToIndex` method tries to convert the cell name to an index. This method exposes two overloads.

**Example 14: Try to convert cell name A1 to row and column indexes**

<snippet id='codeblock-cpu'/>

**Example 15: Try to convert cell name A1 and capture absolute row and column flags**

<snippet id='codeblock-cpv'/>

### Is Valid A1 Cell Name

The `IsValidA1CellName` method determines whether the name of the cell is valid.

**Example 16: Check whether B2 is a valid A1-style cell name**

<snippet id='codeblock-cpw'/>

## See Also

* [Performance Tips and Tricks]({%slug radspreadprocessing-performance%})
