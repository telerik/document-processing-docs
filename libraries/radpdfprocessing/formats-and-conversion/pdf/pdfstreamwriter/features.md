---
title: Features
description: Overview of the features supported by PdfStreamWriter in RadPdfProcessing for high-performance, low-memory PDF file writing.
page_title: Pdf Stream Writer - Features
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features
tags: pdfstreamwriter, features, pdf, stream, radpdfprocessing, performance, lowmemory, writing
published: True
position: 1
---

# Features

**PdfStreamWriter** supports the majority of the PDF format features and preserves them in the resulting document.

Because the current **PdfStreamWriter** API provides methods for merging separate **pages**, the page content and the related page properties are preserved unmodified. However, PDF document properties are not imported and are not preserved in the generated PDF file. Such properties include:

* Document Outlines (Bookmarks)
* Interactive form fields
* Article threads
* Named destinations
* Document metadata

Destinations that lead to other pages are not preserved in the current version, except when they lead to the same page or to a previously merged page.

## See Also

* [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})