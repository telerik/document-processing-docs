```markdown
---
title: Handling TIFF Images for DOCX to PDF Conversion in Telerik WordsProcessing
description: Learn how to address the issue of TIFF image conversion failure in DOCX to PDF conversion using Telerik WordsProcessing in .NET Standard.
type: how-to
page_title: Converting DOCX with TIFF Images to PDF in Telerik WordsProcessing
meta_title: Converting DOCX with TIFF Images to PDF in Telerik WordsProcessing
slug: docx-tiff-pdf-telerik-wordsprocessing
tags: tiff, pdf, docx, telerik wordsprocessing, .net standard, imagepropertiesresolver
res_type: kb
ticketid: 1717245
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.2.723| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting DOCX files containing TIFF images to PDF using [Telerik WordsProcessing](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/model/imageinline), a `NotSupportedImageFormatException` may occur. This issue arises because the .NET Standard version of the library does not natively support certain image formats like TIFF. 

This knowledge base article also answers the following questions:
- How to handle TIFF images in Telerik WordsProcessing for PDF export?
- Why does Telerik WordsProcessing throw NotSupportedImageFormatException for TIFF?
- How to convert DOCX with unsupported images to PDF in .NET Standard?

## Solution

To resolve this issue, preprocess the DOCX file to convert all TIFF images into a supported format like JPEG or PNG before performing the conversion to PDF. Use a custom `ImagePropertiesResolver` to handle TIFF images manually. Follow the steps below:

1. Implement a custom `ImagePropertiesResolver` to handle TIFF images:

```csharp
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Runtime.InteropServices;
using Telerik.Documents.ImageUtils;
using Telerik.Documents.Primitives;

public sealed class TiffOnlyImagePropertiesResolver : ImagePropertiesResolverBase
{
    private readonly ImagePropertiesResolver fallback = new();

    public override Size GetImageSize(byte[] imageData)
    {
        if (!IsTiff(imageData))
        {
            return fallback.GetImageSize(imageData);
        }

        using var bitmap = LoadBitmap(imageData);
        return new Size(bitmap.Width, bitmap.Height);
    }

    public override bool TryGetRawImageData(byte[] imageData, out byte[] rawRgbData, out byte[] rawAlpha, out Size size)
    {
        if (!IsTiff(imageData))
        {
            return fallback.TryGetRawImageData(imageData, out rawRgbData, out rawAlpha, out size);
        }

        using var bitmap = LoadBitmap(imageData);

        size = new Size(bitmap.Width, bitmap.Height);
        var rect = new Rectangle(0, 0, bitmap.Width, bitmap.Height);
        var data = bitmap.LockBits(rect, ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);

        try
        {
            int height = bitmap.Height;
            int width = bitmap.Width;
            int stride = Math.Abs(data.Stride);

            var pixels = new byte[stride * height];
            Marshal.Copy(data.Scan0, pixels, 0, pixels.Length);

            rawRgbData = new byte[width * height * 3];
            rawAlpha = new byte[width * height];

            for (int y = 0; y < height; y++)
            {
                int srcRow = y * stride;
                int rgbRow = y * width * 3;
                int alphaRow = y * width;

                for (int x = 0; x < width; x++)
                {
                    int src = srcRow + (x * 4);

                    // BGRA -> RGB
                    rawRgbData[rgbRow + (x * 3) + 0] = pixels[src + 2];
                    rawRgbData[rgbRow + (x * 3) + 1] = pixels[src + 1];
                    rawRgbData[rgbRow + (x * 3) + 2] = pixels[src + 0];
                    rawAlpha[alphaRow + x] = pixels[src + 3];
                }
            }

            return true;
        }
        finally
        {
            bitmap.UnlockBits(data);
        }
    }

    private static bool IsTiff(byte[] imageData)
    {
        return imageData.Length >= 4 &&
               ((imageData[0] == 0x49 && imageData[1] == 0x49 && imageData[2] == 0x2A && imageData[3] == 0x00) ||
                (imageData[0] == 0x4D && imageData[1] == 0x4D && imageData[2] == 0x00 && imageData[3] == 0x2A));
    }

    private static Bitmap LoadBitmap(byte[] imageData)
    {
        using var ms = new MemoryStream(imageData);
        return new Bitmap(ms);
    }
}
```

2. Configure the custom resolver in your application:

```csharp
using Telerik.Windows.Documents.Extensibility;

FixedExtensibilityManager.ImagePropertiesResolver = new TiffOnlyImagePropertiesResolver();
```

3. Convert the DOCX file to PDF:

```csharp
using System.IO;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.FormatProviders.Pdf;
using Telerik.Windows.Documents.Flow.Model;

string inputPath = "path/to/your/input.docx";
string outputPath = "path/to/your/output.pdf";

RadFlowDocument document;
var docxFormatProvider = new DocxFormatProvider();

using (FileStream inputStream = File.OpenRead(inputPath))
{
    document = docxFormatProvider.Import(inputStream);
}

var pdfFormatProvider = new PdfFormatProvider();
using (FileStream outputStream = File.Create(outputPath))
{
    pdfFormatProvider.Export(document, outputStream);
}
```

This approach will convert any TIFF images to a supported format during the DOCX-to-PDF conversion process.

## See Also
- [Telerik WordsProcessing Documentation: ImageInline](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/model/imageinline)
- [Telerik Document Processing Libraries Overview](https://www.telerik.com/document-processing-libraries)
- [SkiaSharp Documentation](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/graphics/skiasharp/)
```
