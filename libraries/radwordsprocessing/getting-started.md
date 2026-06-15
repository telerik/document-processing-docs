---
title: Getting Started
description: Learn how to create a RadWordsProcessing sample app, build a RadFlowDocument in code, and export it to a DOCX file.
page_title: Getting Started with RadWordsProcessing
slug: radwordsprocessing-getting-started
tags: radwordsprocessing, document, started, nuget, docx, flow, import, export, word
published: True
position: 1
---

# Getting Started with RadWordsProcessing

Use this article to build a small RadWordsProcessing sample that creates a `RadFlowDocument` in code and exports it to a `.docx` file. By the end of the tutorial, you will have a working project, the required namespaces, and a document that you can open in Microsoft Word or another compatible editor.

>note
>
> If you still need to install **Telerik Document Processing**, see [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%}) for the available installation options.

Before you add code, make sure that your environment is ready:

1. Create a new .NET console application or open an existing project.
2. Install the packages listed in [WordsProcessing NuGet packages]({%slug available-nuget-packages%}#wordsprocessing-packages).
3. Confirm that the application can write files to an output folder on your machine.

This article focuses on the fastest path to a first successful export. For package details and version guidance, use the NuGet packages article as the reference source.

## How to Add the Required Package References

After you install the required packages, add the namespaces that you need for document creation and editing:

* `Telerik.Windows.Documents.Flow.Model`
* `Telerik.Windows.Documents.Flow.Model.Editing`

If your export code writes the result to disk, also add the .NET namespaces required by your sample, such as `System.IO`.

## Creating RadFlowDocument from Code

[RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) is the main document model in RadWordsProcessing. To add text, paragraphs, and other content in code, use [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}), which provides a convenient editing surface over the document.

The following example creates a new document instance and inserts sample content. Use it as the starting point for the rest of this tutorial.

### Example 1: Create a RadFlowDocument Programmatically

<snippet id='codeblock-b'/>

After you run the code in Example 1, you should have an in-memory `RadFlowDocument` that contains the text you inserted. At this stage, the document exists only in memory, so the next step is to export it to a file format.

## Exporting RadFlowDocument to Docx

Use the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}) to convert the `RadFlowDocument` to a DOCX file. The provider serializes the in-memory document and lets you save the generated output to a stream or file.

The next example creates a provider instance and exports the document:

### Example 2: Export a RadFlowDocument to DOCX

<snippet id='codeblock-c'/>

When you integrate this example into your project, verify these points:

* The output path exists and your application has permission to write to it.
* The exported file uses the `.docx` extension.
* You reuse the same `RadFlowDocument` instance that you created earlier.

## Verify the Output

Run the application and open the generated DOCX file. If the export succeeds, the file should contain the same content that you inserted with `RadFlowDocumentEditor`.

If the file is not created, check the package references, the output path, and the file-writing code in your sample. If the file opens but does not contain the expected content, confirm that you are exporting the populated `RadFlowDocument` instance instead of a new empty document.

## Next Steps

After you complete this basic flow, continue with the articles that cover the next common tasks:

* Learn more about supported file formats in [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}).
* Explore the document object model in [RadWordsProcessing Model Overview]({%slug radwordsprocessing-model%}).
* Review larger end-to-end samples in [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%}).

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [RadWordsProcessing Model Overview]({%slug radwordsprocessing-model%})
* [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%})
* [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%})
* [WordsProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/wordsprocessing)


