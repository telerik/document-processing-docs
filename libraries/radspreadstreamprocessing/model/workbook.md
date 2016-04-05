---
title: Workbook
page_title: Workbook
description: Workbook
slug: radspreadstreamprocessing-workbook
tags: workbook
published: True
position: 1
---

# Workbook

This article will help you get familiar with the concept of a workbook and its features.

## What is a Workbook?

The workbook is the primary document that you use to retrieve, manipulate and store data. The workbook can also be described as a collection of worksheets, where a worksheet is in turn defined as a collection of cells organized in rows and columns. Each workbook contains, at least, one worksheet and often holds several sheets with related information.

The workbook is designed to hold together multiple worksheets in order to allow efficient organization and consolidation of data. Typically, a workbook has a single theme, responsible for its look, and contains worksheets with related data. 


## IWorkbookExporter Interface

In **RadSpreadStreamProcessing**, the workbook is represented by the **IWorkbookExporter** interface [API REF]. This interface defines members for managing the worksheets and saving the workbook. In addition, each implementation of IWorkbookExporter allows you to access the cell styles of the workbook.


**IWorkbookExporter** represents a workbook that will be exported to one of the supported file formats. A concrete instance of this interface could be created through the CreateWorkbookExporter() method of SpreadExporter [API REF]. The code from **Example 1** will create an empty workbook and export it to an XLSX file.

#### **[C#] Example 1: Create IWorkbookExporter**

{{region [ADD NAME]}}

	using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
	{
		// Fill the workbook
	}
{{endregion}}

>IWorkbookExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.

Through the IWorkbookExporter instance you could obtain the styles of the workbook. **Example 2** uses the workbook, created in **Example 1** to get the "Bad" style. 

#### **[C#] Example 2: Getting a cell style** 

{{region [ADD NAME]}}

	SpreadCellStyle style = workbook.CellStyles.GetByName("Bad");
{{endregion}}

# See Also

* Worksheets
* SpreadCellStyle API Reference [API REF]
