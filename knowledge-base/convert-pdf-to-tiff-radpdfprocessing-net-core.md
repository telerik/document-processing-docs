---
title: Converting PDF to TIFF with RadPdfProcessing in .NET Standard
description: This article demonstrates how to convert PDF documents to TIFF images in .NET Standard applications using RadPdfProcessing.
type: how-to
page_title: How to Convert PDF Documents to TIFF Images Using RadPdfProcessing in .NET Standard
slug: convert-pdf-to-tiff-radpdfprocessing-net-core
tags: radpdfprocessing, document, processing, pdf, tiff, conversion, net, standard
res_type: kb
ticketid: 1682497
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to convert PDF documents to TIFF format in .NET Standard.

## Solution

To convert PDF documents to TIFF images in .NET Standard, follow these steps:

1. Use the [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%}) to export the PDF pages to images.
2. Utilize the [System.Drawing.Common](https://www.nuget.org/packages/System.Drawing.Common/) library to assemble these images into a multi-page TIFF file.

Here's an example code snippet demonstrating the process:

```csharp
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using Telerik.Documents.Fixed.FormatProviders.Image.Skia;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using System.IO;

namespace PdfToTIFFNetCore
{
    internal class Program
    {
        [STAThread]
        static void Main(string[] args)
        {
            PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
            RadFixedDocument fixedDocument = pdfFormatProvider.Import(File.ReadAllBytes("your-pdf-file.pdf"), TimeSpan.FromSeconds(10));
            SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider();
            string exportedFileName = "Exported.tiff";
            using (FileStream fileStream = new FileStream(exportedFileName, FileMode.Create))
            {
                System.Drawing.Imaging.Encoder encoder = System.Drawing.Imaging.Encoder.SaveFlag;
                ImageCodecInfo codecInfo = GetEncoderInfo("image/tiff");
                EncoderParameters encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = new EncoderParameter(encoder, (long)EncoderValue.MultiFrame);

                Bitmap firstImage = null;
                bool firstFrame = true;

                foreach (RadFixedPage page in fixedDocument.Pages)
                {
                    byte[] resultImage = imageProvider.Export(page, TimeSpan.FromSeconds(10));
                    using (MemoryStream ms = new MemoryStream(resultImage))
                    {
                        using (Bitmap bitmap = new Bitmap(ms))
                        {
                            if (firstFrame)
                            {
                                firstImage = new Bitmap(bitmap);
                                firstImage.Save(fileStream, codecInfo, encoderParams);
                                firstFrame = false;
                            }
                            else
                            {
                                encoderParams.Param[0] = new EncoderParameter(encoder, (long)EncoderValue.FrameDimensionPage);
                                firstImage.SaveAdd(bitmap, encoderParams);
                            }
                        }
                    }
                }

                encoderParams.Param[0] = new EncoderParameter(encoder, (long)EncoderValue.Flush);
                firstImage.SaveAdd(encoderParams);
            }

            Process.Start(new ProcessStartInfo() { FileName = exportedFileName, UseShellExecute = true });
        }

        private static ImageCodecInfo GetEncoderInfo(string mimeType)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.MimeType == mimeType)
                {
                    return codec;
                }
            }
            return null;
        }
    }
}
```

Replace `"your-pdf-file.pdf"` with the path to your PDF file. This code will create a TIFF file named `Exported.tiff` containing all the pages from the PDF document.

## See Also

- [Converting a PDF Document to a Multipage TIFF Image]({%slug convert-pdf-to-multipage-tiff-radpdfprocessing%})

