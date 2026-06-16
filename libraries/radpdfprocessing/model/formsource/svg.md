---
title: SVG
description: Learn how to add SVG FormSource vector graphics images into a PDF document by using the static FromSvg method in RadPdfProcessing.
page_title: SVG FormSource
slug: radpdfprocessing-model-formsource-svg
tags: svg, pdf, formsource, radpdfprocessing, vector, graphics, model, images
published: True
position: 1
---

# SVG FormSource

|Minimum Version|Q3 2024|
|----|----|

RadPdfProcessing supports SVG FormSource (vector graphics image format). The static `FormSource.FromSvg` method allows you to insert a vector image in the PDF document. The following overloads are available:

|Method|Description|
|----|----|
|`FormSource.FromSvg(string xml)`|Creates a `FormSource` object from an SVG file provided as XML.|
|`FormSource.FromSvg(byte[] svgData)`|Creates a `FormSource` object from an SVG file provided as a byte array.|
|`FormSource.FromSvg(Stream stream)`|Creates a `FormSource` object from an SVG file provided as a stream.|

The following example shows how to insert an SVG image into a `FormSource` object by using `FixedContentEditor`:

<snippet id='pdf-add-svg'/>

![RadPdfProcessing Insert SVG FormSource result](images/pdf-processing-insert-svg.png)

## See Also

* [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
* [Barcode FormSource]({%slug radpdfprocessing-model-formsource-barcode%})