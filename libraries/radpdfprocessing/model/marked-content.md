---
title: Marked Content
description: Learn how to identify a portion of a PDF content stream as a marked-content element with the PdfProcessing library.
page_title: Marked Content
slug: radpdfprocessing-model-marked-content
tags: marked, content, pdf, tagged, radpdfprocessing, accessibility, stream, structure, labels
published: True
position: 7
---

# Marked Content

|Minimum Version|Q2 2025|
|----|----|
|Related Feature|[Accessibility Support]({%slug pdfprocessing-feature-accessibility-support%})|


Marked-content operators identify a portion of a PDF content stream as a marked-content element of interest to a particular application or PDF plugin extension. A graphics application, for example, can use marked content to identify a set of related objects as a group to be processed as a single unit. A text-processing application can use it to maintain a connection between a footnote marker in the body of a document and the corresponding footnote text at the bottom of the page. The marked-content operators store internally a **tag** operand that indicates the role or significance of the marked-content element to the processing application.

RadPdfProcessing offers the `MarkedContent` class, which represents marked content in a [fixed document]({%slug radpdfprocessing-model-radfixedpage%}).

You can add marked content to a `RadFixedDocument` in the following ways:

## Adding Marked Content Using the PDF Model

<snippet id='libraries-pdf-model-marked-content-markedcontent-in-model'/>

## Adding Marked Content Using the FixedContentEditor

<snippet id='libraries-pdf-model-marked-content-markedcontent-with-fixedcontenteditor'/>

## Adding Marked Content Using the RadFixedDocumentEditor

<snippet id='libraries-pdf-model-marked-content-markedcontent-with-radfixeddocumenteditor'/>

## Adding Marked Content Using the Block

<snippet id='libraries-pdf-model-marked-content-markedcontent-in-block'/>

## See Also

* [Block]({%slug radpdfprocessing-editing-block%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
