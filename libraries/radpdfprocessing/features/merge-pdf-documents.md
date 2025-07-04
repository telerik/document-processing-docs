---
title: Merge PDF Documents
description: RadPdfProcessing provides support for merging PDF documents.
page_title: How to Merge PDF Documents
slug: merge-pdf-documents
tags: pdf, merge, document, file, telerik, processing, library
position: 5
---

# Merge PDF Documents

**RadPdfProcessing** provides support for merging multiple PDF documents into one using the following approaches:

## Using the RadFixedDocument.Merge Method

You can merge PDF documents out-of-the-box with the **Merge** method of [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). This method clones the source document and appends it to the current instance of RadFixedDocument:

<snippet id='libraries-pdf-features-merge-documents-with-radfixeddocument'/>

## Using the PdfStreamWriter

An alternative approach is using the PdfStreamWriter allowing you to merge pages from different PDF documents:
 
<snippet id='libraries-pdf-features-merge-documents-with-pdfstreamwriter'/>

>note The following SDK example is quite useful on this topic as well: [SDK Demo](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages). 

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
