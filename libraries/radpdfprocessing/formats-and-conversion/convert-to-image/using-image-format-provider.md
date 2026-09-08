---
title: Using SkiaImageFormatProvider
description: Learn how to convert PDF pages to images with SkiaImageFormatProvider in cross-platform .NET Standard and .NET versions of RadPdfProcessing.
page_title: Using SkiaImageFormatProvider
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider
tags: skiaimageformatprovider, pdf, image, skiasharp, radpdfprocessing, conversion, dotnet, export
published: True
position: 0
---

# Using SkiaImageFormatProvider

| Minimum Version | R3 2022 |
|----|----|
| Target Framework | .NET Standard / .NET (Target OS: None) |

Use `SkiaImageFormatProvider` to export `RadFixedPage` objects to `.png`, `.jpg`, `.jpeg`, or `.webp` images through the third-party [SkiaSharp](https://learn.microsoft.com/en-us/previous-versions/xamarin/xamarin-forms/user-interface/graphics/skiasharp/) library. To export a full PDF document, iterate its pages and save each page as a separate image.

>important This feature is available for cross-platform `.NET Standard` and `.NET` targets that use `Target OS: None`. For WPF and WinForms-specific alternatives, refer to these articles:
>* [ThumbnailFactory](https://docs.telerik.com/devtools/wpf/controls/radpdfviewer/export-fixedpage-to-image)
>* [How to Export Each Page as an Image in PDF Documents](https://docs.telerik.com/devtools/winforms/knowledge-base/pdfviewer-export-page-images-with-no-ui)
>

## Requirements

To enable the image export functionality in your application, add references to the following packages:

* The `Telerik.Documents.Fixed.FormatProviders.Image.Skia` NuGet package.
* The `SkiaSharp` NuGet package.
* The `SkiaSharp.NativeAssets.*` NuGet package. This package may differ depending on the target platform. Versions are available for Windows, macOS, Linux, WebAssembly, Android, iOS, and others.

Set up a [FontsProvider implementation]({%slug radpdfprocessing-cross-platform-fonts%}#setting-and-exporting-fonts) so the renderer can read document fonts and draw the image correctly.

## Exporting Pages to Images

To convert document pages to images, use the `Export()` method. `SkiaImageFormatProvider` exports `RadFixedPage` objects, not `RadFixedDocument` objects. Iterate the pages of a PDF document and save each page in a separate file.

**Export RadFixedDocument to Image**

<snippet id='pdf-export-to-image'/>

## Exporting Asynchronously

Use `ExportAsync()` when you want to perform the conversion asynchronously.

**Export RadFixedDocument to Image Async**

<snippet id='pdf-async-export-to-image'/>

## Export Settings

The `SkiaImageFormatProvider` exposes [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%}) so you can control the image format, quality, scaling, and antialiasing.

## See Also

* [Converting XLSX Content to DOCX Document]({%slug convert-excel-content-to-word-document%}) 
* [Export Worksheet to image]({%slug spreadprocessing-export-worksheet-to-image-netstandard%})
* [Cropping PDF Pages and Saving as Images Using RadPdfProcessing]({%slug crop-save-pdf-pages-as-images-radpdfprocessing%})
* [Converting a PDF Document to a Multipage TIFF Image]({%slug convert-pdf-to-multipage-tiff-radpdfprocessing%})
* [Converting Multi-page TIFF Images to PDF]({%slug convert-tiff-to-pdf-radpdfprocessing%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%})
