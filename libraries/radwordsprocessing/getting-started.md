---
title: Getting Started
page_title: Getting Started
slug: radwordsprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started

This tutorial will take you through the creation of a sample application that uses RadWordsProcessing.

* [Package References](#package-references)

* [Creating RadFlowDocument from Code](#creating-radflowdocument-from-code)

* [Exporting RadFlowDocument to Docx](#exporting-radflowdocument-to-docx)

>noteIf you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Package References

>The libraries support {{site.dotnetversions}}. .NET Standard-compatible packages are available as well. The packages for .NET Standard don't include 'Windows' in their names. (e.g. **Telerik.Documents.Core**). For more information check [**Cross-Platform Support**]({%slug radwordsprocessing-cross-platform%}) article.

Here is a list of packages that contain the __RadWordsProcessing__ functionality and need to be referenced in your project:

<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Core</b></td>
		<td><b>Telerik.Documents.Core</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Flow</b></td>
		<td><b>Telerik.Documents.Flow</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.DrawingML</b></td>
		<td><b>Telerik.Documents.DrawingML</b></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">If you need to import DOC or DOT files, you will need to refer the following packages:</td> 
    </tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Flow.FormatProviders.Doc</b></td>
		<td><b>Telerik.Documents.Flow.FormatProviders.Doc</b></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">If you need to export documents to PDF format, you will need to refer the following packages:</td> 
    </tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Flow.FormatProviders.Pdf</b></td>
		<td><b>Telerik.Documents.Flow.FormatProviders.Pdf</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Fixed</b></td>
		<td><b>Telerik.Documents.Fixed</b></td>
	</tr>
	<tr>
	    <td><b>-</b></td>
		<td><b>Telerik.Documents.ImageUtils*</b>
		<br><sub><i>This package is not available in UI for Xamarin.</i></sub>
	   </td>		
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">To describe different colors, shapes and other properties, <b>RadWordsProcessing</b> depends on the listed below .NET assemblies, which you should also refer in your project:</td> 
    </tr>
    <tr>
	    <td><b>WindowsBase.dll</b></td>
		<td><b>-</b></td>
	</tr>
	<tr>
	    <td><b>PresentationCore.dll</b></td>
		<td><b>-</b></td>
	</tr>
	<tr>
	    <td><b>PresentationFramework.dll</b></td>
		<td><b>-</b></td>
	</tr>
</tbody>
</table>

<sub> 
	\* _The Telerik.Documents.ImageUtils package is needed when exporting to PDF format a document containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High._
</sub>

>note The **Telerik.Documents.ImageUtils** package depends on **SkiaSharp**. In order to use this package, you will need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

## Creating RadFlowDocument from Code

Here is how to create a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and insert some text content with the help of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
        

#### __[C#] Example 1: Create RadFlowDocument programmatically__

<snippet id='codeblock-b'/>

You need to add using directive to the following namespaces:
        

* Telerik.Windows.Documents.Flow.Model
* Telerik.Windows.Documents.Flow.Model.Editing
            

## Exporting RadFlowDocument to Docx

Exporting the document to Docx file can be achieved with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Here is how to create a provider instance and save a document with it:
        

#### __[C#] Example 2: Export RadFlowDocument to Docx__

<snippet id='codeblock-c'/>

Detailed information about the supported formats and features can be found in the [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}) article. For more complete examples head to the [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%}) section of the library.
        

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [Model]({%slug radwordsprocessing-model%})
* [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%})
* [WordsProcessing Basic Usage Demo](https://demos.telerik.com/document-processing/wordsprocessing)


