---
title: Columns
description: Learn about columns in RadSpreadStreamProcessing, including how to define and configure column properties.
page_title: Columns
slug: radspreadstreamprocessing-model-columns
tags: columns, spread, stream, processing, spreadsheet, model, properties, width, worksheet, export
published: True
position: 3
---

# Columns

A column is a group of cells that are vertically stacked and appear on the same vertical line. The following sections explain how to export and import columns with `RadSpreadStreamProcessing`.

## What Is a Column

A column is a group of cells that are vertically stacked and appear on the same vertical line. Columns are identified by a letter or a combination of letters. For example, the first column is called A, the second one is B, and the last column is XFD.

## IColumnExporter and IColumnImporter Interfaces

In `RadSpreadStreamProcessing`, a column can be exported through the [`IColumnExporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IColumnExporter.html). It defines several methods that allow you to change the appearance of a column.

To read a column and its properties, use the [`IColumnImporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IColumnImporter.html).

### Using IColumnExporter

You can create a concrete instance of `IColumnExporter` through the `CreateColumnExporter()` method of [IWorksheetExporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 1** demonstrates how to add a column to a worksheet.

**Example 1: Create an IColumnExporter for the next worksheet column**


<snippet id='codeblock-dlm'/>

>`IColumnExporter` inherits from [`IDisposable`](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

To customize the way a column appears, use one of the following methods:

| Method | Description |
|---|---|
| `SetWidthInPixels()` | Sets the column width in pixels. |
| `SetWidthInCharacters()` | Sets the column width in characters count. |
| `SetOutlineLevel()` | Sets the column outline level, used when grouping columns. Columns with the same `OutlineLevel` are grouped together. Use different levels for nested grouping. |
| `SetHidden()` | Sets a boolean value indicating whether the column is hidden. |


**Example 2: Set the exported column width to 100 pixels**

<snippet id='codeblock-dln'/>

\* Due to the specifics of the library, `RadSpreadStreamProcessing` does not support auto fitting the width of the columns. You can find information on how to calculate the width needed for specific content in the [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%}) topic.

### Skip Columns

The columns in a document are exported one by one from left to right starting from the one with index 0. To export a column with a bigger index, you need to export all the previous columns or skip them.

In some cases you may need to skip several columns and start filling the data in the next one. The [`IWorksheetExporter`]({%slug radspreadstreamprocessing-model-worksheet%}) interface declares a method that allows you to implement such a scenario. **Example 3** shows how to skip 5 columns.

**Example 3: Skip five columns and hide the sixth column**

<snippet id='codeblock-dlo'/>

## Read a Column

### Using IColumnImporter

You can get a concrete instance of `IColumnImporter` through the `Columns` collection of [IWorksheetImporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 4** demonstrates how to start reading a column from a worksheet.

**Example 4: Iterate imported worksheet columns with IColumnImporter**

<snippet id='codeblock-dlp'/>


The `IColumnImporter` interface exposes the following properties:

| Property | Description |
|---|---|
| `FromIndex` | Gets the first index of the column range with the same properties. |
| `ToIndex` | Gets the last index of the column range with the same properties. |
| `OutlineLevel` | Gets the outline level (used when grouping columns). |
| `IsCustomWidth` | Gets a value indicating whether the width applied to the current column is a custom one. |
| `WidthInPixels` / `WidthInCharacters` | Gets the width of the column in pixels and in characters, respectively. |
| `IsHidden` | Gets a value determining whether the column is hidden. |

## See Also

* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
