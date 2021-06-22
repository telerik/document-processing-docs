---
title: Features
page_title: Pdf Stream Writer - Features
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-features
tags: pdf,stream,writer, features
published: True
position: 1
---

# Features

**PdfStreamWriter** supports the majority of the PDF format features and preserves them in the resultant document.

Since the current **PdfStreamWriter** API provides methods for merging separate **pages**, the page content and the related page properties will be preserved unmodified. However, PDF document properties will not be imported and will not be preserved in the generated PDF file. Such properties are:

- Document Outlines (Bookmarks)
- Interactive form fields
- Article threads
- Named destinations
- Document metadata


Also, destinations leading to other pages are not preserved with the current version, except from the cases when they lead to the same page or to a previously merged page.

## See Also

* [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})