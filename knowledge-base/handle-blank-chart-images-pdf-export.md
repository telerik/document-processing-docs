---
title: How to Handle Blank Charts Images when exporting XLSX documents to PDF format 
description: Learn how to convert charts to images using the RadSpreadProcessing library.
type: how-to
page_title: How to Handle Blank Charts Images when exporting XLSX documents to PDF format 
slug: handle-blank-chart-images-pdf-export
tags: spreadprocessing, chart, image, convert, pdf
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadSpreadProcessing  |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Problem

When using the SDK example, [Export Chart](https://github.com/telerik/document-processing-sdk/tree/master/SpreadProcessing/ExportChart), the exported chart images might get exported as blank images in some cases. This article gives information how to handle this undesired behavior.

## Solution

The SDK example uses the **ChartModelToImageConverter** class which is readily available in the Telerik.Windows.Controls.Spreadsheet assembly and uses internally the RadChartView control to visualize the chart and create an image.

If you are using different versions of Telerik products in your project, this can sometimes cause compatibility issues. Ensure that all references to Telerik products in your project are the same version, including the suffix (e.g.,  `.40`). If necessary, remove all references and add them again using the correct DLLs.

The main reason behind the exported blank charts is if their style is missing. Usually, this is the case when the [NoXaml assemblies](https://docs.telerik.com/devtools/wpf/styling-and-appearance/xaml-vs-noxaml) are referred for Telerik.Windows.Controls.Spreadsheet and Telerik.Windows.Controls.Chart.

>important Ensure that the Xaml assemblies are used from the UI for WPF suite. Thus, the exported chart images will be as expected.

## See Also

- [Export Chart to PDF]({%slug radspreadprocessing-features-charts-pdf-export%})
