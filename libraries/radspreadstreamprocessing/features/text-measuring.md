---
title: Get Cell Content Size
page_title: Get Cell Content Size
description: Learn how you can measure the size of the cell content in SpreadStreamProcessing for .NET Standard.
slug: radspreadstreamprocessing-features-text-measuring
tags: text, measuring, spread, stream, processing, spreadsheet, cells, width, height, auto, fit, dotnet
platforms: core,blazor,winui, wpf, ajax, mvc
published: True
position: 1
---

# Get Cell Content Size

With the text measuring functionality of SpreadStreamProcessing you can get the size of specific content and use it to apply height and width to the rows and columns, respectively.

## Why Is It Needed

SpreadStreamProcessing is designed to write the content directly inside the stream while you generate the document. While this brings great benefits in terms of performance and memory usage, it also introduces a limitation for automatic content sizing. To automatically fit the cell content into a column, the library must measure each cell content inside that column and change its width if needed. However, at the time the cell content is written into the stream, the column is already defined and cannot be further modified. To overcome that limitation, SpreadStreamProcessing exposes the `CellContentSizeHelper` class.

## Using CellContentSizeHelper

`CellContentSizeHelper` is a static class and exposes two overloads of the `GetCellContentSize` method. These overloads allow you to pass the formatting applied to the cell as a `SpreadCellFormat` or as separate values.

>To use this class, you must add a reference to **Telerik.Windows.Documents.Spreadsheet** for .NET Framework projects or **Telerik.Documents.Spreadsheet** for .NET Standard projects.

>tip To achieve accurate results in .NET Standard, use [SpreadFixedTextMeasurer]({%slug radspreadprocessing-cross-platform-text-measure%}#spreadfixedtextmeasurer).

### Measuring Cell Content with SpreadCellFormat

One of the overloads of `GetCellContentSize` enables you to get the size needed for a specific cell value with an applied [SpreadCellFormat]({%slug radspreadstreamprocessing-model-cells%}#set-a-format). The following table describes the parameters of that method:

| Parameter | Type | Description |
|---|---|---|
| `value` | `string` | The cell value. If a formula is passed, the method throws an `ArgumentException`. |
| `spreadCellFormat` | `SpreadCellFormat` | The formatting of the cell. |
| `cellWidth` | `double` | Optional. The width of the cell in pixels. This value is only respected if the value of the `WrapText` property of the `spreadCellFormat` is `true`. The default column width is 65 pixels. |

### Measuring Cell Content with Separate Formatting Values

`GetCellContentSize` exposes an overload that allows you to pass separate values for the formatting properties of a cell that can affect the size of that cell content. The following table describes the parameters that overload accepts:

| Parameter | Type | Description |
|---|---|---|
| `value` | `string` | The cell value. If a formula is passed, the method throws an `ArgumentException`. |
| `cellValueFormat` | `string` | The number format of the cell. |
| `fontFamily` | `string` | The font family name. |
| `fontSize` | `double` | The size of the font. |
| `isBold` | `bool` | A value indicating whether the text is bold. |
| `isItalic` | `bool` | A value indicating whether the text is italic. |
| `horizontalAlignment` | `SpreadHorizontalAlignment` | The horizontal alignment. |
| `isWrapped` | `bool` | A value indicating whether the text is wrapped. |
| `indent` | `int` | The cell indentation. |
| `cellWidth` | `double` | Optional. The width of the cell in pixels. This value is only respected if the value of the `WrapText` property of the `spreadCellFormat` is `true`. The default column width is 65 pixels. |

## Example

The following example shows how to create a spreadsheet document, measure the content of the cells, and apply width to the columns so that these columns auto fit their content.

**Example 1: Measure the widest formatted cell value and apply that width to the exported column**

<snippet id='codeblock-dkv'/>


## See Also

* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})