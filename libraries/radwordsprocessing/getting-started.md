---
title: Getting Started
description: Learn how to get started with RadWordsProcessing by creating a sample application that imports and exports flow documents.
page_title: Getting Started
slug: radwordsprocessing-getting-started
tags: radwordsprocessing, document, started, nuget, docx, flow, import, export, word
published: True
position: 1
---

# Getting Started

This tutorial takes you through the creation of a sample application that uses RadWordsProcessing.

>noteIf you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Package References

You can find the required references in the [WordsProcessing NuGet packages]({%slug available-nuget-packages%}#wordsprocessing-packages) section.

## Creating RadFlowDocument from Code

The following example shows how to create a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and insert some text content with the help of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).

**Example 1: Create RadFlowDocument Programmatically**

<snippet id='codeblock-b'/>

You need to add using directive to the following namespaces:

* Telerik.Windows.Documents.Flow.Model
* Telerik.Windows.Documents.Flow.Model.Editing

## Exporting RadFlowDocument to Docx

You can export the document to a Docx file with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). The following example shows how to create a provider instance and save a document with it:

**Example 2: Export RadFlowDocument to Docx**

<snippet id='codeblock-c'/>

For detailed information about the supported formats and features, see the [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}) article. For more complete examples, see the [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%}) section of the library.

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [Model]({%slug radwordsprocessing-model%})
* [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%})
* [WordsProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/wordsprocessing)
