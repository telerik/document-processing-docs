---
title: Get Cell Content Size
page_title: Get Cell Content Size
description: Learn how you can measure the size of the cell content in SpreadStreamProcessing for .NET Standard.
slug: radspreadstreamprocessing-features-text-measuring
tags: cell, text, size, measure, content, width, height, autofit, fit
platforms: core,blazor,xamarin,winui, wpf, ajax, mvc, silverlight
published: True
position: 1
---

# Get Cell Content Size

With the text measuring functionality of SpreadStreamProcessing you can obtain the size of specific content and use it to apply height and width to the rows and columns, respectively.

## Why is it needed?

SpreadStreamProcessing is designed to directly write the content inside the stream while you generate the document. While this brings great benefits in terms of performance and memory usage, it also comes with a limitation for the automatic sizing of the content. To automatically fit the cell content into a column means that the library should measure each cell content inside that column and change its width if that needed. However, at the time the cell content is written into the stream, the column is already defined and it cannot be further modified. To overcome that limitation, SpreadStreamProcessing exposes the **CellContentSizeHelper** class.

## Using CellContentSizeHelper

CellContentSizeHelper is a static class and exposes two overloads of the GetCellContentSize method. These overloads allow you to pass the formatting applied to the cell as a SpreadCellFormat or as separate values.

>To use this class, you must add a reference to **Telerik.Windows.Documents.Spreadsheet** for .NET Framework projects or **Telerik.Documents.Spreadsheet** for .NET Standard projects.

>tip To achieve accurate results in .NET Standard, it is suggested to use [SpreadFixedTextMeasurer]({%slug radspreadprocessing-cross-platform-text-measure%}#spreadfixedtextmeasurer).

### Measuring Cell Content with SpreadCellFormat

One of overloads of **GetCellContentSize** enables you to obtain the size needed for a specific cell value with applied a [SpreadCellFormat]({%slug radspreadstreamprocessing-model-cells%}#set-a-format) to it. The following list describes the parameters of that method:

- **string value**: The cell value. If formula is passed, the method will throw an ArgumentException.
- **SpreadCellFormat spreadCellFormat**: The formatting of the cell.
- **double cellWidth**: Optional. The width of the cell in pixels. This value is only respected if the value of the `WrapText` property of the `spreadCellFormat` is `true`. *The default column width is 65 pixels*.

### Measuring Cell Content with Separate Formatting Values

GetCellContentSize exposes an overload that allows you pass separate values for the formatting properties of a cell that can affect the size of that cell's content. Following are the parameters that overload accepts:

- **string value**: The cell value. If formula is passed the method will throw an ArgumentException.
- **string cellValueFormat**: The number format of the cell.
- **string fontFamily**: The font family name.
- **double fontSize**: The size of the font.
- **bool isBold**: A value indicating whether the text is bold.
- **bool isItalic**: A value indicating whether the text is italic.
- **SpreadHorizontalAlignment horizontalAlignment**: The horizontal alignment.
- **bool isWrapped**: A value indicating whether the text is wrapped.
- **int indent**: The cell indentation.
- **double cellWidth**: Optional. The width of the cell in pixels. This value is only respected if the value of the `WrapText` property of the `spreadCellFormat` is `true`. *The default column width is 65 pixels*.

## Example

The following example shows how you can create a spreadsheet document, measure the content of the cells and apply width to the columns in a way that these columns auto fit their content.

#### Example 1: Create spreadsheet with auto fit columns width

```csharp

    public static void ExportSpreadsheet(SpreadDocumentFormat documentFormat, string fileName)
    {
        SpreadBorder border = new SpreadBorder(SpreadBorderStyle.Thin, new SpreadThemableColor(new SpreadColor(125, 125, 0)));
        SpreadCellFormat format = new SpreadCellFormat()
        {
            NumberFormat = "@",
            IsBold = true,
            IsItalic = true,
            LeftBorder = border,
            RightBorder = border,
            TopBorder = border,
            BottomBorder = border,
            WrapText = false
        };
    
        string[] vegetablesToExport = new string[] { "carrot", "broccoli", "cucumber", "eggplant", "lettuce", "cabbage", "tomato" };
    
        double vegetablesColumnWidth;
        CalculateColumnWidth(format, vegetablesToExport, out vegetablesColumnWidth);
    
        using (FileStream stream = File.Open(fileName, FileMode.OpenOrCreate))
        {
            using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(documentFormat, stream))
            {
                using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("Vegetables List"))
                {
                    using (IColumnExporter column = worksheet.CreateColumnExporter())
                    {
                        column.SetWidthInPixels(vegetablesColumnWidth);
                    }
    
                    for (int rowIndex = 1; rowIndex < vegetablesToExport.Length + 1; rowIndex++)
                    {
                        using (IRowExporter row = worksheet.CreateRowExporter())
                        {
                            string vegetable = vegetablesToExport[rowIndex - 1];
    
                            using (ICellExporter cell = row.CreateCellExporter())
                            {
                                cell.SetValue(vegetable);
                                cell.SetFormat(format);
                            }
                        }
                    }
                }
            }
        }
    }
    
    private static void CalculateColumnWidth(SpreadCellFormat format, string[] values, out double columnWidth)
    {
        columnWidth = 0;
    
        foreach (var value in values)
        {
            double contentWidth = CellContentSizeHelper.GetCellContentSize(value, format).Width;
            if (contentWidth > columnWidth)
            {
                columnWidth = contentWidth;
            }
        }
    }
    
```


## See Also

* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})