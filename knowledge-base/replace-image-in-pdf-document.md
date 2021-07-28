---
title: Replace Image in PDF Document
description: Check this topic to learn how to replace image in PDF document with PdfProcessing.
type: how-to
page_title: Replace Image in PDF Document
slug: replace-image-in-pdf-document
position: 0
tags: pdf, image, replace
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
		<td>2021.1.212</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

How to replace image in a **PDF** document.

## Solution

In the example below, we are demonstrating how to find a specific image in the imported into a [RadFixedDocument](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument) PDF document, preserve its size and [Position](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/position) and replace it with another [Image](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/image).

#### __[C#] Replace Image in Imported PDF Document__

{{region kb-replace-image-in-pdf-document1}}

    RadFixedPage firstPage = document.Pages[0];

    Image image = firstPage.Content.First(ce => ce is Image) as Image;

    string newImagePath = "image.png";
    ImageSource newImageSource;
    using (FileStream source = File.Open(newImagePath, FileMode.Open))
    {
        newImageSource = new ImageSource(source);
    }

    Image newImage = new Image
    {
        ImageSource = newImageSource,
        Position = image.Position,
        Width = image.Width,
        Height = image.Height
    };

    int imageIndex = firstPage.Content.IndexOf(image);
    firstPage.Content.RemoveAt(imageIndex);
    firstPage.Content.Add(newImage);
	
{{endregion}}
