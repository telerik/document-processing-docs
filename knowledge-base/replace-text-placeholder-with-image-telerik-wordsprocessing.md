---
title: Replace Placeholder Text with Images in Telerik WordsProcessing
description: Learn how to replace placeholder text in a Word document with images by using RadWordsProcessing.
type: how-to
page_title: Replace Placeholder Text with Images in Telerik WordsProcessing
meta_title: Replace Placeholder Text with Images in Telerik WordsProcessing
slug: replace-text-placeholder-with-image-telerik-wordsprocessing
tags: radwordsprocessing, wordsprocessing, placeholder, replace, image, editor, docx, telerik, word
res_type: kb
ticketid: 1715583
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.2.519 | [RadWordsProcessing]({%slug radwordsprocessing-overview%}) | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

I want to programmatically replace placeholders in a Word document, such as [*1], [*2], and so on, with images by using [RadWordsProcessing]({%slug radwordsprocessing-overview%}). The [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) API can do this by replacing the placeholder text with an [ImageInline]({%slug radwordsprocessing-model-imageinline%}).

This knowledge base article also answers the following questions:
- How to use Telerik WordsProcessing to replace text with an image.
- How to programmatically replace placeholders in a Word document with images.
- How to handle dynamic text-to-image replacement in Telerik WordsProcessing.

## Solution

To replace placeholders in a Word document with images using [RadWordsProcessing]({%slug radwordsprocessing-overview%}), follow these steps:

1. Load the Word document with [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}).
2. Create a [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) and prepare an [ImageInline]({%slug radwordsprocessing-model-imageinline%}).
3. Use [ReplaceText()]({%slug radwordsprocessing-editing-replace-document-elements%}) to swap the placeholder with the image.

Below is a sample implementation in C#:

```csharp
using System;
using System.IO;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Editing;
using Telerik.Windows.Documents.Flow.Model.Shapes;
using Telerik.Windows.Documents.Media;

class Program
{
    static void Main()
    {
        RadFlowDocument flowDocument;
        DocxFormatProvider docxFormatProvider = new DocxFormatProvider();
        using (Stream input = File.OpenRead("TestDocument.docx"))
        {
            flowDocument = docxFormatProvider.Import(input, null);
        }

        RadFlowDocumentEditor editor = new RadFlowDocumentEditor(flowDocument);

        ReplacePlaceholderWithImage(editor, flowDocument, "text placeholder 1", "image.jpeg");
        ReplacePlaceholderWithImage(editor, flowDocument, "text placehodler 2", "image.jpeg");

        string outputPath = "output.docx";
        using (Stream output = File.OpenWrite(outputPath))
        {
            docxFormatProvider.Export(flowDocument, output, null);
        }

        Console.WriteLine("Document updated successfully.");
    }

    private static void ReplacePlaceholderWithImage(
        RadFlowDocumentEditor editor,
        RadFlowDocument document,
        string placeholderText,
        string imagePath)
    {
        ImageInline imageInline = new ImageInline(document);
        byte[] imageData = File.ReadAllBytes(imagePath);
        imageInline.Image.ImageSource = new ImageSource(imageData, "jpeg");
        imageInline.Image.Size = new System.Windows.Size(100, 100);

        editor.ReplaceText(placeholderText, imageInline, true, true);
    }
}
```

### Key Points

* Use the `ReplaceText()` method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) to locate and replace placeholders.
* The [ImageInline]({%slug radwordsprocessing-model-imageinline%}) object handles embedding images into the document.
* Customize the `ImageInline.Image.Size` property to set the dimensions of the image.

## See Also

* [RadWordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [ImageInline]({%slug radwordsprocessing-model-imageinline%})
* [Replace Text with Document Elements]({%slug radwordsprocessing-editing-replace-document-elements%})
