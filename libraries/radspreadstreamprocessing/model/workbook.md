---
title: Workbook
description: Learn about the workbook model in RadSpreadStreamProcessing, the top-level container for worksheets in a spreadsheet document.
page_title: Workbook
slug: radspreadstreamprocessing-model-workbook
tags: workbook, spread, stream, processing, spreadsheet, model, worksheets, streaming, export, container
published: True
position: 1
---

# Workbook

The workbook is the primary document that you use to manipulate and store data. The following sections explain how to export and import workbooks with `RadSpreadStreamProcessing`.

## What Is a Workbook

The workbook is the primary document that you use to manipulate and store data. The workbook can also be described as a collection of worksheets, where a worksheet is in turn defined as a collection of cells organized in rows and columns. Each workbook contains at least one worksheet and often holds several sheets with related information.

The workbook is designed to hold together multiple worksheets to allow efficient organization and consolidation of data. Typically, a workbook contains worksheets with related data.


## IWorkbookExporter and IWorkbookImporter Interfaces

In `RadSpreadStreamProcessing`, the workbook is represented by the [`IWorkbookExporter`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorkbookExporter.html) and [`IWorkbookImporter`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorkbookImporter.html) interfaces. These interfaces define members for adding [worksheets]({%slug radspreadstreamprocessing-model-worksheet%}), parsing them, and accessing the cell styles of the workbook.

`IWorkbookExporter` is responsible for exporting a workbook. Due to the specifics of the different file formats, different concrete instances of this interface take care of the creation and export of a document. The same applies when importing with `IWorkbookImporter`.

## Using IWorkbookExporter

You can get an instance of `IWorkbookExporter` through the `CreateWorkbookExporter()` method of [`SpreadExporter`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadExporter.html). The first parameter of the `CreateWorkbookExporter()` method specifies the file format that is used to save the document and the second one represents the stream in which the document is saved.

The code from **Example 1** creates an empty workbook and exports it to an XLSX file.

**Example 1: Create an XLSX workbook exporter and add an empty worksheet with one row**

<snippet id='codeblock-dlu'/>

### Append Content to an Existing Document

The `CreateWorkbookExporter` method creates a new workbook which overrides the content of the document contained in the stream if it is not empty. You can change that by using the second overload of the `CreateWorkbookExporter` method and pass the export mode explicitly. Pass the export mode through the last parameter of the method (`exportMode`) which is of type `SpreadExportMode`. `SpreadExportMode` is an enum that exposes two constants—`Create` and `Append`. The default export mode is `Create`, which overrides the stream content. If you set the export mode to `Append`, an existing workbook from the stream opens if there is any content in it. Then you can append the new content to the already existing document.

**Example 2: Open an XLSX stream in append mode with CreateWorkbookExporter**

<snippet id='codeblock-dlv'/>

>`IWorkbookExporter` inherits from [`IDisposable`](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Ensure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

In the spreadsheet documents, the names of the sheets are unique. If you try to add a sheet with a name that is already present in the workbook, you get an `ArgumentException`. This is where the `GetSheetInfos()` method comes in handy. The method returns information about the sheets currently present in the workbook (imported or added). You can use it to check whether a particular sheet name is available (not already present) when appending a worksheet to an existing workbook. **Example 3** demonstrates how to use it.

**Example 3: Read existing sheet names with IWorkbookExporter.GetSheetInfos()**

<snippet id='codeblock-dlw'/>

The CSV format does not have the concept of multiple sheets. Invoking `GetSheetInfos()` for a CSV document returns an empty collection.

>You can find a runnable example showing how to append a worksheet to an existing workbook in the [SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/SpreadStreamProcessing/AppendWorksheetToExistingWorkbook) on GitHub.

## Using IWorkbookImporter to Read a File

The `IWorkbookImporter` interface is the entry point for reading a document and allows you to iterate the worksheet importers. You can get an instance of `IWorkbookImporter` through the `CreateWorkbookImporter()` method of [`SpreadImporter`](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadExporter.html). The first parameter of the `CreateWorkbookImporter()` method specifies the file format of the document to import and the second one represents the stream with the file data. For more information on how to read the data, see the [Import]({%slug radspreadstreamprocessing-import%}) topic.


## See Also

* [Import]({%slug radspreadstreamprocessing-import%})
* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
* [SpreadCellStyle API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadCellStyle.html)
