---
title: Creating Custom Layout Tables with RadPdfProcessing
description: Learn how to create tables with various column layouts using RadPdfProcessing.
type: how-to
page_title: How to Customize Table Layouts in RadPdfProcessing Documents
slug: customize-table-layout-radpdfprocessing
tags: pdfprocessing, document, processing, table, layout, customize, col, span, columnspan
res_type: kb
ticketid: 1660148
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
Creating tables with customized layouts, including varying column spans, is a common requirement for document processing. This article demonstrates how to achieve a table with multiple rows, each having a different column layout, using the [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) library. 

## Solution

To create a table with varying column layouts, follow the steps below:

1. Define a `Table` and set its `LayoutType` to `AutoFit`. Customize the `DefaultCellProperties` to set padding and borders for the cells.
2. Add table rows using `table.Rows.AddTableRow()`.
3. For each row, add cells using `row.Cells.AddTableCell()`. Customize each cell's content by adding blocks of text with specific styles (e.g., font family, font style, font weight).
4. To change the column layout, set the `ColumnSpan` property of the cells accordingly.
5. To adjust the row height, insert content with the desired height in each cell or use the `Padding` property for minor adjustments.

Here's an example code snippet demonstrating the setup:

```csharp



```
 The code snippet achieves the below result:

## See Also

- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Working with Tables in RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/table)
