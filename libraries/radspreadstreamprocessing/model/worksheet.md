---
title: Worksheet
page_title: Worksheet
description: Worksheet
slug: radspreadstreamprocessing-worksheet
tags: worksheet
published: True
position: 2
---

# Worksheet

This article will help you get familiar with the concept of a worksheet and its features.

## What is a Worksheet

A worksheet is a collection of cells organized in rows and columns. It is the working surface you interact with to enter data. Each worksheet contains 1048576 rows and 16384 columns and serves as a giant table that allows you to organize information. Typically, a workbook contains several worksheets with related content and only one of the worksheets is active at a time.



## IWorksheetExporter Interface

In **RadSpreadStreamProcessing**, the worksheet is represented by the **IWorksheetExporter** interface [API REF]. This interface defines members that allows you create and skip rows or columns as well as merge cells. 

A concrete instance of IWorksheetExporter could be created through the CreateWorksheetExporter() method of [IWorkbookExporter]({slug radspreadstreamprocessing-workbook}). **Example 1** demonstrates how you can add a worksheet to a workbook.

#### **[C#] Example 1: Create IWorksheetExporter**

{{region [ADD NAME]}}

	using (IWorksheetExporter worksheet = workbook.CreateWorksheetExporter("My sheet"))
	{
		// Fill the worksheet with data and set the desired properties
	}
{{endregion}}

>IWorksheetExporter inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a *using* statement.