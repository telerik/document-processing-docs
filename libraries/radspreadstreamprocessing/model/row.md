---
title: Rows
page_title: Rows
slug: radspreadstreamprocessing-model-rows
tags: row
published: True
position: 4
---

# Rows

This article will help you get familiar with the concept of a row and its features.

## What is a Row

Rows in the terms of a spreadsheet document are groups of cells that are on the same horizontal line. Each row is identified by a number. For example, the first row has an index 1, the second one – 2 and the last one – 1048576. 


## IRowExporter and IRowImporter Interfaces

In **RadSpreadStreamProcessing**, a row could be exported through the [**IRowExporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IRowExporter.html). It defines several methods allowing you to add cells to a row or change its appearance.

To read a row and its properties, you should use [**IRowImporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IRowImporter.html). 

### Using IRowExporter

A concrete instance of IRowExporter could be created through the CreateRowExporter() method of [IWorksheetExporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 1** demonstrates how you can add a row to a worksheet.

#### **[C#] Example 1: Create IRowExporter**


{{region cs-radspreadstreamprocessing-model-rows_0}}
	using (IRowExporter row = worksheet.CreateRowExporter())
	{
	}
{{endregion}}

>IRowExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

In order to customize the way a row appears, you could use one of the following methods:

* **SetHeightInPixels()**: Sets the row height in pixels.

* **SetHeightInPoints()**: Sets the row height in points.

* **SetOutlineLevel()**: Sets the row outline level. The outline level is used when grouping rows. To group several rows, they should have the same OutlineLevel and if you would like to create nested grouping, you can use different levels for the outer and for the nested rows. 

* **SetHidden()**: Sets a boolean value that indicates whether the row should be hidden or not.


#### **[C#] Example 2: Set properties to IRowExporter**

{{region cs-radspreadstreamprocessing-model-rows_1}}
	using (IRowExporter row = worksheet.CreateRowExporter())
	{
	    row.SetHeightInPixels(200);
	}
{{endregion}}

\* Due to the specifics of the library, RadSpreadStreamProcessing doesn't support auto fitting the height of the rows. You can find information on how you can calculate the height needed for specific content in the [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%}) topic.

### Skip Rows

The rows in a document are exported one by one from top to bottom starting from the one with index 0. In order to export a row with a bigger index, you will need to export all the previous rows or skip them.

In some cases you may need to skip several rows and start filling the data in the next one. The [**IWorksheetExporter**]({%slug  radspreadstreamprocessing-model-worksheet%}) interface declares a method that allows you to implement such scenario. **Example 3** shows how to skip 5 rows.

#### **[C#] Example 3: Skip rows**

{{region cs-radspreadstreamprocessing-model-rows_2}}
	worksheet.SkipRows(5);
	using (IRowExporter row = worksheet.CreateRowExporter())
	{
	    row.SetHidden(true); // The sixth row will be hidden.
	}
{{endregion}}

## Read a Row

### Using IRowImporter

A concrete instance of IRowImporter could be obtained through the Rows collection of [IWorksheetImporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 4** demonstrates how you can start reading a row from a worksheet.

#### **[C#] Example 4: Create IRowImporter**

{{region cs-radspreadstreamprocessing-model-rows_3}}

	foreach (IRowImporter rowImporter in worksheetImporter.Rows)
	{
	}
{{endregion}}

>IRowImporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.

The IRowImporter interface exposes the following properties to allow you access its data:

* **RowIndex**: Gets the index of the row in the worksheet.
* **OutlineLevel**: Gets the outline level (used when grouping rows).
* **IsCustomHeight**: Gets a value indicating whether the height applied to the current row is a custom one.
* **HeightInPixels** and **HeightInPoints**: Gets the height of the row in pixels and in points, respectively.
* **IsHidden**: Gets a value determining whether the row is hidden.
* **Cells**: Collection of ICellImporter objects, enabling you to iterate the cells inside the worksheet using.



## See Also

* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
