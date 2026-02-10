---
title: Available NuGet Packages
page_title: Available NuGet Packages
description: Learn how you can use the Telerik Document Processing libraries through NuGet.
slug: available-nuget-packages
tags: nuget, document, processing, assembly, package
published: True
position: 6
---

# Available NuGet Packages 

Telerik provides NuGet packages with the assemblies for all five Document Processing libraries: __RadPdfProcessing__, __RadSpreadProcessing__, __RadSpreadStreamProcessing__, __RadWordsProcessing__, and __RadZipLibrary__. These UI-independent cross-platform libraries enable you to process and convert content in various formats and even work with archive files. We deliver these libraries as a complement to the Telerik UI component suites (UI for ASP.NET, Kendo UI, UI for WPF, UI for WinForms, UI for Xamarin, UI for Blazor), and you don't need to purchase an additional license to use them.

If your workflow relies on NuGet for package management, you can take advantage of the packages that we describe in this article. There is no need to download and install the Document Processing libraries by using other methods. 

#### This article contains the following sections:

* [Available NuGet Packages](#available-nuget-packages-1)
* [Get the NuGet Packages](#get-the-nuget-packages)


>important The Telerik Document Processing libraries are available in two versions:
>
>* A version for __.Net Framework 4.0__ or later
>
>* A version for __.Net Standard 2.0__
>
>Both versions are available as NuGet packages but with different names. The packages for __.NET Standard__ do __not__ contain the word __Windows__ in their name.

>caption Package lists to use with .NET Standard (left) and .NET Framework (right)

![installation-nuget-packages 000](images/installation-nuget-packages000.png)

>important The .NET Standard packages are compatible with any .NET version (e.g .NET 9), even if there are no packages explicitly available for the specific versions. The same applies to the .NET Framework packages.

>note As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

## Available NuGet Packages

The following tables represent the available NuGet packages for the Document Processing libraries. Each table shows the package names for both .NET Framework and {{site.dotnetversions}} for Windows, as well as .NET Standard 2.0 (Support for {{site.dotnetversions}}) versions. Although we offer them as an addition to the Telerik UI components, you can use them without any UI components.

### Core Packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Core</b></td>
		<td><b>Telerik.Documents.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">The main NuGet package for the Telerik Document Processing libraries. Required when you plan to use the library.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.CMapUtils</b></td>
		<td><b>Telerik.Documents.CMapUtils</b></td>
	</tr>
	<tr>
		<td colspan="2">Provides a default implementation for getting the data of a predefined CMap table by a given name. The package is optional and you will need to include a reference to it only if you need to process documents with <a href="{%slug radpdfprocessing-concepts-cmap-tables%}">CMap tables</a>.</td>
	</tr>
	<tr>
		<td><b><em>N/A</em></b></td>
		<td><b>Telerik.Documents.ImageUtils</b>
        <br><sub><i>This package is not available in UI for Xamarin.</i></sub></td>
	</tr>
	<tr>
		<td colspan="2">This package is required when exporting to <code>PDF</code> format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High. For more information check the <a href="{%slug radpdfprocessing-cross-platform%}">PdfProcessing`s Cross-Platform Support</a> article. The package also depends on SkiaSharp. In order to use it, you will need to add a reference to SkiaSharp.
        </td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.AIConnector</b></td>
		<td><b>Telerik.Documents.AIConnector</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is required for using the GenAI-powered Document Insights feature.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Core</b></td>
		<td><b>Telerik.Documents.AI.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is a dependency of Telerik.Documents.AIConnector.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.RAG</b></td>
		<td><b>Telerik.Documents.AI.RAG</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is a dependency of Telerik.Documents.AIConnector.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Tools.Core</b></td>
		<td><b>Telerik.Documents.AI.Tools.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">Core types and interfaces for the Agent Tools infrastructure.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Tools.Conversion.Core</b></td>
		<td><b>Telerik.Documents.AI.Tools.Conversion.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">Core types for document conversion operations.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.AgentTools.Conversion</b></td>
		<td><b>Telerik.Documents.AI.AgentTools.Conversion</b></td>
	</tr>
	<tr>
		<td colspan="2">Agent tool classes for document conversion and merging.</td>
	</tr>
</tbody>
</table>

### PdfProcessing packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Fixed</b></td>
		<td><b>Telerik.Documents.Fixed</b></td>
	</tr>
	<tr>
		<td colspan="2">The package is required when processing <code>PDF</code> documents.</td>
	</tr>
	<tr>
		<td><b><em>N/A</em></b></td>
		<td><b>Telerik.Documents.Fixed.FormatProviders.Image.Skia</b></td>
	</tr>
	<tr>
		<td colspan="2">The package is required for the cross-patform <a href="{%slug radspreadprocessing-cross-platform-text-measure%}#skiatextmeasurer">SkiaTextMeasurer</a>. The package depends on SkiaSharp. In order to use this package, you will need to add a reference to SkiaSharp. The SkiaSharp.NativeAssets.* NuGet package is required as well. This package may differ according to the used platform. There are versions for Windows, MacOS, Linux, WebAssembly, Android, iOS, and others.</td>
	</tr>
	<tr>
		<td><b><em>N/A</em></b></td>
		<td><b>Telerik.Text.Skia</b></td>
	</tr>
	<tr>
		<td colspan="2">The package is a dependency of Telerik.Documents.Fixed.FormatProviders.Image.Skia.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Fixed.FormatProviders.Ocr</b></td>
		<td><b>Telerik.Documents.Fixed.FormatProviders.Ocr</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is needed for the <a href="{%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}">Optical Character Recognition (OCR)</a> functionality. This reference is recommended to always be in the form of a NuGet package, as it will add the required Tesseract references and files automatically. Otherwise, a manual intervention might be required.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.TesseractOcr</b></td>
		<td><b>Telerik.Documents.TesseractOcr</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is needed for the <a href="{%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}">Optical Character Recognition (OCR)</a> functionality.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Tools.Fixed.Core</b></td>
		<td><b>Telerik.Documents.AI.Tools.Fixed.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">Repository and core types for PDF document processing.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.AgentTools.Fixed</b></td>
		<td><b>Telerik.Documents.AI.AgentTools.Fixed</b></td>
	</tr>
	<tr>
		<td colspan="2">Agent tool classes for PDF document operations.</td>
	</tr>
</tbody>
</table>

### WordsProcessing packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Flow</b></td>
		<td><b>Telerik.Documents.Flow</b></td>
	</tr>
	<tr>
		<td colspan="2">The package is part of the WordsProcessing library. Required for processing <code>HTML</code>, <code>DOCX</code>, <code>RTF</code>, and <code>TXT</code> documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.DrawingML</b></td>
		<td><b>Telerik.Documents.DrawingML</b></td>
	</tr>
	<tr>
		<td colspan="2">Part of the WordsProcessing library. It is needed for working with shapes inside the documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Flow.FormatProviders.Doc</b></td>
		<td><b>Telerik.Documents.Flow.FormatProviders.Doc</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is required for importing DOC and DOT documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Flow.FormatProviders.Pdf</b></td>
		<td><b>Telerik.Documents.Flow.FormatProviders.Pdf</b></td>
	</tr>
	<tr>
		<td colspan="2">Allows exporting of flow documents (<code>DOCX</code>, <code>DOC</code>, <code>DOT</code>, <code>RTF</code>, and <code>HTML</code>) to <code>PDF</code>.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Tools.Flow.Core</b></td>
		<td><b>Telerik.Documents.AI.Tools.Flow.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">Repository and core types for flow document processing.</td>
	</tr>
</tbody>
</table>

### SpreadProcessing packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet</b></td>
		<td><b>Telerik.Documents.Spreadsheet</b></td>
	</tr>
	<tr>
		<td colspan="2">The main package for generating and editing spreadsheets. It is needed for processing <code>XLSX</code>, <code>CSV</code>, and <code>TXT</code> documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.OpenXml</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is required for the import/export of <code>XLSX</code> documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.Xls</b></td>
	</tr>
	<tr>
		<td colspan="2">This package is required for the import/export of <code>XLS</code> documents.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.Pdf</b></td>
	</tr>
	<tr>
		<td colspan="2">Required for the export of RadSpreadProcessing documents to <code>PDF</code>.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.Json</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.Json</b></td>
	</tr>
	<tr>
		<td colspan="2">Required for the export of RadSpreadProcessing documents to <code>JSON</code> format. Supports export only. No JSON import.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.Tools.Spreadsheet.Core</b></td>
		<td><b>Telerik.Documents.AI.Tools.Spreadsheet.Core</b></td>
	</tr>
	<tr>
		<td colspan="2">Repository and core types for spreadsheet processing.</td>
	</tr>
	<tr>
		<td><b>Telerik.Documents.AI.AgentTools.Spreadsheet</b></td>
		<td><b>Telerik.Documents.AI.AgentTools.Spreadsheet</b></td>
	</tr>
	<tr>
		<td colspan="2">Agent tool classes for spreadsheet operations.</td>
	</tr>
</tbody>
</table>

### SpreadStreamProcessing packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.SpreadsheetStreaming</b></td>
		<td><b>Telerik.Documents.SpreadsheetStreaming</b></td>
	</tr>
	<tr>
		<td colspan="2">The main package for generating huge spreadsheet files while using minimum resources.</td>
	</tr>
</tbody>
</table>

### ZipLibrary packages

<table>
<thead>
	<tr>
		<th>.NET Framework and {{site.dotnetversions}} for Windows</th>
		<th>.NET Standard 2.0 (Support for {{site.dotnetversions}})</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Zip</b></td>
		<td><b>Telerik.Zip</b></td>
	</tr>
	<tr>
		<td colspan="2">It is the main package of the <a href="{%slug radziplibrary-overview%}">Telerik Zip Library</a>. It can be used as a standalone library as well.</td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Zip.Extensions</b></td>
		<td><b><em>N/A</em></b></td>
	</tr>
	<tr>
		<td colspan="2">Extends <b>Telerik.Windows.Zip</b> package with additional helper methods (<a href="{%slug radziplibrary-zipextensions%}">Zip Extensions</a>). The package provides methods for working with files and platform specific operations.</td>
	</tr>
</tbody>
</table>

## See Also

 * [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
 * [How to Obtain Telerik Document Processing Libraries for .NET Framework, .NET Standard, {{site.dotnetversions}}]({%slug distribute-telerik-document-processing-libraries-net-versions%})
 * [Resolving Namespace Conflicts in Telerik Document Processing Libraries]({%slug radspreadprocessing-resolving-namespace-conflicts%})
