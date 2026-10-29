---
title: Merge PDF Documents
description: Learn how to merge multiple PDF documents into one using the RadFixedDocument Merge method or PdfStreamWriter in RadPdfProcessing.
page_title: How to Merge PDF Documents
slug: merge-pdf-documents
tags: merge, pdf, documents, radpdfprocessing, combine, pages, radfixeddocument, export
position: 5
components: [pdfprocessing]
---

# Merge PDF Documents

Use `RadFixedDocument.Merge()` to merge imported PDF documents into a document model, or use `PdfStreamWriter` to stream pages directly to a new PDF with minimal memory use.

>note See the <a href="https://demos.telerik.com/document-processing/pdfprocessing/merge_split_add_content" target="_blank">PdfProcessing Content Merging, Splitting, and Adding Demo</a> for a live example.

## Merging with RadFixedDocument

Use `RadFixedDocument.Merge()` with [the `RadFixedDocument` model]({%slug radpdfprocessing-model-radfixeddocument%}) when you need a full document model and document-level content. The method clones the source document and appends its supported content to the current `RadFixedDocument`, including pages, bookmarks, form fields, and destinations:

<snippet id='libraries-pdf-features-merge-documents-with-radfixeddocument'/>

## Merging with PdfStreamWriter

Use the [`PdfStreamWriter` overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}) when you need a low-memory merge flow. It streams page content from source PDF files directly into a new output file without preserving the PDF document model in memory:
 
<snippet id='libraries-pdf-features-merge-documents-with-pdfstreamwriter'/>

>note The <a href="https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages" target="_blank">Manipulate Pages SDK demo</a> shows this approach end to end.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [PdfStreamWriter class]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [Create a Table of Contents for Merged PDF Documents]({%slug create-toc-for-merged-pdf-radpdfprocessing%})
