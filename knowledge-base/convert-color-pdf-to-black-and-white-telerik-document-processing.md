---
title: Converting Colored PDF Documents to GrayScale with Telerik Document Processing
description: Learn how to use Telerik Document Processing libraries to convert color PDF reports into black and white format.
type: how-to
page_title: How to Convert Color PDF Reports to Black & White Using Telerik Document Processing
slug: convert-color-pdf-to-black-and-white-telerik-document-processing
tags: document, processing, pdf, conversion, black, white, grays
res_type: kb
ticketid: 1675661
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article shows a sample approach how to convert a colored PDF document to a grayscale one with RadPdfProcessing. 

## Solution

To convert a colored PDF file to black and white using Telerik Document Processing, follow the steps below:

1. Use the [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) library to import the PDF file.
2. Iterate through the content of the PDF file, including Path, TextFragment, and Image instances.
3. Modify the colors to grayscale and export the processed file as a new PDF document.

Here is a complete code snippet that demonstrates how to achieve this conversion:

```csharp
using System;
using System.Diagnostics;
using System.Windows.Media.Imaging;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Graphics;
using Telerik.Windows.Documents.Fixed.Model.Objects;
using Telerik.Windows.Documents.Fixed.Model.Text;

namespace PDFToBlackAndWhite
{
    class Program
    {
        static void Main(string[] args)
        {
            // Load your original PDF report
            PdfFormatProvider provider = new PdfFormatProvider();
            RadFixedDocument document = provider.Import(System.IO.File.ReadAllBytes("yourOriginalReport.pdf"));

            // Convert each element's color to grayscale
            foreach (RadFixedPage page in document.Pages)
            {
                foreach (ContentElementBase element in page.Content)
                {
                    MakeGrayscale(element);
                }
            }

            // Export the modified document as a new PDF file
            string resultFile = "grayscaleReport.pdf";
            System.IO.File.WriteAllBytes(resultFile, provider.Export(document));
            Process.Start(new ProcessStartInfo(resultFile) { UseShellExecute = true });
        }

        private static void MakeGrayscale(ContentElementBase element)
        {
            if (element is TextFragment text)
            {
                text.Stroke = MakeGrayscale(text.Stroke);
                text.Fill = MakeGrayscale(text.Fill);
            }

            if (element is Path path)
            {
                path.Stroke = MakeGrayscale(path.Stroke);
                path.Fill = MakeGrayscale(path.Fill);
            }

            if (element is Image image)
            {
                // Convert the image to grayscale - Implementation depends on your specific requirements
            }
        }

        // Implement the MakeGrayscale method for ColorBase, Path, and Image as per your requirements
    }
}
```

Ensure to adjust the `MakeGrayscale` methods for `ColorBase`, `Path`, and `Image` according to your specific needs. This sample demonstrates the basic approach to converting document elements to grayscale but might require adjustments for complex scenarios or specific color processing requirements.
## See Also

- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Telerik Document Processing Introduction](https://docs.telerik.com/devtools/document-processing/introduction)
- [Conditional Formatting in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting)
