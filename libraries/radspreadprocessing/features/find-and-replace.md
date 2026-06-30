---
title: Find and Replace
description: Learn how to find and replace text and numbers across workbooks, worksheets, and cell ranges in RadSpreadProcessing.
page_title: Find and Replace
slug: radspreadprocessing-features-find-and-replace
tags: find, replace, spreadsheet, radspreadprocessing, search, text, workbook, cells, spread, xlsx
published: True
position: 5
---

# Find and Replace

The document model offers a convenient way to find and replace text and numbers in a workbook, worksheet, or a specified range of cells.

* [Find and FindAll](#find-and-findall)

* [Replace and ReplaceAll](#replace-and-replaceall)

## Find and FindAll

Both `Workbook` and `Worksheet` classes expose methods that search their contents for a specific value. The two classes offer a `Find()` method that returns the first occurrence of the sought string and a `FindAll()` method that returns all occurrences of the specified value. Both methods require a single parameter of type `FindOptions` that determines how the search is performed. The following list describes the properties of the `FindOptions` class:

* `FindWhat`: Specifies the sought string.

* `FindWithin`: Determines if the search covers the whole `Workbook` or a particular `Worksheet`. If you call the `Find()` method of the `Workbook` class and the `FindWithin` option is set to `Workbook`, the search covers the entire workbook. If the option is `Worksheet`, the search covers only the active worksheet. If you call the `Find()` method of the `Worksheet` class, the `FindWithin` property is ignored and the search covers the worksheet instance that invokes it.

* `FindBy`: Indicates whether the search is performed by rows or by columns.

* `FindIn`: Indicates if the search includes formulas or only result values.

* `MatchCase`: Determines if the search must match the casing of the sought string.

* `MatchEntireCellContents`: Indicates whether the sought string must match the entire cell content.

* `StartCell`: Marks the cell from which the search begins.

* `SearchRanges`: If the property is set to `null`, the search covers the entire workbook or worksheet, depending on the `FindWithin` property. If ranges are defined, the search covers only those ranges of the active sheet. This property applies only to the `Find()` and `Replace()` methods and is disregarded in the `FindAll()` and `ReplaceAll()` methods.

**Example 1** creates a new workbook with two empty worksheets and assigns sample values to the sheets. The `FindOptions` instance specifies that the search covers the whole workbook and starts from cell A1 of the first worksheet. The snippet shows how to use the `Find()` and `FindAll()` methods.

**Example 1: Perform Find and Find All**

<snippet id='libraries-spread-features-find-and-replace-1'/>

## Replace and ReplaceAll

In addition to the `Find()` and `FindAll()` methods, the `Workbook` and `Worksheet` classes offer two more methods that allow you to alter the found strings: `Replace()` and `ReplaceAll()`. The `Replace()` method replaces the string of the first occurrence while `ReplaceAll()` alters all encountered occurrences. The two methods take one argument of type `ReplaceOptions` that specifies how the search is performed and the string that replaces the occurrences. The class derives from `FindOptions` and defines one more property:

* `ReplaceWith`: Specifies the string that replaces any found value.

**Example 2** creates a workbook from scratch with two empty worksheets and adds sample values. The `ReplaceOptions` instance specifies that the replace covers the whole workbook and includes formula values. The operation starts from cell A1 of the first worksheet and the search proceeds by columns.

**Example 2: Perform Replace and Replace All**

<snippet id='libraries-spread-features-find-and-replace-2'/>

## See Also

* [Activate a Worksheet]({%slug radspreadprocessing-working-with-worksheets-activate-worksheet%})
