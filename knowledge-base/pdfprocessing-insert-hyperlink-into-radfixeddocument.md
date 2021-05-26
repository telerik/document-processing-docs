---
title: Insert Hyperlink into the RadFixedDocument
description: This knowledge base article describes how to insert a Hyperlink into the RadFixedDocument
type: how-to
page_title: Insert Hyperlink into the RadFixedDocument
slug: pdfprocessing-insert-hyperlink-into-radfixeddocument
position: 0
tags: pdf, processing, insert, hyperlink, radfixeddocument
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
		<td>2021.2.507</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article describes how to insert a Hyperlink into the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).

## Solution

The following example shows how to insert a Hyperlink using a [Link]({%slug radpdfprocessing-model-annotations-and-destinations%}#link) annotation with an associated [UriAction](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.actions.uriaction) in the RadFixedDocument. With the help of the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}), we are drawing a block containing the text over the annotation.

#### __[C#] Insert Hyperlink into RadFixedDocument__

{{region pdfprocessing-insert-hyperlink-into-radfixeddocument1}}

	RadFixedDocument document = new RadFixedDocument();
	RadFixedPage firstPage = document.Pages.AddPage();

	FixedContentEditor editor = new FixedContentEditor(firstPage);
	editor.Position.Translate(70, 10);

	Block block = new Block();
	block.GraphicProperties.FillColor = new RgbColor(255, 5, 99, 193);
	block.InsertText("Telerik Website");
	Size blockSize = block.Measure();
	editor.DrawBlock(block);

	UriAction uriAction = new UriAction();
	uriAction.Uri = new Uri(@"http://www.telerik.com");

	Link uriLink = firstPage.Annotations.AddLink(uriAction);
	uriLink.Rect = new Rect(70, 10, blockSize.Width, blockSize.Height);
{{endregion}}
