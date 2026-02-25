---
title: Getting Started
page_title: Getting Started
slug: radpdfprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started

This article will get you started in using the __RadPdfProcessing__ library. 

>note If you still don't have **Telerik Document Processing** installed, check the [First Steps]({%slug getting-started-first-steps%}) topic to learn how you can obtain the packages through the different suites. 

## Required References

You can find the required references in the [PdfProcessing NuGet packages]({%slug available-nuget-packages%}#pdfprocessing-packages) section.

## Creating a Document

[RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) is the root element in the library. It consists of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) objects and instructions for annotations and destinations in the document. __Example 1__ shows how to create a document and add a page to it.  

#### __Example 1: Create RadFixedDocument__

<snippet id='pdf-create-fixed'/>

The page can then be edited through a [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) instance. __Example 2__ creates an editor and adds a [TextFragment]({%slug radpdfprocessing-model-textfragment%}) to the page object created in __Example 1__.     

#### __Example 2: Add text__

<snippet id='pdf-create-editor'/>

## Exporting to PDF

Exporting to PDF format can be achieved with the __PdfFormatProvider__ class. __Example 3__ shows how to export the __RadFixedDocument__  created in __Examples 1 and 2__ to a file.
        

#### __Example 3: Export to PDF__

<snippet id='pdf-export'/>

For more complete examples head to the [Developer Focused Examples]({%slug radpdfprocessing-sdk-examples%}) section of the library.

## See Also

 * [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
 * [PdfProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/pdfprocessing)