---
title: Invert PDF Document Colors
description: Learn how to invert the background and text colors within a PDF document by iterating its content with RadPdfProcessing.
type: how-to
page_title: Invert the Colors within a PDF Document
slug: pdfprocessing-invert-pdf-document-colors
position: 0
tags: radpdfprocessing, pdf, colors, invert, background, document, processing, fixed
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.1.322|RadPdfProcessing|[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)|

## Description

This article describes how to invert the background and text colors within a PDF document by iterating its content.

## Solution

The following code snippets demonstrate how to import a PDF document and invert its background and text color by iterating its content.

**Example 1: Import a PDF File and Invert Its Background and Content Color**

```csharp

	RadFixedDocument document;
	PdfFormatProvider provider = new PdfFormatProvider();
	using (Stream input = File.OpenRead(path))
	{
		document = provider.Import(input);
	}

	TextColor = RgbColors.White;
	BackGroundColor = RgbColors.Black;

	InvertBackgroundColor(document);
	InvertContentColor(document);

	string exportedDocument = "ExportedDocument6.pdf";
	if (File.Exists(exportedDocument))
	{
		File.Delete(exportedDocument);
	}

	using (Stream output = File.OpenWrite(exportedDocument))
	{
		provider.Export(document, output);
	}
```

The PDF document has no background concept. To achieve the inverted background, create a [RectangleGeometry](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.graphics.rectanglegeometry) by using the page size and setting the desired color to it.

**Example 2: Invert the Document Background Color**

```csharp

	private static void InvertBackgroundColor(RadFixedDocument document)
	{
		foreach (RadFixedPage page in document.Pages)
		{
			Graphics.Path path = new Graphics.Path();
			path.Fill = BackGroundColor;
			Graphics.RectangleGeometry rectangle = new Graphics.RectangleGeometry(page.MediaBox);
			path.Geometry = rectangle;
			page.Content.Insert(0, path);
		}
	}
```

The following methods invert the document elements' color by recursively iterating their content and setting the desired color through the relevant `Fill` property.

**Example 3: Invert the Document Content Color**

```csharp

	private static void InvertContentColor(RadFixedDocument document)
	{
		foreach (RadFixedPage page in document.Pages)
		{
			InvertCollectionColors(page.Content);
		}
	}

	private static void InvertCollectionColors(ContentElementCollection contentElementCollection)
	{
		foreach (ContentElementBase contentElement in contentElementCollection)
		{
			if (contentElement is TextFragment textFragment)
			{
				textFragment.Fill = TextColor;
			}
			else if (contentElement is Graphics.Path path && path.Fill.Equals(TextColor))
			{
				path.Fill = BackGroundColor;
			}
			else if (contentElement is Form form)
			{
				InvertCollectionColors(form.FormSource.Content);
			}
		}
	}
```

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
