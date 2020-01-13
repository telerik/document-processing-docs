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

* [Convert a Document to PDF](#convert-a-document-to-pdf)

* [Convert a Spreadsheet Document to PDF](#convert-a-spreadsheet-document-to-pdf)

>important The **.NET Standard** specification does not define APIs for getting specific fonts. **PdfFormatProvider** needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the **FontsProviderBase** abstract class and set this implementation to the **FontsProvider** property of **FixedExtensibilityManager**. For detailed information, check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.


## Create a PDF Document From Scratch

**RadPdfProcessing** is intended to work with fixed documents and provides a convenient API to create, modify and export PDF documents. To use its import and export functionalities, you will need to add a reference to the **Telerik.Windows.Documents.Fixed** assembly. 

You can import and export a document through the respective methods of the **PdfFormatProvider** class.

>The **PdfFormatProvider** class of RadPdfProcessing resides in the **Telerik.Windows.Documents.Fixed.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

## Convert a Document to PDF

In scenarios where you need to convert a document from another file format to PDF, you could take advantage of the capabilities of **RadWordsProcessing**. This library allows you to import documents from the most common rich text formats (Docx, HTML, RTF) as well as plain text and export them to PDF. All the supported document formats and the corresponding format providers are listed in the [Formats and Conversion section]({%slug radwordsprocessing-formats-and-conversion%}). 

In order to use the **PdfFormatProvider** of **RadWordsProcessing**, you should add a reference to  the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf** assembly.

>The **PdfFormatProvider** class of RadWordsProcessing resides in the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}).


### Convert HTML to PDF

**Example 1** demonstrates how you can convert an HTML string to a PDF document. The [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%}) and [PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) classes of [RadWordsProcessing]({%slug radwordsprocessing-overview%}) are used to import/export the [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instance. 

#### [C#] Example 1: HTML to PDF conversion

{{region radwordsprocessing-pdf-export_0}}

	string htmlContent = "<!DOCTYPE html><html><body><p>Hello, world!</p></body></html>";
	
    Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider htmlProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider();
	// Create a document instance from the content.
    RadFlowDocument document = htmlProvider.Import(htmlContent);

    Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
    byte[] pdfBytes = pdfProvider.Export(document);
{{endregion}}

## Convert a Spreadsheet Document to PDF

While the so far discussed libraries allow working with text documents, with RadSpreadProcessing you can create, import and export tabular data. This library supports the most common file formats for storing spreadsheet documents - Xlsx, CSV. All format providers are listed and described in the corresponding [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}). 

In order to enable the export to PDF in RadSpreadProcessing, you will need to add a reference to the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf** assembly.

>The **PdfFormatProvider** class of RadSpreadProcessing resides in the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

## See Also

* [Getting Started with Telerik Document Processing]({%slug getting-started%})
* [RadPdfProcessing]([%slug radpdfprocessing-overview%])
* [RadWordsProcessing]([%slug radwordsprocessing-overview%])
* [RadSpreadProcessing]([%slug radspreadprocessing-overview%])
