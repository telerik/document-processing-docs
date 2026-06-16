---
title: Setting a Value Using a Named Range
description: Learn how to set a value to a named range in a worksheet using SpreadProcessing.
type: how-to
page_title: Setting a Value Using a Named Range
slug: set-value-using-named-range
position: 0
tags: radspreadprocessing, excel, named, range, cell, worksheet, document, processing
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2021.1.222 | RadSpreadProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article shows how to set the value of a [CellSelection](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.cellselection) by using its [Named Range]({%slug radspreadprocessing-features-named-ranges%}).

## Solution

Iterate the imported [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook %}) names to find the desired one. Split the [RefersTo](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.definedname#collapsible-Telerik_Windows_Documents_Spreadsheet_Model_DefinedName_RefersTo) property to match the exact [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) and get the indexes describing the `CellSelection`. Use the [NameConverter]({%slug radspreadprocessing-name-converter%}) `TryConvertCellNameToIndex()` method to convert the obtained cell name to an index.

**Example 1: Set Value Using Named Range**

```csharp

    string namedRange = "test";
    string newValue = "edited";

    Workbook workbook = ImportWorkbook();
    foreach (var name in workbook.Names)
    {
        if (name.Name == namedRange)
        {
            string[] refersToElements = name.RefersTo.Split("!".ToCharArray());

            foreach (Worksheet sheet in workbook.Sheets)
            {
                if (sheet.Name.ToUpper() == refersToElements[0].Replace("=", String.Empty).ToUpper())
                {
                    string rangeName = refersToElements[1];
                    string fromIndexName = rangeName.Split(":".ToCharArray())[0];
                    string toIndexName = rangeName.Split(":".ToCharArray())[1];

                    bool nameRefersToIndexFrom = NameConverter.TryConvertCellNameToIndex(fromIndexName, out bool isRowFromAbsolute, out int fromRowIndex, out bool isColumnFromAbsolute, out int fromColumnIndex);

                    bool nameRefersToIndexTo = NameConverter.TryConvertCellNameToIndex(toIndexName, out bool isRowToAbsolute, out int toRowIndex, out bool isColumnToAbsolute, out int toColumnIndex);

                    if (nameRefersToIndexFrom && nameRefersToIndexTo)
                    {
                        CellRange cellRange = new CellRange(fromRowIndex, fromColumnIndex, toRowIndex, toColumnIndex);
                        sheet.Cells[cellRange].SetValue(newValue);
                    }
                }
            }
        }
    }
```

There is an item logged in the backlog to provide an API for this scenario: [SpreadProcessing: Add API to get the list of ranges to which a defined name refers](https://feedback.telerik.com/document-processing/1356055-spreadprocessing-add-api-to-get-the-list-of-ranges-to-which-a-defined-name-refers). You can cast your vote for the implementation and subscribe to the task by clicking the **Follow** button to receive updates when the status changes.

## See Also

* [Named Ranges]({%slug radspreadprocessing-features-named-ranges%})
* [NameConverter]({%slug radspreadprocessing-name-converter%})
