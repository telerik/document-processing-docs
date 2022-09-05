---
title: Columns
page_title: Columns
slug: radspreadstreamprocessing-model-columns
tags: column
published: True
position: 3
---

# Columns

This article will help you get familiar with the concept of a column and its features.

## What is a Column

A column is a group of cells that are vertically stacked and appear on the same vertical line. Columns are identified by a letter or a combination of letters. For example, the first column is called A, the second one – B and the last column is XFD.

## IColumnExporter and IColumnImporter Interfaces

In **RadSpreadStreamProcessing**, a column could be exported through the [**IColumnExporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IColumnExporter.html). It defines several methods allowing you to change the appearance of a column.

To read a column and its properties, you should use the [**IColumnImporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IColumnImporter.html). 

### Using IColumnExporter

A concrete instance of IColumnExporter could be created through the CreateColumnExporter() method of [IWorksheetExporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 1** demonstrates how you can add a column to a worksheet.

#### **[C#] Example 1: Create IColumnExporter**


{{region cs-radspreadstreamprocessing-model-columns_0}}
	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
	}
{{endregion}}

>IColumnExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

In order to customize the way a column appears, you could use one of the following methods:

* **SetWidthInPixels()**: Sets the column width in pixels.

* **SetWidthInCharacters()**: Sets the column width in characters count.

* **SetOutlineLevel()**: Sets the column outline level. The outline level is used when grouping columns. To group several columns, they should have the same OutlineLevel and if you would like to create nested grouping, you can use different levels for the outer and for the nested columns. 

* **SetHidden()**: Sets a boolean value that indicates whether the column should be hidden or not.


#### **[C#] Example 2: Set properties to IColumnExporter**

{{region cs-radspreadstreamprocessing-model-columns_1}}
	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
	    column.SetWidthInPixels(100);
	}
{{endregion}}

\* Due to the specifics of the library, RadSpreadStreamProcessing doesn't support auto fitting the width of the columns. You can find information on how you can calculate the width needed for specific content in the [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%}) topic.

### Skip Columns

The columns in a document are exported one by one from left to right starting from the one with index 0. In order to export a column with a bigger index, you will need to export all the previous columns or skip them.

In some cases you may need to skip several columns and start filling the data in the next one. The [**IWorksheetExporter**]({%slug radspreadstreamprocessing-model-worksheet%}) interface declares a method that allows you to implement such scenario. **Example 3** shows how to skip 5 columns.

#### **[C#] Example 3: Skip columns**

{{region cs-radspreadstreamprocessing-model-columns_2}}
	worksheet.SkipColumns(5);
	using (IColumnExporter column = worksheet.CreateColumnExporter())
	{
	    column.SetHidden(true); // The sixth (F) column will be hidden.
	}
{{endregion}}

## Read a Column

### Using IColumnImporter

A concrete instance of IColumnImporter could be obtained through the Columns collection of [IWorksheetImporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 4** demonstrates how you can start reading a row from a worksheet.

#### **[C#] Example 4: Create IColumnImporter**

{{region cs-radspreadstreamprocessing-model-columns_3}}

	foreach (IColumnImporter column in worksheetImporter.Columns)
	{
	}
{{endregion}}


The IColumnImporter interface exposes the following properties:

* **FromIndex**: Gets the first index of the column range with same properties.
* **ToIndex**: Gets the last index of the column range with same properties.
* **OutlineLevel**: Gets the outline level (used when grouping columns).
* **IsCustomWidth**: Gets a value indicating whether the width applied to the current column is a custom one.
* **WidthInPixels** and **WidthInCharacters**: Gets the width of the column in pixels and in characters, respectively.
* **IsHidden**: Gets a value determining whether the row is hidden.

## See Also

* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
