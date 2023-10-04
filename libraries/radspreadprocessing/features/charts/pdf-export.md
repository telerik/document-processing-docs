---
title: Export Chart to PDF
page_title: Export Chart to PDF
slug: radspreadprocessing-features-charts-pdf-export
tags: chart, pdf, export
published: True
position: 7
platforms: wpf
---

# Export Chart to PDF

> At this point, PDF export of charts is not supported for .NET Standard.

You can export spreadsheet documents in RadSpreadProcessing using the [PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) class. The charts functionality relies on a renderer which implements the **IPdfChartRenderer** interface to draw the charts in the PDF document. This topic shows how you can implement this renderer using the built-in class in WPF.

>To use the functionality described in this topic, you will need to add a reference to the **Telerik.Windows.Controls.Spreadsheet.dll** and **Telerik.Windows.Controls.Chart.dll** assemblies of the [Telerik UI for WPF](https://www.telerik.com/products/wpf/overview.aspx) suite.

## IPdfChartRenderer

The IPdfChartRenderer interface defines members for classes which will be used by the internal logic of PdfFormatProvider to render the chart objects in a spreadsheet document when exporting it to PDF. The interface defines the RenderChart() method which should be implemented so it can be called when the internal logic of the PdfFormatProvider reaches a chart which has to be rendered.

## ChartModelToImageConverter Class

The **ChartModelToImageConverter** object is readily available in the **Telerik.Windows.Controls.Spreadsheet** assembly and uses internally the [**RadChartView**](https://docs.telerik.com/devtools/wpf/controls/radchartview/overview) control to visualize the chart and create an image. This class exposes the **GetBitmapSourceFromFloatingChartShape()** method which converts a chart shape object to an image and can be used to draw the image in the PDF document.

## Implementing Export to PDF in Your Application

The [**PdfFormatProvider**]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) instance accepts a renderer in its settings. The renderer needs to implement the **IPdfChartRenderer** interface and the RenderChart() method this interface defines. The method takes a [**FixedContentEditor**]({%slug radpdfprocessing-editing-fixedcontenteditor%}) in its parameters, which will draw the chart, and the other parameters contain the information necessary to draw it. The WpfPdfChartImageRenderer implemented in **Example 1** is an example implementation which uses the Telerik.Windows.Controls.Spreadsheet and Telerik.Windows.Controls.Chart assemblies to draw the chart.

#### [C#] Example 1: Implementing a renderer

{{region radspreadprocessing-features-charts-pdf-export_0}}
	
 	public class WpfPdfChartImageRenderer : IPdfChartRenderer
    {
        private readonly ChartModelToImageConverter chartToImageConverter;

        public WpfPdfChartImageRenderer()
        {
            this.chartToImageConverter = new ChartModelToImageConverter();
        }

        // This is the method which will be called when the internal logic of the PdfFormatProvider reaches a chart which has to be rendered.
        public void RenderChart(FixedContentEditor editor, FloatingChartShape chartShape)
        {
            // The ChartModelToImageConverter object is readily available in the Telerik.Windows.Controls.Spreadsheet assembly and
            // uses internally the RadChartView control to visualize the chart and create an image.
            BitmapSource source = this.chartToImageConverter.GetBitmapSourceFromFloatingChartShape(chartShape);

            // The editor draws the image in the PDF.
            editor.DrawImage(this.StreamFromBitmapSource(source));
        }

        public Stream StreamFromBitmapSource(BitmapSource writeBmp)
        {
            Stream bmp = new MemoryStream();

            BitmapEncoder enc = new BmpBitmapEncoder();
            enc.Frames.Add(BitmapFrame.Create(writeBmp));
            enc.Save(bmp);

            return bmp;
        }
    }
{{endregion}}

When you have the renderer implemented, you will need to assign it to the PdfFormatProvider instance through the **ChartRenderer** property of its [ExportSettings]({%slug radspreadprocessing-format-and-conversion-pdf-settings%}). 

#### [C#] Example 2: Registering the renderer

{{region radspreadprocessing-features-charts-pdf-export_1}}
	
	PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
	pdfFormatProvider.ExportSettings.ChartRenderer = new WpfPdfChartImageRenderer();
{{endregion}}

Now the chart objects in the spreadsheet will be exported along with the other content after invoking the **Export()** method of **PdfFormatProvider**.

>note You can find a complete runnable example using the approach described in this topic in our SDK repository: [Export Chart](https://github.com/telerik/document-processing-sdk/tree/master/SpreadProcessing/ExportChart).

## See Also 

* [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})