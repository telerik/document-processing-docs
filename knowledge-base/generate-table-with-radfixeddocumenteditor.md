---
title: Generating a Table with RadFixedDocumentEditor
description: Learn how to build a table using RadFixedDocumentEditor in RadPdfProcessing and explores the alternative RadFixedDocumentEditor for a flow-like content management.
type: how-to
page_title: How to Generate a Table with RadFixedDocumentEditor
slug: generate-table-with-radfixeddocumenteditor
tags: radpdfprocessing, document processing, fixedcontenteditor, radfixeddocumenteditor, pdf, editing
res_type: kb
ticketid: 1674934
---
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.4.1106| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
When creating or editing a PDF document using RadPdfProcessing, understanding how to manage the positioning of elements is essential. This knowledge base article addresses the question of whether it's necessary to reposition all elements below a newly added element in the middle of the PDF file using [FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor) and explores the existence of a design tool for creating PDF documents. This knowledge base article also answers the following questions:
- How to generate a PDF document from images using FixedContentEditor?
- How to add a watermark to PDF files using RadPdfProcessing?
- Is there a design tool provided by Telerik for creating PDF documents?

## Solution
### Managing Elements with FixedContentEditor
The [FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor) in RadPdfProcessing enables precise control over the element's positioning within a PDF page. It acts as a pencil, allowing content to be drawn at specific locations. After adding an element, adjust the editor's Position to prevent overlapping with subsequent elements. This method requires manual management of each element's position, especially when inserting a new element amidst existing ones.

For more insights on using FixedContentEditor effectively, consider reviewing these resources:
- [How to Generate a PDF Document from Images with FixedContentEditor](https://docs.telerik.com/devtools/document-processing/knowledge-base/pdf-from-images-with-fixedcontenteditor)
- [Adding a Watermark to PDF Files Using RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/add-watermark-pdf-radpdfprocessing)

### Flow-Like Content Management with RadFixedDocumentEditor
Alternatively, RadPdfProcessing offers the [RadFixedDocumentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/radfixeddocumenteditor), which allows for a flow-like content management approach. This editor automates the positioning of elements, enabling you to insert content sequentially without manually calculating positions. This option might be more suitable for scenarios where manual positioning is cumbersome.

### Design Tool for Creating PDF
Regarding the query on a design tool for PDF creation, Telerik Document Processing is primarily focused on processing document formats programmatically and does not include a design tool for PDF creation. The functionality to visually design and edit PDF documents typically falls within UI components like a PDF viewer, which is outside the scope of the Telerik Document Processing libraries.

## See Also
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [RadFixedDocumentEditor Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/radfixeddocumenteditor)
- [Introduction to Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/introduction)

 
