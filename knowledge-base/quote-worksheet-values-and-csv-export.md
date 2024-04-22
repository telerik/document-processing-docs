---
title: How to Quote Worksheet Values during CSV Export
description: Learn how to create a custom CSV export of worksheet values in RadSpreadProcessing, while specifying the delimiter and surrounding the cell values with quotes.
type: how-to
page_title: How to Quote Worksheet Values during CSV Export | RadSpreadProcessing
slug: quote-worksheet-values-and-csv-export
tags: spreadprocessing, export, worksheet, values, csv, delimiter, quotes
res_type: kb
---

## Environment
|Product Version|Product|Author|
|----|----|----|
|2024.1.124|SpreadProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description
This example shows how to export the values of a worksheet to a CSV file using [RadSpreadProcessing]({%slug radspreadprocessing-overview%}), while also specifying the delimiter and surrounding the cell values with quotes.

>important Please note that this approach is slower than using the integrated SpreadProcessing API. 

## Solution
1. Define the delimiter character and quote character to be used in the CSV file. 
2. Open a stream and create a StreamWriter to write the CSV file. The example below opens a file named "output.csv".
3. Get the range of used cells in the worksheet.
4. Iterate over each row and column in the used cell range and export the cell values to the CSV file.

```csharp
Workbook workbook;
IWorkbookFormatProvider xlsxFormatProvider = new XlsxFormatProvider();

using (Stream input = new FileStream("input.xlsx", FileMode.Open))
{
    workbook = xlsxFormatProvider.Import(input);
}

Worksheet worksheet = workbook.ActiveWorksheet;

//Manually export to CSV
char delimiter = ',';
string quote = "\"";
string doubleQuotes = $"{quote}{quote}";

using (Stream stream = File.OpenWrite("test.csv"))
using (StreamWriter writer = new StreamWriter(stream))
{
    var usedCellRange = worksheet.GetUsedCellRange(CellPropertyDefinitions.ValueProperty);
    for (int row = usedCellRange.FromIndex.RowIndex; row <= usedCellRange.ToIndex.RowIndex; row++)
    {
        for (int column = usedCellRange.FromIndex.ColumnIndex; column <= usedCellRange.ToIndex.ColumnIndex; column++)
        {
            var cellSelection = worksheet.Cells[row, column];
            var format = cellSelection.GetFormat().Value;
            var value = cellSelection.GetValue().Value.GetResultValueAsString(format);

            var handledQUotes = value.Replace(quote, doubleQuotes);

            writer.Write(quote);
            writer.Write(handledQUotes);
            writer.Write(quote);
            writer.Write(delimiter);
        }

        writer.WriteLine();
    }
}
```
![Before - After quoting and exporting to CSV ](images/quotedCsvValus.png)

## See Also

* [Using CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})
* [CsvFormatProvider Settings]({%slug radspreadprocessing-formats-and-conversion-csv-settings%})
