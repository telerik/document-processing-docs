---
title: Draw a PDF Page Background Using RadPdfProcessing
description: Learn how to draw a PDF page background by adding a colored rectangle behind the page content using RadPdfProcessing.
type: how-to
page_title: Draw PDF Page Background
slug: radpdfprocessing-draw-pdf-page-background
tags: pdf, processing, background, page, content, rectangle, color, fixed, document, draw
res_type: kb
---

## Environment

| Version | Product | Author |
| ---- | ---- | ---- |
| 2025.4.1104 | RadPdfProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

To draw a page background, you can create a colored [rectangle]({%slug radpdfprocessing-concepts-geometry%}#rectanglegeometry) and insert it at the beginning of the page's content collection so that it renders behind the rest of the content.

## Solution

The approach is to import the PDF, create a rectangle path sized to the page, and insert it into the page content at index `0` (first position).

### Key Points
* PDF pages don't have a built-in background property. Draw a rectangle to create a background.
* Backgrounds are typically the first element in the page content, subsequent elements render above earlier ones.
* Insert at index `0` to draw a background behind all content.
* Size the rectangle to match `firstPage.Size` for full-page coverage.

```csharp
RadFixedDocument inputDocument;
PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();

using (System.IO.Stream input = System.IO.File.OpenRead("input.pdf"))
{
    inputDocument = pdfFormatProvider.Import(input);
}

RadFixedPage firstPage = inputDocument.Pages.First();

// Create the background
RectangleGeometry rectangleGeometry = new RectangleGeometry();
rectangleGeometry.Rect = new Rect(1, 1, firstPage.Size.Width, firstPage.Size.Height);

Telerik.Windows.Documents.Fixed.Model.Graphics.Path path = new Telerik.Windows.Documents.Fixed.Model.Graphics.Path();
path.Geometry = rectangleGeometry;

path.IsFilled = true;
path.Fill = new RgbColor(100, 150, 0, 0);

// Insert the background (at position 1) into the first page
firstPage.Content.Insert(0, path); // Use index '1' if the document already has a set background

string pdfOutputPath = "output.pdf";

System.IO.File.Delete(pdfOutputPath);
using (System.IO.Stream output = System.IO.File.OpenWrite(pdfOutputPath))
{
    pdfFormatProvider.Export(inputDocument, output, TimeSpan.FromSeconds(10));
}
```
## See Also
* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})

