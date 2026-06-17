---
title: Replacing Word Placeholders with Images Using Telerik WordsProcessing
description: Learn how to use Telerik WordsProcessing to replace placeholders in a Word document with images programmatically.
type: how-to
page_title: Replace Placeholder Text with Images in Telerik WordsProcessing
meta_title: Replace Placeholder Text with Images in Telerik WordsProcessing
slug: replace-word-placeholder-with-image-telerik-wordsprocessing
tags: telerik, wordsprocessing, radflowdocumenteditor, replace-text, imageinline
res_type: kb
ticketid: 1715583
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td>
Telerik Document Processing WordsProcessing
</td>
</tr>
<tr>
<td> Version </td>
<td> 2025.4.1216 </td>
</tr>
</tbody>
</table>

## Description

I want to programmatically replace placeholders in a Word document, such as [*1], [*2], etc., with images using Telerik WordsProcessing. The images can be in formats like .jpg, .tiff, or .png, and I would like to use the `RadFlowDocumentEditor` for this purpose.

This knowledge base article also answers the following questions:
- How to use Telerik WordsProcessing to replace text with an image.
- How to programmatically replace placeholders in a Word document with images.
- How to handle dynamic text-to-image replacement in Telerik WordsProcessing.

## Solution

To replace placeholders in a Word document with images using Telerik WordsProcessing, follow these steps:

1. Load the Word document using the `DocxFormatProvider`.
2. Use the `RadFlowDocumentEditor` to search for placeholder text.
3. Replace the placeholder text with an `ImageInline` element.

Below is a sample implementation in C#:

```csharp
using System;
using System.IO;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Editing;
using Telerik.Windows.Documents.Media;

class Program
{
    static void Main()
    {
        // Load the Word document
        RadFlowDocument flowDocument;
        DocxFormatProvider docxFormatProvider = new DocxFormatProvider();
        using (Stream input = File.OpenRead("TestDocument.docx"))
        {
            flowDocument = docxFormatProvider.Import(input, null);
        }

        // Initialize the document editor
        RadFlowDocumentEditor editor = new RadFlowDocumentEditor(flowDocument);

        // Create an ImageInline object
        ImageInline imageInline = new ImageInline(flowDocument);
        byte[] imageData = File.ReadAllBytes("image.jpeg"); // Replace with your image file path
        imageInline.Image.ImageSource = new ImageSource(imageData, "jpeg");
        imageInline.Image.Size = new System.Windows.Size(100, 100); // Set image dimensions

        // Replace placeholders with the image
        editor.ReplaceText("[*1]", imageInline, true, true); // Replace [*1]
        editor.ReplaceText("[*7]", imageInline, true, true); // Replace [*7]

        // Save the modified document
        string outputPath = "output.docx";
        using (Stream output = File.OpenWrite(outputPath))
        {
            docxFormatProvider.Export(flowDocument, output, null);
        }

        Console.WriteLine("Document updated successfully.");
    }
}
```

### Key Points
- Use the `ReplaceText` method of `RadFlowDocumentEditor` to locate and replace placeholders.
- The `ImageInline` object handles embedding images into the document.
- Customize the `ImageInline.Image.Size` property to set the dimensions of the image.

## See Also

- [WordsProcessing Documentation](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/overview)
- [RadFlowDocument Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/model/radflowdocument)
- [RadFlowDocumentEditor Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/editing/radflowdocumenteditor)
- [Replace Text with Document Elements](https://www.telerik.com/document-processing-libraries/documentation/libraries/radwordsprocessing/editing/find-and-replace/replace-document-elements)
