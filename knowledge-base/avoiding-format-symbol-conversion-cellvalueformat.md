---
title: Preventing Undesired Format Conversion in CellValueFormat
description: Learn how to avoid undesired exchange of format symbols in CellValueFormat caused by culture settings in Telerik Document Processing.
type: how-to
page_title: Avoiding Format Symbol Conversion in CellValueFormat
meta_title: Avoiding Format Symbol Conversion in CellValueFormat
slug: avoiding-format-symbol-conversion-cellvalueformat
tags: spreadstreamprocessing,telerik document processing,cellvalueformat,spreadsheetculturehelper,cultureinfo,formathelper
res_type: kb
ticketid: 1676276
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When using the `CellValueFormat` in Telerik Document Processing, format strings may experience an undesired exchange of symbols, such as `,` to `.` and `.` to `,`. 
   ```csharp
    CellValueFormat textFormat = new CellValueFormat("[$-de-DE,101]#.##0,00;-#.##0,00"); 
    CellSelection cellSelectionA1 = worksheet.Cells[new CellIndex(0, 0)]; 
    cellSelectionA1.SetValue(1234.56789); 
    cellSelectionA1.SetFormat(textFormat);
    CellSelection cellSelectionA1 = worksheet.Cells[new CellIndex(0, 0)]; 
    CellValueFormat cellSelectioA1Format = cellSelectionA1.GetFormat().Value;
   ```
The returned Value is [$-de-DE,101]#,##0.00;-#,##0.00 - the , and . are exchanged. For better visualization:
Input    : [$-de-DE,101]#.##0,00;-#.##0,00
Output : [$-de-DE,101]#,##0.00;-#,##0.00

You can see the 0,00 has been changed to 0.00  and #.## has been changed to #,##

This happens due to culture settings. For instance, using the German culture (`de-DE`) where the decimal separator is a comma and the group separator is a period, versus the English culture (`en-US`) where these separators are reversed, can lead to a different output format.

This knowledge base article also answers the following questions:
- How to prevent undesired format conversion in Telerik Spreadsheet?
- How to set custom culture settings for CellValueFormat?
- How to retain original format string in CellValueFormat?

## Solution

To prevent undesired format symbol exchanges, explicitly set the desired culture in your application using the `SpreadsheetCultureHelper`. Follow these steps:

1. Import the required namespaces:
   ```csharp
   using System.Globalization;
   using Telerik.Windows.Documents.Spreadsheet.Formatting;
   ```

2. Set the desired culture by creating a new `SpreadsheetCultureHelper` instance:
   ```csharp
   FormatHelper.CultureHelper = new SpreadsheetCultureHelper(new CultureInfo("de-DE"));
   ```

   Replace `"de-DE"` with the appropriate culture code for your scenario.

3. Apply the culture settings before working with the `CellValueFormat` and related operations.

This approach ensures consistent handling of format strings regardless of the user's default culture settings.

## See Also

- [Number Formats in Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/number-formats)
- [Setting the Culture for Telerik Spreadsheet](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/setting-the-culture#setting-the-culture)
