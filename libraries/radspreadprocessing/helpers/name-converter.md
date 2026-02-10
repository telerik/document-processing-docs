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

```csharp

    int rowIndex = 0;
    string rowName = NameConverter.ConvertRowIndexToName(rowIndex);
```

### Convert Row Name to Index
**ConvertRowNameToIndex** method converts the row name to index.
#### __Example 2:__

```csharp

    string rowName = "1";
    int rowIndex = NameConverter.ConvertRowNameToIndex(rowName);
```

### Convert Column Index to Name
**ConvertColumnIndexToName** method converts the column index to name.
#### __Example 3:__

```csharp

    int columnIndex = 0;
    string columnName = NameConverter.ConvertColumnIndexToName(columnIndex);
```

### Convert Column Name to Index
**ConvertColumnNameToIndex** converts the column name to index.
#### __Example 4:__

```csharp

    string columnName = "A";
    int columnIndex = NameConverter.ConvertColumnNameToIndex(columnName);
```

### Convert Cell Index to Name
**ConvertCellIndexToName** method converts the cell index to name. This method exposes two overloads.
#### __Example 5: first overload__

```csharp

    CellIndex cellIndex = new CellIndex(rowIndex: 0, columnIndex: 0);
    string cellName = NameConverter.ConvertCellIndexToName(cellIndex);
```

#### __Example 5: second overload__
```csharp

    string cellName = NameConverter.ConvertCellIndexToName(rowIndex: 0, columnIndex: 0);
```

### Try Convert Names to Cell Reference Range Expression
**TryConvertNamesToCellReferenceRangeExpression** method tries to convert the cell ranges names to cell reference ranges.
#### __Example 6:__

```csharp
    
    string cellRangesName = "A1:F11";
    Worksheet worksheet = workbook.ActiveWorksheet;
    int rowIndex = 0;
    int columnIndex = 0;
    CellReferenceRangeExpression expression;
    bool isConversionToCellReferenceRangeExpressionSuccessful = NameConverter.TryConvertNamesToCellReferenceRangeExpression(cellRangesName, worksheet, rowIndex, columnIndex, out expression);
```

### Convert Cell Reference to Name
**ConvertCellReferenceToName** method converts the cell reference to name.
#### __Example 7:__

```csharp

    CellReference fromCellReference = cellReferenceRangeExpression.CellReferenceRange.FromCellReference;
    string fromCellReferenceName = NameConverter.ConvertCellReferenceToName(fromCellReference);

    CellReference toCellReference = cellReferenceRangeExpression.CellReferenceRange.ToCellReference;
    string toCellReferenceName = NameConverter.ConvertCellReferenceToName(toCellReference);
```

### Convert Cell Range to Name
**ConvertCellRangeToName** method converts the cell range to a name.
#### __Example 8:__

```csharp

    CellIndex fromIndex = new CellIndex(rowIndex: 0, columnIndex: 0);
    CellIndex toIndex = new CellIndex(rowIndex: 10, columnIndex: 5);
    string cellRangeName = NameConverter.ConvertCellRangeToName(fromIndex, toIndex);
```


### Try Convert Name to Cell Range
**TryConvertNameToCellRange** method converts the name to a cell range. 
#### __Example 9:__

```csharp

    CellIndex fromIndex = new CellIndex(rowIndex: 0, columnIndex: 0);
    CellIndex toIndex = new CellIndex(rowIndex: 10, columnIndex: 5);
    string cellRangeName = NameConverter.ConvertCellRangeToName(fromIndex, toIndex);

    CellRange cellRange;
    bool result = NameConverter.TryConvertCellRangeNameToCellRange(cellRangeName, out cellRange);
```

### Convert Cell Indexes to Name
**ConvertCellIndexesToName** method converts the cell indexes to a name.
#### __Example 10:__

```csharp

    string cellRangeName = NameConverter.ConvertCellIndexesToName(fromRowIndex: 0, fromColumnIndex: 0, toRowIndex: 10, toColumnIndex: 5);
```

### Convert Cell Name to Index
**ConvertCellNameToIndex** method converts the cell name to a cell index. This method exposes two overloads.
#### __Example 11: first overload__

```csharp

    string cellName = "A1";
    int rowIndex;
    int columnIndex;
    NameConverter.ConvertCellNameToIndex(cellName, out rowIndex, out columnIndex);
```

#### __Example 11: second overload__
```csharp

    string cellName = "A1";
    int rowIndex;
    bool isRowAbsolute;
    int columnIndex;
    bool isColumnAbsolute;
    NameConverter.ConvertCellNameToIndex(cellName, out isRowAbsolute, out rowIndex, out isColumnAbsolute, out columnIndex);
```

### Try Convert Cell Name to Index
**TryConvertCellNameToIndex** method tries to convert the cell name to index. This method exposes two overloads.
#### __Example 12: first overload__
```csharp

    string cellName = "A1";
    int rowIndex;
    int columnIndex;
    bool isConversionSuccessful = NameConverter.TryConvertCellNameToIndex(cellName, out rowIndex, out columnIndex);
```

#### __Example 12: second overload__
```csharp
 
    string cellName = "A1";
    int rowIndex;
    bool isRowAbsolute;
    int columnIndex;
    bool isColumnAbsolute;
    bool isConversionSuccessful = NameConverter.TryConvertCellNameToIndex(cellName, out isRowAbsolute, out rowIndex, out isColumnAbsolute, out columnIndex);
```


### Is Valid A1 Cell Name
**IsValidA1CellName** method determines whether the name of the cell is valid.
#### __Example 13:__

```csharp

    string cellName = "B2";
    bool isValidCellName= NameConverter.IsValidA1CellName(cellName);
```

## See Also

* [Performance Tips and Tricks]({%slug radspreadprocessing-performance%})
