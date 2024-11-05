---
title: Changes
page_title: Changes
slug: radpdfprocessing-changes
tags: changes
published: True
position: 0
---

# Changes

This topic summarizes the new functionality introduced in the library with helpful links to places in the documentation that describe in greater detail the new functionality and how it can be used. [Read more.]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})

## What's New in 2024 Q4

* Introduced timeout mechanism for import and export of documents. The new Import and Export methods for all FormatProviders have a mandatory timeout parameter. 

## What's New in 2024 Q2

* Instead of using the PdfExportSettings.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property, use the **FontEmbeddingType** property allowing to specify whether the full font will be embedded in the document or a subset of it.
* Support for OTF (OpenType Font) font file format
      
## What's New in 2014 Q3

__What's New__

* RadFixedDocumentEditor class which creates fixed content in a flow-like manner. [Read more.]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})

* Introduced Tables generator allowing easy export of tabular data content. [Read more.]({%slug radpdfprocessing-editing-table%})

* Exposed Block class allowing to draw and split in parts groups of text, images and shapes. [Read more.]({%slug radpdfprocessing-editing-block%})

* Introduced hyperlink concept that combines Link annotation and fixed content.
            

__What's Fixed__

* Rounding double values causes offsets in rendering.
            
