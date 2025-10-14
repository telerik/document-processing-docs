---
title: Importing and Exporting CSV Files while changing their formatting in Telerik SpreadProcessing
description: Learn how to handle culture settings, delimiters, and decimal separators while importing and exporting CSV files in Telerik SpreadProcessing.
type: how-to
page_title: Changing Formatting While Importing and Exporting CSV Files in SpreadProcessing
meta_title: Changing Formatting While Importing and Exporting CSV Files in SpreadProcessing
slug: spreadprocessing-import-export-csv-formatting
tags: telerik, document, processing, spread, csv, culture, delimiter, decimal, separator, formatting, export, import
res_type: kb
ticketid: 1700417
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> SpreadProcessing for Telerik Document Processing </td>
</tr>
<tr>
<td> Version </td>
<td> 11.1.1 </td>
</tr>
</tbody>
</table>

## Description

I want to import a CSV file and export its values to another CSV file while applying specific formatting during the process. I need to account for culture settings and delimiters during both import and export operations to ensure the desired formatting results.

This knowledge base article also answers the following questions:
- How to change culture settings during CSV import/export in SpreadProcessing?
- How to use different delimiters and formats for CSV operations?
- How to format date and numeric values during CSV export?

## Solution

To import and export a CSV file with custom formatting, follow these steps:

1. Set the culture settings to English (en-EN) and the delimiter to a comma (",") for importing the CSV file.
2. Import the CSV file using the `CsvFormatProvider` and parse the workbook.
3. Switch the culture settings to German (de-DE), the delimiter to a semicolon (";"), and apply the desired formatting.
4. Export the formatted workbook to a new CSV file.

### Full Code Example

```csharp
using System.Globalization;
using System.IO;
using Telerik.Windows.Documents.Spreadsheet.Formatting;
using Telerik.Windows.Documents.Spreadsheet.Model;
using Telerik.Windows.Documents.Spreadsheet.FormatProviders.Csv;

Telerik.Windows.Documents.Spreadsheet.Formatting.FormatHelper.CultureHelper = new SpreadsheetCultureHelper(new CultureInfo("en-EN"));

Workbook workbook;
CsvFormatProvider formatProvider = new CsvFormatProvider();
formatProvider.Settings.Delimiter = ',';

using (Stream input = new FileStream("..\\..\\..\\input.csv", FileMode.Open))
{
    workbook = formatProvider.Import(input, TimeSpan.FromSeconds(10));
}

Telerik.Windows.Documents.Spreadsheet.Formatting.FormatHelper.CultureHelper = new SpreadsheetCultureHelper(new CultureInfo("de-DE"));

var worksheet = workbook.Worksheets[0];

var currencyFormat = new CellValueFormat("#,##");
ColumnSelection surchargePercent = worksheet.Columns[1];
surchargePercent.SetFormat(currencyFormat);

ColumnSelection surchargePercentNew = worksheet.Columns[2];
surchargePercentNew.SetFormat(currencyFormat);

var dateFormat = new CellValueFormat("dd.mm.yyyy");
ColumnSelection date = worksheet.Columns[0];
date.SetFormat(dateFormat);

formatProvider.Settings.Delimiter = ';';

string fileName = "..\\..\\..\\output.csv";
File.Delete(fileName);
using (Stream output = new FileStream(fileName, FileMode.Create))
{
    formatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
}
```

### Key Notes:
- Modify `SpreadsheetCultureHelper` settings before and after importing the file to ensure proper parsing and formatting.
- Use `CsvFormatProvider.Settings.Delimiter` to set the appropriate delimiter for import and export.
- Apply formatting such as `CellValueFormat` to columns before exporting the workbook.

## See Also

- [SpreadProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [CsvFormatProvider Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/import-export/csv)
- [Formatting Cells in SpreadProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/cells/formatting-cells)
