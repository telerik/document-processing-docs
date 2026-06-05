---
title: Inserting XAML Content into a PDF Document
description: Learn how to insert XAML content from RadRichTextBox into an existing PDF while retaining formatting using RadWordsProcessing.
type: how-to
page_title: How to Convert XAML to PDF While Preserving Formatting
slug: insert-xaml-content-into-pdf
tags: radpdfprocessing, radwordsprocessing, xaml, pdf, wpf, conversion, document, processing
res_type: kb
category: knowledge-base
ticketid: 1654120
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.2.426| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

In WPF applications, you can collect input from a [RichTextBox](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview) and save it as an XAML string. This input can include links, font styles (bold, italic), bullet points, tables, and other elements. You can then import this XAML content into an existing PDF document.

This article demonstrates a sample approach for handling this scenario with the Telerik Document Processing Libraries.

## Solution

The [XamlFormatProvider](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/xaml/xamlformatprovider) is applicable for the WPF [RadRichTextBox](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview) control. The format providers offered by the `RadRichTextBox` control are different from the format providers in the [Document Processing Libraries](https://docs.telerik.com/devtools/document-processing/introduction). As a result, they may support different features and produce different output results.

To insert XAML content into a PDF while retaining formatting, follow these steps:

1. Export the XAML content from the [RadRichTextBox](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview) to a DOCX format using the [DocxFormatProvider](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/docx/docxformatprovider).

2. Use the [RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview) library to import the DOCX file.

3. Export the DOCX content to [PDF format]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}). This preserves the content formatting as closely as possible.

4. If you need to merge the newly created PDF content (from the XAML content) with another PDF document, use the [PdfStreamWriter](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/overview) to merge the documents.

>note The [XAML SDK repository](https://github.com/telerik/document-processing-sdk) on GitHub contains examples showing the capabilities of `PdfStreamWriter`. The [Manipulate Pages](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ManipulatePages) example shows different use cases of `PdfStreamWriter`. Review the `MergeDifferentDocumentsPages` method.

## See Also

* [RadRichTextBox Overview](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/overview)
* [XamlFormatProvider Documentation](https://docs.telerik.com/devtools/wpf/controls/radrichtextbox/import-export/xaml/xamlformatprovider)
* [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
* [PdfStreamWriter Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/overview)
