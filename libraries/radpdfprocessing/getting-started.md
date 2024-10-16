---
title: Getting Started
page_title: Getting Started
slug: radpdfprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started



This article will get you started in using the __RadPdfProcessing__ library. 

>noteIf you still don't have **Telerik Document Processing** installed, check the [First Steps]({%slug getting-started-first-steps%}) topic to learn how you can obtain the packages through the different suites. 

## Assembly References

>The libraries support .NET 6/.NET 8/.NET 9. .NET Standard-compatible binaries are available as well. The assemblies for .NET Standard don't include 'Windows' in their names (e.g. **Telerik.Documents.Core.dll**). For more information check [**Cross-Platform Support**]({%slug radpdfprocessing-cross-platform%}) article.

In order to use the __RadPdfProcessing__ library in your project, you need to add references to the following assemblies:
<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Core.dll</b></td>
		<td><b>Telerik.Documents.Core.dll</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Fixed.dll</b></td>
		<td><b>Telerik.Documents.Fixed.dll</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Zip.dll</b></td>
		<td><b>Telerik.Zip.dll</b></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">To export images different than <b>Jpeg</b> and <b>Jpeg2000</b> or ImageQuality different than High you will need to add a reference to the following assembly:</td> 
    </tr>
	<tr>
	    <td><b>-</b></td>
		<td><b>Telerik.Documents.ImageUtils.dll</b>
			<br><sub><i>This assembly is not available in UI for Xamarin.</i></sub>
	</tr>
	<tr> 
		<td  colspan="2" >This assembly is required for the <a href="https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/convert-to-image/using-image-format-provider">Image Exporting</a> functionality. This is only available in the NET Standard version. </td>
	</tr>
	<tr>
		<td><b>-</b></td>
		<td><b>Telerik.Documents.Fixed.FormatProviders.Image.Skia</b></td>
	</tr>
		<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
		<tr>
        <td colspan="2">To enable the import of documents containing <a href="https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/cmaps">CMap Tables</a>, you will need to add a reference to:</td> 
    </tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.CMapUtils</b></td>
		<td><b>Telerik.Documents.CMapUtils</b></td>
	</tr>
	<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">To describe different colors, shapes and other properties, <b>RadPdfProcessing</b> depends on the listed below .NET assemblies, which you should also refer in your project:</td> 
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

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **SkiaSharp**. In order to use this assembly, you will need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

>note The **Telerik.Documents.Fixed.FormatProviders.Image.Skia** assembly depends on **SkiaSharp**. In order to use this assembly, you will need to add a reference to [SkiaSharp](https://www.nuget.org/packages/SkiaSharp/). The **SkiaSharp.NativeAssets.*** Nuget package is required as well. This package may differ according to the used platform. There are version for Windows, MacOs, Linux, WebAssembly, Android, iOS, and others.
 

## Creating a Document

[RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) is the root element in the library. It consists of [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) objects and instructions for annotations and destinations in the document. __Example 1__ shows how to create a document and add a page to it.
        

#### __[C#] Example 1: Create RadFixedDocument__

{{region cs-radpdfprocessing-getting-started_0}}
	RadFixedDocument document = new RadFixedDocument();
	RadFixedPage page = document.Pages.AddPage();
{{endregion}}



The page can then be edited through a [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) instance. __Example 2__ creates an editor and adds a [TextFragment]({%slug radpdfprocessing-model-textfragment%}) to the page object created in __Example 1__.
        

#### __[C#] Example 2: Add text__

{{region cs-radpdfprocessing-getting-started_1}}
	FixedContentEditor editor = new FixedContentEditor(page);
	editor.DrawText("Hello RadPdfProcessing!");
{{endregion}}



## Exporting to PDF

Exporting to PDF format can be achieved with the __PdfFormatProvider__ class. __Example 3__ shows how to export the __RadFixedDocument__  created in __Examples 1 and 2__ to a file.
        

#### __[C#] Example 3: Export to PDF__

{{region cs-radpdfprocessing-getting-started_2}}
	PdfFormatProvider provider = new PdfFormatProvider();
	using (Stream output = File.OpenWrite("Hello.pdf"))
	{
	    provider.Export(document, output);
	}
{{endregion}}



## See Also

 * [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
