---
title: Overview
description: Learn how to generate an accessible PDF document using Telerik Document Processing Libraries.
page_title: Accessibility Support - Overview
slug: pdfprocessing-feature-accessibility-support
tags: overview, content, structure, pdf, accessibility
published: True
position: 0
---

# Accessibility Support - Overview

**RadPdfProcessing** provides *accessibility support* of documents to users with disabilities. This allows many users with visual impairments to use screen readers and read such documents aloud. To enable proper vocalization, either through a screen reader or by some more direct invocation of a text-to-speech engine, the PDF document should support the following features: 

* Specifying the natural language used for text in a PDF document.

* Providing textual descriptions for images or other items that do not translate naturally into text, or replacement text for content that does translate into text but is represented in a nonstandard way.

* Specifying the expansion of abbreviations or acronyms.

The core of this support lies in the ability to determine the logical order of content in a PDF document, independently of the content's appearance or layout, through [logical structure]({%slug radpdfprocessing-model-structure-tree%}) and [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%}).

## See Also

* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [Marked Content]({%slug radpdfprocessing-model-marked-content%})
* [StructureTree]({%slug radpdfprocessing-model-structure-tree%})
* [PdfProcessing Accessibility Demo](https://demos.telerik.com/document-processing/pdfprocessing/accessibility)
