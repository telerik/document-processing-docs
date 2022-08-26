---
title: Using SkiaImageFormatProvider
page_title: Using SkiaImageFormatProvider
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider
tags: pdf,image,skia
published: True
position: 1
---

# Using SkiaImageFormatProvider

Since R3 2022 the __RadPdfProcessing__ library support converting entire documents to images. This is achieved by using the third party library SkiaSharp. You can convert to various formats, using synchronous or asynchronous export. 

>important This feature is only available in the NET Standard version of the suite. For other versions check the fllowing article: [ThumbnailFactory](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/features/export-fixedpage-to-image)
>

## Required packages

* The __Telerik.Documents.Fixed.FormatProviders.Image.Skia__ assembly.
* The __SkiaSharp__ Nuget package. Please note that the package is different for the different operating systems. There is a Linux, MacOs, and Win32 versions. 

## Using the SkiaImageFormatProvider

To convert your documents to images use the __Export__ method.

#### __[C#] Example 1: Export RadFixedDocument to Image__

{{region cs-radpdfprocessing-formats-and-conversion-imageformatprovider_0}}

	PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
	RadFixedDocument fixedDocument = pdfFormatProvider.Import(File.ReadAllBytes("Sample.pdf"));
	SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider(); 
	
	int count = 1;
	foreach (RadFixedPage page in fixedDocument.Pages)
	{
	byte[] resultImage = imageProvider.Export(page);
	File.WriteAllBytes(@"C:\Temp\Page " + count++ + ".png", resultImage);
	}

{{endregion}}

## Exporting Asynchronously
The __ExportAsync__ method allows you to perform this operation asyncronously.

#### __[C#] Example 2: Export RadFixedDocument to Image Async__

    {{region cs-radpdfprocessing-formats-and-conversion-imageformatprovider_1}}
    
    PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
    RadFixedDocument fixedDocument = pdfFormatProvider.Import(File.ReadAllBytes("Test.pdf"));
    SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider();
    
    List<Task<byte[]>> tasks = new List<Task<byte[]>>();
    foreach (RadFixedPage page in fixedDocument.Pages)
    {
        Task<byte[]> resultTask = imageProvider.ExportAsync(page);
        tasks.Add(resultTask);
    }
    
    Task.WaitAll(tasks.ToArray());
    
    int count = 1;
    foreach (Task<byte[]> task in tasks)
    {
        File.WriteAllBytes(@"C:\Temp\Page " + count++ + ".png", task.Result);
    }

{{endregion}}

## Export Settings

The __SkiaImageFormatProvider__ exposes the following settings.

* __ImageFormat:__ Allows you to set the image format, the suported values are __JPEG__, __PNG__, and __Webpp__.
* __ScaleFactor:__ Allows you to set the scale factor. The minimum values is 0.1.
* __Quality:__ The value range is 1 (lowest quality) to 100 (highest quality) inclusive. The default value is 75.
* __IsAntialiased:__ Gets or sets a value indicating whether the image will be antialiased. Default value is *true*. 

#### __[C#] Example 3: Set the Settings__

{{region cs-radpdfprocessing-formats-and-conversion-imageformatprovider_0}}

	PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
	RadFixedDocument fixedDocument = pdfFormatProvider.Import(File.ReadAllBytes("Sample.pdf"));
	SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider();
	
	imageProvider.ExportSettings.ImageFormat = SkiaImageFormat.Png;
	imageProvider.ExportSettings.ScaleFactor = 0.5;
	imageProvider.ExportSettings.Quality = 50;
	imageProvider.ExportSettings.IsAntialiased = false; 
	
	int count = 1;
	foreach (RadFixedPage page in fixedDocument.Pages)
	{
	byte[] resultImage = imageProvider.Export(page);
	File.WriteAllBytes(@"C:\Temp\Page " + count++ + ".png", resultImage);
	}

{{endregion}}