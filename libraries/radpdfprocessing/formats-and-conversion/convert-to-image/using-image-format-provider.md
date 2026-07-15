---
title: Using SkiaImageFormatProvider
description: Learn how to convert PDF pages to images using the SkiaImageFormatProvider in the .NET Standard version of RadPdfProcessing.
page_title: Using SkiaImageFormatProvider
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider
tags: skiaimageformatprovider, pdf, image, skiasharp, radpdfprocessing, conversion, dotnet, export
published: True
position: 0
---

# Using SkiaImageFormatProvider

|Minimum Version|R3 2022|
|----|----|
|Target Framework|.NET Standard / .NET (Target OS: None)|

RadPdfProcessing supports converting entire documents to images through the third-party library [SkiaSharp](https://docs.microsoft.com/en-us/xamarin/xamarin-forms/user-interface/graphics/skiasharp/). You can convert to various formats with synchronous or asynchronous export.

>important This feature is available only in the .NET Standard version of the suite. For other versions, refer to the following articles:
>* [ThumbnailFactory](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/features/export-fixedpage-to-image)
>* [How to Export Each Page as an Image in PDF Documents](https://docs.telerik.com/devtools/winforms/knowledge-base/pdfviewer-export-page-images-with-no-ui)
>

## Requirements

To enable the image export functionality in your application, add references to the following packages:

* The `Telerik.Documents.Fixed.FormatProviders.Image.Skia` NuGet package.
* The `SkiaSharp` NuGet package.
* The `SkiaSharp.NativeAssets.*` NuGet package. This package may differ depending on the target platform. Versions are available for Windows, macOS, Linux, WebAssembly, Android, iOS, and others.

A [FontsProvider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/cross-platform/fonts#setting-and-exporting-fonts) implementation is required to read the document fonts and draw the image.

## Using the SkiaImageFormatProvider

To convert document pages to images, use the `Export` method. The `Export` method does not accept a document but a page. Iterate all pages and save each page in a separate file.

**Export RadFixedDocument to Image**

<snippet id='pdf-export-to-image'/>

## Exporting Asynchronously

The `ExportAsync` method allows you to perform the conversion asynchronously.

**Export RadFixedDocument to Image Async**

<snippet id='pdf-async-export-to-image'/>

## Export Settings

The `SkiaImageFormatProvider` exposes the [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%}), which allow you to control the export options.

## See Also

* [Converting XLSX Content to DOCX Document]({%slug convert-excel-content-to-word-document%}) 
* [Export Worksheet to image]({%slug spreadprocessing-export-worksheet-to-image-netstandard%})
* [Cropping PDF Pages and Saving as Images Using RadPdfProcessing]({%slug crop-save-pdf-pages-as-images-radpdfprocessing%})
* [Converting a PDF Document to a Multipage TIFF Image]({%slug convert-pdf-to-multipage-tiff-radpdfprocessing%})
* [Converting Multi-page TIFF Images to PDF]({%slug convert-tiff-to-pdf-radpdfprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%})
