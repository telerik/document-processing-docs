---
title: Overview
page_title: Overview
description: Overview
slug: radspreadstreamprocessing-overview
tags: overview
published: True
position: 0
---

# Overview

Thank you for choosing Telerik **RadSpreadStreamProcessing**!

This article briefly explains the Spread Stream library specifics as what is spread streaming, how it works compared to the **RadSpreadProcessing** library and when to use it.

![](images/SpreadStreamProcessing-Overview_01.png)

## What is Spread Streaming?

Spread streaming is a document processing paradigm that allows you to create big spreadsheet documents with great performance and minimal memory footprint. 

The key for the memory efficiency is that the spread streaming library writes the spreadsheet content directly to a stream without creating and preserving the spreadsheet document model in memory. Each time a value is set, the export kicks-in and the new value is written into the stream. This allows you to create large documents with an excellent performance.

## Key Features

Some of the features you can take advantage of are:

* Export to XLSX or CSV files
* Writing directly into a stream
* Append new worksheets to existing ones
* Grouping
* [Styling]({%slug radspreadstreamprocessing-features-styling-cell-styles%}) and [formatting cells]({%slug radspreadstreamprocessing-model-cells%}#set-a-format)
* Hidden [rows]({%slug radspreadstreamprocessing-model-rows%}) and [columns]({%slug radspreadstreamprocessing-model-columns%})
* [Freezing panes]({%slug radspreadstreamprocessing-features-worksheetviewexporter%}#freeze-panes)

## RadSpreadStreamProcessing vs. RadSpreadProcessing

There are two main differences between the libraries.
* __RadSpreadStreamProcessing__ can be used only to create documents and append data to existing ones. On the other hand you can use the __RadSpreadProcessing__ also for reading documents.
* __RadSpreadStreamProcessing__ writes directly into a stream, unlike __RadSpreadProcessing__ which creates models for the elements in the document. This is why the memory used with the spread streaming library is significantly lower than when using __RadSpreadProcessing__.

## When to Use the Spread Streaming

You can use the spread stream processing to create and export large amount of data with a low memory footprint. You can also append data to already existing document stream.

## See Also

* [Getting Started]({%slug radspreadstreamprocessing-getting-started%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})
* [Worksheet View Exporter]({%slug radspreadstreamprocessing-features-worksheetviewexporter%})
