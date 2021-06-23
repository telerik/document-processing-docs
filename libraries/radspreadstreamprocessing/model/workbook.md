---
title: Workbook
page_title: Workbook
slug: radspreadstreamprocessing-model-workbook
tags: workbook
published: True
position: 1
---

# Workbook

This article will help you get familiar with the concept of a workbook and its features.

* [What is a Workbook](#what-is-a-workbook)

* [IWorkbookExporter Interface](#iworkbookexporter-interface)

* [Using IWorkbookExporter](#using-iworkbookexporter)


## What is a Workbook?

The workbook is the primary document that you use to manipulate and store data. The workbook can also be described as a collection of worksheets, where a worksheet is in turn defined as a collection of cells organized in rows and columns. Each workbook contains, at least, one worksheet and often holds several sheets with related information.

The workbook is designed to hold together multiple worksheets in order to allow efficient organization and consolidation of data. Typically, a workbook contains worksheets with related data. 


## IWorkbookExporter Interface

In **RadSpreadStreamProcessing**, the workbook is represented by the [**IWorkbookExporter** interface](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.IWorkbookExporter.html). This interface defines members for adding [worksheets]({%slug radspreadstreamprocessing-model-worksheet%}) and accessing the cell styles of the workbook. 

**IWorkbookExporter** is responsible for exporting a workbook. Due to the specifics of the different file formats, different concrete instances of this interface take care about the creation and export of a document. 

## Using IWorkbookExporter

You can obtain an instance of IWorkbookExporter through the **CreateWorkbookExporter()** method of [SpreadExporter](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadExporter.html). The first parameter of the CreateWorkbookExporter() method specifies the file format that will be used to save the document and the second one represents the stream in which the document will be saved. 

The code from **Example 1** creates an empty workbook and exports it to an XLSX file.

#### **[C#] Example 1: Create IWorkbookExporter**

{{region cs-radspreadstreamprocessing-model-workbook_0}}
	using (FileStream stream = File.OpenWrite("sample.xlsx"))
	{
	    using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
	    {
	        using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("First sheet"))
	        {
	            using (IRowExporter row = worksheet.CreateRowExporter())
	            {
	            }
	        }
	    }
	}
{{endregion}}

### Append Content to an Existing Document 

The __CreateWorkbookExporter__ method creates a new workbook which overrides the content of the document contained in the stream if it's not empty. You can change that by using the second overload of the CreateWorkbookExporter method and pass the export mode explicitly. You can do that via the last parameter of the method (exportMode) which is of type __SpreadExportMode__. SpreadExportMode is an enum that exposes two constants - __Create__ and __Append__. The default export mode is Create, which overrides the stream's content. If you set the export mode to __Append__, an existing workbook from the stream will be opened if there is any content in it. Then you can append the new content to the already existing document.

#### **[C#] Example 2: Create IWorkbookExporter and append the content from the stream**

{{region cs-radspreadstreamprocessing-model-workbook_1}}
	IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream, SpreadExportMode.Append);
{{endregion}}

>IWorkbookExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

In the spreadsheet documents, the names of the sheets are unique. If you try to add a sheet with a name that is already present in the workbook, you will get an **ArgumentException**. This is where the **GetSheetInfos()** method comes in handy. The method returns information about the sheets currently present in the workbook (imported or added). It could be used to check whether a particular sheet name is available (not already present) when appending a worksheet to an existing workbook. **Example 3** demonstrates how you can use it.

#### **[C#] Example 3: Using IWorkbookExporter.GetSheetInfos()**

{{region cs-radspreadstreamprocessing-model-workbook_2}}

	using (IWorkbookExporter workbookExporter = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
	{
	    IEnumerable<SheetInfo> sheetInfos = workbookExporter.GetSheetInfos();
	    string firstNameSheet = sheetInfos.First().Name;
	}
{{endregion}}

Since the CSV format doesn't have the concept for multiple sheets, invoking GetSheetInfos() for a CSV document returns an empty collection.

>You can find a runnable example showing how to append a worksheet to an existing workbook in the [SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/SpreadStreamProcessing/AppendWorksheetToExistingWorkbook) on GitHub.

## See Also

* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
* [SpreadCellStyle API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Documents.SpreadsheetStreaming.SpreadCellStyle.html)
