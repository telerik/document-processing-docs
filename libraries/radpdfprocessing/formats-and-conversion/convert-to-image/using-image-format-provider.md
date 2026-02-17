---
title: Using SkiaImageFormatProvider
page_title: Using SkiaImageFormatProvider
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider
tags: pdf,image,skia
published: True
position: 0
---

# Using SkiaImageFormatProvider

|Minimum Version|R3 2022|
|----|----|
|Target Framework|.NET Standard / .NET (Target OS: None)|

RadPdfProcessing supports converting the entire document to images. This is achieved by using the third-party library [SkiaSharp](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/graphics/skiasharp/). You can convert to various formats, using synchronous or asynchronous export. 

>important This feature is only available in the NET Standard version of the suite. For other versions check the following articles:
>* [ThumbnailFactory](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/features/export-fixedpage-to-image)
>* [How to Export Each Page as an Image in PDF Documents](https://docs.telerik.com/devtools/winforms/knowledge-base/pdfviewer-export-page-images-with-no-ui)
>

## Requirements

To enable the image exporting functionality in your application, you must add references to the following packages:

* The __Telerik.Documents.Fixed.FormatProviders.Image.Skia__ NuGet package.
* The __SkiaSharp__ NuGet package. 
* The __SkiaSharp.NativeAssets.*__ NuGet package. This package may differ according to the used platform. There are versions for Windows, macOS, Linux, WebAssembly, Android, iOS, and others.

A [FontsProvider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/fonts#setting-and-exporting-fonts) implementation is required to read the document fonts and draw the image.

## Using the SkiaImageFormatProvider

To convert your documents' pages to images, use the __Export__ method. Note that the export method does not accept a document but a page. This is why you need to iterate all pages. In this example, each page is saved in a separate file.

#### __Example 1: Export RadFixedDocument to Image__

<snippet id='pdf-export-to-image'/>

## Exporting Asynchronously
The __ExportAsync__ method allows you to perform the conversion asynchronously.

#### __Example 2: Export RadFixedDocument to Image Async__

<snippet id='pdf-async-export-to-image'/>

## Export Settings

The __SkiaImageFormatProvider__ exposes the [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%}) which allow you to control the export options.

# See Also
* [Converting XLSX Content to DOCX Document]({%slug convert-excel-content-to-word-document%}) 
* [Export Worksheet to image]({%slug spreadprocessing-export-worksheet-to-image-netstandard%})
* [Cropping PDF Pages and Saving as Images Using RadPdfProcessing]({%slug crop-save-pdf-pages-as-images-radpdfprocessing%})
* [Converting a PDF Document to a Multipage TIFF Image]({%slug convert-pdf-to-multipage-tiff-radpdfprocessing%})
* [Converting Multi-page TIFF Images to PDF]({%slug convert-tiff-to-pdf-radpdfprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%})
