---
title: Converting a PDF Document to a Multipage TIFF Image in .NET Framework
description: Learn how to transform PDF documents into multipage TIFF files using RadPdfProcessing from the Document Processing libraries.
type: how-to
page_title: How to Convert PDF Documents to Multipage TIFF with RadPdfProcessing
slug: convert-pdf-to-multipage-tiff-radpdfprocessing
tags: radpdfprocessing, pdf, tiff, image, conversion, multipage, document, processing
res_type: kb
ticketid: 1660512
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

You may need to convert PDF pages into multipage TIFF images for archival purposes or for compatibility with systems that require image formats. Many graphic applications do not directly support this conversion. This article demonstrates how to convert PDF documents to multipage TIFF images with `RadPdfProcessing`.

![Convert PDF to Multipage TIFF](images/pdf-to-multiple-page-tiff.gif)  

## Solution

To convert a PDF document to a multipage TIFF image, follow the steps below:

1. Use the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to import the PDF document.
2. Iterate through all the pages ([RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})) of the imported [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).
3. For each page, create a thumbnail image.
4. Render each thumbnail image to a `RenderTargetBitmap`.
5. Add each rendered bitmap as a frame to a [TiffBitmapEncoder](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.tiffbitmapencoder).
6. Save the encoded TIFF image to a file.

The following code snippet demonstrates this process:

```csharp
[STAThread]
private static void Main(string[] args)
{
    string inputFilePath = @"path_to_your_pdf_document.pdf";
    PdfFormatProvider pdfProcessingProvider = new PdfFormatProvider();
    RadFixedDocument document = pdfProcessingProvider.Import(File.ReadAllBytes(inputFilePath));
    ThumbnailFactory factory = new ThumbnailFactory();
    BitmapEncoder encoder = new TiffBitmapEncoder();
    string exportedFileName = "Exported.tiff";
    using (FileStream fileStream = new FileStream(exportedFileName, FileMode.Create))
    {
        foreach (RadFixedPage page in document.Pages)
        {
            ImageSource imageSource = factory.CreateThumbnail(page, page.Size);
            System.Windows.Controls.Image image = new System.Windows.Controls.Image();
            image.Source = imageSource;
            Grid container = new Grid();
            container.Background = Brushes.White;
            container.Children.Add(image);
            container.Measure(new Size(double.PositiveInfinity, double.PositiveInfinity));
            container.Arrange(new Rect(new Point(0, 0), container.DesiredSize));

            RenderTargetBitmap bitmap = new RenderTargetBitmap((int)PageLayoutHelper.GetActualWidth(page), 
                (int)PageLayoutHelper.GetActualHeight(page), 96, 96, PixelFormats.Pbgra32);
            bitmap.Render(container);

            encoder.Frames.Add(BitmapFrame.Create(bitmap));
        }
        encoder.Save(fileStream);
    }
    Process.Start(new ProcessStartInfo() { FileName = exportedFileName, UseShellExecute = true });
}
```

## Required Assemblies

* Telerik.Windows.Controls.FixedDocumentViewers.dll
* Telerik.Windows.Documents.Core.dll
* Telerik.Windows.Documents.Fixed.dll
* WindowsBase.dll
* PresentationCore.dll

## Notes

* Add references to the required Telerik Document Processing and WPF libraries in your project.
* Adjust the `inputFilePath` variable to point to your PDF document.
* The generated TIFF file is saved with the name "Exported.tiff" in the project directory. Change the `exportedFileName` variable to modify the output file name and location.

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [Export RadFixedPage to TIFF Image]({%slug export-radfixedpage-to-image%})
* [TiffBitmapEncoder Class Documentation](https://learn.microsoft.com/en-us/dotnet/api/system.windows.media.imaging.tiffbitmapencoder)
* [Using SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})
* [Converting Multi-page TIFF Images to PDF]({%slug convert-tiff-to-pdf-radpdfprocessing%})
* [Converting PDF to TIFF with RadPdfProcessing in .NET Standard]({%slug convert-pdf-to-tiff-radpdfprocessing-net-core%})
