---
title: SkiaImageExportSettings
page_title: SkiaImageExportSettings
description: Learn what are the options offered by the SkiaImageExportSettings used with the PdfProcessing library.
slug: radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings
tags: pdf, image, skia, export, settings
published: True
position: 1
---

# SkiaImageExportSettings

The [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%}) offers the functionality to export PDF pages ([RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) objects). The public **ExportSettings** property gives access to the **SkiaImageExportSettings** that gives you modification options and further fine-tuning.

>important Since the SkiaImageFormatProvider works with PDF pages (RadFixedPage), not a PDF document (RadFixedDocument), it is possible to export detached pages as well which are not associated with a particular PDF document. Hence, any document-related [exception handling mechanism]({%slug radpdfprocessing-handling-exceptions%}) wouldn't be triggered in this case.

|Setting|Description|
|----|----|
|**IsAntialiased**|Gets or sets a value indicating whether the image will be antialiased.|
|**ScaleFactor**|Gets or sets a value indicating the scale factor of the image.|
|**ImageFormat**|Gets or sets a value indicating the image format. The available options for the SkiaImageFormat are **Jpeg**, **Png** and **Webp**.|
|**Quality**|Gets or sets a value indicating the image quality. The value range is 1 (lowest quality) to 100 (highest quality) inclusive. The default value is 75.|

As of **Q3 2025** the **SkiaImageExportSettings** offers the **DocumentUnhandledException** event which allows you to handle exceptions while exporting a PDF page (RadFixedPage). 

The example shows how you can create a **SkiaImageExportSettings** object with the desired settings and handle unexpected errors while exporting a PDF page (built from scratch) which is not associated with a document:

<snippet id='libraries-pdf-skiaimageformatprovider-exportsettings'/>

The next example shows how to import an existing PDF document, iterate all of its pages and export each page to an image:

<snippet id='radpdfprocessing-formats-and-conversion-imageformatprovider'/>

# See Also

* [SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%})  
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
