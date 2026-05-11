---
title: What is a Workbook?
description: Learn about the concept of a workbook in RadSpreadProcessing and how it represents an Excel spreadsheet document.
page_title: What is a Workbook?
slug: radspreadprocessing-working-with-workbooks-what-is-workbook
tags: workbook, spreadsheet, radspreadprocessing, excel, model, concept, worksheets, structure, xlsx, spread
published: True
position: 0
---

# What is a Workbook?

This article will help you get familiar with the representation of an Excel workbook in the model of SpreadProcessing.

## Overview

The workbook lays in the core of the SpreadProcessing' document model. It is the primary document that you use to retrieve, manipulate and store data. The workbook can also be viewed as a collection of worksheets, where a worksheet is in turn defined as a collection of cells organized in rows and columns. Each workbook contains, at least, one worksheet and often holds several sheets with related information.

The workbook is designed to hold together multiple worksheets in order to allow efficient organization and consolidation of data. Typically, a workbook has a single theme and contains worksheets with related data. For example, an annual budget workbook may comprise four worksheets that break down the budget in quarters.

You can create a workbook from scratch or import an existing document. To save a document you can export its contents into a `csv`, `txt`, `xlsx`, `xls` file or a `DataTable`. Further information is available in the [Create, Open and Save Workbooks]({%slug radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks%}) article and the [Formats and Conversion]({%slug radspreadprocessing-formats-and-conversion-general-information%}) section.

## What is in it?

The workbook has several important characteristics:

| Characteristic | Description |
|---|---|
| Collection of Worksheets | Each workbook maintains a collection of worksheets that allows you to add and delete worksheets, move worksheets within the workbook, or iterate through them. More information is available in [What is a Worksheet?]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}). |
| Active Worksheet | The workbook exposes a property that indicates the active worksheet. There is a single active worksheet in a workbook at a time. See [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%}). |
| History | Each workbook maintains a history stack that records all changes to its content, enabling undo and redo operations. You can also group several actions into one undo step. For more information, see [History]({%slug radspreadprocessing-features-history%}). |
| Names (Named Ranges) | The `Workbook` class exposes a `Names` property of type `NameCollection` that allows you to create, update and manage names. More about the feature is available in [Names]({%slug radspreadprocessing-features-named-ranges%}). |
| Collection of Cell Styles | Each workbook contains a collection of cell styles — predefined sets of formatting options (borders, fonts, fills, number formats) that you can apply to a cell. For more information, see [Cell Styles]({%slug radspreadprocessing-features-styling-cell-styles%}). |
| Theme | The workbook has a theme that lets you specify colors, fonts and graphic effects for the whole document. For more information, see [Document Themes]({%slug radspreadprocessing-features-styling-document-themes%}). |
| Find and Replace | The `Workbook` class offers an API to find and replace text and numbers across all worksheets. For more information, see [Find and Replace]({%slug radspreadprocessing-features-find-and-replace%}). |
| Protection | Lets you prevent users from modifying the structure of the workbook (adding, removing, renaming, or reordering sheets). See [Workbook Protection]({%slug radspreadprocessing-features-protection-workbook%}). |
| `DocumentInfo` | Enables you to set and obtain document metadata. Of type `DocumentInfo`, it exposes `Author`, `Title`, `Subject`, `Keywords`, and `Description` properties. |

![Rad Spreadsheet Model Working with Excel Workbooks What is Workbook](images/RadSpreadsheet_Model_Working_with_Workbooks_What_is_Workbook_02.png)


*This documentation is neither affiliated with, nor authorized, sponsored, or approved by, Microsoft® Corporation.

## See Also

* [Create, Open and Save Workbooks]({%slug radspreadprocessing-working-with-workbooks-create-open-and-save-workbooks%})
* [Formats and Conversion]({%slug radspreadprocessing-formats-and-conversion-general-information%})
