---
title: Converting Colored PDF Documents to GrayScale in ASP.NET Core 
description: Learn how to convert colored PDF documents to grayscale using the Telerik PdfProcessing library in ASP.NET Core (.NET 9 Target OS: None).
type: how-to
page_title: How to Convert Colored PDFs to GrayScale in ASP.NET Core
meta_title: How to Convert Colored PDFs to GrayScale in ASP.NET Core
slug: convert-colored-pdf-to-grayscale-aspnet-core
tags: pdf,processing,telerik, document ,asp,net, core, gray, image
res_type: kb
ticketid: 1697916
---

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
I am working with ASP.NET Core (.NET 9) and need to convert colored PDF documents to grayscale using the Telerik PdfProcessing library. The example provided in the Telerik knowledge base uses `System.Windows.Media` and `System.Windows.Media.Imaging`, which are unavailable in my environment. I need a solution compatible with ASP.NET Core (.NET 9).

This knowledge base article also answers the following questions:
- How to convert colored PDFs to grayscale in ASP.NET Core?
- How to use Telerik PdfProcessing for grayscale PDF conversion?
- How to modify PDF images to grayscale using .NET Core?

## Solution
To convert colored PDF documents to grayscale in ASP.NET Core (.NET 9), use the Telerik PdfProcessing library and the following custom implementation.

### Code Example: Grayscale PDF Conversion
```csharp
using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Objects;
using Telerik.Windows.Documents.ImageUtils;

static void Main(string[] args)
{
    ImagePropertiesResolver defaultImagePropertiesResolver = new ImagePropertiesResolver();
    Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
    string inputPath = "colored.pdf";
    string outputPath = "grayscale.pdf";
    
    ConvertPdfToGrayscale(inputPath, outputPath);
    
    Process.Start(new ProcessStartInfo() { FileName = outputPath, UseShellExecute = true });
}

public static void ConvertPdfToGrayscale(string inputPath, string outputPath)
{
    PdfFormatProvider provider = new PdfFormatProvider();
    RadFixedDocument document = provider.Import(File.ReadAllBytes(inputPath), TimeSpan.FromSeconds(10));

    foreach (RadFixedPage page in document.Pages)
    {
        foreach (ContentElementBase element in page.Content)
        {
            if (element is Telerik.Windows.Documents.Fixed.Model.Objects.Image img)
            {
                ImageSource source = img.ImageSource;
                EncodedImageData encodedImageData = source.GetEncodedImageData();
                byte[] original = encodedImageData.Data;
                Bitmap gray = ConvertToGrayscale(original);

                using (var ms = new MemoryStream())
                {
                    gray.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                    string tempImage = "tempImage.jpeg";
                    gray.Save(tempImage, System.Drawing.Imaging.ImageFormat.Jpeg);

                    using (FileStream fs = File.Open(tempImage, FileMode.Open))
                    {
                        ImageSource imageSource = new ImageSource(fs);
                        img.ImageSource = imageSource;
                    }
                }
            }
        }
    }

    if (File.Exists(outputPath))
    {
        File.Delete(outputPath);
    }

    File.WriteAllBytes(outputPath, provider.Export(document, TimeSpan.FromSeconds(10)));
}

public static Bitmap ConvertToGrayscale(byte[] imageBytes)
{
    using (var ms = new MemoryStream(imageBytes))
    {
        using (var originalImage = new Bitmap(ms))
        {
            var grayBitmap = new Bitmap(originalImage.Width, originalImage.Height);

            for (int y = 0; y < originalImage.Height; y++)
            {
                for (int x = 0; x < originalImage.Width; x++)
                {
                    Color originalColor = originalImage.GetPixel(x, y);
                    int grayValue = (int)(originalColor.R * 0.3 + originalColor.G * 0.59 + originalColor.B * 0.11);
                    Color grayColor = Color.FromArgb(grayValue, grayValue, grayValue);
                    grayBitmap.SetPixel(x, y, grayColor);
                }
            }
            return grayBitmap;
        }
    }
}
```

### Key Points
1. The `ConvertPdfToGrayscale` method processes each image in the PDF document and converts it to grayscale.
2. The `ConvertToGrayscale` method applies a luminance formula to transform colored images to grayscale.
3. Ensure that the `ImageSource` properties are re-assigned after image processing.

Modify the code further to address any specific requirements.

## See Also
- [PdfProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Convert Color PDF to Black-and-White Knowledge Base Article](https://docs.telerik.com/devtools/document-processing/knowledge-base/convert-color-pdf-to-black-and-white-telerik-document-processing)
- [ASP.NET Core Documentation](https://learn.microsoft.com/en-us/aspnet/core)
