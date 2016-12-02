---
title: Worksheet
page_title: Worksheet
description: Worksheet
slug: radspreadstreamprocessing-model-worksheet
tags: worksheet
published: True
position: 2
---

# Worksheet

This article will help you get familiar with the concept of a worksheet and its features.

* [What is a Worksheet](#what-is-a-worksheet)

* [IWorksheetExporter Interface](#iworksheetexporter-interface)

* [Using IWorksheetExporter](#using-iworksheetexporter)

 
## What is a Worksheet

A worksheet is a collection of cells organized in rows and columns. It is the working surface you interact with to enter data. Each worksheet contains up to 1048576 rows and 16384 columns and serves as a giant table that allows you to organize information. Typically, a workbook contains several worksheets with related content and only one of the worksheets is active at a time.



## IWorksheetExporter Interface

In **RadSpreadStreamProcessing**, a worksheet could be exported through the [**IWorksheetExporter** interface](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Documents_SpreadsheetStreaming_IWorksheetExporter.htm). This interface defines members that allows you create and skip rows or columns as well as merge cells. 

### Using IWorksheetExporter

A concrete instance of IWorksheetExporter could be created through the CreateWorksheetExporter() method of [IWorkbookExporter]({%slug radspreadstreamprocessing-model-workbook%}). **Example 1** demonstrates how you can add a worksheet to a workbook.

#### **[C#] Example 1: Create IWorksheetExporter**

{{region cs-radspreadstreamprocessing-model-worksheet_0}}
	using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("My sheet"))
	{
	    // Fill the worksheet with data and set the desired properties
	}
{{endregion}}

>IWorksheetExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. Otherwise, the content won't be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

>tip A worksheet must contain at least one row. Otherwise, an exception is thrown.

# See Also 

* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Columns]({%slug radspreadstreamprocessing-model-columns%})
* [Rows]({%slug radspreadstreamprocessing-model-rows%})
* [Cells]({%slug radspreadstreamprocessing-model-cells%})