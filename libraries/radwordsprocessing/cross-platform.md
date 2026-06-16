---
title: Cross-Platform Support
description: Learn about the .NET Standard and .NET Core support in RadWordsProcessing and how to use the cross-platform NuGet packages.
page_title: Cross-Platform Support
slug: radwordsprocessing-cross-platform
tags: cross, platform, word, processing, dotnet, standard, nuget, blazor, maui, document
platforms: core, blazor, winui, maui
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of packages built against .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can get the packages through the **UI for ASP.NET Core**, **UI for Blazor**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the suites mentioned previously.

## Package References

To use the model of the **RadWordsProcessing** library in your cross-platform project, add references to the following **.NET Standard** packages:

<table>
<thead>
	<tr>
		<th>.NET Standard-compatible</th>
		<th>Additional information</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Documents.Core</b></td>
		<td></td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Flow</b></td>
		<td></td>
	</tr>
    <tr>
		<td><b>Telerik.Documents.Flow.FormatProviders.Doc</b></td>
		<td>Required when importing from DOC or DOT files.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Flow.FormatProviders.Pdf</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Fixed</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
		<td>	
			<b>Telerik.Documents.ImageUtils</b>
		</td>
        <td>Required when exporting to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High.</td>
	</tr>
</tbody>
</table>

>note The **Telerik.Documents.ImageUtils** package depends on **SkiaSharp**. To use this package, you need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

> For .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (for example, **Telerik.Windows.Documents.Core**).

## Limitations in .NET Standard

### Additional Settings Required

Some features require additional settings:

* To **export to PDF** format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), set the **FontsProvider** property inside the **FixedExtensibilityManager**. For more information, see the FixedExtensibilityManager in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).
* To **export to PDF** format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, set the **JpegImageConverter** property inside the **FixedExtensibilityManager**. For more information, see the FixedExtensibilityManager in the [PdfProcessing Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

## Limitations in Windows Server

### Additional Settings Required

When importing HTML with images that are not included in the file and need to be loaded:

* Ensure **.NET 4.8** is installed.
* Or subscribe to the [LoadImageFromUri](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/settings#loadimagefromuri-and-loadstylesheetfromuri-events) event.

## See Also

* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Section]({%slug radwordsprocessing-model-section%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Run]({%slug radwordsprocessing-model-run%})
