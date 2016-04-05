---
title: Rows
page_title: Rows
description: Rows
slug: radspreadstreamprocessing-model-rows
tags: row
published: True
position: 4
---

# Rows

This article will help you get familiar with the concept of a row and its features.

## What is a Row

Rows in the terms of a spreadsheet document are groups of cells that are on the same horizontal line. Each row is identified by a number. For example, the first row has an index 1, the second one – 2 and the last one – 1048576. 


## IRowExporter Interface

In **RadSpreadStreamProcessing**, the row is represented by the **IRowExporter** interface [API REF]. It defines several methods allowing you to add cells to a row or change its appearance.

A concrete instance of IRowExporter could be created through the CreateRowExporter() method of [IWorksheetExporter]({slug radspreadstreamprocessing-worksheet}). **Example 1** demonstrates how you can add a row to a worksheet.

#### **[C#] Example 1: Create IRowExporter**


{{region [ADD NAME]}}

	using (IRowExporter row = worksheet.CreateRowExporter())
	{
	}
{{endregion}}

>IRowExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.


In order to customize the way a row appears, you could use one of the following methods:

* **SetWidthInPixels()**: Sets the row width in pixels.

* **SetWidthInCharacters()**: Sets the row width in characters count.

* **SetOutlineLevel()**: Sets the row outline level. The outline level is used when grouping rows.

* **SetHidden()**: Sets a boolean value that indicates whether the row should be hidden or not.


#### **[C#] Example 2: Set properties to IRowExporter**

{{region [ADD NAME]}}

	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
		column.SetWidthInPixels(100);
	}
{{endregion}}

# See Also

* Rows
* Cells
* Worksheets