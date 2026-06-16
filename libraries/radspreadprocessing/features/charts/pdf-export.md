---
title: Export Chart to PDF
description: Learn how to export spreadsheet charts to PDF using RadSpreadProcessing and the IPdfChartRenderer interface in WPF.
page_title: Export Chart to PDF
slug: radspreadprocessing-features-charts-pdf-export
tags: charts, pdf, export, spreadsheet, radspreadprocessing, wpf, renderer, excel, spread, xlsx
published: True
position: 7
platforms: wpf
---

# Export Chart to PDF

> At this point, PDF export of charts is not supported for .NET Standard.

You can export spreadsheet documents in RadSpreadProcessing using the [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) class. The charts functionality relies on a renderer that implements the `IPdfChartRenderer` interface to draw the charts in the PDF document. This topic shows how you can implement this renderer using the built-in class in WPF.

>To use the functionality described in this topic, you need to add a reference to the **Telerik.Windows.Controls.Spreadsheet** and **Telerik.Windows.Controls.Chart** packages of the [Telerik UI for WPF](https://www.telerik.com/products/wpf/overview.aspx) suite.

## IPdfChartRenderer

The `IPdfChartRenderer` interface defines members for classes that the internal logic of `PdfFormatProvider` uses to render chart objects in a spreadsheet document when exporting it to PDF. The interface defines the `RenderChart()` method which you must implement so the internal logic of `PdfFormatProvider` can call it when it reaches a chart that has to be rendered.

## ChartModelToImageConverter Class

The `ChartModelToImageConverter` object is available in the **Telerik.Windows.Controls.Spreadsheet** assembly and uses internally the [RadChartView](https://docs.telerik.com/devtools/wpf/controls/radchartview/overview) control to visualize the chart and create an image. This class exposes the `GetBitmapSourceFromFloatingChartShape()` method which converts a chart shape object to an image and can be used to draw the image in the PDF document.

## Implementing Export to PDF in Your Application

The [`PdfFormatProvider`]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) instance accepts a renderer in its settings. The renderer needs to implement the `IPdfChartRenderer` interface and the `RenderChart()` method this interface defines. The method takes a [`FixedContentEditor`]({%slug radpdfprocessing-editing-fixedcontenteditor%}) in its parameters, which draws the chart, and the other parameters contain the information necessary to draw it. The `WpfPdfChartImageRenderer` implemented in **Example 1** is an example implementation that uses the Telerik.Windows.Controls.Spreadsheet and Telerik.Windows.Controls.Chart [Xaml assemblies](https://docs.telerik.com/devtools/wpf/styling-and-appearance/xaml-vs-noxaml) to draw the chart.

**Example 1: Implementing a Renderer**

<snippet id='codeblock-cll'/>

When you have the renderer implemented, you need to assign it to the `PdfFormatProvider` instance through the `ChartRenderer` property of its [ExportSettings]({%slug radspreadprocessing-format-and-conversion-pdf-settings%}).

**Example 2: Registering the Renderer**

<snippet id='codeblock-clm'/>

Now the chart objects in the spreadsheet are exported along with the other content after you invoke the `Export()` method of `PdfFormatProvider`.

>note You can find a complete runnable example using the approach described in this topic in the SDK repository: [Export Chart](https://github.com/telerik/document-processing-sdk/tree/master/SpreadProcessing/ExportChart).

## See Also

* [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Exporting Spreadsheets with Charts to PDF with RadSpreadProcessing and WinForms RadChartView]({%slug export-charts-to-pdf-radspreadprocessing%})
* [Exporting Charts from Excel Documents to PNG Images with a Specific DPI Resolution Using SpreadProcessing]({%slug export-charts-png-300dpi-spreadprocessing%})
* [Exporting Spreadsheet with Bar Charts in .NET Standard]({%slug export-spreadsheet-with-chart-net-standard%})
