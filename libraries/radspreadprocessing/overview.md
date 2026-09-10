---
title: Overview
description: Learn about RadSpreadProcessing, the Telerik Document Processing library for creating, importing, exporting, and converting XLSX, XLSM, XLS, CSV, TXT, JSON, and PDF spreadsheets.
page_title: RadSpreadProcessing Library Overview
slug: radspreadprocessing-overview
tags: spread, processing, spreadsheet, excel, xlsx, csv, pdf, import, export
published: True
position: 0
---

# Overview

Telerik Document Processing includes the **RadSpreadProcessing** library for creating, importing, exporting, and converting spreadsheet documents. **RadSpreadProcessing** supports XLSX, XLSM, XLS, CSV, TXT, and JSON files, as well as PDF export. It includes more than 200 built-in functions, such as `SUM` and `AVERAGE`. Create workbooks from scratch, modify existing files, convert between common spreadsheet formats, and save the result to a file or stream.

![Telerik Document Processing RadSpreadProcessing document conversion between XLSX, CSV, and TXT formats](images/spread-processing-overview.jpg)

This article lists the most popular features of the library. To start right away, see [how to get started with RadSpreadProcessing]({%slug radspreadprocessing-getting-started%}).

![Telerik Document Processing RadSpreadProcessing workbook with a monthly report worksheet and product quantity data](images/RadSpreadProcessing_Overview_01.png)

>note If you do not yet have Telerik Document Processing installed, see [the first steps for installation]({%slug getting-started-first-steps%}).

## Key Features

The following table describes the most popular features of the `RadSpreadProcessing` library.

| Feature | Description |
|---------|-------------|
| [**Shapes and Images**]({%slug radspreadprocessing-features-shapes-and-images%}) | Insert, position, and delete images in worksheets. **RadSpreadProcessing** also supports SVG `FormSource` content. |
| [**Charts**]({%slug radspreadprocessing-features-charts%}) | Add, remove, and manipulate chart objects in spreadsheet documents. |
| [**Conditional Formatting**]({%slug radspreadprocessing-features-conditional-formatting%}) | Analyze data more easily by highlighting values, patterns, and trends. |
| [**Hyperlinks**]({%slug radspreadprocessing-features-hyperlink%}) | Add, remove, edit, and search for hyperlinks in worksheets. |
| [**Workbook Protection**]({%slug radspreadprocessing-features-protection-workbook%}) | Prevent users from adding, removing, renaming, or reordering sheets. |
| [**Worksheet Protection**]({%slug radspreadprocessing-features-protection-worksheet%}) | Restrict changes to worksheet content and structure, and choose which commands remain available. |
| [**Grouping**]({%slug radspreadprocessing-features-grouping%}) | Organize data in sections, and show or hide the relevant ranges. |
| [**Formulas**]({%slug radspreadprocessing-features-formulas-general-information%}) | Use more than 200 built-in functions, and register custom functions. |
| [**Named Ranges**]({%slug radspreadprocessing-features-named-ranges%}) | Use named ranges at the workbook and worksheet levels. |
| [**Styling**]({%slug radspreadprocessing-features-styling-cell-styles%}) | Apply styles to cells, duplicate predefined styles, or create custom styles. |
| [**Theming**]({%slug radspreadprocessing-features-styling-document-themes%}) | Apply predefined document themes to control colors, fonts, and graphic effects across the workbook. |
| [**Resizing**]({%slug radspreadprocessing-working-with-rows-and-columns-resizing%}) | Autofit or resize rows and columns. |
| [**Number Formats**]({%slug radspreadprocessing-features-number-formats%}) | Format cell data with predefined categories such as **General**, **Number**, **Currency**, **Accounting**, **Date**, **Time**, **Percentage**, **Fraction**, **Scientific**, **Text**, and **Special**, or create custom formats. |
| **Copy and Paste** | Add or [copy worksheets]({%slug radspreadprocessing-working-with-worksheets-copy-worksheet%}) within or across workbooks. [Copy and paste cells]({%slug radspreadprocessing-features-clipboard-support%}) as well. |
| [**Data Validation**]({%slug radspreadprocessing-features-data-validation%}) | Control the data or values that users can enter in a cell. Available rules include list, number, date, text length, and custom validation. |
| [**Filtering**]({%slug radspreadprocessing-features-filtering%}) | Filter worksheet data. |
| [**Sorting**]({%slug radspreadprocessing-features-sorting%}) | Sort data in the worksheet. |
| [**Find and Replace Data**]({%slug radspreadprocessing-features-find-and-replace%}) | Find, find all, replace, and replace all values. |
| [**Freeze Panes**]({%slug radspreadprocessing-features-freeze-panes%}) | Keep part of the worksheet visible at all times when scrolling. |
| [**Hidden Rows and Columns**]({%slug radspreadprocessing-working-with-rows-and-columns-hiding%}) | Set the hidden state of each row or column in the workbook model. |
| [**Merge and Unmerge Cells**]({%slug radspreadprocessing-features-merge-unmerge-cells%}) | Merge adjacent cells into one cell that spans multiple rows and columns, or split them again. |
| **[Auto fill]({%slug radspreadprocessing-features-fill-data-automatically-repeat-values%}) and [Auto Fill Series]({%slug radspreadprocessing-features-fill-data-automatically-series%})** | Fill cells automatically with data following a specific pattern. |
| [**Page Setup**]({%slug radspreadprocessing-features-worksheetpagesetup%}) | Configure headers, footers, paper size, orientation, scaling, margins, page breaks, and print settings. |
| [**Workbook History**]({%slug radspreadprocessing-features-history%}) | Track workbook changes through history stacks. Each worksheet maintains its own history stack. |
| [**Comments**]({%slug radspreadprocessing-features-comments%}) | Add comments and replies to cells for easier collaboration. |
| [**Notes**]({%slug radspreadprocessing-features-notes%}) | Add notes to cells to highlight important information. |
| [**GenAI-Powered Document Insights**]({%slug radspreadprocessing-features-gen-ai-powered-document-insights-overview%}) | Extract insights from Excel documents by using large language models (LLMs). |

## Supported Formats

The library supports the following formats:

* Excel formats: [**XLSX**]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%}), [**XLSM**]({%slug radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider%}), and [**XLS**]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%}).
* Text formats: [**CSV**]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%}), [**Plain Text**]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%}), and [**JSON**]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%}) for export.
* Other formats: [**PDF**]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) for export.

To populate a workbook from a .NET `DataTable`, see [importing data from a `DataTable`]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%}).

*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft Corporation.

## Online Demos

The following demos show common `RadSpreadProcessing` scenarios:

| Demo | Description |
|---|---|
| [SpreadProcessing Basic Usage](https://demos.telerik.com/document-processing/spreadprocessing) | Convert spreadsheet documents between formats such as XLSX, CSV, XLSM, and TXT. You can also export these formats to PDF. |
| [SpreadProcessing Document Generation](https://demos.telerik.com/document-processing/spreadprocessing/generate_documents) | Create documents entirely in code. This demo is useful when you need to export large amounts of data to XLSX, CSV, TXT, or XLSM. |
| [SpreadProcessing Grid Integration](https://demos.telerik.com/document-processing/spreadprocessing/grid_integration) | Integrate `RadSpreadProcessing` with the Kendo UI for ASP.NET Core Grid to export grid data to XLSX, CSV, XLSM, or TXT. |
| [SpreadProcessing Chart Generation](https://demos.telerik.com/document-processing/spreadprocessing/charts) | Create spreadsheet documents with charts entirely in code. |
| [SpreadProcessing Add Notes](https://demos.telerik.com/document-processing/spreadprocessing/notes) | Add notes to cells while you generate a document, and then export the result to XLSX. |
| [SpreadProcessing Add Comments](https://demos.telerik.com/document-processing/spreadprocessing/comments) | Add comments to cells while you generate a document, and then export the result to XLSX. |

## See Also

* [Getting Started]({%slug radspreadprocessing-getting-started%})
* [What is a Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})
* [What is a Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%})
* [Generating Excel Documents from IEnumerable Collections]({%slug generate-excel-files-from-ienumerable-collections%})
* [Exporting Data from DataGridView Control to Excel File]({%slug saving-data-from-datagridview-to-xlsx-file-in-csharp%})
