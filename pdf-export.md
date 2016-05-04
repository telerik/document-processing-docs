---
title: PDF Export
page_title: PDF Export
description: PDF Export
slug: pdf-export
tags: pdf-export
published: True
position: 3
---

# PDF Export

The libraries included in **Telerik Document Processing** allow you to create, modify and export PDF documents, as well as convert a document from different file format to PDF.

Depending on the scenario, you could take advantage of the different functionalities each library provides. This article will describe the most common approaches for creating a PDF document and how to achieve the desired goal using **Telerik Document Processing**.

* [Create a PDF Document From Scratch](#create-a-pdf-document-from-scratch)

* [Convert a Flow Document to PDF](#convert-a-flow-document-to-pdf)

* [Convert a Spreadsheet Document to PDF](#convert-a-spreadsheet-document-to-pdf)



## Create a PDF Document From Scratch

**RadPdfProcessing** is intended to work with fixed documents and provides a convenient API to create, modify and export PDF documents. To use its import and export functionalities, you will need to add a reference to the **Telerik.Windows.Documents.Fixed** assembly. 

You can import and export a document through the respective methods of the **PdfFormatProvider** class.

>The **PdfFormatProvider** class of RadPdfProcessing resides in the **Telerik.Windows.Documents.Fixed.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

## Convert a Document to PDF

In scenarios where you need to convert a document from another file format to PDF, you could take advantage of the capabilities of **RadWordsProcessing**. This library allows you to import documents from the most common rich text formats (Docx, HTML, RTF) as well as plain text and export them to PDF. All the supported document formats and the corresponding format providers are listed in the [Formats and Conversion section]({%slug radwordsprocessing-formats-and-conversion%}). 

In order to use the **PdfFormatProvider** of **RadWordsProcessing**, you should add a reference to  the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf** assembly.

>The **PdfFormatProvider** class of RadWordsProcessing resides in the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

## Convert a Spreadsheet Document to PDF

While the so far discussed libraries allow working with text documents, with RadSpreadProcessing you can create, import and export tabular data. This library supports the most common file formats for storing spreadsheet documents - Xlsx, CSV. All format providers are listed and described in the corresponding [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}). 

In order to enable the export to PDF in RadSpreadProcessing, you will need to add a reference to the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf** assembly.

>The **PdfFormatProvider** class of RadSpreadProcessing resides in the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

# See Also

* [Getting Started with Telerik Document Processing]({%slug getting-started%})
* [RadPdfProcessing]([%slug radpdfprocessing-overview%])
* [RadWordsProcessing]([%slug radwordsprocessing-overview%])
* [RadSpreadProcessing]([%slug radspreadprocessing-overview%])