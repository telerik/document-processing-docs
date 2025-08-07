---
title: Tagged PDF
description: Learn how to identify a portion of a PDF content stream as a marked-content element with the PdfProcessing library.
page_title: Tagged PDF
slug: radpdfprocessing-model-tagged-pdf
tags: marked, content, tag, pdf, accessibility
published: True
position: 7
---

# Tagged PDF

|Version|**Q3 2025** (or newer)|
|----|----|

**RadPdfProcessing** provides support for a **Tagged PDF**. It is a stylized use of PDF which defines a set of standard structure types and attributes that allow page content (text, graphics, and images) to be extracted and reused for other purposes. It is intended to be used by tools that perform operations like:

* Making content accessible to users with visual impairments
* Simple extraction of text and graphics
* Automatic reflow of text and associated graphics to fit a page of a different size than was assumed for the original layout 
* Processing text for such purposes as searching, indexing, and spell-checking 
* Conversion to other common file formats with document structure and basic styling information preserved

## Tagging Strategy 

Represents the strategy for handling tagging in PDF documents. The available options are:

* **UseExisting** - Specifies whether the document should not be tagged on export automatically and the existing StructureTree will be used. The *default* option.

* **Build** - Specifies whether the document should be automatically tagged on export and a new StructureTree should be created.

## Tagging Document Elements

The following sections demonstrate how to tag the different elements of a RadFixedDocument:

### Tagging a TextFragment

<snippet id='libraries-pdf-tagged-pdf-text-fragment'/>

### Tagging an Annotation 

<snippet id='libraries-pdf-tagged-pdf-annotation'/>

### Tagging a Link Annotation 

<snippet id='libraries-pdf-tag-link-annotation'/>

### Tagging a Table

<snippet id='libraries-pdf-tagged-pdf-table'/>

### Tagging a List

<snippet id='libraries-pdf-tagged-pdf-list'/>

### Advanced Example

<snippet id='libraries-pdf-tagged-pdf-advanced'/>

### Auto-Tagging 

<snippet id='libraries-pdf-tagged-pdf-auto-tagging'/>

### Tagging a Form Field

<snippet id='libraries-pdf-tagged-pdf-form-field'/>

### Tagging a FormField using FixedContentEditor

<snippet id='libraries-pdf-tagged-pdf-form-field-with-fixed-content-editor'/>

### Auto-Tagging a FormField using FixedContentEditor

<snippet id='libraries-pdf-tagged-pdf-form-field-with-fixed-content-editor-auto-tagging'/>

### Tagging a Form

<snippet id='libraries-pdf-tagged-pdf-form'/>

### Auto-Tagging a Form

<snippet id='libraries-pdf-tagged-pdf-form-auto-tagging'/>

### Tagging a Link

<snippet id='libraries-pdf-tagged-pdf-link'/>

## See Also

 * [Marked Content]({%slug radpdfprocessing-model-marked-content%})
 * [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) 
 * [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
 * [Accessibility Support]({%slug create-accessible-pdf-documents%})
