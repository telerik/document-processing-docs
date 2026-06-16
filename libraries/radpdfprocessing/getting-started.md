---
title: Getting Started
description: Learn how to get started with RadPdfProcessing, add the required NuGet references, and create your first PDF document.
page_title: Getting Started
slug: radpdfprocessing-getting-started
tags: pdf, radpdfprocessing, nuget, document, export, fixed, content, editor, text, fragment, radfixeddocument
published: True
position: 1
---

# Getting Started

This article helps you get started with the `RadPdfProcessing` library.

>note If you still don't have **Telerik Document Processing** installed, check the [First Steps]({%slug getting-started-first-steps%}) topic to learn how you can obtain the packages through the different suites. 

## Required References

You can find the required references in the [PdfProcessing NuGet packages]({%slug available-nuget-packages%}#pdfprocessing-packages) section.

## Creating a Document

[RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) is the root element in the library. It consists of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) objects and instructions for annotations and destinations in the document. **Example 1** shows how to create a document and add a page to it.

#### **Example 1: Create RadFixedDocument**

<snippet id='pdf-create-fixed'/>

The page can then be edited through a [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) instance. **Example 2** creates an editor and adds a [TextFragment]({%slug radpdfprocessing-model-textfragment%}) to the page object created in **Example 1**.

#### **Example 2: Add text**

<snippet id='pdf-create-editor'/>

## Exporting to PDF

Exporting to PDF format can be achieved with the `PdfFormatProvider` class. **Example 3** shows how to export the `RadFixedDocument` created in **Examples 1 and 2** to a file.
        

#### **Example 3: Export to PDF**

<snippet id='pdf-export'/>

For more complete examples head to the [Developer Focused Examples]({%slug radpdfprocessing-sdk-examples%}) section of the library.

## See Also

* [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [TextFragment]({%slug radpdfprocessing-model-textfragment%})
* [PdfProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/pdfprocessing)