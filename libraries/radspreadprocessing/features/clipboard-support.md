---
title: Clipboard Support
description: Learn how to copy and paste cell values in RadSpreadProcessing with flexible paste options for content and formatting.
page_title: Clipboard Support
slug: radspreadprocessing-features-clipboard-support
tags: clipboard, paste, spreadsheet, radspreadprocessing, cells, copy, formatting, values, excel, xlsx
published: True
position: 4
---

# Clipboard Support

The document model offers a way to copy and paste multiple values. The library provides a flexible API that allows you to choose the content and formatting included in the pasted region.

## Copy

To copy values from your worksheet, create a `CellSelection` for the desired cell region and invoke its `Copy()` method. The method returns a `WorksheetFragment` instance that holds the copied values. The `WorksheetFragment` is a piece of worksheet designed to keep the data and its properties. You can later pass the worksheet fragment to the `Paste()` method to get the values pasted in another worksheet.

**Example 1** creates a new workbook with a single worksheet, assigns sample values to the A1:B3 region, selects that range, and calls `Copy()`. The returned `WorksheetFragment` can later be used for pasting.

**Example 1: Copy the selected cell range**

<snippet id='codeblock-cgi'/>



## Paste

The document model provides control over the content and the formatting included in the pasted region. The `Paste()` method requires two arguments: a `WorksheetFragment` that contains the values to paste, and a `PasteOptions` instance that determines the type of information pasted from the fragment. The `PasteOptions` class introduces a `PasteType` property that indicates the type of the paste. The following paste types are supported:

* `All`: Pastes everything, including text, numbers, formulas, and their formatting.

* `Formulas`: Pastes text, numbers, and formulas. This option ignores cell formatting.

* `Formulas and Number Formatting`: Pastes text, numbers, and formulas, and applies formatting of the copied cells to the pasted cells.

* `Column Widths`: Pastes text, numbers, and formulas, and applies the column widths of the copied cells to the pasted cells.

* `Values`: Pastes the calculated result of the formulas, ignoring formatting and column width.

* `Values and Number Formatting`: Pastes the calculated results of any formula and the formatting of the copied cells to the pasted cells.

* `Formatting`: Pastes only the formatting of the copied cells to the pasted cells.

**Example 2** creates a new workbook with an empty worksheet. It sets the `Value` of cell *A1* to =CONCATENATE("Rad" ,"Spreadsheet") and its `ForeColor` to green. The code then copies the contents of *A1* and pastes them into *A2* by using the `All` paste type.

**Example 2: Paste all copied cell content and formatting**

<snippet id='codeblock-cgj'/>



Using a different `PasteType` produces different output. **Example 3** pastes the contents of *A1* with the `Values` paste type, which results in the value "RadSpreadsheet" instead of =CONCATENATE("Rad" ,"Spreadsheet") and uses the default `ForeColor` instead of green.

**Example 3: Paste only the calculated cell values**

<snippet id='codeblock-cgk'/>



If you want to paste the formula contained in *A1* rather than only its result and keep its formatting, combine the `Values` and `Formats` paste types.

**Example 4** combines the Values and Formats paste types to preserve both the contents and formatting of the copied cell selection.

**Example 4: Combine Values and Formats paste types**

<snippet id='codeblock-cgl'/>



## See Also

* [Accessing Cells of a Worksheet]({%slug radspreadprocessing-working-with-cells-accessing-cells-of-worksheet%})
