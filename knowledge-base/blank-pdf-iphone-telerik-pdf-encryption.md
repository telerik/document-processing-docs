---
title: Encrypted PDF Generation Results in Empty Document on iPhone
description: Resolving issues where encrypted PDFs generated using Telerik PdfProcessing appear blank when opened on iPhone devices.
type: troubleshooting
page_title: Blank PDF on iPhone When Using Telerik PdfProcessing Encryption
meta_title: Fix for Blank PDF on iPhone Due to Telerik PdfProcessing Encryption
slug: blank-pdf-iphone-telerik-pdf-encryption
tags: pdf, processing, telerik, document, aes, aes256, 256, 128, aes128, encrypt, linearization, iphone, ios, apple
res_type: kb
ticketid: 1701327
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Problem

When generating and encrypting a PDF using Telerik Document Processing, the file appears blank when opened on iPhone devices. However, the same PDF opens correctly on other platforms, including the mobile version of Adobe Acrobat on iPhone. 

## Description

iOS viewers are sensitive to PDF structure and metadata. Many mobile PDF viewers, including those on iOS, expect linearized PDFs for optimal compatibility, especially when encryption is applied. Non-linearized encrypted PDFs may fail to render properly or show as empty.
The **AES256** encryption used by Telerik PdfProcessing is broadly compatible, but some viewers require specific encryption flags or additional metadata that may not be present in the generated PDF. 

## Solution

If you intend to display the generated PDF documents on Apple devices, make sure that you are encrypting the document with the **AES128** algorithm.

## See Also

- [Telerik PdfProcessing Encryption Types](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.formatproviders.pdf.export.encryptiontype)
- [AES Encryption in Telerik PdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings)
- [Feedback Portal: Add Support to Linearize PDFs](https://feedback.telerik.com/document-processing/1701394-pdfprocessing-add-support-to-linearize-pdfs)
- [Feedback Portal: Add AES-128 Encryption Support](https://feedback.telerik.com/document-processing/1699425-pdfprocessing-add-support-for-encrypting-documents-with-an-aes-128-algorithm)
