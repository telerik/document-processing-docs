---
title: Name Converter
page_title: Name Converter
slug: radspreadprocessing-name-converter
tags: convert,name,index
published: True
position: 0
---

# Name Converter

The [NameConverter](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.utilities.nameconverter) is a static class that provides methods for name conversion (e.g. converting cell names to indexes and vice versa).

## Methods

* **[ConvertRowIndexToName](#convert-row-index-to-name)**: Converts the row index to name.
* **[ConvertRowNameToIndex](#convert-row-name-to-index)**: Converts the row name to index.
* **[ConvertColumnIndexToName](#convert-column-index-to-name)**: Converts the column index to name.
* **[ConvertColumnNameToIndex](#convert-column-name-to-index)**: Converts the column name to index.
* **[ConvertCellIndexToName](#convert-cell-index-to-name)**: Converts the cell index to name.
* **[TryConvertNamesToCellReferenceRangeExpression](#try-convert-names-to-cell-reference-range-expression)**: Tries to convert the cell ranges names to cell reference ranges.
* **[ConvertCellReferenceToName](#convert-cell-reference-to-name)**: Converts the cell reference to name.
* **[ConvertCellRangeToName](#convert-cell-range-to-name)**: Converts the cell range to a name.
* **[TryConvertNameToCellRange](#try-convert-name-to-cell-range)**: Tries to convert the name to a cell range. 
* **[ConvertCellIndexesToName](#convert-cell-indexes-to-name)**: Converts the cell indexes to a name.
* **[ConvertCellNameToIndex](#convert-cell-name-to-index)**: Converts the cell name to a cell index.
* **[TryConvertCellNameToIndex](#try-convert-cellName-to-index)**: Tries to convert the cell name to index.
* **[IsValidA1CellName](#is-valid-a1-cell-name)**: Determines whether the name of the cell is valid.

### Convert Row Index to Name
**ConvertRowIndexToName** method converts the row index to name.
#### __Example 1:__

<snippet id='codeblock-cph'/>

### Convert Row Name to Index
**ConvertRowNameToIndex** method converts the row name to index.
#### __Example 2:__

<snippet id='codeblock-cpi'/>

### Convert Column Index to Name
**ConvertColumnIndexToName** method converts the column index to name.
#### __Example 3:__

<snippet id='codeblock-cpj'/>

### Convert Column Name to Index
**ConvertColumnNameToIndex** converts the column name to index.
#### __Example 4:__

<snippet id='codeblock-cpk'/>

### Convert Cell Index to Name
**ConvertCellIndexToName** method converts the cell index to name. This method exposes two overloads.
#### __Example 5: first overload__

<snippet id='codeblock-cpl'/>

#### __Example 5: second overload__
<snippet id='codeblock-cpm'/>

### Try Convert Names to Cell Reference Range Expression
**TryConvertNamesToCellReferenceRangeExpression** method tries to convert the cell ranges names to cell reference ranges.
#### __Example 6:__

<snippet id='codeblock-cpn'/>

### Convert Cell Reference to Name
**ConvertCellReferenceToName** method converts the cell reference to name.
#### __Example 7:__

<snippet id='codeblock-cpo'/>

### Convert Cell Range to Name
**ConvertCellRangeToName** method converts the cell range to a name.
#### __Example 8:__

<snippet id='codeblock-cpp'/>


### Try Convert Name to Cell Range
**TryConvertNameToCellRange** method converts the name to a cell range. 
#### __Example 9:__

<snippet id='codeblock-cpq'/>

### Convert Cell Indexes to Name
**ConvertCellIndexesToName** method converts the cell indexes to a name.
#### __Example 10:__

<snippet id='codeblock-cpr'/>

### Convert Cell Name to Index
**ConvertCellNameToIndex** method converts the cell name to a cell index. This method exposes two overloads.
#### __Example 11: first overload__

<snippet id='codeblock-cps'/>

#### __Example 11: second overload__
<snippet id='codeblock-cpt'/>

### Try Convert Cell Name to Index
**TryConvertCellNameToIndex** method tries to convert the cell name to index. This method exposes two overloads.
#### __Example 12: first overload__
<snippet id='codeblock-cpu'/>

#### __Example 12: second overload__
<snippet id='codeblock-cpv'/>


### Is Valid A1 Cell Name
**IsValidA1CellName** method determines whether the name of the cell is valid.
#### __Example 13:__

<snippet id='codeblock-cpw'/>

## See Also

* [Performance Tips and Tricks]({%slug radspreadprocessing-performance%})
