---
title: SkiaImageExportSettings
page_title: SkiaImageExportSettings
description: Learn how to configure the SkiaImageExportSettings to control image format, quality, scale factor, and antialiasing when exporting PDF pages with RadPdfProcessing.
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings
tags: skiaimageexportsettings, pdf, image, export, skiasharp, radpdfprocessing, settings, conversion
published: True
position: 1
---

# SkiaImageExportSettings

The [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%}) exports PDF pages ([RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) objects) to images. The `ExportSettings` property provides access to the `SkiaImageExportSettings` class, which allows you to control the output format, quality, scale, and antialiasing.

>important The `SkiaImageFormatProvider` works with PDF pages (`RadFixedPage`), not with a PDF document (`RadFixedDocument`). You can export detached pages that are not associated with a particular PDF document. In this case, any document-related [exception handling mechanism]({%slug radpdfprocessing-handling-exceptions%}) is not triggered.

The following table lists the available settings:

|Setting|Description|
|----|----|
|`IsAntialiased`|Gets or sets a value indicating whether the image is antialiased.|
|`ScaleFactor`|Gets or sets the scale factor of the image.|
|`ImageFormat`|Gets or sets the image format. The available options for `SkiaImageFormat` are `Jpeg`, `Png`, and `Webp`.|
|`Quality`|Gets or sets the image quality. The value range is 1 (lowest quality) to 100 (highest quality) inclusive. The default value is 75.|

Starting with **Q3 2025**, `SkiaImageExportSettings` exposes the `DocumentUnhandledException` event, which allows you to handle exceptions while exporting a PDF page (`RadFixedPage`).

The following example demonstrates how to create a `SkiaImageExportSettings` object with custom settings and handle unexpected errors while exporting a PDF page (built from scratch) that is not associated with a document:

<snippet id='libraries-pdf-formats-and-conversion-convert-to-image-settings-skiaimageformatprovider-exportsettings'/>

The next example shows how to import an existing PDF document, iterate all of its pages, and export each page to an image:

<snippet id='libraries-pdf-formats-and-conversion-convert-to-image-settings-radpdfprocessing-formats-and-conversion-imageformatprovider'/>

## See Also

* [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})  
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
