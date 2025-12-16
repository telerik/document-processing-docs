---
title: Fixing Missing Text with Specific Cultures 
description: Learn how to address the issue where RadFixedDocument recognizes incorrect document size during import.
type: how-to
page_title: Resolving Missing Text with Specific Cultures 
meta_title: Resolving Missing Text with Specific Cultures 
slug: radfixeddocument-import-wrong-document-size
tags: pdf, processing, telerik, document, fixed, pdfformatprovider, culture, truncate
res_type: kb
ticketid: 1674854
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2024.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When loading some PDF documents with German culture, part of the text got missing. It is possible to observe the following error:
`The dimensions of this page are out-of-range. Page content might be truncated`. 
When importing a PDF file using RadFixedDocument with PdfFormatProvider, the document may recognize an incorrect size. For example, an A4-sized document may display a width value thousands of times larger than expected. This issue can occur due to culture settings on the machine (e.g. German).

This knowledge base article also answers the following questions:
- How to fix incorrect document size when using PdfFormatProvider in RadFixedDocument?
- Why does RadFixedDocument import PDFs with wrong size values?
- How to ensure correct document size during import with RadFixedDocument?

## Solution

To resolve the incorrect document size issue, follow these steps:

### Option 1: Set English Culture Before Import

1. Add the following code before loading the document:
   ```csharp
   Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
   ```
   
### Option 2: Use Preview Version of Telerik UI for WinForms

1. Download and install the  preview version 2024.4.1127 (or newer).
2. Use this version to render and process the PDF.

## See Also

- [Feedback Item: Missing Text with Specific Cultures](https://feedback.telerik.com/document-processing/1670849-pdfprocessing-missing-text-with-specific-cultures-e-g-german)
