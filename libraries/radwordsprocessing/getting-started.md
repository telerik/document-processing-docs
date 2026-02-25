---
title: Getting Started
page_title: Getting Started
slug: radwordsprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started

This tutorial will take you through the creation of a sample application that uses RadWordsProcessing.

>noteIf you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Package References

You can find the required references in the [WordsProcessing NuGet packages]({%slug available-nuget-packages%}#wordsprocessing-packages) section.

## Creating RadFlowDocument from Code

Here is how to create a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and insert some text content with the help of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
        

#### __Example 1: Create RadFlowDocument programmatically__

<snippet id='codeblock-b'/>



You need to add using directive to the following namespaces:
        

* Telerik.Windows.Documents.Flow.Model
* Telerik.Windows.Documents.Flow.Model.Editing
            

## Exporting RadFlowDocument to Docx

Exporting the document to Docx file can be achieved with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Here is how to create a provider instance and save a document with it:
        

#### __Example 2: Export RadFlowDocument to Docx__

<snippet id='codeblock-c'/>

Detailed information about the supported formats and features can be found in the [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}) article. For more complete examples head to the [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%}) section of the library.
        

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [Model]({%slug radwordsprocessing-model%})
* [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%})
* [WordsProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/wordsprocessing)


