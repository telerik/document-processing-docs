---
title: Using SkiaImageFormatProvider
page_title: Using SkiaImageFormatProvider
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider
tags: pdf,image,skia
published: True
position: 1
---

# Using SkiaImageFormatProvider

Since R3 2022 the __RadPdfProcessing__ library support converting entire documents to images. This is achieved by using the third-party library [SkiaSharp](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/graphics/skiasharp/). You can convert to various formats, using synchronous or asynchronous export. 

>important This feature is only available in the NET Standard version of the suite. For other versions check the following article: [ThumbnailFactory](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/features/export-fixedpage-to-image)
>

## Requirements

To enable the image exporting functionality in your application, you must add references to the following packages:

* The __Telerik.Documents.Fixed.FormatProviders.Image.Skia__ assembly.
* The __SkiaSharp__ Nuget package. 
* The __SkiaSharp.NativeAssets.*__ Nuget package. This package may differ according to the used platform. There are versions for Windows, macOS, Linux, WebAssembly, Android, iOS, and others.

A [FontsProvider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/fonts#setting-and-exporting-fonts) implementation is required to read the document fonts and draw the image.

## Using the SkiaImageFormatProvider

To convert your documents' pages to images, use the __Export__ method. Note that the export method does not accept a document but a page. This is why you need to iterate all pages. In this example, each page is saved in a separate file.

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
The __ExportAsync__ method allows you to perform the conversion asynchronously.

#### __[C#] Example 2: Export RadFixedDocument to Image Async__

{{region cs-radpdfprocessing-formats-and-conversion-imageformatprovider_1}}
    
    public async void ExportAsync()
    {
        PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();
        RadFixedDocument fixedDocument = pdfFormatProvider.Import(File.ReadAllBytes("Sample.pdf"));
        SkiaImageFormatProvider imageProvider = new SkiaImageFormatProvider();
         
        int count = 0;
    
        await Parallel.ForEachAsync(fixedDocument.Pages, async (page, token) =>
        {
            int currentCount = Interlocked.Increment(ref count); 
            byte[]? result = await imageProvider.ExportAsync(page);
            File.WriteAllBytes(@"C:\my_temp\Page" + currentCount + ".png", result);
    
        }); 
    } 


{{endregion}}

## Export Settings

The __SkiaImageFormatProvider__ exposes the following settings:

* __ImageFormat:__ Allows you to set the image format, the supported values are __JPEG__, __PNG__, and __Webp__.
* __ScaleFactor:__ Allows you to set the scale factor. The minimum value is 0.1.
* __Quality:__ The value range is 1 (lowest quality) to 100 (highest quality) inclusive. The default value is 75.
* __IsAntialiased:__ Gets or sets a value indicating whether the image will be antialiased. The default value is *true*. 

#### __[C#] Example 3: Set the Settings__

{{region cs-radpdfprocessing-formats-and-conversion-imageformatprovider_2}}

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
