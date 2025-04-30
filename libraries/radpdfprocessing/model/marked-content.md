---
title: Marked Content
description: Learn how to identify a portion of a PDF content stream as a marked-content element with the PdfProcessing library.
page_title: Marked Content
slug: radpdfprocessing-model-marked-content
tags: marked, content, tag, pdf
published: True
position: 7
---

# Marked Content

Marked-content operators identify a portion of a PDF content stream as a marked-content element of interest to a particular application or PDF plug-in extension. A graphics application, for example, might use marked content to identify a set of related objects as a group to be processed as a single unit. A text-processing application might use it to maintain a connection between a footnote marker in the body of a document and the corresponding footnote text at the bottom of the page. The marked-content operators are expected to store internally a **tag** operand indicating the role or significance of the marked-content element to the processing application. 

As of **Q2 2025** RadPdfProcessing offers the **MarkedContent** class which represents marked content in a [fixed document]({%slug radpdfprocessing-model-radfixedpage%}). 

There are different possibilities for adding marked content to a RadFixedDocument:

## Adding Marked Content using the PDF Model

<snippet id='libraries-pdf-model-markedcontent-in-model'/>

## Adding Marked Content using the FixedContentEditor

<snippet id='libraries-pdf-model-markedcontent-with-fixedcontenteditor'/>

## Adding Marked Content using the RadFixedDocumentEditor

<snippet id='libraries-pdf-model-markedcontent-with-radfixeddocumenteditor'/>

## Adding Marked Content using the Block

<snippet id='libraries-pdf-model-markedcontent-in-block'/>

## See Also

 * [Block]({%slug radpdfprocessing-editing-block%})
 * [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) 
