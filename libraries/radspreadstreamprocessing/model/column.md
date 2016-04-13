---
title: Columns
page_title: Columns
description: Columns
slug: radspreadstreamprocessing-columns
tags: column
published: True
position: 3
---

# Columns

This article will help you get familiar with the concept of a column and its features.

## What is a Column

A column is a group of cells that are vertically stacked and appear on the same vertical line. Columns are identified by a letter or a combination of letters. For example, the first column is called A, the second one – B and the last column is XFD.

## IColumnExporter Interface

In **RadSpreadStreamProcessing**, the column is represented by the **IColumnExporter** interface [API REF]. It defines several methods allowing you to change the appearance of a column.

A concrete instance of IColumnExporter could be created through the CreateColumnExporter() method of [IWorksheetExporter]({slug radspreadstreamprocessing-worksheet}). **Example 1** demonstrates how you can add a column to a worksheet.

#### **[C#] Example 1: Create IColumnExporter**


{{region [ADD NAME]}}

	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
	}
{{endregion}}

>IColumnExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.


In order to customize the way a column appears, you could use one of the following methods:

* **SetWidthInPixels()**: Sets the column width in pixels.

* **SetWidthInCharacters()**: Sets the column width in characters count.

* **SetOutlineLevel()**: Sets the column outline level. The outline level is used when grouping columns.

* **SetHidden()**: Sets a boolean value that indicates whether the column should be hidden or not.


#### **[C#] Example 2: Set properties to IColumnExporter**

{{region [ADD NAME]}}

	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
		column.SetWidthInPixels(100);
	}
{{endregion}}

In some cases you may need to skip several columns and start filling the data in the next one. The [**IWorksheetExporter**]({%slug %}) interface declares a method that allows you to implement such scenario. **Example 3** shows how to skip 5 columns.

#### **[C#] Example 3: Skip columns**

{{region [ADD NAME]}}

	worksheet.SkipColumns(5);
	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
	    column.SetHidden(true); // The sixth (F) column will be hidden.
	}
{{endregion}}

# See Also

* [Rows]({%slug %})
* [Cells]({%slug %})
* [Worksheets]({%slug %})