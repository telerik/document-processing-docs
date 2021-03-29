---
title: Overview
page_title: Overview
description: Getting Started with Telerik Document Processing
slug: getting-started
tags: getting-started
published: True
position: 0
---

# Getting Started with Telerik Document Processing


Telerik Document Processing includes a set of cross-platform libraries that let you import and export content between different formats and work with archive files. The needed assemblies come with the installation files of several Telerik suites. They are available also in the internal builds of the same Telerik suites. 

More information about the suites that include Telerik Document Processing and how to install them is available in the [Installing on Your Computer]({%slug installation-installing-on-your-computer%}) article.

>The libraries support .NET 4 and later. .NET Standard-compatible binaries are available as well. The assemblies for .NET Standard don't include 'Windows' in their names.

The following table lists all Telerik Document Processing assemblies and their roles:

| Assembly | Description |
|-------|----------------|
| **Telerik.Windows.Documents.Core.dll** | The main assembly from the Telerik document processing libraries. You always need it when you intend to use the library. |
| **Telerik.Windows.Documents.Flow.dll** | Part of the words (text) processing library. It is needed for processing HTML, DOCX, RTF and TXT documents. |
| **Telerik.Windows.Documents.Flow.FormatProviders.Pdf** | Allows exporting of flow documents (DOCX, RTF) to PDF. |
| **Telerik.Documents.SpreadsheetStreaming.dll** | The main assembly for generating huge spreadsheet files using minimum resources. |
| **Telerik.Windows.Documents.Spreadsheet.dll** | The main assembly for the spreadsheet processing. It is needed for processing XLSX, CSV, TXT documents. |
| * **Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll** | This assembly is needed for processing XLSX documents. |
| **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll** | This assembly is needed for processing XLS documents. |
| **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.dll** | This assembly is needed for processing PDF documents. |
| **Telerik.Windows.Documents.CMapUtils.dll** | Provides a default implementation for getting the data of a predefined CMap table by a given name. The assembly is optional and you will need to include a reference to it only if you need to process documents with [CMap tables]({%slug radpdfprocessing-concepts-cmap-tables%}). |
| **Telerik.Windows.Zip.dll** | Needed for working with zipped formats (DOCX, XLSX) and PDF. It is the main assembly of the ([Telerik Zip Library]({%slug radziplibrary-overview%})). |
| **Telerik.Windows.Zip.Extensions.dll** | Extends **Telerik.Windows.Zip** assembly with additional helper methods ([Zip Extensions]({%slug radziplibrary-zipextensions%})). |

## Getting Started Resources by Library

More information about each of the Telerik Document Processing libraries is available in the articles listed below.

### Words (text) processing

* [Getting Started with RadWordsProcessing]({%slug radwordsprocessing-getting-started%})

* [Export to DOCX (Word Document) using DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})

* [Export to HTML using HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})

* [Export to RTF using RtfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})

* [Export to TXT (plain text) using TxtFormatProvider]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%})

### Spreadsheet processing

* [Getting Started with RadSpreadProcessing]({%slug radspreadprocessing-getting-started%})

* [Export to XLSX (Excel Workbook) using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})

* [Export to XLS (Excel 97-2003 Workbook) using XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%})

* [Export to CSV (Comma delimited) using CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})

* [Export to PDF using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})

* [Export to TXT (plain text) using TxtFormatProvider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%})

### Fast spreadsheet generation

* [Getting Started with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%})

### PDF processing

* [Getting Started with RadPdfProcessing]({%slug radpdfprocessing-getting-started%})

* [Import/export from/to PDF using PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})

### Working with ZIP files

* [Getting started with RadZipLibrary]({%slug radziplibrary-gettingstarted%})

## See Also

* [System Requirements]({%slug installation-system-requirements%})
* [Installing on Your Computer]({%slug installation-installing-on-your-computer%})
* [First Steps in using Telerik Document Processing]({%slug getting-started-first-steps%})