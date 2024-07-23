---
title: Retrieving Themable Cell Color in RadSpreadProcessing
description: Learn how to retrieve the actual cell color in RadSpreadProcessing when the color comes from the document theme.
type: how-to
page_title: How to Retrieve Cell Color from Theme in RadSpreadProcessing
slug: retrieve-cell-color-radspreadprocessing
tags: radspreadprocessing, document processing, cell color, themable color, pattern fill
res_type: kb
ticketid: 1656165
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Let's import an Excel file with some cells formatted with color. Learn how to retrieve the cell color when the background color is set from MS Excel.

## Solution

To retrieve the cell color in RadSpreadProcessing, especially when the color is applied through the document theme, follow these steps:

1. [Import the Excel document]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}) using the appropriate format provider.
2. [Access the desired cell]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%}) or range of cells.
3. Check if the cell's fill is of type [PatternFill](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/working-with-cells/get-set-clear-properties#fill-property).
4. Retrieve the [ThemableColor]({%slug radspreadprocessing-features-styling-document-themes%}) object from the `PatternFill`.
5. Use the [GetActualValue](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/styling/document-themes#getting-actual-values) method of the `ThemableColor` object, passing in the document's theme, to get the actual color value.

Here is a sample code snippet demonstrating these steps:

```csharp
string filePath = "Book1.xlsx";
Workbook workbook = new Workbook(); 
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();

using (Stream input = new FileStream(filePath, FileMode.Open))
{
    workbook = formatProvider.Import(input);
}
Worksheet worksheet = workbook.Worksheets.First();
CellSelection selection = worksheet.Cells[0,1]; 
PatternFill solidPatternFill = selection.GetFill().Value as PatternFill;
if (solidPatternFill != null)
{
    PatternType type = solidPatternFill.PatternType;
    ThemableColor patternColor = solidPatternFill.PatternColor;
    Color color = patternColor.LocalValue;
    ThemableColor bg = solidPatternFill.BackgroundColor;
    Color bgcolor = bg.LocalValue;

    Color actualColor = patternColor.GetActualValue(workbook.Theme);
    // The actual color is the same as Accent1 color of the colorScheme 
    Debug.WriteLine("RGB: " + actualColor.R.ToString() + ", " + actualColor.G.ToString() + ", " + actualColor.B.ToString());
}
```

This approach ensures that even when a cell's color is derived from the document's theme, you can obtain the actual color value as displayed in the Excel file.

## See Also

- [Document Themes in RadSpreadProcessing]({%slug radspreadprocessing-features-styling-document-themes%}})
- [Getting Actual Values](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/styling/document-themes#getting-actual-values)

---
