---
title: Developer Focused Examples
page_title: Developer Focused Examples
description: Developer Focused Examples
slug: radpdfprocessing-sdk-examples
tags: sdk,examples
published: True
position: 2
---

# SDK Examples



The [Telerik XAML SDK repository](https://github.com/telerik/xaml-sdk/tree/master/) provides additional demos for the document processing libraries. The examples demonstrate many specific user case scenarios, that might be really helpful. In this article you can find the complete list of all SDK examples for __RadPdfProcessing__.
      

## List of all RadPdfProcessing SDK examples:

* [__Generate document__](https://github.com/telerik/xaml-sdk/tree/master/PdfProcessing/GenerateDocument): This project demonstrates how to use RadPdfProcessing to create a PDF document.
            

* [__Pdf viewer integration__](https://github.com/telerik/xaml-sdk/tree/master/PdfProcessing/PdfViewerIntegration): This project demonstrates how to integrate RadPdfProcessing with [RadPdfViewer for WPF](http://docs.telerik.com/devtools/wpf/controls/radpdfviewer/overview.html).

* [__Create document with images__](https://github.com/telerik/xaml-sdk/tree/master/PdfProcessing/CreateDocumentWithImages): This example demonstrates how to create RadFixedDocument containing images and export it with different ImageQuality. In CreateDocumentContent() method you can see 3 different ways of inserting images allowing you to control the exported image quality and size:
	* The first approach inserts the images by simply passing the image file stream in ImageSource constructor. This way the images will be exported with different image quality depending on PdfFormatProvider.ExportSettings. When the ImageQuality is set to High then PdfProcessing automatically detects if the image is JPEG or JPEG2000 and the image is inserted in the PDF file as it is which guarantees fast export with maximum image quality.
	
	* The second approach inserts the images by passing image file stream and ImageQuality enumeration value in the ImageSource's constructor. This way the images will be always exported with the specified image quality ignoring PdfFormatProvider.ExportSettings.
	
	* The third approach inserts a black and white image using EncodedImageData class. This allows you to achieve maximum lossless compression by exporting the image data with BitsPerComponent equal to 1 and FlateDecode filter. As the encoded image data is exported as it is, the PdfFormatProvider.ExportSettings.ImageQuality value is ignored in this case as well.
            
* [__Export UI Element__](https://github.com/telerik/xaml-sdk/tree/master/PdfProcessing/ExportUIElement): ﻿In this sample is demonstrated how you can use the RadPdfProcessing library to export UI elements to PDF. The example uses the [UIElement class](https://msdn.microsoft.com/en-us/library/system.windows.uielement(v=vs.110).aspx), which is specific for the WPF platform. 
