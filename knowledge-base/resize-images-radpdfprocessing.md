---
title: Resizing Large Images to Fit in the PDF Page
description: Learn how to adjust large images to fit within the PDF page dimensions using RadPdfProcessing, preserving the aspect ratio.
type: how-to
page_title: How to Resize Images for PDF Documents in RadPdfProcessing
slug: resize-images-radpdfprocessing
tags: radpdfprocessing, document processing, image to pdf, image resize, aspect ratio
res_type: kb
ticketid: 1656650
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When converting an image to a PDF file using [RadPdfProcessing]({%slug radpdfprocessing-overview%}), the resulting PDF may cut off parts of the image if its dimensions (e.g., 1700 x 1700 px) exceed the PDF page size. The goal is to:

1. Display the image as is if it fits on the page without resizing.
2. If the image is too large, shrink it to fit on the page while preserving the aspect ratio.

This KB article also answers the following questions:
- How do I convert an image to a PDF while fitting it on the page in RadPdfProcessing?
- How can I preserve the aspect ratio of an image when converting it to PDF?
- What is the method to resize images for PDF conversion in RadPdfProcessing?

## Solution

To resize a large image to fit within the PDF page dimensions while preserving its aspect ratio, follow these steps:

1. Determine the dimensions of the image by creating an [ImageSource({%slug radpdfprocessing-model-imagesource%}) instance from the image file.

2. Check if the image dimensions exceed the page size. If they do, calculate the new size of the image that preserves the aspect ratio and fits within the page.

3. Use the `DrawImage(ImageSource source, Size size)` method to draw the resized image on the PDF page.

4. To preserve the aspect ratio, use the following code snippet that automatically adjusts the image size based on the page dimensions:

```csharp
Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

string[] imageFiles = Directory.GetFiles(@"..\..\..\MyImages");

foreach (string imageFilePath in imageFiles)
{
    RadFixedDocument document = new RadFixedDocument();
    RadFixedPage fixedPage = document.Pages.AddPage();
    Telerik.Documents.Primitives.Size pageSize = new Telerik.Documents.Primitives.Size(
        Telerik.Windows.Documents.Media.Unit.MmToDip(210),
        Telerik.Windows.Documents.Media.Unit.MmToDip(297));
    Telerik.Documents.Primitives.Size original; 
    using (Bitmap bmp = new Bitmap(imageFilePath))
    {
        original = new Telerik.Documents.Primitives.Size(bmp.Width, bmp.Height);
    }
    
    double maxSize = Math.Min(pageSize.Width, pageSize.Height);
    float percent = (new List<float> { (float)maxSize / (float)original.Width, (float)maxSize / (float)original.Height }).Min();
    Telerik.Documents.Primitives.Size resultSize = new Telerik.Documents.Primitives.Size((int)Math.Floor(original.Width * percent), (int)Math.Floor(original.Height * percent));

    if (resultSize.Width > resultSize.Height)
    {
        pageSize = new Telerik.Documents.Primitives.Size(
        Telerik.Windows.Documents.Media.Unit.MmToDip(297),
        Telerik.Windows.Documents.Media.Unit.MmToDip(210));
    }
    fixedPage.Size = pageSize;
    Telerik.Windows.Documents.Fixed.Model.Objects.Image image = new Telerik.Windows.Documents.Fixed.Model.Objects.Image();
    FileStream fileStream = new FileStream(imageFilePath, FileMode.Open);
    ImageSource imageSrc = new ImageSource(fileStream);
    image.ImageSource = imageSrc;
    image.Width = resultSize.Width;
    image.Height = resultSize.Height;
    SimplePosition simplePosition = new SimplePosition();
    simplePosition.Translate(5, 5);
    image.Position = simplePosition;
    fixedPage.Content.Add(image);

    PdfFormatProvider provider = new PdfFormatProvider();
    string outputFilePath = "output" + Guid.NewGuid().ToString() + ".pdf";

    using (Stream output = File.OpenWrite(outputFilePath))
    {
        provider.Export(document, output);
    }
    Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
}
``` 

This approach ensures that images are resized to fit within the PDF page dimensions without losing their aspect ratio.

|Vertical Image|Horizontal Image|
|----|----|
|![PdfProcessing Resize Vertical Image](images/pdf-processing-resize-vertical-image.png)|![PdfProcessing Resize Horizontal](images/pdf-processing-resize-horizontal-image.png)|      

## See Also

- [Splitting a Large Image Across Multiple PDF Pages]({%slug split-export-large-image-multiple-pdf-pages-radpdfprocessing%})
- [How to Generate a PDF Document from Images with FixedContentEditor]({%slug pdf-from-images-with-fixedcontenteditor%})
