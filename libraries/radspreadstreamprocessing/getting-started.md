---
title: Getting Started
page_title: Getting Started
description: Getting Started
slug: radspreadstreamprocessing-getting-started
tags: getting started
published: True
position: 2
---

# Getting Started

This article will get you started in using the **RadSpreadStreamProcessing** library. It contains the following sections:

* [Assembly References](#assembly-references)

* [Supported Formats](#supported-formats)

## Assembly References

In order to use RadSpreadStreamProcessing in your project, you will need to add a reference to:

* **Telerik.Documents.SpreadsheetStreaming**

## Supported Formats

With RadSpreadStreamProcessing you can create XLSX and CSV files. All you have to do is to specify the desired format when creating a workbook with the CreateWorkbookExporter() method. **Example 1** demonstrates how this could be achieved.

#### **Example 1: Specify export format**

{{region [ADD NAME]}}

	IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream)     
{{endregion}}


## Create a Spreadsheet Document

This section will explain how a document could be created. If you need more detailed information about the classes that represent the document elements, you can check the articles from the [Model section]({%slug %}).

