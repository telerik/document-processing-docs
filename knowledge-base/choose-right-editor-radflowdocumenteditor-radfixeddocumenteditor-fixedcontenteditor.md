---
title: Choosing Between RadFlowDocumentEditor, RadFixedDocumentEditor, and FixedContentEditor
description: Learn the differences between the Word and PDF editors in Telerik Document Processing and choose the right API for your document-generation scenario.
type: how-to
page_title: Choose the Right Telerik Document Editor for Word and PDF Generation
slug: choose-right-editor-radflowdocumenteditor-radfixeddocumenteditor-fixedcontenteditor
tags: radflowdocumenteditor, radfixeddocumenteditor, fixedcontenteditor, radwordsprocessing, radpdfprocessing, pdf, docx, document, generation
res_type: kb
---

# Choosing Between RadFlowDocumentEditor, RadFixedDocumentEditor, and FixedContentEditor

## Environment

| Version | Product | Author |
|---|---|---|
| 2026.2.707 | PdfProcessing and WordsProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

You need to decide between `RadFlowDocumentEditor`, `RadFixedDocumentEditor`, and `FixedContentEditor` for document generation in Progress® Telerik® Document Processing. The three editors serve different layout models, come from different libraries, and offer different levels of control and convenience.

## Solution

Use this rule first:

* Choose `RadFlowDocumentEditor` when your source model is Word-like flow content (`RadFlowDocument`) and you need high-level editing.
* Choose `RadFixedDocumentEditor` when your output is PDF and you need flow-like authoring with automatic pagination.
* Choose `FixedContentEditor` when your output is PDF and you need precise, coordinate-based placement.

### Library and Model Differences

| Library | Main document model | What it is best at | Format notes |
|---|---|---|---|
| [RadWordsProcessing]({%slug radwordsprocessing-overview%}) | `RadFlowDocument` | Word-processing scenarios: rich text, sections, paragraphs, fields, tables | Supports multiple import and export formats. PDF support is [export only]({%slug radwordsprocessing-formats-and-conversion%}). |
| [RadPdfProcessing]({%slug radpdfprocessing-overview%}) | `RadFixedDocument` | Native PDF creation/import/edit/export | Designed for fixed-layout PDF content and page-level control. |

### Editor Comparison

| Editor | Library | Layout behavior | Pros | Cons | Best use cases |
|---|---|---|---|---|---|
| [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) | RadWordsProcessing | Flow-based in Word document model | High productivity API; inserts content in logical order; good for structured document generation | Not a PDF-native editor; final PDF output depends on WordsProcessing PDF export capabilities | DOCX-first generation, templates, mail-merge-like content assembly |
| [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) | RadPdfProcessing | Flow-like authoring for PDF with automatic sizing and page flow | Less manual layout work; convenient for text-heavy PDF reports; handles page flow automatically | Less absolute control than coordinate-based drawing | PDF reports, invoices, catalogs, long flowing documents |
| [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) | RadPdfProcessing | Fixed positioning on a specific PDF page/content root | Maximum control over exact placement, size, transforms, and drawing | You must manage coordinates, available space, and overlap/cropping risks manually | Pixel-precise layout, overlays, stamps, custom graphics, form-like positioned content |

### Practical Guidance

If you create content similar to a Word document, start with `RadFlowDocumentEditor`.
If you create a PDF directly and need easier layout flow, use `RadFixedDocumentEditor`.
If exact XY placement is mandatory, use `FixedContentEditor`.

For Word-to-PDF conversion scenarios, RadWordsProcessing exports PDF based on its supported feature matrix. If a source document uses unsupported or partially supported features, visual differences can appear in exported PDF. Review [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}) for details.

## See Also

* [RadWordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [RadWordsProcessing Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%})
