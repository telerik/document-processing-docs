---
title: Copy a Worksheet
page_title: Copy a Worksheet
description: Shows how you can copy a worksheet between workbooks using SpreadProcessing.
slug: radspreadprocessing-working-with-worksheets-copy-worksheet
tags: copy,worksheet
published: True
position: 5
---

# Copy a Worksheet


There are scenarios in which you may need to copy a specific Worksheet and apply a modification to it. For those cases, in Q1 2016 we introduced API in the __Worksheet__ class allowing you to copy a sheet to the same or another __Workbook__.


The __CopyFrom(Worksheet source)__ method of a Worksheet will copy the passed _source_ sheet into the one the method is called for. This will clone all content and formatting from the source.


__Example 1__ illustrates how to copy a specific worksheet from a source Workbook into a new sheet in the desired target workbook.


#### __[C#] Example 1: Copy worksheet__
{{region cs-radspreadprocessing-working-with-worksheets-copy-worksheet_0}}
	Worksheet clonedSheet = target.Worksheets.Add();
	clonedSheet.CopyFrom(source.Sheets[0] as Worksheet);
{{endregion}}


#### __[VB.NET] Example 1: Copy worksheet__

{{region vb-radspreadprocessing-working-with-worksheets-copy-worksheet_2}}
	Dim clonedSheet As Worksheet = target.Worksheets.Add()
	clonedSheet.CopyFrom(TryCast(source.Sheets(0), Worksheet))
{{endregion}}


>If the sheet that you're copying is in a document where a [DocumentTheme]({%slug radspreadprocessing-features-styling-document-themes%}) has been applied, the theme will not be copied. Themes are information preserved in the __Workbook__ and you may need to transfer them additionally.


Copying a worksheet can be done both in a newly created worksheet and an existing one. If you are copying the content into an existing worksheet, all previously available content in the target will be removed and replaced with the copied one. The sole exception of this is the [Name]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%}) of the sheet which will not be transferred.

__Example 2__ demonstrates a slightly more complex scenario in which a sheet is copied into an existing workbook. If the workbook contains a worksheet with the same name, the sheet to clone is copied into it. Otherwise, a new worksheet is created and its Name is copied from the source document.  
        

#### __[C#] Example 2: Copy to existing workbook__
{{region cs-radspreadprocessing-working-with-worksheets-copy-worksheet_1}}
	bool containsSameName = false;
	
	foreach (var worksheet in targetWorkbook.Worksheets)
	{
	    if (worksheet.Name == sheetToClone.Name)
	    {
	        containsSameName = true;
	        break;
	    }
	}
	
	if (containsSameName)
	{
	    targetWorkbook.Worksheets[sheetToClone.Name].CopyFrom(sheetToClone);
	}
	else
	{
	    Worksheet clonedSheet = targetWorkbook.Worksheets.Add();
	    clonedSheet.CopyFrom(sheetToClone);
	    clonedSheet.Name = sheetToClone.Name;
	}
{{endregion}}


#### __[VB.NET] Example 2: Copy to existing workbook__

{{region vb-radspreadprocessing-working-with-worksheets-copy-worksheet_3}}
	Dim containsSameName As Boolean = False
	
	For Each worksheet As var In targetWorkbook.Worksheets
	    If worksheet.Name = sheetToClone.Name Then
	        containsSameName = True
	        Exit For
	    End If
	Next
	
	If containsSameName Then
	    targetWorkbook.Worksheets(sheetToClone.Name).CopyFrom(sheetToClone)
	Else
	    Dim clonedSheet As Worksheet = targetWorkbook.Worksheets.Add()
	    clonedSheet.CopyFrom(sheetToClone)
	    clonedSheet.Name = sheetToClone.Name
	End If
{{endregion}}


## See Also

* [Iterate through Worksheets]({%slug radspreadprocessing-working-with-worksheets-iterate-through-worksheets%})
* [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%})
* [Add and Remove Worksheets]({%slug radspreadprocessing-working-with-worksheets-add-remove-worksheets%})
