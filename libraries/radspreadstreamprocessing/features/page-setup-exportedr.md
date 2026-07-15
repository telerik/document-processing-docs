---
title: Page Setup Exporter
description: Learn how to configure page setup settings for printing in RadSpreadStreamProcessing using the PageSetupExporter.
page_title: Page Setup Exporter
slug: radspreadstreamprocessing-features-page-setup-exporter
tags: pagesetup, spread, stream, processing, spreadsheet, print, export, worksheet, margins, headers
published: True
position: 3
---

# Page Setup Exporter

The `PageSetupExporter` allows you to export the page settings for printing. The following methods are available:

* `SetFitToPagesTall`: Sets the number of pages tall the worksheet is scaled to when printed.
* `SetFitToPagesWide`: Sets the number of pages wide the worksheet is scaled to when printed.
* `SetPageOrder`: Sets the page order.
* `SetPageOrientation`: Sets the page orientation.
* `SetPaperSize`: Sets the size of the paper.
* `SetScaleFactor`: Sets the scale factor of the printed worksheet. The valid values are from 0.1 to 4.


## Working with PageSetupExporter

You must place the `PageSetupExporter` after the code for exporting all cells on the sheet. The following example demonstrates how to create the `PageSetupExporter` and where to place it.

**Example 1: Create a page setup exporter and configure fit, order, orientation, paper size, and scale settings**

<snippet id='codeblock-dku'/>


>`IPageSetupExporter` inherits from [IDisposable](https://learn.microsoft.com/en-us/dotnet/api/system.idisposable). Make sure the object is disposed when you are done with it. Otherwise, the content will not be written in the exported file. The best way to ensure this is handled properly is to wrap it in a *using* statement.

## See Also

* [Worksheet]({%slug radspreadstreamprocessing-model-worksheet%})
* [Workbook]({%slug radspreadstreamprocessing-model-workbook%})