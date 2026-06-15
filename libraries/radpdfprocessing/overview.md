---
title: Overview
page_title: RadPdfProcessing Overview
description: Explore RadPdfProcessing features, editors, document model capabilities, and next steps for creating, importing, and exporting PDF documents.
slug: radpdfprocessing-overview
tags: pdf, radpdfprocessing, processing, documents, export, import, forms, signatures
published: True
position: 0
---

# RadPdfProcessing Overview

**RadPdfProcessing** is the Telerik Document Processing library for creating, importing, editing, and exporting PDF documents in .NET applications. You can use it to generate PDF files from code, work with existing documents, add forms, tables, annotations, digital signatures, accessibility metadata, and more without relying on Adobe Acrobat or other third-party desktop software.

This overview explains what RadPdfProcessing is designed for, which editors and features it provides, and where to continue next based on the task you need to complete.

![Diagram showing RadPdfProcessing document creation and editing workflows](images/pdf-processing-overview.jpg)

>note
>
> If you still need to install **Telerik Document Processing**, see [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%}) for the available package options.

If you want a first working example, continue to [Getting Started with RadPdfProcessing]({%slug radpdfprocessing-getting-started%}).

## Key Features

Use RadPdfProcessing for these common tasks:

* Generate PDF documents from code.
* Import existing PDF files and update selected content.
* Add text, images, shapes, tables, lists, forms, annotations, and bookmarks.
* Merge, split, and append PDF content.
* Sign documents digitally and validate signatures.
* Export PDF content to PDF or plain text.
* Create accessible PDF output and control viewer preferences.
* Extract insights from documents with GenAI-powered Document Insights.

The following table summarizes the capabilities that most users need first:

| Feature | Description |
|---|---|
| Create and edit PDF documents | Generate documents from scratch, edit existing content, or append new content while preserving the original PDF structure where supported. |
| Automatic and fixed layout | Build flowing content by using [blocks]({%slug radpdfprocessing-editing-block%}), [tables]({%slug radpdfprocessing-editing-table-overview%}), and [lists]({%slug radpdfprocessing-editing-list%}), or draw content directly on the page. |
| Interactive forms | Create, fill, extract, flatten, and sign PDF forms by using [interactive forms]({%slug radpdfprocessing-model-interactive-forms-overview%}). |
| Digital signatures | Sign and validate PDF documents, use [timestamp servers]({%slug pdf-sign-timestamp-server%}), support [external signing]({%slug external-digital-signing%}), and apply multiple signatures. |
| Merge and export workflows | Merge documents, split content, and optimize large-output scenarios by using [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}). |
| Accessibility and AI scenarios | Create [accessible PDF documents]({%slug create-accessible-pdf-documents%}) and use [GenAI-powered Document Insights]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%}). |

## Choose an Editor

RadPdfProcessing provides two editors that serve different document-generation styles:

| Editor | Best for | 
|---|---|
| [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) | Flow-like editing where content is inserted in a more automatic layout sequence. |
| [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) | Precise drawing and positioning when you need detailed control over the page. | 

Choose `RadFixedDocumentEditor` when you want a higher-level editing flow. Choose `FixedContentEditor` when you need lower-level control over exact PDF page content.

## Document Model Overview

The document model includes the following major areas:

| Area | Description |
|---|---|
| [Pages]({%slug radpdfprocessing-model-radfixedpage%}) | Add, remove, and modify pages, including page size and rotation. |
| [Images]({%slug radpdfprocessing-model-image%}) | Work with encoded image data, control image quality, and use SVG form sources starting with **Q3 2024**. |
| [Geometries]({%slug radpdfprocessing-concepts-geometry%}) | Define 2D shapes and path geometry. |
| [Form XObjects]({%slug radpdfprocessing-model-form%}) | Reuse composite content for better rendering performance and smaller file sizes. |
| [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) and [destinations]({%slug radpdfprocessing-model-annotations-links%}#destination) | Associate content with locations and define document views. |
| [Bookmarks]({%slug radpdfprocessing-features-bookmarks%}) | Add and manage outlines for document navigation. |
| [Clipping]({%slug radpdfprocessing-concepts-clipping%}) | Define clipping outlines for images and paths. |
| [Fonts]({%slug radpdfprocessing-concepts-fonts%}) and [colors]({%slug radpdfprocessing-concepts-colors-and-color-spaces%}) | Control typography and color spaces for document content. |
| [Text and graphic properties]({%slug radpdfprocessing-editing-text-and-graphic-properties%}) | Customize visual appearance across document elements. |
| [Viewer preferences]({%slug radpdfprocessing-features-viewer-preferences%}) | Control how the document behaves in PDF viewers. |
| [Embedded file streams]({%slug radpdfprocessing-embedded-file-streams-overview%}) | Attach external files to the document. |
| [Password protection]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings) | Import documents encrypted with supported RC4, AES-128, and AES-256 algorithms. |
| [JavaScript actions and trigger events]({%slug radpdfprocessing-model-javascript-actions%}) | Import and export JavaScript actions associated with pages and form fields. |

## Typical Next Steps

Most users continue with one of these paths:

1. Start with [Getting Started with RadPdfProcessing]({%slug radpdfprocessing-getting-started%}) for a first working sample.
2. Review [Using PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) if you need import and export details.
3. Explore [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) or [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) to choose an editing approach.
4. Review [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) or [Interactive Forms]({%slug radpdfprocessing-model-interactive-forms-overview%}) for specialized PDF workflows.


## Online Demos

Review these demos to see common RadPdfProcessing scenarios in action:

| Demo | Description |
|----|----|
| [PdfProcessing Basic Usage](https://demos.telerik.com/document-processing/pdfprocessing) | Create a document with images, text, and shapes and export it to PDF. |
| [PdfProcessing Bar Chart Export](https://demos.telerik.com/document-processing/pdfprocessing/bar_chart_export) | Create a PDF document that contains a bar chart and a data table. |
| [PdfProcessing Form Fields Reading and Writing](https://demos.telerik.com/document-processing/pdfprocessing/read_write_form_fields) | Read an existing PDF, update form fields, and export the result. |
| [PdfProcessing Content Merging, Splitting, and Adding](https://demos.telerik.com/document-processing/pdfprocessing/merge_split_add_content) | Merge, split, or append PDF content. |
| [PdfProcessing Embedding File Streams](https://demos.telerik.com/document-processing/pdfprocessing/embed_file_streams) | Embed a file or a ZUGFeRD electronic invoice in a PDF document. |
| [PdfProcessing Optical Character Recognition (OCR)](https://demos.telerik.com/document-processing/pdfprocessing/optical_character_recognition) | Import an image, recognize text, and export searchable PDF content. |
| [PdfProcessing Annotations](https://demos.telerik.com/document-processing/pdfprocessing/annotations) | Create a PDF document and insert annotations. |
| [PdfProcessing Digitally Sign Document](https://demos.telerik.com/document-processing/pdfprocessing/digitally_sign_document) | Apply a digital signature to a PDF document. |
| [PdfProcessing Validate Digital Signature](https://demos.telerik.com/document-processing/pdfprocessing/validate_digital_signature) | Validate an existing digital signature in a PDF file. |
| [PdfProcessing Multiple Digital Signatures](https://demos.telerik.com/document-processing/pdfprocessing/multiple_digital_signatures) | Apply a new digital signature without invalidating existing signatures. |
| [PdfProcessing Accessibility](https://demos.telerik.com/document-processing/pdfprocessing/accessibility) | Create accessible PDF documents that support PDF/UA-oriented structure and metadata. |
| [PdfProcessing GenAI Document Insights](https://demos.telerik.com/document-processing/pdfprocessing/genai_document_insights) | Use GenAI-powered Document Insights to extract meaningful information from PDF documents. |
| [PdfProcessing Add Digital Signature External](https://demos.telerik.com/document-processing/pdfprocessing/external_digitally_sign_document) | Sign a PDF document with external signing support and optional timestamp server usage. |




## See Also

- [Installing on Your Computer]({%slug installation-installing-on-your-computer%})
- [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
- [Getting Started with RadPdfProcessing]({%slug radpdfprocessing-getting-started%})
- [Using PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
- [Accessibility Support]({%slug create-accessible-pdf-documents%})