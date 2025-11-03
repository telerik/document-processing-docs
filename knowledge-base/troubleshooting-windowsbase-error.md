---
title: Could not load type from assembly 'WindowsBase' error in .NET Core project
description: Check how to resolve errors related to a dependency to the WindowsBase assembly when running project with Telerik Document Processing.
type: troubleshooting
page_title: TypeLoadException is thrown trying to run .NET Core project with Telerik Document Processing
slug: troubleshooting-windowsbase-error
position: 0
tags: processing, document, worbook, pdf, error, exception, windows, xamarin, blazor, maui, .net core, net5, net6
ticketid: 1563636
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>N/A</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Telerik Document Processing</td>
		</tr>
		<tr>
			<td>Used with</td>
			<td>UI for Blazor, UI for Xamarin, UI for WinUI, UI for ASP.NET Core, UI for .NET MAUI</td>
		</tr>
	</tbody>
</table>


## Description

This exception is thrown when the packages for .NET Framework are used in a project targeting .NET Core.

## Error Message

- System.TypeLoadException: Could not load type 'System.Windows.Size' from assembly 'WindowsBase'
- System.TypeLoadException: Could not load type of field 'Telerik.Windows.Documents.Spreadsheet.Expressions.DataStructures.CellReferenceRangeExpressionCache:cellReferenceRangeExpressionCache' (1) due to: Could not resolve type with token 010000da from typeref (expected class 'System.Windows.IWeakEventListener' in assembly 'WindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35') assembly:WindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35 type:System.Windows.IWeakEventListener member:(null)
- Could not load file or assembly 'WindowsBase, Version=5.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'. The located assembly's manifest definition does not match the assembly reference. 


## Solution

Remove all the binaries or NuGet packages related to Telerik Document Processing and make sure you add them again in their .NET Standard-Compatible version that does not include the word 'Windows'.

**Example:**

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
</tbody>
</table>

>Although the word 'Windows' is removed from the assembly names for .NET Core, the namespaces still contain it.

## See Also

- [PdfProcessing Dependencies]({%slug radpdfprocessing-getting-started%}#assembly-references)
- [WordsProcessing Dependencies]({%slug radwordsprocessing-getting-started%}#assembly-references)
- [SpreadProcessing Dependencies]({%slug radspreadprocessing-getting-started%}#assembly-references)
- [SpreadStreamProcessing Dependencies]({%slug radspreadstreamprocessing-getting-started%}#assembly-references)
- [ZipLibrary Dependencies]({%slug radziplibrary-gettingstarted%}#assembly-references)

