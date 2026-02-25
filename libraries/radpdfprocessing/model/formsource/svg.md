---
title: SVG
description: Learn how to add SVG FormSource images into a PDF document using RadPdfProcessing.
page_title: SVG FormSource
slug: radpdfprocessing-model-formsource-svg
tags: formsource, pdfprocessing, document, processing, pdf, svg
published: True
position: 1
---

# SVG FormSource

|Minimum Version|Q3 2024|
|----|----|

RadPdfProcessing provides support for SVG FormSource (vector graphics image format). The static FormSource.**FromSvg** method allows the possibility to insert a vector image in the PDF document. The following overloads are publicly available:

|Method|Description|
|----|----|
|**FormSource.FromSvg(string xml)**|Creates a FormSource object from an SVG file provided as a xml.|
|**FormSource.FromSvg(byte[] svgData)**|Creates a FormSource object from an SVG file provided as a byte[].|
|**FormSource.FromSvg(Stream stream)**|Creates a FormSource object from an SVG file provided as a stream.|

The following example shows how to insert an SVG image into a FormSource object using FixedContentEditor:

<snippet id='pdf-add-svg'/>
![PdfProcessing Insert SVG FormSource](images/pdf-processing-insert-svg.png)

## See Also

 * [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
 * [Barcode FormSource]({%slug radpdfprocessing-model-formsource-barcode%})