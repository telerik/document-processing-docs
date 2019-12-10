---
title: Sheets Visibility
page_title: Sheets Visibility
description: Sheets Visibility
slug: radspreadprocessing-working-with-worksheets-sheets-visibility
tags: grouping
published: True
position: 16
---

# Sheets Visibility

The purpose of this article is to describe what is Sheets Visibility. It contains the following sections:

* [What is Sheets Visibility?](#what-is-hiding-sheets)

* [Hiding Sheets](#hiding-sheets)

* [Unhiding Sheets](#unhiding-sheets)

## What is Sheets Visibility?

Sheets Visibility is a mechanism to change the visibility of certain sheet, in order to be able to show and hide the relevant sheet(s);

## Hiding Sheets

There are two available options when hiding sheets. The first option is by setting the sheet **Visibility** property exposed both by the SheetCollection and WorksheetCollection classes. This property is of type *SheetVisibility*, an enum describing the types of visibility of the sheets:
* **Visible**: Visible sheet visibility.
* **Hidden**: Hidden sheet visibility.
* **VeryHidden**: Very hidden sheet visibility.  

> The VeryHidden can be set only from the provided API, while the Hidden state is designed for UI purposes.

#### **[C#] Example 1: Setting the SheetVisibility to Hidden/VeryHidden**

{{region cs-radspreadprocessing-working-with-worksheets-sheets-visibility_0}}

    // Change the visibility of the active sheet
    workbook.ActiveSheet.Visibility = SheetVisibility.Hidden;
    
    // OR change the visibility of the first sheet from the SheetCollection
    workbook.Sheets[0].Visibility = SheetVisibility.Hidden;
    
    // OR change the visibility of the first sheet from the WorksheetCollection
    workbook.Worksheets[0].Visibility = SheetVisibility.Hidden;
{{endregion}}

The other option is to use the **Hide** method exposed by both the SheetCollection and WorksheetCollection classes. The Hide method provides several overloads and supports hiding a sheet by passing:  
* a sheet at the specified index; 
* a specified sheet;
* an active sheet. (available on SheetCollection only)

#### **[C#] Example 2: Hiding sheets using the Hide method**

{{region cs-radspreadprocessing-working-with-worksheets-sheets-visibility_1}}

    Worksheet worksheet = workbook.Worksheets.First();
    // Hiding the first sheet from the WorksheetCollection
    workbook.Worksheets.Hide(worksheet);
{{endregion}}


## Unhiding Sheets

As with hiding, unhiding can be done both through setting the Sheet Visibility property, or by using the **Unhide** method exposed by the SheetCollection and WorksheetCollection classes.

The following code snippets exemplify the two approaches.

#### **[C#] Example 3: Setting the SheetVisibility to Visible**

{{region cs-radspreadprocessing-working-with-worksheets-sheets-visibility_2}}

    // Change the visibility of the first sheet from the SheetCollection
    workbook.Sheets[0].Visibility = SheetVisibility.Visible;
{{endregion}}

The **Unhide** method provides two overloads and supports unhiding a sheet by:  
* a sheet at the specified index.  
* a specified sheet.

#### **[C#] Example 4: Unhiding sheets using the Unhide method**

{{region cs-radspreadprocessing-working-with-worksheets-sheets-visibility_3}}

    // Unhiding sheet at the specified index
	workbook.Worksheets.Unhide(0);
	
	// OR unhiding the first sheet from the WorksheetCollection
    workbook.Worksheets.Unhide(workbook.Worksheets.First());
{{endregion}}

## See Also

* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
* [Add, Remove and Reorder Worksheets]({%slug radspreadprocessing-working-with-worksheets-add-remove-worksheets%})
* [Rename a Worksheet]({%slug radspreadprocessing-working-with-worksheets-rename-worksheet%})
* [Iterate Through Worksheets]({%slug radspreadprocessing-working-with-worksheets-iterate-through-worksheets%})
* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
* [Copy a Worksheet]({%slug radspreadprocessing-working-with-worksheets-copy-worksheet%})

