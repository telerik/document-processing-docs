---
title: Exporting Charts from Excel Documents to PNG Images with a Specific DPI Resolution Using SpreadProcessing and PdfProcessing
description: Learn how to export Excel charts to PNG images with a Specific DPI resolution using Telerik SpreadProcessing, PdfProcessing and UI for WinForms and WPF charting controls.
type: how-to
page_title: Exporting Charts from Excel Documents to PNG Images with a Specific DPI Resolution Using SpreadProcessing
meta_title: Exporting Charts from Excel Documents to PNG Images with a Specific DPI Resolution Using SpreadProcessing
slug: export-charts-png-300dpi-spreadprocessing
tags: spread, processing,telerik, document ,chart, image, export, png, dpi, resolution
res_type: kb
ticketid: 1695547
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadSpreadProcessing & RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to extract the [charts]({%slug radspreadprocessing-features-charts%}) from Excel documents and save them as PNG files, while specifying the desired resolution (e.g. 300 DPI).

## Solution

Exporting charts directly from Excel files to images is not yet supported by the [SpreadProcessing]({%slug radspreadprocessing-overview%}) library. As an alternative, you can benefit the export option to PDF format which allows you to plug into the chart rendering process, export the chart and handle the DPI settings

### Suggested Workflow Using Charting Controls

1. Extract the chart data from the Excel file using SpreadProcessing.
2. Rebuild the chart using a UI component, such as [RadChartView](https://docs.telerik.com/devtools/winforms/controls/chartview/features/export) from the Telerik UI for WinForms or WPF suites.
3. Export the chart as a PNG image with 300 DPI using RadChartView.

### Alternative Approach: Exporting to PDF

Export the XLSX document to PDF format using SpreadProcessing. This method internally uses a **chart renderer** for rendering charts in the PDF. Implement a custom [IPdfChartRenderer]({%slug radspreadprocessing-features-charts-pdf-export%}) to manipulate chart resolution and save the chart as a PNG image in the ongoing export process.

#### Sample implementation for exporting charts as PNG with 300 DPI:

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

#### Applying the custom renderer:

```csharp
Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
IWorkbookFormatProvider formatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
string fileName = "SampleFile.xlsx";
using (Stream inputStream = new FileStream(fileName, FileMode.Open))
{
    workbook = formatProvider.Import(inputStream, TimeSpan.FromSeconds(10));
}

PdfFormatProvider pdfFormatProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();
pdfFormatProvider.ExportSettings.ChartRenderer = new WinFormsPdfChartImageRenderer();  
converter.PdfFormatProvider = pdfFormatProvider;
using (Stream output = File.OpenWrite("Sample.pdf"))
{ 
    pdfFormatProvider.Export(workbook, output, TimeSpan.FromSeconds(10));
}
```

Note: Recreating the chart using RadChartView may require extra effort if the charts are highly customized or complex.

## See Also

- [SpreadProcessing PDF Export]({%slug radspreadprocessing-features-charts-pdf-export%})
- [Exporting Spreadsheets with Charts to PDF with RadSpreadProcessing and WinForms RadChartView]({%slug export-charts-to-pdf-radspreadprocessing%})
