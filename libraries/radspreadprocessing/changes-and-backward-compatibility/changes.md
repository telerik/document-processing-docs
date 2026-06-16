---
title: Changes
description: Summary of the new features and functionality introduced in RadSpreadProcessing across releases.
page_title: Get familiar with the new functionality introduced in RadSpreadProcessing. 
slug: radspreadprocessing-changes
tags: changes, radspreadprocessing, releases, spreadsheet, excel, xlsx, features, new
published: True
position: 0
---

# Changes

The following sections summarize the new features introduced in each release with links to the relevant documentation.

## What Is New in 2024 Q4

* Introduced a timeout mechanism for document import and export. The new Import and Export methods for all format providers have a mandatory timeout parameter. [Read more.]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})

## What Is New in 2014 Q3

**New Features**

* Improved import and export performance.
* Improved FillSeries performance.
* Performance optimizations for shapes and images.
* Included option to unregister a function from `FunctionManager`.
* Exposed API for getting the cell content size and the cell layout box from the model.

**Fixes**

* Setting an empty string as font family in a cell and exporting the workbook produces a corrupted document.
* Copy and paste of named ranges with isolated scope in a different worksheet refers to the source worksheet.
* Importing a document that contains a predefined Normal style causes an exception.
* Some documents cannot be imported due to the theme in use.
* Cannot import XLSX files that contain images with uppercase extensions.
* Theme-dependent fills are not updated when the theme changes.
* The currency number format is not exported correctly in cultures that contain "." or "," in the currency symbol, for example Bulgarian and Serbian.
* When the worksheet name changes from code, existing `CellReferenceRangeExpressions` are not updated.

## What Is New in 2014 Q2

* [Filtering]({%slug radspreadprocessing-features-filtering%})
* [Sorting]({%slug radspreadprocessing-features-sorting%})
* [Export to PDF]({%slug radspreadprocessing-formats-and-conversion-pdf-pdf%})
* Error cell value
* Automatic update for all defined names and cell references when the workbook name changes
* Automatic translation of cell references when cells, rows, or columns are inserted or deleted
