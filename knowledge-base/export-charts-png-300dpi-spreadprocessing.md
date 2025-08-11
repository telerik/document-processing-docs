---
title: Exporting Charts from Excel Documents to PNG Images with 300 DPI Resolution Using SpreadProcessing
description: Learn how to export Excel charts to PNG images with 300 DPI resolution using Telerik SpreadProcessing and charting controls.
type: how-to
page_title: Exporting Charts from Excel Documents to PNG Images with 300 DPI Resolution Using SpreadProcessing
meta_title: Exporting Charts from Excel Documents to PNG Images with 300 DPI Resolution Using SpreadProcessing
slug: export-charts-png-300dpi-spreadprocessing
tags: spread, processing,telerik, document ,chart, image, export, png, dpi, resolution
res_type: kb
ticketid: 1695547
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I need to export charts from Excel as PNG files with a resolution of at least 300 DPI for printing purposes. I want to know if Telerik SpreadProcessing supports exporting charts with 300 DPI directly to PNG format.

This knowledge base article also answers the following questions:
- How to export Excel charts as PNG with high resolution using SpreadProcessing?
- How to set DPI for charts exported using Telerik Document Processing?
- Can Excel charts be exported to 300 DPI PNG files directly?

## Solution

Exporting charts directly from Excel files to PNG images with 300 DPI resolution using Telerik SpreadProcessing is not supported. SpreadProcessing focuses on spreadsheet data manipulation and exporting to formats like XLSX and PDF but does not handle chart export or DPI settings.

### Suggested Workflow Using Charting Controls

1. Extract the chart data from the Excel file using SpreadProcessing.
2. Rebuild the chart using a UI component, such as [RadChartView](https://docs.telerik.com/devtools/winforms/controls/chartview/features/export) from the Telerik UI for WinForms or WPF suites.
3. Export the chart as a PNG image with 300 DPI using RadChartView.

### Alternative Approach: Exporting to PDF

Export the XLSX document to PDF format using SpreadProcessing. This method internally uses a chart renderer for rendering charts in the PDF. Implement a custom `IPdfChartRenderer` to manipulate chart resolution and save the chart as a PNG image.

Sample implementation for exporting charts as PNG with 300 DPI:

```csharp
public class WinFormsPdfChartImageRenderer : IPdfChartRenderer
{
    public void RenderChart(FixedContentEditor editor, FloatingChartShape chartShape)
    {
        string filePath = @"exportedChart.png";

        // Set chart dimensions
        System.Drawing.Size size = new System.Drawing.Size((int)(chartShape.Width), (int)(chartShape.Height + 10));
        System.Drawing.Image chartImage = Telerik.WinForms.Controls.Spreadsheet.Layers.ChartModelToImageConverter.GetImageFromFloatingChartShape(chartShape, size);

        using (var bmp = new Bitmap(chartImage))
        {
            // Set DPI to 300
            bmp.SetResolution(300, 300);

            // Save as PNG
            bmp.Save(filePath, System.Drawing.Imaging.ImageFormat.Png);
        }
        using (FileStream fs = new FileStream(filePath, FileMode.Open))
        {
            editor.DrawImage(fs);
        }
        Process.Start(new ProcessStartInfo(filePath) { UseShellExecute = true });
    }
}
```

To export charts to PNG, use the custom renderer in conjunction with SpreadProcessing’s PDF export functionalities. Charts saved as PNG images can then be adjusted for resolution.

Note: Recreating the chart using RadChartView may require extra effort if the charts are highly customized or complex.

## See Also

- [RadChartView Export](https://docs.telerik.com/devtools/winforms/controls/chartview/features/export)
- [SpreadProcessing PDF Export](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/features/charts/pdf-export)
- [Exporting Spreadsheets with Charts to PDF with RadSpreadProcessing and WinForms RadChartView](https://docs.telerik.com/devtools/document-processing/knowledge-base/export-charts-to-pdf-radspreadprocessing)
