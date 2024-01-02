---
title: Extracting Images from a PDF Document and Saving Them as Image Files
description: This article explains how to extract images from a PDF document and save them as image files. It provides a code snippet and instructions on how to use it.
type: how-to
page_title: Extracting Images from a PDF and Saving Them as Image Files
slug: extracting-images-from-pdf-and-saving-as-image-files
tags: pdf, images, extraction, save, byte arrays, files
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | ---- |
| 2023.3.1106 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|

## Description

This article demonstrates how to extract the images from a PDF document and save them as separate image files.

## Solution

You can use the following code snippet to extract images from each page of a PDF document and save them as image files:

```csharp
static void Main(string[] args)
{
    List<byte[]> extractedImages = new List<byte[]>();

    PdfFormatProvider formatProvider = new PdfFormatProvider();
    string filePath = @"..\..\sample.pdf";
    using (FileStream pdfStream = File.Open(filePath, FileMode.Open))
    {
        RadFixedDocument document = formatProvider.Import(pdfStream);

        // Iterate through each page in the document
        foreach (RadFixedPage page in document.Pages)
        {
            foreach (var contentElement in page.Content)
            {
                Telerik.Windows.Documents.Fixed.Model.Objects.Image imageContent = contentElement as Telerik.Windows.Documents.Fixed.Model.Objects.Image;
                if (imageContent != null)
                {
                    EncodedImageData imageData = imageContent.ImageSource.GetEncodedImageData();
                    byte[] imageBytes = imageData.Data;
                    extractedImages.Add(imageBytes);

                    SaveImageToFile(imageContent, imageData);
                }
            }
        }
    }
}

static int counter = 0;
private static void SaveImageToFile(Image image, EncodedImageData encodedImageData)
{
    string outputDirectoryName = @"..\..\";
    bool isTransperant = image.ImageSource.GetEncodedImageData().AlphaChannel != null;
    if (encodedImageData.Filters.Contains("DCTDecode") && !isTransperant)
    {
        File.WriteAllBytes(Path.Combine(outputDirectoryName, $"fileName{++counter}.jpeg"), encodedImageData.Data);
    }
    else if (encodedImageData.Filters.Contains("FlateDecode") | isTransperant)
    {
        BitmapSource bitmapSource = image.GetBitmapSource();
        using (FileStream fileStream = new FileStream(Path.Combine(outputDirectoryName, $"fileName{++counter}.png"), FileMode.Create))
        {
            BitmapEncoder encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(bitmapSource));
            encoder.Save(fileStream);
        }
    }
    else if (encodedImageData.Filters.Contains("JPXDecode"))
    {
        File.WriteAllBytes(Path.Combine(outputDirectoryName, $"fileName{++counter}.jp2"), encodedImageData.Data);
    }
}
```

Make sure to replace the `filePath` variable with the actual path to your PDF document.

>note Please note that the above code snippet regarding to FlateDecode filter is compatible with .NET Framework because the image data extracted from the PDF is encoded. If you want to use the image data, you will need to decode it and then encode it with the desired image format. 

>caution Keep in mind that the current implementation of the .NET Standard version of the PdfProcessing library doesn't provide an option to get the decoded image data of images with the FlateDecode filter applied. However, you can create a custom method to decode the flate encoded data.

For more information about converting images and scaling their quality, refer to our online documentation: [Cross-Platform Support](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/images).

