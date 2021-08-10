---
title: How do I add an image using WordsProcessing with the correct aspect ratio?
description: Learn how you can resize an image to fit into a page while keeping its aspect ratio.
type: how-to
page_title: Fit image to page using WordsProcessing
slug: wordsprocessing-fit-image
position: 0
tags: fit, image, aspect, ratio, docx, rtf, html, document, resize
ticketid: 1531113
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>2021.2.728.1</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Telerik Document Processing</td>
		</tr>
	</tbody>
</table>


## Description

This article illustrates how you can insert an image in a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance and resize that image to fit into the page while keeping its aspect ratio.

## Solution

Create an image and compare its size with the size available on the page. If the image is bigger, decrease its size:

#### [C#] Insert and resize image

{{region kb-wordsprocessing-fit-image}}

    RadFlowDocument document = new RadFlowDocument();
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
    
    Section section = editor.InsertSection();
    section.PageSize = new Size(300, 500);
    
    Image image = new ImageInline(document).Image;
    image.ImageSource = new ImageSource(File.OpenRead(@"C:\Users\tdimitrova\Desktop\sample.png"), "png");
    
    double availableWidth = section.PageSize.Width - section.PageMargins.Left - section.PageMargins.Right;
    while (image.Width > availableWidth)
    {
        image.SetWidth(true, image.Width - 5);
    }
    
    editor.InsertImageInline(image.ImageSource, image.Size);
{{endregion}}

## See Also

* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [ImageInline]({%slug radwordsprocessing-model-imageinline%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})