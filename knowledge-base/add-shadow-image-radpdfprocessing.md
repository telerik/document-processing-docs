---
title: Adding Images with a Shadow in PDF Documents
description: Learn how to add a shadow effect when inserting images into PDF documents using RadPdfProcessing.
type: how-to
page_title: How to Simulate Shadow Effects for Images in PDFs with RadPdfProcessing
slug: add-shadow-image-radpdfprocessing
tags: radpdfprocessing, document processing, image, shadow, insertimage, path, geometry
res_type: kb
ticketid: 1655064
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When inserting an image into a PDF document using the [Block.InsertImage](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/path) method, you might want to add a shadow effect to enhance its appearance. RadPdfProcessing provides functionalities to draw paths and geometries, enabling the simulation of shadows around images. This KB article demonstrates how to add a shadow to an image in a PDF document.

## Solution

To add a shadow to an image, utilize paths with specific geometries to simulate the shadow effect. The following example outlines the necessary steps to insert an image and draw a shadow around it using RadPdfProcessing:

1. **Prepare the environment**: Ensure that `ImagePropertiesResolver` and `JpegImageConverter` are set for cross-platform image scenarios. Refer to the RadPdfProcessing documentation on [cross-platform image handling](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/images).

2. **Insert the image**: Use the `Block.InsertImage` method to insert the image into a block.

3. **Draw the shadow**: Create a `RectangleGeometry` around the image's location with an offset to simulate the shadow effect. Use a dark color for the shadow and adjust its opacity as needed.

4. **Export the PDF document**: Use the `PdfFormatProvider` to export the document to a PDF file.

```csharp
public static Padding pageMarginsValue = new Telerik.Windows.Documents.Primitives.Padding(
     Unit.MmToDip(20), //left
     Unit.MmToDip(20), //top
     Unit.MmToDip(0),  //right
     Unit.MmToDip(0)); //bottom

static void Main(string[] args)
{
    // Setup the environment for image handling
    Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
    Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;
    Telerik.Windows.Documents.Extensibility.JpegImageConverterBase defaultJpegImageConverter = new Telerik.Documents.ImageUtils.JpegImageConverter();
    Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.JpegImageConverter = defaultJpegImageConverter;

    RadFixedDocument fixedDocument = new RadFixedDocument();
    RadFixedPage fixedPage = fixedDocument.Pages.AddPage();
    FixedContentEditor fixedContentEditor = new FixedContentEditor(fixedPage);

    using (Stream imageStream = File.OpenRead("ninja.png"))
    {
        Block imageBlock = new Block();
        imageBlock.SpacingAfter = 0;
        imageBlock.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
        Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource _imageSource =
            new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(imageStream);
        imageBlock.InsertImage(_imageSource);
        Size imageBlockDesiredSize = imageBlock.Measure();
        int shadowWidth = 10;

        // DrawShadow
        RectangleGeometry rectangleGeometry = new RectangleGeometry();
        rectangleGeometry.Rect = new Rect(pageMarginsValue.Left + shadowWidth, pageMarginsValue.Top + shadowWidth, imageBlockDesiredSize.Width, imageBlockDesiredSize.Height);
        Telerik.Windows.Documents.Fixed.Model.Graphics.Path path = fixedPage.Content.AddPath();
        path.IsFilled = true;
        path.IsStroked = false;
        RgbColor shadowColor = new RgbColor(80, 0, 0, 0);
        path.Fill = shadowColor;
        path.Geometry = rectangleGeometry;
                 
        fixedContentEditor.DrawBlock(imageBlock);                     

        // Export the document
        PdfFormatProvider provider = new PdfFormatProvider();
        string outputFilePath = @"sample.pdf";
        using (Stream output = File.OpenWrite(outputFilePath))
        {
            provider.Export(fixedDocument, output);
        }
        Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
    } 
}
```
 ![Image Shadon in PDF](images/image-shadow-pdf.png)  

Adjust the shadow's size, color, and opacity according to your requirements. This approach can be customized to fit specific needs or visual styles.

## Notes

- The provided example is a basic approach to simulating a shadow and might not cover all use cases.
- Experiment with different geometry shapes and colors to achieve the desired shadow effect.

## See Also

- [RadPdfProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Drawing Geometries in PDF Documents](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor#inserting-geometries)
- [Handling Images in Cross-Platform Scenarios](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/images)
