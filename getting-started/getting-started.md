---
title: Overview
description: Get started with Telerik Document Processing, a set of cross-platform libraries for importing, exporting, and working with documents and archive files.
page_title: Overview
slug: getting-started
tags: telerik, document, processing, pdf, spreadsheet, nuget, libraries, installation
published: True
position: 0
---

# Getting Started with Telerik Document Processing

This article explains how to install **Telerik Document Processing**, choose the correct package family, and add the required NuGet packages for common .NET application types. Telerik Document Processing includes cross-platform libraries for importing, exporting, and working with different [supported document formats]({%slug introduction%}#supported-formats) and archive files. The required references come with the installation files of several Telerik suites and are also available in the internal builds of the same Telerik suites. Learn which products include Telerik Document Processing in the [Telerik product bundles](https://www.telerik.com/purchase.aspx?filter=web).

>tip More information about the suites that include Telerik Document Processing and how to install them is available in the [Telerik suite installation guide]({%slug installation-installing-on-your-computer%}).

## Install the Base Packages

For new development, install Telerik Document Processing as NuGet packages. As of Q2 2026, the recommended source is NuGet.org, so you usually do not need to configure an additional feed. For the full installation options, see the [NuGet package installation guide]({%slug installation-nuget-packages%}).

Start by adding the package references to the project file of the app that will generate or process documents. Place the references inside an `ItemGroup` in the `.csproj` file.

```xml
<Project Sdk="Microsoft.NET.Sdk">
	<PropertyGroup>
		<TargetFramework>net8.0</TargetFramework>
		<TelerikDocumentProcessingVersion>2026.1.210</TelerikDocumentProcessingVersion>
	</PropertyGroup>

	<ItemGroup>
		<PackageReference Include="Telerik.Licensing" Version="1.*" />
		<PackageReference Include="Telerik.Documents.Core" Version="$(TelerikDocumentProcessingVersion)" />
	</ItemGroup>
</Project>
```

>important Install **Telerik.Licensing** in the same project where you add the Telerik Document Processing packages. Keep all `Telerik.Documents.*` or all `Telerik.Windows.Documents.*` references on the same release version. Understand the difference between the [cross-platform and Windows package namespaces]({%slug telerik-windows-documents-vs-telerik-documents-namespace%}).

You can find the full package inventory in the [available NuGet packages reference]({%slug available-nuget-packages%}).

## Choose the Correct Package Family

Use the following matrix to choose the correct package family for your application type. Each row identifies the recommended package namespace, the minimum starting packages, and the versioning rule for that scenario.

| Scenario | Package family | Required starting packages | Version guidance | Notes |
| --- | --- | --- | --- | --- |
| Blazor Web App, Blazor Server, ASP.NET Core, console apps, services, Linux/macOS workloads | `Telerik.Documents.*` | `Telerik.Licensing`<br>`Telerik.Documents.Core`<br>One or more library packages such as `Telerik.Documents.Fixed`, `Telerik.Documents.Flow`, `Telerik.Documents.Spreadsheet`, `Telerik.Documents.SpreadsheetStreaming` | Use the same Telerik Document Processing version for every `Telerik.Documents.*` package, for example `2026.1.210` | Recommended for all cross-platform and modern .NET scenarios. |
| Blazor WebAssembly | `Telerik.Documents.*` | `Telerik.Licensing`<br>`Telerik.Documents.Core`<br>The library packages you need, for example `Telerik.Documents.Fixed` or `Telerik.Documents.Flow` | Use the same Telerik Document Processing version for every `Telerik.Documents.*` package | Do not use `Telerik.Windows.Documents.*` packages in WebAssembly projects. |
| .NET Framework or Windows-only desktop apps that already rely on Windows compatibility | `Telerik.Windows.Documents.*` | `Telerik.Licensing`<br>`Telerik.Windows.Documents.Core`<br>One or more library packages such as `Telerik.Windows.Documents.Fixed`, `Telerik.Windows.Documents.Flow`, `Telerik.Windows.Documents.Spreadsheet`, `Telerik.Windows.Documents.SpreadsheetStreaming` | Use the same Telerik Document Processing version for every `Telerik.Windows.Documents.*` package | Use this family for Windows-only projects. |

### Package Selection by Library

Start with `Telerik.Licensing` and the matching `Core` package, then add the library-specific package for the document type you work with.

| You want to... | Cross-platform / Blazor / modern .NET | .NET Framework / Windows |
| --- | --- | --- |
| Work with PDF documents | `Telerik.Documents.Fixed` | `Telerik.Windows.Documents.Fixed` |
| Work with Word documents (`DOCX`, `RTF`, `HTML`, `TXT`) | `Telerik.Documents.Flow` | `Telerik.Windows.Documents.Flow` |
| Export Word documents to PDF | `Telerik.Documents.Flow.FormatProviders.Pdf` | `Telerik.Windows.Documents.Flow.FormatProviders.Pdf` |
| Work with spreadsheets (`XLSX`, `CSV`, `TXT`, PDF export) | `Telerik.Documents.Spreadsheet` | `Telerik.Windows.Documents.Spreadsheet` |
| Generate large spreadsheet files with streaming APIs | `Telerik.Documents.SpreadsheetStreaming` | `Telerik.Windows.Documents.SpreadsheetStreaming` |
| Work with ZIP files separately | `Telerik.Zip` | `Telerik.Windows.Zip` |

>note If you are unsure whether to use `Telerik.Documents.*` or `Telerik.Windows.Documents.*`, use the cross-platform `Telerik.Documents.*` packages unless your project is Windows-only and depends on the Windows-specific package family. For more details, see the [NuGet package inventory]({%slug available-nuget-packages%}).

## Install Packages for Common Scenarios

Choose the example that matches your application type and the Telerik Document Processing library you want to use.

### Blazor or ASP.NET Core: Create DOCX and Export to PDF

Use these packages when a Blazor Web App, Blazor Server app, or ASP.NET Core app creates Word documents and exports them to PDF.

Run these .NET CLI commands to add the required packages:

```bash
dotnet add package Telerik.Licensing
dotnet add package Telerik.Documents.Core --version 2026.1.210
dotnet add package Telerik.Documents.Flow --version 2026.1.210
dotnet add package Telerik.Documents.Flow.FormatProviders.Pdf --version 2026.1.210
```

Use these Package Manager Console commands if you install packages from Visual Studio:

```powershell
Install-Package Telerik.Licensing
Install-Package Telerik.Documents.Core -Version 2026.1.210
Install-Package Telerik.Documents.Flow -Version 2026.1.210
Install-Package Telerik.Documents.Flow.FormatProviders.Pdf -Version 2026.1.210
```

Add these `PackageReference` entries directly to the project file if you manage dependencies in the `.csproj` file:

```xml
<ItemGroup>
	<PackageReference Include="Telerik.Licensing" Version="1.*" />
	<PackageReference Include="Telerik.Documents.Core" Version="2026.1.210" />
	<PackageReference Include="Telerik.Documents.Flow" Version="2026.1.210" />
	<PackageReference Include="Telerik.Documents.Flow.FormatProviders.Pdf" Version="2026.1.210" />
</ItemGroup>
```

### Blazor WebAssembly: PDF Processing

Use these packages when a Blazor WebAssembly app imports, exports, or edits PDF documents.

Run these .NET CLI commands to add the base PDF processing packages:

```bash
dotnet add package Telerik.Licensing
dotnet add package Telerik.Documents.Core --version 2026.1.210
dotnet add package Telerik.Documents.Fixed --version 2026.1.210
```

If the Blazor WebAssembly app exports PDF content that contains non-JPEG images or uses image quality different from `High`, also add the image-processing dependencies described in the [cross-platform PDF image support guide]({%slug radpdfprocessing-cross-platform-images%}). For Blazor WebAssembly, this includes `Telerik.Documents.ImageUtils`, `SkiaSharp.Views.Blazor`, and `wasm-tools`.

### .NET Framework: Create DOCX and Export to PDF

Use these packages when a .NET Framework app creates Word documents and exports them to PDF.

Run these Package Manager Console commands to add the required Windows-specific packages:

```powershell
Install-Package Telerik.Licensing
Install-Package Telerik.Windows.Documents.Core -Version 2026.1.210
Install-Package Telerik.Windows.Documents.Flow -Version 2026.1.210
Install-Package Telerik.Windows.Documents.Flow.FormatProviders.Pdf -Version 2026.1.210
```

Add these `PackageReference` entries directly to the project file if the .NET Framework project uses `PackageReference`:

```xml
<ItemGroup>
	<PackageReference Include="Telerik.Licensing" Version="1.*" />
	<PackageReference Include="Telerik.Windows.Documents.Core" Version="2026.1.210" />
	<PackageReference Include="Telerik.Windows.Documents.Flow" Version="2026.1.210" />
	<PackageReference Include="Telerik.Windows.Documents.Flow.FormatProviders.Pdf" Version="2026.1.210" />
</ItemGroup>
```

## Common Setup Errors

Use this table to diagnose the most common Telerik Document Processing installation and package-selection problems.

| Problem | Cause | Resolution |
| --- | --- | --- |
| The project restores the wrong Telerik package family | The project uses `Telerik.Windows.Documents.*` in Blazor, ASP.NET Core, or another cross-platform project | Replace those references with the matching `Telerik.Documents.*` packages. |
| The app builds, but licensing is not recognized | `Telerik.Licensing` is missing from the app project that loads Telerik Document Processing | Add `<PackageReference Include="Telerik.Licensing" Version="1.*" />` to that project's `.csproj` file. |
| NuGet cannot find Telerik packages on the Telerik feed | The Telerik feed is not configured or the credentials are stale | Prefer NuGet.org for current releases, or reconfigure the Telerik feed as shown in the [NuGet package installation guide]({%slug installation-nuget-packages%}). |
| PDF export with images fails in Blazor WebAssembly or another cross-platform app | Image-processing dependencies are missing | Add `Telerik.Documents.ImageUtils` and the required SkiaSharp platform packages. See the [cross-platform PDF image support guide]({%slug radpdfprocessing-cross-platform-images%}). |
| Package restore succeeds, but runtime or compile-time conflicts appear | Telerik package versions are mixed across releases | Keep all Telerik Document Processing packages on the same release version. |

## Next Steps by Scenario

Choose the next article based on the document type or application type you are working with.

* **Blazor, ASP.NET Core, console, services**: Start with the [Document Processing first steps tutorial]({%slug getting-started-first-steps%}) and use the `Telerik.Documents.*` package family.

* **PDF-specific scenarios**: See the [RadPdfProcessing getting-started guide]({%slug radpdfprocessing-getting-started%}).

* **Word-processing scenarios**: See the [RadWordsProcessing getting-started guide]({%slug radwordsprocessing-getting-started%}).

* **Spreadsheet scenarios**: See the [RadSpreadProcessing getting-started guide]({%slug radspreadprocessing-getting-started%}) or the [RadSpreadStreamProcessing getting-started guide]({%slug radspreadstreamprocessing-getting-started%}).

## Getting Started Resources by Library

Use the following library-specific articles when you need API-level guidance after installation.

### Words (Text) Processing

* [Start developing with RadWordsProcessing]({%slug radwordsprocessing-getting-started%})

* [Export DOCX documents with DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})

* [Export HTML with HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})

* [Export RTF with RtfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})

* [Export plain text with TxtFormatProvider]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%})

### Spreadsheet Processing

* [Start developing with RadSpreadProcessing]({%slug radspreadprocessing-getting-started%})

* [Export Excel workbooks with XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})

* [Export legacy Excel workbooks with XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%})

* [Export CSV files with CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})

* [Export spreadsheet data to a DataTable]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})

* [Export spreadsheets to PDF with PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})

* [Export spreadsheet data to plain text]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%})

### Fast Spreadsheet Generation

* [Generate large spreadsheets with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%})

### PDF Processing

* [Start developing with RadPdfProcessing]({%slug radpdfprocessing-getting-started%})

* [Import and export PDF files with PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})

### Working with ZIP Files

* [Start working with ZIP archives using RadZipLibrary]({%slug radziplibrary-gettingstarted%})

## See Also

* [Review Document Processing system requirements]({%slug installation-system-requirements%})
* [Install Telerik Document Processing on your computer]({%slug installation-installing-on-your-computer%})
* [Complete the Document Processing first steps tutorial]({%slug getting-started-first-steps%})
* [Review Document Processing library distribution across .NET versions]({%slug distribute-telerik-document-processing-libraries-net-versions%})
* [Configure NuGet package installation]({%slug installation-nuget-packages%})
* [Use the Telerik CLI for Document Processing]({%slug dpl-telerik-cli%})
* [Compare the Windows and cross-platform package namespaces]({%slug telerik-windows-documents-vs-telerik-documents-namespace%})
