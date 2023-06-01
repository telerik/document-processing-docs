---
title: Cross-Platform Support
page_title: Cross-Platform Support
slug: radwordsprocessing-cross-platform
tags: cross,platform
platforms: core, blazor, xamarin, winui, maui
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor**, **UI for Xamarin**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadWordsProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

<table>
<thead>
	<tr>
		<th>.NET Standard-compatible</th>
		<th>Additional information</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Documents.Core.dll</b></td>
		<td></td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Flow.dll</b></td>
		<td></td>
	</tr>
	<tr>
		<td><b>Telerik.Zip.dll</b></td>
		<td>Required when working with DOCX, DOC, DOT or PDF.</td>
	</tr>
    <tr>
		<td><b>Telerik.Documents.Flow.FormatProviders.Doc.dll</b></td>
		<td>Required when importing from DOC or DOT files.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Flow.FormatProviders.Pdf.dll</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Documents.Fixed.dll</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
		<td>	
			<b>Telerik.Documents.ImageUtils.dll</b>
			<br><sub><i>This assembly is not available in UI for Xamarin.</i></sub>
		</td>
        <td>Required when exporting to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High.</td>
	</tr>
</tbody>
</table>

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **SkiaSharp**. In order to use this assembly, you will need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)
 
## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:
* In order to **export to PDF** format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), the **FontsProvider** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).
* In order to **export to PDF** format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

## See Also

 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Run]({%slug radwordsprocessing-model-run%})
