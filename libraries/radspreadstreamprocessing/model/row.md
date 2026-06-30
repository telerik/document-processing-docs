---
title: Rows
description: Learn about rows in RadSpreadStreamProcessing, including how to define and configure row properties.
page_title: Rows
slug: radspreadstreamprocessing-model-rows
tags: rows, spread, stream, processing, spreadsheet, model, properties, height, worksheet, export
published: True
position: 4
---

# Rows

A row is a group of cells that are on the same horizontal line. The following sections explain how to export and import rows with `RadSpreadStreamProcessing`.

## What Is a Row

Rows in the terms of a spreadsheet document are groups of cells that are on the same horizontal line. Each row is identified by a number. For example, the first row has an index 1, the second one is 2, and the last one is 1048576.


## IRowExporter and IRowImporter Interfaces

In `RadSpreadStreamProcessing`, a row can be exported through the [`IRowExporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IRowExporter.html). It defines several methods that allow you to add cells to a row or change its appearance.

To read a row and its properties, use the [`IRowImporter` interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IRowImporter.html).

### Using IRowExporter

You can create a concrete instance of `IRowExporter` through the `CreateRowExporter()` method of [IWorksheetExporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 1** demonstrates how to add a row to a worksheet.

**Example 1: Create IRowExporter**


<snippet id='libraries-spreadstream-model-row-1'/>

>`IRowExporter` inherits from [`IDisposable`](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

To customize the way a row appears, use one of the following methods:

| Method | Description |
|---|---|
| `SetHeightInPixels()` | Sets the row height in pixels. |
| `SetHeightInPoints()` | Sets the row height in points. |
| `SetOutlineLevel()` | Sets the row outline level, used when grouping rows. Rows with the same `OutlineLevel` are grouped together. Use different levels for nested grouping. |
| `SetHidden()` | Sets a boolean value indicating whether the row is hidden. |


**Example 2: Set Properties to IRowExporter**

<snippet id='libraries-spreadstream-model-row-2'/>

\* Due to the specifics of the library, `RadSpreadStreamProcessing` does not support auto fitting the height of the rows. You can find information on how to calculate the height needed for specific content in the [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%}) topic.

### Skip Rows

The rows in a document are exported one by one from top to bottom starting from the one with index 0. To export a row with a bigger index, you need to export all the previous rows or skip them.

In some cases you may need to skip several rows and start filling the data in the next one. The [`IWorksheetExporter`]({%slug  radspreadstreamprocessing-model-worksheet%}) interface declares a method that allows you to implement such a scenario. **Example 3** shows how to skip 5 rows.

**Example 3: Skip Rows**

<snippet id='libraries-spreadstream-model-row-3'/>

## Read a Row

### Using IRowImporter

You can get a concrete instance of `IRowImporter` through the `Rows` collection of [IWorksheetImporter]({%slug radspreadstreamprocessing-model-worksheet%}). **Example 4** demonstrates how to start reading a row from a worksheet.

**Example 4: Create IRowImporter**

<snippet id='libraries-spreadstream-model-row-4'/>


The `IRowImporter` interface exposes the following properties to allow you to access its data:

| Property | Description |
|---|---|
| `RowIndex` | Gets the index of the row in the worksheet. |
| `OutlineLevel` | Gets the outline level (used when grouping rows). |
| `IsCustomHeight` | Gets a value indicating whether the height applied to the current row is a custom one. |
| `HeightInPixels` / `HeightInPoints` | Gets the height of the row in pixels and in points, respectively. |
| `IsHidden` | Gets a value determining whether the row is hidden. |
| `Cells` | Collection of `ICellImporter` objects, enabling you to iterate the cells inside the row. |



## See Also

* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
