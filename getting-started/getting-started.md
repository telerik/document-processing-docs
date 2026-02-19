---
title: Overview
page_title: Overview
slug: getting-started
tags: getting-started
published: True
position: 0
---

# Getting Started with Telerik Document Processing

**Telerik Document Processing** includes a set of cross-platform libraries that let you import and export content between different document formats and work with archive files. The required references come with the installation files of several Telerik suites. They are also available in the internal builds of the same Telerik suites. Learn which products include Telerik Document Processing in the [Product Bundles](https://www.telerik.com/purchase.aspx?filter=web).

>tip More information about the suites that include Telerik Document Processing and how to install them is available in the [Installing on Your Computer]({%slug installation-installing-on-your-computer%}) article.

>important Please install **&lt;PackageReference Include="Telerik.Licensing" Version="1.*" /&gt;**.

The following tables list all Telerik Document Processing packages for the different platforms and their roles:

>important The .NET Standard packages are compatible with any .NET version (e.g .NET 9), even if there are no packages explicitly available for the specific versions. The same applies to the .NET Framework packages.

### Packages for .NET Standard (Support for {{site.dotnetversions}})

| Packagea Name| Description |
|-------|----------------|
| **Telerik.Documents.Core** | The main package from the Telerik document processing libraries. You always need it when you intend to use the library. |
| **Telerik.Documents.Flow** | Part of the words (text) processing library. It is needed for processing HTML, DOCX, RTF and TXT documents. |
| **Telerik.Documents.DrawingML** | Part of the words (text) processing library. It is needed for working with shapes inside the documents. |
| **Telerik.Documents.Flow.FormatProviders.Doc** | Allows importing of DOC and DOT document. |
| **Telerik.Documents.Flow.FormatProviders.Pdf** | Allows exporting of flow documents (DOCX, DOC, DOT, RTF, and HTML) to PDF. |
| **Telerik.Documents.Fixed** | Part of the PDF processing library. It is needed for working with PDF documents. |
| **Telerik.Documents.Fixed.FormatProviders.Ocr** | This package is needed for the [Optical Character Recognition (OCR)]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) functionality. |
| **Telerik.Documents.Tesseract.Ocr** | This package is needed for the [Optical Character Recognition (OCR)]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) functionality. |
| **Telerik.Documents.ImageUtils** |  This package is required when exporting to `PDF` format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High. For more information check the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.
| **Telerik.Documents.CMapUtils** | Provides a default implementation for getting the data of a predefined CMap table by a given name. The package is optional and you will need to include a reference to it only if you need to process documents with [CMap tables]({%slug radpdfprocessing-concepts-cmap-tables%}). |
| **Telerik.Documents.Spreadsheet** | The main package for the spreadsheet processing. It is needed for processing XLSX, CSV, TXT documents. |
| **Telerik.Documents.Spreadsheet.FormatProviders.OpenXml** | This package is needed for processing XLSX documents. |
| **Telerik.Documents.Spreadsheet.FormatProviders.Pdf** | This package is needed for exporting to PDF documents. |
| **Telerik.Documents.Spreadsheet.FormatProviders.Xls** | This package is needed for processing XLS documents. |
| **Telerik.Documents.SpreadsheetStreaming** | The main package for generating huge spreadsheet files using minimum resources. |
| **Telerik.Zip** |It is the main package of the [Telerik Zip Library]({%slug radziplibrary-overview%}). |


### Assemblies for .NET Framework 

| package Name| Description |
|-------|----------------|
| **Telerik.Windows.Documents.Core** | The main package from the Telerik document processing libraries. You always need it when you intend to use the library. |
| **Telerik.Windows.Documents.Flow** | Part of the words (text) processing library. It is needed for processing HTML, DOCX, RTF and TXT documents. |
| **Telerik.Windows.Documents.DrawingML** | Part of the words (text) processing library. It is needed for working with shapes inside the documents. |
| **Telerik.Windows.Documents.Flow.FormatProviders.Doc** | Allows importing of DOC and DOT document. |
| **Telerik.Windows.Documents.Flow.FormatProviders.Pdf** | Allows exporting of flow documents (DOCX, DOC, DOT, RTF, and HTML) to PDF. |
| **Telerik.Documents.SpreadsheetStreaming** | The main package for generating huge spreadsheet files using minimum resources. |
| **Telerik.Windows.Documents.Spreadsheet** | The main package for the spreadsheet processing. It is needed for processing XLSX, CSV, TXT documents. |
| **Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml** | This package is needed for processing XLSX documents. |
| **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls** | This package is needed for processing XLS documents. |
| **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf** | This package is needed for processing PDF documents. |
| **Telerik.Windows.Documents.Fixed** | Part of the PDF processing library. It is needed for working with PDF documents. |
| **Telerik.Windows.Documents.Fixed.FormatProviders.Ocr** | This package is needed for the [Optical Character Recognition (OCR)]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) functionality. |
| **Telerik.Windows.Documents.Tesseract.Ocr** | This package is needed for the [Optical Character Recognition (OCR)]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) functionality. |
| **Telerik.Windows.Documents.CMapUtils** | Provides a default implementation for getting the data of a predefined CMap table by a given name. The package is optional and you will need to include a reference to it only if you need to process documents with [CMap tables]({%slug radpdfprocessing-concepts-cmap-tables%}). |
| **Telerik.Windows.Zip** |It is the main package of the [Telerik Zip Library]({%slug radziplibrary-overview%}). |
| **Telerik.Windows.Zip.Extensions** | Extends **Telerik.Windows.Zip** package with additional helper methods ([Zip Extensions]({%slug radziplibrary-zipextensions%})). |


>The libraries support .NET 4.6.2 and later. .NET Standard-compatible packages are available as well. The packages for .NET Standard don't include 'Windows' in their names.

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

* [Export to DataTable using DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})

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
* [How to Obtain Telerik Document Processing Libraries for .NET Framework, .NET Standard, {{site.dotnetversions}}]({%slug distribute-telerik-document-processing-libraries-net-versions%})
