---
title: Insert Hyperlink into the RadFixedDocument
description: Learn how to insert a clickable hyperlink into a RadFixedDocument using a Link annotation and UriAction in RadPdfProcessing.
type: how-to
page_title: Insert Hyperlink into the RadFixedDocument
slug: pdfprocessing-insert-hyperlink-into-radfixeddocument
position: 0
tags: radpdfprocessing, pdf, hyperlink, link, document, processing, fixed, uriaction
res_type: kb
---

## Environment

| Product Version | Product | Author |
| --- | --- | --- |
| 2021.2.507 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article describes how to insert a hyperlink into the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).

## Solution

The following example shows how to insert a hyperlink using a [Link]({%slug radpdfprocessing-model-annotations-links%}#link) annotation with an associated [UriAction](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.actions.uriaction) in the `RadFixedDocument`. The [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) draws a block containing the text over the annotation.

**Example 1: Insert a Hyperlink into RadFixedDocument**

```csharp

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
```

## See Also

* [Link Annotations]({%slug radpdfprocessing-model-annotations-links%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
