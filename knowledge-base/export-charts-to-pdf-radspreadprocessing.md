---
title: Exporting Spreadsheets with Charts to PDF with RadSpreadProcessing and WinForms RadChartView
description: Learn how to export charts from Excel files to PDF format using RadSpreadProcessing, including handling chart images with the WinForms ChartView control.
type: how-to
page_title: How to Export Charts from Excel to PDF with RadSpreadProcessing and WinForms RadChartView
slug: export-charts-to-pdf-radspreadprocessing
tags: spreadprocessing, document, processing, export, chart, pdf, excel, image, winforms
res_type: kb
ticketid: 1659898
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting an Excel file with charts to PDF, the charts may not display as expected in the PDF document. This may occur when exporting charts to PDF in .NET Framework applications. This KB article shows a sample approach how to utilize the chart engine that [WinForms RadChartView]({%slug winforms/chartview/overview%}) control offers and ensure charts are properly exported from Excel files to PDF.

## Solution

To export charts from Excel files to PDF format using RadSpreadProcessing, follow these steps:

1. **Implement a Custom IPdfChartRenderer**: The export process requires providing an [IPdfChartRenderer]({%slug radspreadprocessing-features-charts-pdf-export%}) implementation. This renderer is responsible for converting the chart shapes from the Excel file into images that can be inserted into the PDF. 

2. **Use the WinForms RadChartView control**: The [WinForms RadSpreadsheet]({%slug ({%slug radspreadsheet-overview%})%}) control (that supports charts) internally uses the WinForms RadChartView for visualization and it provides a convenient API for image creation having the [FloatingChartShape]({%slug radspreadprocessing-features-charts-using-charts%}) from the SpreadProcessing model.

3. **Export the Excel to PDF**: Use the [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to export the workbook to PDF, setting the `ChartRenderer` property to your custom renderer implementation.

Below is a sample implementation using the WinForms RadChartView for chart visualization:

```csharp
public class WinFormsPdfChartImageRenderer : IPdfChartRenderer
{
    public void RenderChart(FixedContentEditor editor, FloatingChartShape chartShape)
    {
        string filePath = @"exportedChart.png";

        System.Drawing.Size size = new System.Drawing.Size((int)(chartShape.Width ),(int)(chartShape.Height));
        System.Drawing.Image chartImage = Telerik.WinForms.Controls.Spreadsheet.Layers.ChartModelToImageConverter.GetImageFromFloatingChartShape(chartShape, size);

        chartImage.Save(filePath);
        using (FileStream fs = new FileStream(filePath, FileMode.Open))
        {
            editor.DrawImage(fs);
        }
        File.Delete(filePath);
    }
}

PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
pdfFormatProvider.ExportSettings.ChartRenderer = new WinFormsPdfChartImageRenderer();
```

## See Also

- [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
- [Export Chart to PDF]({%slug radspreadprocessing-features-charts-pdf-export%})
- [RadChartView for WinForms Overview]({%slug winforms/chartview/overview%})
- [Export Chart to Image in WinForms]({%slug winforms/chartview-/features/export%})
- [WinForms RadSpreadsheet]({%slug radspreadsheet-overview%})
