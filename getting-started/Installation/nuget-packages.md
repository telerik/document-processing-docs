---
title: NuGet packages
page_title: NuGet packages
description: Adding references via NuGet Packages
slug: installation-nuget-packages
tags: nuget, document, processing
published: True
position: 6
---


# NuGet Packages 

Telerik Document Processing provides the __RadPdfProcessing__, __RadSpreadProcessing__, __RadSpreadStreamProcessing__, __RadWordsProcessing__, and __RadZipLibrary__ UI-independent and cross-platform libraries which enable you to process content between different formats and work with archive files. Currently, the libraries are not shipped independently, and they are part of the products that provide UI components (UI for ASP.NET, Kendo UI, UI for WPF, UI for WinForms, UI for Xamarin, UI for Blazor).   
 


>important There are two versions of each assembly in the library, for __.Net Framework 4.0 or later__, and for __.Net Standard 2.0__. Both versions are available as NuGet packages. The name of the assemblies for both versions is different. The assemblies for .NET Standard do not contain the word __Windows__ in their name. 

![installation-nuget-packages 000](images/installation-nuget-packages000.png)

## Packages for .NET Framework

There are other Telerik NuGet Packages for the UI suites. The following are the ones for the Document Processing Library (No UI is required to use the functionality in the bellow libraries).     

* __Telerik.Windows.Documents.Core:__ The main NuGet package for the Telerik Document Processing libraries. Required when you plan to use the library.
* __Telerik.Windows.Documents.Fixed:__ The package is required when processing `PDF` documents.
* __Telerik.Windows.Documents.CMapUtils:__ Provides a default implementation for getting the data of a predefined CMap table by a given name.
* __Telerik.Windows.Documents.Flow:__ The package is part of the Word Processing Library. Required for processing `HTML`, `DOCX`, `RTF`, and `TXT` documents.
* __Telerik.Windows.Documents.Flow.FormatProviders.Pdf:__ The package for exporting flow documents, such as `DOCX` and `RTF`, to `PDF`.
* __Telerik.Windows.Documents.Spreadsheet:__ The main package for generating spreadsheets.
* __Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml:__ This package is required for the import/export of `XLSX` documents. 
* __Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls:__ This package is required for the import/export of `XLS` documents. 
* __Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf:__ Required for the export of RadSpreadProcessing documents to `PDF`.
* __Telerik.Windows.Documents.SpreadsheetStreaming:__ The main package for generating huge spreadsheet files while using minimum resources.
* __Telerik.Windows.Zip:__ The package is required when working with zipped formats, such as `DOCX` and `XLSX`. It can be used as a standalone library as well. 
* __Telerik.Windows.Zip.Extensions:__ The package provides methods for working with files and platform specific operations. 

## Packages for .NET Standard 2.0

Telerik Document Processing supports [.NET Standard 2.0](https://github.com/dotnet/standard/blob/master/docs/versions/netstandard2.0.md). The available packages are: 

* __Telerik.Documents.Core:__ The main NuGet package from the Telerik Document Processing libraries. Required when you plan to use the library.

* __Telerik.Documents.Fixed:__ The package is required when processing `PDF` documents.
* __Telerik.Documents.ImageUtils:__ This package is required when exporting to `PDF` format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High. For more information check the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.
* __Telerik.Documents.CMapUtils:__ Provides a default implementation for getting the data of a predefined CMap table by a given name.

* __Telerik.Documents.Flow:__ The package is part of the Words Processing Library. Required for processing `HTML`, `DOCX`, `RTF`, and `TXT` documents.
* __Telerik.Documents.Flow.FormatProviders.Pdf:__ The package for exporting flow documents, such as `DOCX` and `RTF`, to PDF.

* __Telerik.Documents.Spreadsheet:__ The main package for generating and editing spreadsheets.
* __Telerik.Documents.Spreadsheet.FormatProviders.OpenXml:__ This package is required for the import/export of `XLSX documents.
* __Telerik.Documents.Spreadsheet.FormatProviders.Xls:__ This package is required for the import/export of `XLS` documents.
* __Telerik.Documents.Spreadsheet.FormatProviders.Pdf:__ Required for the export of RadSpreadProcessing documents to `PDF`.

* __Telerik.Documents.SpreadsheetStreaming:__ The main package for generating huge spreadsheet files while using minimum resources.

* __Telerik.Zip:__ The package is required when working with zipped formats, such as `DOCX` and `XLSX`. It can be used as a standalone library as well. 


## Get the NuGet Packages

You need to add the Telerik package server (https://nuget.telerik.com/nuget) to the package sources in Visual Studio. 

1\. First open the Options window:

![installation-nuget-packages 001](images/installation-nuget-packages001.png)

2\. Add new source and add the server to the Source field:

![installation-nuget-packages 002](images/installation-nuget-packages002.png)


3\. When the __Package Source__ is selected you will be prompted for a user name and a password. Use the credentials for your Telerik Account

![installation-nuget-packages 003](images/installation-nuget-packages003.png)

4\. Then you can just select and install the desired NuGet packages.

![installation-nuget-packages 004](images/installation-nuget-packages004.png)

 



