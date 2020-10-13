---
title: Name Converter
page_title: Name Converter
description: Name Converter
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
* **[ConvertCellIndexesToName](#convert-cell-indexes-to-name)**: Converts the cell indexes to a name.
* **[ConvertCellNameToIndex](#convert-cell-name-to-index)**: Converts the cell name to a cell index.
* **[TryConvertCellNameToIndex](#try-convert-cellName-to-index)**: Tries to convert the cell name to index.
* **[IsValidA1CellName](#is-valid-a1-cell-name)**: Determines whether the name of the cell is valid.

### Convert Row Index to Name
**ConvertRowIndexToName** method converts the row index to name.
#### __[C#] Example 1:__

{{region radspreadprocessing-name-converter_0}}

    int rowIndex = 0;
    string rowName = NameConverter.ConvertRowIndexToName(rowIndex);
{{endregion}}

### Convert Row Name to Index
**ConvertRowNameToIndex** method converts the row name to index.
#### __[C#] Example 2:__

{{region radspreadprocessing-name-converter_1}}

    string rowName = "1";
    int rowIndex = NameConverter.ConvertRowNameToIndex(rowName);
{{endregion}}

### Convert Column Index to Name
**ConvertColumnIndexToName** method converts the column index to name.
#### __[C#] Example 3:__

{{region radspreadprocessing-name-converter_2}}

    int columnIndex = 0;
    string columnName = NameConverter.ConvertColumnIndexToName(columnIndex);
{{endregion}}

### Convert Column Name to Index
**ConvertColumnNameToIndex** converts the column name to index.
#### __[C#] Example 4:__

{{region radspreadprocessing-name-converter_3}}

    string columnName = "A";
    int columnIndex = NameConverter.ConvertColumnNameToIndex(columnName);
{{endregion}}

### Convert Cell Index to Name
**ConvertCellIndexToName** method converts the cell index to name. This method exposes two overloads.
#### __[C#] Example 5: first overload__

{{region radspreadprocessing-name-converter_4}}

    CellIndex cellIndex = new CellIndex(rowIndex: 0, columnIndex: 0);
    string cellName = NameConverter.ConvertCellIndexToName(cellIndex);
{{endregion}}

#### __[C#] Example 5: second overload__
{{region radspreadprocessing-name-converter_5}}

    string cellName = NameConverter.ConvertCellIndexToName(rowIndex: 0, columnIndex: 0);
{{endregion}}

### Try Convert Names to Cell Reference Range Expression
**TryConvertNamesToCellReferenceRangeExpression** method tries to convert the cell ranges names to cell reference ranges.
#### __[C#] Example 6:__

{{region radspreadprocessing-name-converter_6}}
    
    string cellRangesName = "A1:F11";
    Worksheet worksheet = workbook.ActiveWorksheet;
    int rowIndex = 0;
    int columnIndex = 0;
    CellReferenceRangeExpression expression;
    bool isConversionToCellReferenceRangeExpressionSuccessful = NameConverter.TryConvertNamesToCellReferenceRangeExpression(cellRangesName, worksheet, rowIndex, columnIndex, out expression);
{{endregion}}

### Convert Cell Reference to Name
**ConvertCellReferenceToName** method converts the cell reference to name.
#### __[C#] Example 7:__

{{region radspreadprocessing-name-converter_7}}

    CellReference fromCellReference = cellReferenceRangeExpression.CellReferenceRange.FromCellReference;
    string fromCellReferenceName = NameConverter.ConvertCellReferenceToName(fromCellReference);

    CellReference toCellReference = cellReferenceRangeExpression.CellReferenceRange.ToCellReference;
    string toCellReferenceName = NameConverter.ConvertCellReferenceToName(toCellReference);
{{endregion}}

### Convert Cell Range to Name
**ConvertCellRangeToName** method converts the cell range to a name.
#### __[C#] Example 8:__

{{region radspreadprocessing-name-converter_8}}

    CellIndex fromIndex = new CellIndex(rowIndex: 0, columnIndex: 0);
    CellIndex toIndex = new CellIndex(rowIndex: 10, columnIndex: 5);
    string cellRangeName = NameConverter.ConvertCellRangeToName(fromIndex, toIndex);
{{endregion}}


### Convert Cell Indexes to Name
**ConvertCellIndexesToName** method converts the cell indexes to a name.
#### __[C#] Example 9:__

{{region radspreadprocessing-name-converter_9}}

    string cellRangeName = NameConverter.ConvertCellIndexesToName(fromRowIndex: 0, fromColumnIndex: 0, toRowIndex: 10, toColumnIndex: 5);
{{endregion}}

### Convert Cell Name to Index
**ConvertCellNameToIndex** method converts the cell name to a cell index. This method exposes two overloads.
#### __[C#] Example 10: first overload__

{{region radspreadprocessing-name-converter_10}}

    string cellName = "A1";
    int rowIndex;
    int columnIndex;
    NameConverter.ConvertCellNameToIndex(cellName, out rowIndex, out columnIndex);
{{endregion}}

#### __[C#] Example 10: second overload__
{{region radspreadprocessing-name-converter_11}}

    string cellName = "A1";
    int rowIndex;
    bool isRowAbsolute;
    int columnIndex;
    bool isColumnAbsolute;
    NameConverter.ConvertCellNameToIndex(cellName, out isRowAbsolute, out rowIndex, out isColumnAbsolute, out columnIndex);
{{endregion}}

### Try Convert Cell Name to Index
**TryConvertCellNameToIndex** method tries to convert the cell name to index. This method exposes two overloads.
#### __[C#] Example 11: first overload__
{{region radspreadprocessing-name-converter_12}}

    string cellName = "A1";
    int rowIndex;
    int columnIndex;
    bool isConversionSuccessful = NameConverter.TryConvertCellNameToIndex(cellName, out rowIndex, out columnIndex);
{{endregion}}

#### __[C#] Example 11: second overload__
{{region radspreadprocessing-name-converter_13}}
 
    string cellName = "A1";
    int rowIndex;
    bool isRowAbsolute;
    int columnIndex;
    bool isColumnAbsolute;
    bool isConversionSuccessful = NameConverter.TryConvertCellNameToIndex(cellName, out isRowAbsolute, out rowIndex, out isColumnAbsolute, out columnIndex);
{{endregion}}


### Is Valid A1 Cell Name
**IsValidA1CellName** method determines whether the name of the cell is valid.
#### __[C#] Example 12:__

{{region radspreadprocessing-name-converter_14}}

    string cellName = "B2";
    bool isValidCellName= NameConverter.IsValidA1CellName(cellName);
{{endregion}}

## See Also

* [Performance Tips and Tricks]({%slug radspreadprocessing-performance%})
