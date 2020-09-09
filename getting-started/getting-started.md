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


Telerik Document Processing includes a set of cross-platform libraries that let you import and export content between different formats and work with archive files. The needed assemblies come with the installation (automated and manual) of several of the Telerik suites and in the internal builds archive where the latter is available. More information about the suites that include Telerik Document Processing and how to install them is available in the [Installing on Your Computer article]({%slug installation-installing-on-your-computer%}). 

>The libraries support .NET 4 and later. .NET Standard-compatible binaries are available as well. The assemblies for .NET Standard don't include 'Windows' in their names.

* **Telerik.Windows.Documents.Core.dll**: The main assembly from the Telerik document processing libraries. You always need it when you intend to use the library.

* **Telerik.Windows.Documents.Flow.dll**: Part of the words (text) processing library. It is needed for processing HTML, DOCX, RTF and TXT documents.

* **Telerik.Windows.Documents.Flow.FormatProviders.Pdf**: Allows exporting of flow documents (DOCX, RTF) to PDF.

* **Telerik.Documents.SpreadsheetStreaming.dll**: The main assembly for generating huge spreadsheet files using minimum resources.

* **Telerik.Windows.Documents.Spreadsheet.dll**: The main assembly for the spreadsheet processing. It is needed for processing XLSX, CSV, TXT documents.

* **Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll**: This assembly is needed for processing XLSX documents.
 
* **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll**: This assembly is needed for processing XLS documents.

* **Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.dll**: This assembly is needed for processing PDF documents.

* **Telerik.Windows.Documents.Fixed.dll**: This assembly is needed for processing PDF documents.

* **Telerik.Windows.Documents.CMapUtils.dll**: Provides a default implementation for getting the data of a predefined CMap table by a given name. The assembly is optional and you will need to include a reference to it only if you need to process documents with [CMap tables]({%slug radpdfprocessing-concepts-cmap-tables%}).

* **Telerik.Windows.Zip.dll**: Needed for working with zipped formats (DOCX, XLSX) and PDF. It is the main assembly of the ([Telerik Zip Library]({%slug radziplibrary-overview%})).

* **Telerik.Windows.Zip.Extensions.dll**: Extends **Telerik.Windows.Zip** assembly with additional helper methods ([Zip Extensions]({%slug radziplibrary-zipextensions%})).

You can find more information on working with the Telerik Document Processing libraries in the following articles:

* Words (text) processing
	
	* [Getting Started with RadWordsProcessing]({%slug radwordsprocessing-getting-started%})

	* [DOCX format provider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})

	* [HTML format provider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})

	* [RTF format provider]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})

	* [TXT format provider]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%})

* Spreadsheet processing

	* [Getting Started with RadSpreadProcessing]({%slug radspreadprocessing-getting-started%})

	* [XLSX format provider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
	
    * [XLS format provider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%})

	* [CSV format provider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})

	* [PDF format provider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})

	* [TXT format provider]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%})

* Fast spreadsheet generation
	
	* [Getting Started with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%})

* PDF processing

	* [Getting Started with RadPdfProcessing]({%slug radpdfprocessing-getting-started%})

	* [PDF format provider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})

* Working with ZIP files

    * [Getting started with RadZipLibrary]({%slug radziplibrary-gettingstarted%})

## See Also

* [System Requirements]({%slug installation-system-requirements%})
* [Installing on Your Computer]({%slug installation-installing-on-your-computer%})
* [First Steps in using Telerik Document Processing]({%slug getting-started-first-steps%})