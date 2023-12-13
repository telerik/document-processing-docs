---
title: Setting Image Opacity in RadPdfProcessing for Document Processing
description: Learn how to set the opacity of images in RadPdfProcessing when creating RadFixedDocument
type: how-to
page_title: Setting Image Opacity in RadPdfProcessing for Document Processing | Telerik UI for PDF Processing
slug: setting-image-opacity-radpdfprocessing
tags: pdfprocessing, image-opacity, pdf-processing, radpdfviewer
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | PdfProcessing for Document Processing |
| Version | 2023.3.1010 |

## Description

How to create PDFs with images that have less than 100% opacity (semi-transparent images). 

## Solution

Currently, PdfProcessing does not provide an API for setting the opacity of images. However, you can work around this limitation by modifying the opacity of the image before inserting it into the RadFixedDocument.

Here's an example of how you can achieve this using the provided code:

1. Create a new `Bitmap` object from the original image and set its opacity using the `SetImageOpacity` method.
2. Save the modified image to a stream in PNG format.
3. Create an `ImageSource` from the image stream.
4. Use a `FixedContentEditor` to draw the image onto the RadFixedPage.
5. Export the RadFixedDocument to a PDF file using the PdfFormatProvider.
6. Open the PDF file.

```csharp
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Editing;
using Telerik.Windows.Documents.Fixed.Model.Resources;

internal class Program
{
    static void Main()
    {
        RadFixedDocument document = new RadFixedDocument();
        RadFixedPage page = document.Pages.AddPage();

        // Set the opacity level (0.0 - fully transparent, 1.0 - fully opaque)
        float opacity = 0.5f;

        using (Bitmap originalBitmap = new Bitmap("Progress_DevCraft_Ultimate.jpg"))
        {
            Bitmap image = SetImageOpacity(originalBitmap, opacity);

            using (Stream imageStream = new MemoryStream())
            {
                image.Save(imageStream, ImageFormat.Png);
                ImageSource imageSource = new ImageSource(imageStream);

                FixedContentEditor editor = new FixedContentEditor(page);
                editor.DrawImage(imageSource);
            }
        }

        string outputFilePath = $"transformed_{opacity * 100}% opacity.pdf";
        File.Delete(outputFilePath);

        using (Stream output = File.OpenWrite(outputFilePath))
        {
            PdfFormatProvider provider = new PdfFormatProvider();
            provider.Export(document, output);
        }

        Process.Start(outputFilePath);
    }

    public static Bitmap SetImageOpacity(Image image, float opacity)
    {
        Bitmap bmp = new Bitmap(image.Width, image.Height);

        using (Graphics gfx = Graphics.FromImage(bmp))
        {
            ColorMatrix matrix = new ColorMatrix();
            matrix.Matrix33 = opacity;

            ImageAttributes attributes = new ImageAttributes(); 

            attributes.SetColorMatrix(matrix, ColorMatrixFlag.Default, ColorAdjustType.Bitmap);

            gfx.DrawImage(image, new Rectangle(0, 0, bmp.Width, bmp.Height), 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, attributes);
        }

        return bmp;
    }
}
```

Please note that this is a workaround and not an official feature of the PdfProcessing. There is a feature request logged in our backlog to add an API for setting image opacity using PdfProcessing. You can vote for and subscribe to this feature request to receive updates on its progress: [PdfProcessing: Add API for setting Image opacity](https://feedback.telerik.com/document-processing/1634368-pdfprocessing-add-api-for-setting-image-opacity)

## See Also

- [RadPdfProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
