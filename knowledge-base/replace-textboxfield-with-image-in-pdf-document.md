---
title: Replace TextBoxField with Image in PDF Document
description: How to Replace TextBoxField with Image in PDF Document
type: how-to
page_title: Replace TextBoxField with Image in PDF Document
slug: replace-textboxfield-with-image-in-pdf-document
position: 0
tags: pdf, textbox, field, image, replace
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

How to replace a [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) with an [Image]({%slug radpdfprocessing-model-image%}) in a **PDF** document.

## Solution

In the example below, we are demonstrating how to find a specific [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) by its name in the imported into a [RadFixedDocument](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument) PDF document, preserve its size and [Position]({%slug radpdfprocessing-concepts-position%}) and replace it with an [Image]({%slug radpdfprocessing-model-image%}).

#### __[C#] Replace TextBoxField with Image in Imported PDF Document__

{{region kb-replace-textboxfield-with-image-in-pdf-document1}}

RadFixedPage firstPage = document.Pages[0];

    Annotation field = firstPage.Annotations.First(a => ((VariableContentWidget)a).Field.Name == "SampleField");
    Telerik.Documents.Primitives.Rect fieldRect = field.Rect;

    string imagePath = "image.png";
    ImageSource newImageSource;
    using (FileStream source = File.Open(imagePath, FileMode.Open))
    {
        newImageSource = new ImageSource(source);
    }

    SimplePosition simplePosition = new SimplePosition();
    simplePosition.Translate(fieldRect.X, fieldRect.Y);

    Image newImage = new Image
    {
        ImageSource = newImageSource,
        Position = simplePosition,
        Width = fieldRect.Width,
        Height = fieldRect.Height
    };

    firstPage.Annotations.Remove(field);
    firstPage.Content.Add(newImage);	
{{endregion}}
