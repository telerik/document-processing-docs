---
title: Converting Multi-page TIFF Images to PDF 
description: Learn how to convert TIFF images to PDF format using RadPdfProcessing while ensuring the whole image fits onto the page without being cut off.
type: how-to
page_title: How to Convert TIFF to PDF with Full Content Visibility Using RadPdfProcessing
slug: convert-tiff-to-pdf-radpdfprocessing
tags: radpdfprocessing, document, processing, tiff, pdf, conversion, image, fit,
res_type: kb
category: knowledge-base
ticketid: 1651927
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

A common requirement is to generate a PDF document from a multi-page TIFF file. This article demonstrates a sample approach how to achieve it, ensuring the entire TIFF image fits onto the PDF page without any content being cut off.

## Solution

To prevent TIFF images from being cut off when converted to PDF, consider creating a list of images from the TIFF frames. Then, adjust the PDF page dimensions to fit the image size. Here's a step-by-step guide:

1. Convert the TIFF image to individual JPEG or PNG images. Ensure each image size matches the TIFF frame size to avoid scaling issues.
2. Create a new `RadFixedDocument`, setting the page size based on the image dimensions.
3. Use `RadFixedDocumentEditor` to add the images to the document pages, ensuring each image fits the page.
4. Export the document to PDF format using `PdfFormatProvider`.

Below is a code snippet demonstrating this process:

```csharp
static void Main(string[] args)
{
    string tiffFilePath = "test4.tif";
    string imageFolderPath = @"..\..\Images";
    System.Windows.Size pageSize = CreatedImages(tiffFilePath, imageFolderPath);
    GeneratePdfFromImagesWithRadFixedDocumentEditor(imageFolderPath, pageSize);
}

private static System.Windows.Size CreatedImages(string file, string imageFolderPath)
{
    int offset = 5;
    System.Windows.Size pageSize = new System.Windows.Size(100, 100);
    List<Image> images = new List<Image>();
    Bitmap bitmap = (Bitmap)Image.FromFile(file);
    int count = bitmap.GetFrameCount(FrameDimension.Page);
    string tempImg = string.Empty;
    for (int idx = 0; idx < count; idx++)
    {
        bitmap.SelectActiveFrame(FrameDimension.Page, idx);
        MemoryStream byteStream = new MemoryStream();
        bitmap.Save(byteStream, ImageFormat.Tiff);
        if (bitmap.Width > pageSize.Width )
        {
            pageSize = new System.Windows.Size(bitmap.Width+ offset, pageSize.Height);
        }
        if (bitmap.Height > pageSize.Height)
        {
            pageSize = new System.Windows.Size(pageSize.Width, bitmap.Height + offset);
        }
        tempImg = imageFolderPath+@"\img" + idx + ".jpeg";
        File.Delete(tempImg);
        bitmap.Save(tempImg, ImageFormat.Jpeg);
        images.Add(Image.FromStream(byteStream));
    }
    return pageSize;
}
private static void GeneratePdfFromImagesWithRadFixedDocumentEditor(string imageFolderPath, System.Windows.Size pageSize)
{
    Padding pageMarginsValue = new Padding(
        Unit.MmToDip(0),//left
         Unit.MmToDip(0),//top
          Unit.MmToDip(0),//right
           Unit.MmToDip(0));//bottom 
    RadFixedDocument fixedDocument = new RadFixedDocument();
    RadFixedDocumentEditor documentEditor = new RadFixedDocumentEditor(fixedDocument);
    documentEditor.SectionProperties.PageSize = pageSize;
    documentEditor.SectionProperties.PageMargins = pageMarginsValue;
    string[] imageFiles = Directory.GetFiles(imageFolderPath);

    foreach (string imageFilePath in imageFiles)
    {
        FileStream fileStream = new FileStream(imageFilePath, FileMode.Open);
        Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource _imageSource =
            new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(fileStream);
        documentEditor.InsertImageInline(_imageSource);
        documentEditor.InsertLineBreak();
    }
    documentEditor.Dispose();

    PdfFormatProvider provider = new PdfFormatProvider();
    string outputFilePath = @"..\..\sample.pdf";
    File.Delete(outputFilePath);
    using (Stream output = File.OpenWrite(outputFilePath))
    {
        provider.Export(fixedDocument, output);
    }
    Process.Start(outputFilePath);
}
```
This approach ensures the TIFF images are converted to PDF format without any part being cut off. The key is to adjust the document's page size to match the image dimensions.

## Notes

- The conversion process involves saving each TIFF frame as a separate image (JPEG or PNG) to accurately size the document pages.
- The `offset` variable adds a margin around the image to ensure it fits comfortably on the page without touching the edges.

## See Also

- [RadPdfProcessing Documentation]({%slug radpdfprocessing-overview%})
- [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%})
- [How to Generate a PDF Document from Images with RadFixedDocumentEditor]({%slug pdf-from-images-with-radfixeddocumenteditor%})
