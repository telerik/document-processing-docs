---
title: Changes
description: Summary of the new features and functionality introduced in RadPdfProcessing across releases.
page_title: Get familiar with the new functionality introduced in the RadPdfProcessing. 
slug: radpdfprocessing-changes
tags: changes, radpdfprocessing, pdf, releases, fontembedding, opentype, import, export
published: True
position: 0
---

# Changes

The following sections summarize the new functionality introduced in the library with links to the relevant documentation that describes how to use the new features.

## What Is New in 2024 Q4

* Introduced a timeout mechanism for import and export of documents. The new `Import` and `Export` methods for all format providers have a mandatory timeout parameter. [Read more.]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})

## What Is New in 2024 Q2

* Instead of using the `PdfExportSettings`.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property, use the `FontEmbeddingType` property to specify whether the full font or a subset is embedded in the document.
* Support for OTF (OpenType Font) font file format.

## What Is New in 2014 Q3

**New Features**

* `RadFixedDocumentEditor` class which creates fixed content in a flow-like manner. [Read more.]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})

* Introduced a Tables generator that allows easy export of tabular data content. [Read more.]({%slug radpdfprocessing-editing-table-overview%})

* Exposed `Block` class that allows you to draw and split groups of text, images, and shapes into parts. [Read more.]({%slug radpdfprocessing-editing-block%})

* Introduced hyperlink concept that combines Link annotation and fixed content.

**Bug Fixes**

* Rounding double values causes offsets in rendering.

