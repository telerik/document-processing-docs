---
title: Merge PDF Documents
description: Learn how to merge multiple PDF documents into one using the RadFixedDocument Merge method or PdfStreamWriter in RadPdfProcessing.
page_title: How to Merge PDF Documents
slug: merge-pdf-documents
tags: merge, pdf, documents, radpdfprocessing, combine, pages, radfixeddocument, export
position: 5
---

# Merge PDF Documents

**RadPdfProcessing** supports merging multiple PDF documents into one with these approaches:

>note See the [PdfProcessing Content Merging, Splitting, and Adding Demo](https://demos.telerik.com/document-processing/pdfprocessing/merge_split_add_content) for a live example.

## Merging with RadFixedDocument

Use the `Merge()` method of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) when you want to merge fully imported PDF documents. The method clones the source document and appends its supported content to the current `RadFixedDocument`, including pages and document-level data such as bookmarks, form fields, and destinations:

<snippet id='libraries-pdf-features-merge-documents-with-radfixeddocument'/>

## Merging with PdfStreamWriter

Use [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}) when you want a low-memory merge flow that streams pages from source PDF files into a new output file:
 
<snippet id='libraries-pdf-features-merge-documents-with-pdfstreamwriter'/>

>note The [Manipulate Pages SDK demo](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) shows this approach end to end.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Create a Table of Contents for Merged PDF Documents]({%slug create-toc-for-merged-pdf-radpdfprocessing%})
