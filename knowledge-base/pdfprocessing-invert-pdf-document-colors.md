---
title: Invert PDF Document Colors
description: Invert the Colors within a PDF Document by iterating its content
type: how-to
page_title: Invert the Colors within a PDF Document
slug: pdfprocessing-invert-pdf-document-colors
position: 0
tags: pdf, processing, invert, color, background
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.1.322</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article describes how to invert the background and text colors within a PDF document by iterating its content.

## Solution

The provided code snippets demonstrates how to import a PDF document and invert its background and text color by iterating its content.

#### __[C#] Import PDF file and Invert its Background and Content Color__

{{region pdfprocessing-invert-pdf-document-colors1}}

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
{{endregion}}

As the PDF document has no background concept we are creating a [RectangleGeometry](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.graphics.rectanglegeometry) using the page size and setting the desired color to it.

#### __[C#] Invert Document's Background Color__

{{region pdfprocessing-invert-pdf-document-colors2}}

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
{{endregion}}

The following methods show how to invert the document elements' color by recursively iterating their content and setting the desired color using the relevant Fill property.

#### __[C#] Invert Document Content`s Color__

{{region pdfprocessing-invert-pdf-document-colors3}}

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
{{endregion}}
