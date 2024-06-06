---
title: Adding a Watermark to PDF Files Using RadPdfProcessing
description: Learn how to add custom watermarks to PDF documents using the RadPdfProcessing library.
type: how-to
page_title: How to Add Watermarks to PDF Documents with RadPdfProcessing
slug: add-watermark-pdf-radpdfprocessing
tags: radpdfprocessing, document processing, watermark, pdf, text watermark
res_type: kb
ticketid: 1653970
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This KB article demonstrates how to add a text watermark across all pages of a PDF document using RadPdfProcessing.

## Solution

To add a watermark to PDF pages using RadPdfProcessing, follow these steps:

1. Import the PDF document using [PdfFormatProvider({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).
2. Iterate through each page of the document.
3. Use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) to add a watermark text block to each page.
4. Customize the watermark's text properties, color, and position.
5. [Export[(https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#export) the document with watermarks back to a PDF file.

Here is a complete code snippet demonstrating these steps:

```csharp
        static void Main(string[] args)
        {
            string fileName = "sample.pdf";
            PdfFormatProvider provider = new PdfFormatProvider();
            RadFixedDocument document = provider.Import(File.ReadAllBytes(fileName));

            foreach (RadFixedPage page in document.Pages)
            {
                AddWatermarkText(page, "Watermark text!", 100);
            }

            string exportFileName = "testWatermarks.pdf";
            File.Delete(exportFileName);

            File.WriteAllBytes(exportFileName, new PdfFormatProvider().Export(document));
            ProcessStartInfo psi = new ProcessStartInfo()
            {
                FileName = exportFileName,
                UseShellExecute = true
            };
            Process.Start(psi);
        }

        private static void AddWatermarkText(RadFixedPage page, string text, byte transparency)
        {
            FixedContentEditor editor = new FixedContentEditor(page);

            Block block = new Block();
            block.TextProperties.FontSize = 80;
            block.TextProperties.TrySetFont(new FontFamily("Arial"), FontStyles.Normal, FontWeights.Bold);
            block.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
            block.GraphicProperties.FillColor = new RgbColor(transparency, 255, 0, 0);
            block.InsertText(text);

            double angle = -45;
            editor.Position.Rotate(angle);
            editor.Position.Translate(0, page.Size.Width);
            editor.DrawBlock(block, new Size(page.Size.Width / Math.Abs(Math.Sin(angle)), double.MaxValue));
        }
```

## See Also

- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) 
- [SDK Example: Add Watermark](https://github.com/telerik/document-processing-sdk/blob/master/PdfProcessing/AddWatermark/Program.cs)
