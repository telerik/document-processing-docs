---
title: Tagged PDF
description: Learn how to identify a portion of a PDF content stream as a marked-content element with the PdfProcessing library.
page_title: Tagged PDF
slug: radpdfprocessing-model-tagged-pdf
tags: taggedpdf, pdf, accessibility, radpdfprocessing, structuretree, markedcontent, tagged
published: True
position: 7
---

# Tagged PDF

|Minimum Version|Q3 2025|
|----|----|
|Related Feature:|[Accessibility Support]({%slug pdfprocessing-feature-accessibility-support%})|

**RadPdfProcessing** provides support for Tagged PDF documents. A Tagged PDF is a stylized use of PDF that defines a set of standard structure types and attributes. These types allow page content (text, graphics, and images) to be extracted and reused for other purposes. Tagged PDF is intended to be used by tools that perform operations such as:

* Making content accessible to users with visual impairments
* Simple extraction of text and graphics
* Automatic reflow of text and associated graphics to fit a page of a different size than assumed for the original layout
* Processing text for purposes such as searching, indexing, and spell-checking
* Conversion to other common file formats with document structure and basic styling information preserved

## Tagging Strategy

The tagging strategy represents how tagging is handled in PDF documents. The available options are:

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

* **UseExisting**—Specifies that the document is not tagged on export automatically and the existing `StructureTree` is used. This is the *default* option.

* **Build**—Specifies that the document is automatically tagged on export and a new `StructureTree` is created.

## Tagging Document Elements

The following sections demonstrate how to tag the different elements of a `RadFixedDocument`:

### Tagging a TextFragment

<snippet id='libraries-pdf-model-tagged-pdf-text-fragment'/>

### Tagging an Annotation

<snippet id='libraries-pdf-model-tagged-pdf-annotation'/>

### Tagging a Link Annotation

<snippet id='libraries-pdf-model-tagged-pdf-tag-link-annotation'/>

### Tagging a Table

<snippet id='libraries-pdf-model-tagged-pdf-table'/>

### Tagging a List

<snippet id='libraries-pdf-model-tagged-pdf-list'/>

### Advanced Example

<snippet id='libraries-pdf-model-tagged-pdf-advanced'/>

### Auto-Tagging

<snippet id='libraries-pdf-model-tagged-pdf-auto-tagging'/>

### Tagging a Form Field

<snippet id='libraries-pdf-model-tagged-pdf-form-field'/>

### Tagging a FormField with FixedContentEditor

<snippet id='libraries-pdf-model-tagged-pdf-form-field-with-fixed-content-editor'/>

### Auto-Tagging a FormField with FixedContentEditor

<snippet id='libraries-pdf-model-tagged-pdf-form-field-with-fixed-content-editor-auto-tagging'/>

### Tagging a Form

<snippet id='libraries-pdf-model-tagged-pdf-form'/>

### Auto-Tagging a Form

<snippet id='libraries-pdf-model-tagged-pdf-form-auto-tagging'/>

### Tagging a Link

<snippet id='libraries-pdf-model-tagged-pdf-link'/>

## See Also

* [Marked Content]({%slug radpdfprocessing-model-marked-content%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
* [Accessibility Support]({%slug create-accessible-pdf-documents%})
