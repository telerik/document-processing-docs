---
title: Set Value using Named Range
description: Set Value using Named Range
type: how-to
page_title: Set Value using Named Range
slug: set-value-using-named-range
position: 0
tags: workbook, cellselection, named, range
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.1.222</td>
		<td>SpreadProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

How to set the value to a [CellSelection](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.cellselection) using its [Named Range]({%slug radspreadprocessing-features-named-ranges%}).

## Solution

The solution would be to iterate the imported [Workbook]({%slug radspreadprocessing-working-with-workbooks-what-is-workbook%})`s Names in order to find the desired one. Then to split its [RefersTo](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.spreadsheet.model.definedname#collapsible-Telerik_Windows_Documents_Spreadsheet_Model_DefinedName_RefersTo) property to use its elements to match the exact [Worksheet]({%slug radspreadprocessing-working-with-worksheets-what-is-worksheet%}) and to get the name of the indexes describing the **CellSelection**. We are using the [NameConverter]({%slug radspreadprocessing-name-converter%})._TryConvertCellNameToIndex()_ method to convert the already obtained cell name to an index.

#### __[C#] Set Value using Named Range__

{{region kb-set-value-using-named-range1}}

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
{{endregion}}

There is an item logged in our backlog to provide an API to make this easier: [SpreadProcessing: Add API to get the list of ranges to which a defined name refers](https://feedback.telerik.com/document-processing/1356055-spreadprocessing-add-api-to-get-the-list-of-ranges-to-which-a-defined-name-refers). You can cast your vote for the implementation as well as subscribe to the task by clicking the _Follow_ button to receive updates when its status changes.
