---
title: Getting Started
page_title: Getting Started
description: Getting Started
slug: radspreadprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started


This article will get you started in using the __RadSpreadProcessing__ library. It contains the following sections:


* [Assembly References](#assembly-references)

* [Creating a Workbook](#creating-a-workbook)

* [Exporting](#exporting)

* [Using RadSpreadsheet](#using-radspreadsheet)

>noteIf you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

## Assembly References

>The libraries support .NET 4 and later. .NET Standard-compatible binaries are available as well. The assemblies for .NET Standard don't include 'Windows' in their names. (e.g. **Telerik.Documents.Core.dll**). For more information check [**Cross-Platform Support**]({%slug radspreadprocessing-cross-platform%}) article.

In order to use the model of the __RadSpreadProcessing__ library in your project, you need to add references to the following assemblies:

<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
		<th>Additional information</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Core.dll</b></td>
		<td><b>Telerik.Documents.Core.dll</b></td>
		<td></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Spreadsheet.dll</b></td>
		<td><b>Telerik.Documents.Spreadsheet.dll</b></td>
		<td></td>
	</tr>
	<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.dll</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.OpenXml.dll</b></td>
		<td>Required when exporting to XLSX.</td>
	</tr>
		<tr>
		<td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.Xls.dll</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.Xls.dll</b></td>
		<td>Required when exporting to XLS.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.dll</b></td>
		<td><b>Telerik.Documents.Spreadsheet.FormatProviders.Pdf.dll</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Fixed.dll</b></td>
		<td><b>Telerik.Documents.Fixed.dll</b></td>
		<td>Required when exporting to PDF.</td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Zip.dll</b></td>
		<td><b>Telerik.Zip.dll</b></td>
		<td>Required for working with XLSX, XLS and PDF files.</td>
	</tr>
	<tr>
	    <td><b>-</b></td>
		<td>	
			<b>Telerik.Documents.ImageUtils.dll</b>
			<br><sub><i>This assembly is not available in UI for Xamarin.</i></sub>
		</td>
		<td>*</td>
	</tr>
	<tr>
	    <td colspan="3">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="3">To describe different colors, shapes and other properties, RadSpreadProcessing depends on the listed below .NET assemblies, which you should also refer in your project:</td> 
    </tr>
    <tr>
	    <td><b>WindowsBase.dll</b></td>
		<td><b>-</b></td>
		<td></td>
	</tr>
	<tr>
	    <td><b>PresentationCore.dll</b></td>
		<td><b>-</b></td>
		<td></td>
	</tr>
	<tr>
	    <td><b>PresentationFramework.dll</b></td>
		<td><b>-</b></td>
		<td></td>
	</tr>
</tbody>
</table>

<sub> 
	\* _Needed when exporting to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High. The **Telerik.Documents.ImageUtils.dll** assembly depends on **ImageSharp** and **TiffLibrary.ImageSharpAdapter**. In order to use this assembly, you will need to add references to [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) and [TiffLibrary.ImageSharpAdapter](https://www.nuget.org/packages/TiffLibrary.ImageSharpAdapter/)._ 
</sub>

## Creating a Workbook

The document model allows you to instantiate a new [workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%}) and populate it with any data you want.


__Example 1__ shows how you can create a workbook and add a new worksheet to it.


#### __[C#] Example 1: Create Workbook__

{{region cs-radspreadprocessing-getting-started_0}}
	Workbook workbook = new Workbook();
	Worksheet worksheet = workbook.Worksheets.Add();
{{endregion}}



You can then create a [CellSelection]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%}) and set any value to the selected cells. __Example 2__ shows how you can create a cell and set a string value to it.


#### __[C#] Example 2: Set value of cell__

{{region cs-radspreadprocessing-getting-started_1}}
	CellSelection selection = worksheet.Cells[1, 1]; //B2 cell
	selection.SetValue("Hello RadSpreadProcessing");
{{endregion}}



## Exporting

The __RadSpreadProcessing__ library supports a variety of formats to which you can export the contents of a workbook. __Example 3__ shows how you can export the previously created workbook to Xlsx format.


#### __[C#] Example 3: Export to Xlsx__

{{region cs-radspreadprocessing-getting-started_2}}
	string fileName = "SampleFile.xlsx";
	
	IWorkbookFormatProvider formatProvider = new XlsxFormatProvider();
	
	using (Stream output = new FileStream(fileName, FileMode.Create))
	{
	    formatProvider.Export(workbook, output);
	}
{{endregion}}

>More information about the import and export functionalities of RadSpreadProcessing is available in the [Formats and Conversion section]({%slug radspreadprocessing-formats-and-conversion-general-information%}).

## Using RadSpreadsheet

__RadSpreadsheet__ is a UI control part of the Telerik UI for WPF/Silverlight suites. The document model explained in this section of the documentation and all its features are shared between the __RadSpreadProcessing__ library and __RadSpreadsheet__. [This help section](http://docs.telerik.com/devtools/wpf/controls/radspreadsheet/overview.html) contains information about all UI-specific features of __RadSpreadsheet__.


## See Also

 * [Using Telerik Document Processing First Steps]({%slug getting-started-first-steps%})
 * [Whats is a Workbook?]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
 * [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
 * [Get, Set and Clear Cell Properties]({%slug radspreadprocessing-working-with-cells-get-set-clear-properties%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
