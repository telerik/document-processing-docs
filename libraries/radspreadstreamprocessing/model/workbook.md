---
title: Workbook
page_title: Workbook
description: Workbook
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

In **RadSpreadStreamProcessing**, the workbook is represented by the [**IWorkbookExporter** interface](docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_IWorkbookExporter.htm). This interface defines members for adding [worksheets]({%slug radspreadstreamprocessing-model-worksheet%}) and accessing the cell styles of the workbook. 

**IWorkbookExporter** is responsible for exporting a workbook. Due to the specifics of the different file formats, different concrete instances of this interface take care about the creation and export of a document. 

## Using IWorkbookExporter

You can obtain an instance of IWorkbookExporter through the **CreateWorkbookExporter()** method of [SpreadExporter](docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadExporter.htm). The first parameter of the CreateWorkbookExporter() method specifies the file format that will be used to save the document and the second one represents the stream in which the document will be saved. 

The code from **Example 1** creates an empty workbook and exports it to an XLSX file.

#### **[C#] Example 1: Create IWorkbookExporter**

{{region radspreadstreamprocessing-model-workbook_0}}
	
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

>IWorkbookExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.


# See Also

* [Worksheets]({%slug radspreadstreamprocessing-model-worksheet%})
* [SpreadCellStyle API Reference](docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_SpreadCellStyle.htm)
