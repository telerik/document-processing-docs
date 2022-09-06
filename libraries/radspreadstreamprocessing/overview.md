---
title: Overview
page_title: Overview
slug: radspreadstreamprocessing-overview
tags: overview
published: True
position: 0
---

# Overview

This article briefly explains the specifics of **RadSpreadStreamProcessing** - what is spread streaming, how it works compared to the RadSpreadProcessing library, when to use it, and what are its key features.

If you want to skip this introductory article and directly start using SpreadStreamProcessing, take a look at the **[Getting Started with RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-getting-started%})** help topic.

>noteIf you still don't have **Telerik Document Processing installed**, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites with Telerik controls.

![](images/SpreadStreamProcessing-Overview_01.png)

>tipYou can find the code example from the image above in our [SDK repository on GitHub](https://github.com/telerik/document-processing-sdk/tree/master/SpreadStreamProcessing/GenerateDocument). This repository contains numerous examples that cover all Document Processing libraries.


## What is Spread Streaming?

Spread streaming is a document processing paradigm that allows you to create or read big spreadsheet documents with great performance and minimal memory footprint. 

The key for the memory efficiency is that the spread streaming library writes the spreadsheet content directly to a stream without creating and preserving the spreadsheet document model in memory. Each time an exporter object is disposed, the set values are written into the stream. This allows you to create large documents with excellent performance.

While reading, only the required chunk of information is parsed to ensure there are no application resources kept without user need.

## Key Features

Some of the features you can take advantage of are:

* [Export]({%slug radspreadstreamprocessing-export%}) to XLSX or CSV files

* [Import]({%slug radspreadstreamprocessing-import%}) from XLSX or CSV files

* Writing directly into a stream; or parsing required data only

* **Append** new worksheets to existing workbook

* **Grouping**: Helps you organize data in sections, to be able to show and hide the currently relevant chunks.

* **Hidden [rows]({%slug radspreadstreamprocessing-model-rows%}) and [columns]({%slug radspreadstreamprocessing-model-columns%})**: The API allows you to set the hidden state of each row or column.

* [**Cell formatting**]({%slug radspreadstreamprocessing-model-cells%}#set-a-format): A number of properties enabling you to apply the desired look to a cell.

* [**Cell styles**]({%slug radspreadstreamprocessing-features-styling-cell-styles%}): Using cell styles allows you to apply multiple format options in one step and also offers an easy approach to achieve consistency in cell formatting.

* [**Merge cells**]({%slug radspreadstreamprocessing-model-cells%}#merge-cells): You have the ability to merge two or more adjacent cells into a single cell that spans over multiple rows and columns.

* **Controlling the view state of a sheet:**
	* [Setting scale factor]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#scale-a-document)
	* [Control over the selection and the active cell]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#add-selection-to-a-document)
	* [Show/hide gridlines]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#hide-grid-lines-and-row-or-column-headers)
	* [Show/hide row and column headers]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#ide-grid-lines-and-row-or-column-headers)
	* [Freezing panes]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#freeze-panes): Keep part of the worksheet always visible while scrolling.
	* [Changing the first visible cell]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#change-the-first-visible-cell): when you would like to show a particular part of the sheet to the user on opening the document in a viewer.
	

## RadSpreadStreamProcessing vs. RadSpreadProcessing

Following are the main differences between the two spreadsheet processing libraries.

* __RadSpreadStreamProcessing__ writes directly into a stream, unlike [RadSpreadProcessing]({%slug radspreadprocessing-overview%}), which creates models for the elements in the document. This is why the memory used with the spread streaming library is significantly lower than when using __RadSpreadProcessing__.
* __RadSpreadStreamProcessing__ does not perform any formula or other layout-related calculations, which makes its file generation performance much better compared to __RadSpreadProcessing__.

## When to Use RadSpreadStreamProcessing

You can use the __RadSpreadStreamProcessing__ library to create or read __large amount of data__ with a low memory footprint and great performance. You can also append data to an already existing document stream. The generated document can be exported directly to a file on the file system or to a stream (for example, to send it to the client).

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Worksheet View Exporter]({%slug radspreadstreamprocessing-features-worksheetviewexporter%})
* [RadSpreadProcessing]({%slug radspreadprocessing-overview%})
