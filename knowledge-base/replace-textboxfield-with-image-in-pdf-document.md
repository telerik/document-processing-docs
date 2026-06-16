---
title: Replace TextBoxField with Image in PDF Document
description: Learn how to replace a TextBoxField with an Image in a PDF document using PdfProcessing by preserving the field size and position.
type: how-to
page_title: Replace TextBoxField with Image in PDF Document
slug: replace-textboxfield-with-image-in-pdf-document
position: 0
tags: radpdfprocessing, pdf, textbox, field, image, replace, document, processing
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2021.1.212 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

How to replace a [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) with an [Image]({%slug radpdfprocessing-model-image%}) in a PDF document.

## Solution

The following example finds a specific [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) by its name in a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) imported from PDF, preserves its size and [Position]({%slug radpdfprocessing-concepts-position%}), and replaces it with an [Image]({%slug radpdfprocessing-model-image%}).

```csharp

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
```

## See Also

* [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%})
* [Image]({%slug radpdfprocessing-model-image%})
* [Position]({%slug radpdfprocessing-concepts-position%})
