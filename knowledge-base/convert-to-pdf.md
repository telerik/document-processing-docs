---
title: Convert Document to PDF
description: This article demonstrates how you can convert different types of documents to PDF with Telerik Document Processing.
type: how-to 
page_title: Convert rich text documents and spreadsheets to PDF
slug: convert-to-pdf
position: 0
tags: pdf, xlsx, xls, datatable, plain text, string, docx, doc, rtf, html, Word, Excel
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|N/A|Telerik Document Processing|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|

## Description

The libraries included in Telerik Document Processing allow you to create, modify and export PDF documents, as well as convert a document from different file format to PDF.

Depending on the scenario, you could take advantage of the different functionalities each library provides. This article contains examples of the most common approaches for converting a document to PDF using Telerik Document Processing.

## Solution

This article shows examples of the most common scenarios for converting documents of different types to PDF. The Table of Contents section below contains the full list of covered examples for easy and quick navigation.

## Table of Contents

 - [Convert a Document to PDF](#convert-a-document-to-pdf)
	- [DOCX to PDF](#convert-docx-to-pdf)
	- [DOC to PDF](#convert-doc-to-pdf)
	- [HTML to PDF](#convert-html-to-pdf)
	- [RTF to PDF](#convert-rtf-to-pdf)
	- [Plain text to PDF](#convert-txt-to-pdf)
- [Convert a Spreadsheet Document to PDF](#convert-a-spreadsheet-document-to-pdf)
	- [XLSX to PDF](#convert-xlsx-to-pdf)
	- [XLS to PDF](#convert-xls-to-pdf)
	- [CSV to PDF](#convert-csv-to-pdf)	
	- [DataTable object to PDF](#convert-datatable-to-pdf)	
	

## Convert a Document to PDF

In scenarios where you need to convert a document from another file format to PDF, you could take advantage of the capabilities of **WordsProcessing**. This library allows you to import documents from the most common rich text formats (Docx, Doc, HTML, RTF) as well as plain text and export them to PDF. All the supported document formats and the corresponding format providers are listed in the [Formats and Conversion section]({%slug radwordsprocessing-formats-and-conversion%}). 

>note In order to use the **PdfFormatProvider** of **WordsProcessing**, you should add a reference to  the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf** assembly. For the full list of dependencies required by WordsProcessing, check the [Getting Started]({%slug radwordsprocessing-getting-started%}) topic.

>The **PdfFormatProvider** class of WordsProcessing resides in the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}).

### Convert DOCX to PDF

````C#
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument flowDocument;
	using (Stream input = File.OpenRead("sample.docx"))
	{
		Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
		// The import method enables you to also pass a byte[] with the DOCX document data
		flowDocument = provider.Import(input);
	}

	Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(flowDocument);
````



### Convert DOC to PDF

````C#
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument flowDocument;
	using (Stream input = File.OpenRead("sample.doc"))
	{
		Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Doc.DocFormatProvider();
		// The import method enables you to also pass a byte[] with the DOC document data
		flowDocument = provider.Import(input);
	}

	Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(flowDocument);
````



### Convert HTML to PDF

````C#
	string htmlContent = "<!DOCTYPE html><html><body><p>Hello, world!</p></body></html>";
	
    Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider htmlProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider();
	// Create a document instance from the content.
    RadFlowDocument flowDocument = htmlProvider.Import(htmlContent);

    Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
    byte[] pdfBytes = pdfProvider.Export(flowDocument);
````

### Convert RTF to PDF

````C#
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument flowDocument;
	using (Stream input = File.OpenRead("sample.rtf"))
	{
		Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();
		// The import method enables you to also pass a string or a stream with the content.
		flowDocument = provider.Import(input);
	}

	Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(flowDocument);
````


### Convert Plain text to PDF

````C#
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument flowDocument;
	string text = "Hello, WordsProcessing!";
	Telerik.Windows.Documents.Flow.FormatProviders.Txt.TxtFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Txt.TxtFormatProvider();
	// The import method enables you to also pass a string or a stream with the content.
	flowDocument = provider.Import(text);

	Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(flowDocument);
````

## Convert a Spreadsheet Document to PDF

While the so far discussed libraries allow working with text documents, with **SpreadProcessing** you can create, import and export tabular data. This library supports the most common file formats for storing spreadsheet documents - XLSX, XLS CSV. All format providers are listed and described in the corresponding [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}). 

>note In order to enable the export to PDF in SpreadProcessing, you will need to add a reference to the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf** assembly. For the full list of dependencies required by SpreadProcessing, check the [Getting Started]({%slug radspreadprocessing-getting-started%}) topic.

>The **PdfFormatProvider** class of SpreadProcessing resides in the **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf namespace**. For more information on how to work with this provider, please read [this topic]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}).


### Convert XLSX to PDF

````C#
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
	using (Stream input = File.OpenRead("sample.xlsx"))
	{
		Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.Xlsx.XlsxFormatProvider();
		// The import method enables you to also pass a byte[] with the XLSX document data
		workbook = provider.Import(input);
	}

	Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(workbook);
````

### Convert XLS to PDF

````C#
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
	using (Stream input = File.OpenRead("sample.xls"))
	{
		Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.XlsFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.XlsFormatProvider();
		// The import method enables you to also pass a byte[] with the XLS document data
		workbook = provider.Import(input);
	}

	Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(workbook);

````

### Convert CSV to PDF

````C#
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
	using (Stream input = File.OpenRead("sample.csv"))
	{
		Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.TextBased.Csv.CsvFormatProvider();
		// The import method enables you to also pass a string with the CSV document data
		workbook = provider.Import(input);
	}

	Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(workbook);
````

### Convert DataTable to PDF

````C#
	Telerik.Windows.Documents.Spreadsheet.Model.Workbook workbook;
	using (Stream input = File.OpenRead("sample.csv"))
	{
		Telerik.Windows.Documents.Spreadsheet.FormatProviders.DataTableFormatProvider provider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.DataTableFormatProvider();
		// Load the DataTable from yor database
		DataTable dataTable = LoadDataTable();
		workbook = provider.Import(dataTable);
	}

	Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider pdfProvider = new Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.PdfFormatProvider();

	// Export the document. The different overloads enables you to export to a byte[] or to a Stream.
	byte[] pdfBytes = pdfProvider.Export(workbook);
````


## See Also

* [Getting Started with Telerik Document Processing]({%slug getting-started%})
* [PdfProcessing]([%slug radpdfprocessing-overview%])
* [WordsProcessing]([%slug radwordsprocessing-overview%])
* [SpreadProcessing]([%slug radspreadprocessing-overview%])
