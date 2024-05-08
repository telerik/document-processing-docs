---
title: How to Draw a Chart with FixedContentEditor in PdfProcessing
description: This article provides a solution to draw a bar chart with PdfProcessing. 
type: how-to
page_title: How to Draw a Chart with FixedContentEditor in PdfProcessing
slug: draw-chart-with-fixedcontenteditor
tags:  pdfprocessing, chart, draw
res_type: kb
---
# Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

# Description

This article demonstrates a sample solution how to draw a chart in PdfProcessing.

# Solution
The powerful [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) allows you draw a simulation of a chart element at the desired [Position]({%slug radpdfprocessing-concepts-position%}):

 
   ```csharp
            public static System.Windows.Size pageSize = new System.Windows.Size(Unit.MmToDip(210), Telerik.Windows.Documents.Media.Unit.MmToDip(297));
        public static Padding pageMarginsValue = new Telerik.Windows.Documents.Primitives.Padding(
             Unit.MmToDip(20),//left
              Unit.MmToDip(0),//top
               Unit.MmToDip(0),//right
                Unit.MmToDip(0));//bottom
        public static double currentYposition = pageMarginsValue.Top;
        public static double currentXposition = pageMarginsValue.Left;
        public static double pageYLimit = pageSize.Height - pageMarginsValue.Bottom;
        public static double pageXLimit = pageSize.Width - pageMarginsValue.Right;

        private static Random random = new Random();
        private static Dictionary<string, int> availableLibraries = new Dictionary<string, int>();
        private static RadFixedDocument fixedDocument = new RadFixedDocument();
        static void Main(string[] args)
        {
            availableLibraries.Add("RadPdfProcessing", random.Next(20, 500));
            availableLibraries.Add("RadSpreadProcessing", random.Next(20, 500));
            availableLibraries.Add("RadWordsProcessing", random.Next(20, 500));
            availableLibraries.Add("RadSpreadStreamProcessing", random.Next(20, 500));
            availableLibraries.Add("RadZipLibrary", random.Next(20, 500)); 

            DrawChart();

            PdfFormatProvider provider = new PdfFormatProvider();
            string outputFilePath = @"..\..\sample.pdf";
            File.Delete(outputFilePath);
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(fixedDocument, output);
            }
            Process.Start(outputFilePath);
        }

        private static void DrawChart()
        {
            RadFixedPage fixedPage = fixedDocument.Pages.LastOrDefault();
            if (fixedPage == null) { fixedPage = fixedDocument.Pages.AddPage(); }
            FixedContentEditor fixedEditor = new FixedContentEditor(fixedPage);

            fixedEditor.Position.Translate(currentXposition, currentYposition);
            fixedEditor.TextProperties.Font = FontsRepository.Courier;
            double maxWidth = availableLibraries.Max(x =>
            {
                Block block = new Block();
                block.InsertText(x.Key +" - "+ x.Value );
                return block.Measure().Height;
            }); 
            Point chartStartPoint = new Point(maxWidth, 250);

            Rect chartDimensions = GetChartDimensions(chartStartPoint);
 
            fixedEditor.Position.Translate(pageMarginsValue.Left, currentYposition);
            int maxValue = availableLibraries.Max(x => x.Value);
            Block textBlock = new Block();
            textBlock.InsertText(availableLibraries.First().Key);
            double textHeight = textBlock.Measure().Height;
            double startX = 0;

            foreach (KeyValuePair<string, int> library in availableLibraries)
            {  
                Block measureBlock = new Block();
                measureBlock.InsertText(string.Format("{0} - {1}", library.Key, library.Value));
                Size measuredSize = measureBlock.Measure();
                startX = Math.Max(startX, measuredSize.Width)+10;
            }

            foreach (KeyValuePair<string, int> library in availableLibraries)
            {
                DrawBarAndText(maxValue, textHeight, startX, library);
            }
        }
        private static Rect GetChartDimensions(Point start)
        {
            Block textBlock = new Block();
            textBlock.InsertText(availableLibraries.First().Key);
            double textHeight = textBlock.Measure().Height;
            double chartHeight = textHeight * availableLibraries.Count;

            double pageWidth = fixedDocument.Pages.Last().Size.Width;
            double chartWidth = pageWidth * 0.55;

            Point leftBottomPoint = new Point(start.X, start.Y + chartHeight);
            Point rightTopPoint = new Point(chartWidth + start.X, start.Y);
            Point rightBottomPoint = new Point(chartWidth + start.X, chartHeight + start.Y);

            Rect chartRect = new Rect(start, new Size(rightTopPoint.X - start.X, chartHeight));

            return chartRect;
        }

        private static byte RandomRgbValue()
        {
            return (byte)random.Next(0, 201);
        }
        private static void DrawBarAndText(int maxValue, double textHeight, double startX, KeyValuePair<string, int> library)
        {
            string name = library.Key;
            RadFixedPage fixedPage = fixedDocument.Pages.LastOrDefault();
            if (fixedPage == null) { fixedPage = fixedDocument.Pages.AddPage(); }
            FixedContentEditor fixedEditor = new FixedContentEditor(fixedPage);
            RgbColor fillColor = new RgbColor(RandomRgbValue(), RandomRgbValue(), RandomRgbValue());
            Block textBlock = new Block();
            fixedEditor.GraphicProperties.FillColor = fillColor;
            fixedEditor.GraphicProperties.StrokeColor = new RgbColor(fillColor.B, fillColor.G, fillColor.R);
            textBlock.GraphicProperties.CopyFrom(fixedEditor.GraphicProperties);
            textBlock.InsertText(string.Format("{0} - {1}", name, library.Value));
            Size measuredText = textBlock.Measure();
            currentYposition += measuredText.Height;
            fixedEditor.Position.Translate(pageMarginsValue.Left, currentYposition);
            fixedEditor.DrawBlock(textBlock);

          
            int width = library.Value - (maxValue % library.Value);
            
            fixedEditor.Position.Translate(fixedEditor.Position.Matrix.OffsetX + startX, currentYposition);

            LinearGradient linearGradient = new Telerik.Windows.Documents.Fixed.Model.ColorSpaces.LinearGradient(new Point(0, 0), new Point(30, 30));
            RgbColor startColor=  new RgbColor(RandomRgbValue(), RandomRgbValue(), RandomRgbValue());
            RgbColor stopColor = new RgbColor(RandomRgbValue(), RandomRgbValue(), RandomRgbValue());
            linearGradient.GradientStops.Add(new GradientStop(startColor, 0));
            linearGradient.GradientStops.Add(new GradientStop(stopColor, 1));

            fixedEditor.GraphicProperties.FillColor = linearGradient;
            IPosition savedPosition = fixedEditor.Position.Clone();
            fixedEditor.Position.Translate(0, currentYposition);
            fixedEditor.DrawRectangle(new Rect(startX + pageMarginsValue.Left, textHeight / 2, width, 10));
            fixedEditor.Position = savedPosition; 
            fixedEditor.Position.Translate(fixedEditor.Position.Matrix.OffsetX - startX, currentYposition + measuredText.Height);
        }
   ```

The achieved result is illustrated below:

![Pdf document with Chart](images/pdf-with-chart.png)

# See Also
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
- [Position]({%slug radpdfprocessing-concepts-position%})
