---
title: Converting PDF to TIFF with RadPdfProcessing in .NET Core Applications
description: This article demonstrates how to convert PDF documents to TIFF images in .NET Core applications using RadPdfProcessing.
type: how-to
page_title: How to Convert PDF Documents to TIFF Images Using RadPdfProcessing in .NET Core
slug: convert-pdf-to-tiff-radpdfprocessing-net-core
tags: radpdfprocessing, document processing, pdf, tiff, conversion, .net core, asp.net core
res_type: kb
ticketid: 1682497
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I need to convert PDFs to TIFFs in a .NET 8 ASP.NET Core application. The existing solutions seem to target the .NET Framework, causing compatibility issues. How can I achieve this conversion using RadPdfProcessing in my application?

This knowledge base article also answers the following questions:
- How do I convert PDF documents to TIFF format in a .NET Core application?
- What is the process for exporting PDF pages as images in .NET Core?
- Can I generate a multipage TIFF image from a PDF document using RadPdfProcessing in ASP.NET Core?

## Solution

To convert PDF documents to TIFF images in a .NET Core application, follow these steps:

1. Use the `SkiaImageFormatProvider` to export the PDF pages to images.
2. Utilize the `System.Drawing.Common` library to assemble these images into a multipage TIFF file.

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

- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Using Image Format Provider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/convert-to-image/using-image-format-provider)
- [PdfProcessing: Add support for converting a PDF document to a multipage TIFF image](https://feedback.telerik.com/document-processing/1660559-pdfprocessing-add-support-for-converting-a-pdf-document-to-a-multipage-tiff-image)

---
