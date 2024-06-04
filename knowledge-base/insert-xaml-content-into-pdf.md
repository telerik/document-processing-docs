---
title: Inserting XAML Content into a PDF Document
description: Learn how to insert XAML content from RadRichTextBox into an existing PDF while retaining formatting using RadWordsProcessing.
type: how-to
page_title: How to Convert XAML to PDF While Preserving Formatting
slug: insert-xaml-content-into-pdf
tags: radpdfprocessing, documentprocessing, xamlformatprovider, radrichtextbox, docxformatprovider, radwordsprocessing, pdfstreamwriter
res_type: kb
category: knowledge-base
ticketid: 1654120
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

There are use cases in WPF applications that collect input from a `RichTextBox` and then saves it as a XAML string. This input could include links, font styles (bold, italic), bullet points, tables, etc. Then, having this piece of XAML content, the required functionality is to import it into an existing PDF document.
This article demonstrates a sample approach how to handle such a scenario with the help of Telerik Document Processing Libraries.

## Solution

The [XamlFormatProvider](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/xaml/xamlformatprovider) is applicable for the WPF [RadRichTextBox](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview) control. It is important to note that the format providers offered by the RichTextBox control are different than the format providers from the Document Processing Libraries. Hence, they may support different features that may produce different output results.

To insert XAML content into a PDF while retaining formatting, follow these steps:

1. Export the XAML content from the RadRichTextBox to a DOCX format using the [DocxFormatProvider](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/docx/docxformatprovider).

2. Utilize the [RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview) library to import the DOCX file. The DOCX content can then be exported to a PDF format, preserving the content formatting as closely as possible.

3. If you need to merge the newly created PDF content (from the XAML content) with another PDF document, use the [PdfStreamWriter](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/overview) for merging the documents.

## See Also

- [RadRichTextBox Overview](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview)
- [XamlFormatProvider Documentation](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/xaml/xamlformatprovider)
- [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [PdfStreamWriter Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/overview)
