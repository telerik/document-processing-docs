---
title: Merge PDF Documents
description: Learn how to merge multiple PDF documents into one using the RadFixedDocument Merge method or PdfStreamWriter in RadPdfProcessing.
page_title: How to Merge PDF Documents
slug: merge-pdf-documents
tags: merge, pdf, documents, radpdfprocessing, combine, pages, radfixeddocument, export
position: 5
---

# Merge PDF Documents

**RadPdfProcessing** supports merging multiple PDF documents into one using the following approaches:

>note See the [PdfProcessing Content Merging, Splitting, and Adding Demo](https://demos.telerik.com/document-processing/pdfprocessing/merge_split_add_content) for a live example.

## Using the RadFixedDocument.Merge Method

You can merge PDF documents with the `Merge` method of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). This method clones the source document and appends it to the current instance of `RadFixedDocument`:

<snippet id='libraries-pdf-features-merge-pdf-documents-merge-documents-with-radfixeddocument'/>

## Using the PdfStreamWriter

An alternative approach is to use the [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}) to merge pages from different PDF documents:
 
<snippet id='libraries-pdf-features-merge-pdf-documents-merge-documents-with-pdfstreamwriter'/>

>note The following SDK example demonstrates this topic: [Manipulate Pages SDK Demo](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages).

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Create a Table of Contents for Merged PDF Documents]({%slug create-toc-for-merged-pdf-radpdfprocessing%})
