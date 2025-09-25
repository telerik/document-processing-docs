---
title: Converting Colored PDF Document Images to GrayScale in .NET Standard
description: Learn how to convert colored images in PDF documents to grayscale using Telerik PdfProcessing in an ASP.NET Core (.NET 9) environment.
type: how-to
page_title: How to Convert Colored PDF Document Images to GrayScale in .NET Standard
meta_title: How to Convert Colored PDF Document Images to GrayScale in .NET Standard
slug: convert-pdf-grayscale-aspnet-core
tags: pdf,processing,telerik, document, asp,core,convert grayscale,image
res_type: kb
ticketid: 1697916
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Convert colored images in PDF documents using Telerik [PdfProcessing]({%slug radpdfprocessing-overview%}) in an ASP.NET Core (.NET 9) environment. 

![Converting Colored PDF Documents to GrayScale](images/colored-to-grayscale.gif)   


## Solution

To convert colored PDFs to grayscale in ASP.NET Core (.NET 9), follow these steps:

1. Use the Telerik [PdfProcessing]({%slug radpdfprocessing-overview%}) library to load and manipulate PDF content.
2. Replace the image processing logic with a custom implementation using `System.Drawing`.

Here is the complete code example:

```csharp
using System;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Objects;
using Telerik.Windows.Documents.ImageUtils;

class Program
{
    static void Main(string[] args)
    {
        // Initialize ImagePropertiesResolver
        ImagePropertiesResolver defaultImagePropertiesResolver = new ImagePropertiesResolver();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

        string inputPath = "colored.pdf"; // Path to the input PDF
        string outputPath = "grayscale.pdf"; // Path for the grayscale output

        ConvertPdfToGrayscale(inputPath, outputPath); 

        Process.Start(new ProcessStartInfo() { FileName = outputPath, UseShellExecute = true });
    }

    /// <summary>
    /// Converts all content in a PDF document to grayscale.
    /// </summary>
    public static void ConvertPdfToGrayscale(string inputPath, string outputPath)
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        RadFixedDocument document = provider.Import(File.ReadAllBytes(inputPath), TimeSpan.FromSeconds(10));

        foreach (RadFixedPage page in document.Pages)
        {
            foreach (ContentElementBase element in page.Content)
            {
                Image img = element as Image;
                if (img != null)
                {
                    ImageSource source = img.ImageSource;
                    EncodedImageData encodedImageData = source.GetEncodedImageData();
                    byte[] original = encodedImageData.Data;

                    Bitmap grayBitmap = ConvertToGrayscale(original);

                    // Save the grayscale bitmap to a temporary file
                    string tempImagePath = "temp_grayscale_image.jpeg";
                    grayBitmap.Save(tempImagePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                    
                    // Update the image source in the PDF
                    using (FileStream fs = File.Open(tempImagePath, FileMode.Open))
                    {
                        ImageSource grayscaleImageSource = new ImageSource(fs);
                        img.ImageSource = grayscaleImageSource;
                    }
                }
            }
        }

        // Save the modified PDF to the output path
        if (File.Exists(outputPath))
        {
            File.Delete(outputPath);
        }

        File.WriteAllBytes(outputPath, provider.Export(document, TimeSpan.FromSeconds(10)));
    }

    /// <summary>
    /// Converts a byte array of image data to grayscale.
    /// </summary>
    public static Bitmap ConvertToGrayscale(byte[] imageBytes)
    {
        using (var ms = new MemoryStream(imageBytes))
        {
            using (var originalImage = new Bitmap(ms))
            {
                Bitmap grayBitmap = new Bitmap(originalImage.Width, originalImage.Height);

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
}
```

## See Also

- [Converting Colored PDF Documents to GrayScale in .NET Framework]({%slug convert-color-pdf-to-black-and-white-telerik-document-processing%})
