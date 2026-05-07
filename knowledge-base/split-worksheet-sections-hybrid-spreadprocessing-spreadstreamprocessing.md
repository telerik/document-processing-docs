---
title: Splitting Worksheet Sections into Separate Sheets with a Hybrid SpreadProcessing and SpreadStreamProcessing Approach
description: Learn how to efficiently split multiple report sections from a single large worksheet into separate worksheets using a hybrid SpreadProcessing and SpreadStreamProcessing approach in Telerik Document Processing.
type: how-to
page_title: How to Split Worksheet Sections into Separate Worksheets Using a Hybrid Approach
meta_title: How to Split Worksheet Sections into Separate Worksheets Using a Hybrid Approach
slug: split-worksheet-sections-hybrid-spreadprocessing-spreadstreamprocessing
tags: spreadstreamprocessing, spreadprocessing, performance, worksheet, split, merge, columns, hybrid, export, xlsx
res_type: kb
ticketid: 171142
---

## Environment

| Version | Product | Author |
| ---- | ---- | ---- |
| 2026.1.402 | RadSpreadStreamProcessing/SpreadProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

When working with large Excel files that contain multiple sections in a single worksheet, splitting those sections into individual worksheets using [RadSpreadProcessing]({%slug radspreadprocessing-overview%}) alone can be very slow for large datasets. While [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}) offers high-performance streaming for large datasets, it does not support directly copying rows or retaining column widths and merged cell ranges from the source document.

This knowledge base article also answers the following questions:

* How can I split sections of a large Excel worksheet into separate worksheets with high performance?
* How do I preserve column widths and merged cells when exporting with SpreadStreamProcessing?
* Why are number formats like currency and percentages not applied correctly in SpreadStreamProcessing?

## Solution

To achieve a fully automated, high-performance split that preserves column widths, merged cells, and number formatting, use a **hybrid approach** that combines both libraries:

* **[RadSpreadProcessing]({%slug radspreadprocessing-overview%})** — used to read column widths and merged cell ranges from the source document.
* **[RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%})** — used to write the output document efficiently with minimal memory usage.

### Step 1: Read Column Widths and Merged Cell Ranges with SpreadProcessing

Use [RadSpreadProcessing]({%slug radspreadprocessing-overview%}) to extract column widths and merged ranges before the streaming phase begins:

```csharp
Workbook workbook;
IWorkbookFormatProvider xlsxFormatProvider = new XlsxFormatProvider();

using (Stream input = new FileStream(inputFilePath, FileMode.Open))
{
    workbook = xlsxFormatProvider.Import(input, TimeSpan.FromSeconds(10));
}

Worksheet activeWorksheet = workbook.ActiveWorksheet;

Dictionary<int, double> columnWidths = new Dictionary<int, double>();
for (int columnIndex = activeWorksheet.UsedCellRange.FromIndex.ColumnIndex;
     columnIndex <= activeWorksheet.UsedCellRange.ToIndex.ColumnIndex;
     columnIndex++)
{
    double width = activeWorksheet.Columns[columnIndex].GetWidth().Value.Value;
    columnWidths[columnIndex] = width;
}

IEnumerable<CellRange> mergedCellRanges = activeWorksheet.Cells.GetMergedCellRanges();
```

### Step 2: Stream the Sections with SpreadStreamProcessing

Once the structural data is available, use [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}) to import each row and detect section boundaries. The logic relies on a **repeating marker value** - a cell value that appears exactly once at the beginning of each section and nowhere else in the data. Each time this marker is encountered, a new section is started. Replace `"Section Title"` with the actual repeating value present in your document:

```csharp
string sectionMarker = "Section Title"; // replace with the value that identifies the start of each section

using (IWorkbookImporter workBookImporter = SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, streamIn))
{
    foreach (IWorksheetImporter worksheetImporter in workBookImporter.WorksheetImporters)
    {
        foreach (IRowImporter rowImporter in worksheetImporter.Rows)
        {
            RowData rowData = new RowData();
            bool isSectionStart = false;

            foreach (ICellImporter cellIn in rowImporter.Cells)
            {
                CellData cellData = new CellData
                {
                    Value = cellIn.Value,
                    Format = cellIn.Format,
                };
                rowData.Cells.Add(cellData);

                if (cellIn.Value == sectionMarker)
                {
                    isSectionStart = true;
                }
            }

            if (isSectionStart)
            {
                if (currentSection != null && currentSection.Count > 0)
                    sections.Add(currentSection);

                currentSection = new List<RowData>();
            }

            if (currentSection != null)
                currentSection.Add(rowData);
        }
    }
}
```

### Step 3: Apply Column Widths, Cell Values, Formatting, and Merged Ranges

When exporting each section, apply the column widths from SpreadProcessing, set cell values with the correct type, apply number formats, and re-apply merged ranges:

```csharp
using (IWorkbookExporter workbookExporter = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, streamOut))
{
    for (int pageIndex = 0; pageIndex < sections.Count; pageIndex++)
    {
        List<RowData> section = sections[pageIndex];
        using (IWorksheetExporter worksheetExporter = workbookExporter.CreateWorksheetExporter($"Page {pageIndex}"))
        {
            // Apply column widths obtained from SpreadProcessing
            foreach (var columnWidth in columnWidths)
            {
                using (IColumnExporter columnExporter = worksheetExporter.CreateColumnExporter())
                {
                    columnExporter.SetWidthInPixels(columnWidth.Value);
                }
            }

            // Write rows and cells
            foreach (RowData rowData in section)
            {
                using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
                {
                    int currentColumnIndex = 0;
                    foreach (CellData cellData in rowData.Cells)
                    {
                        while (currentColumnIndex < cellData.ColumnIndex)
                        {
                            using (ICellExporter emptyCellExporter = rowExporter.CreateCellExporter()) { }
                            currentColumnIndex++;
                        }

                        using (ICellExporter cellOut = rowExporter.CreateCellExporter())
                        {
                            if (cellData.Value != null)
                            {
                                // Set numeric values as numbers so that number formats are respected
                                if (double.TryParse(cellData.Value, out double numericValue))
                                    cellOut.SetValue(numericValue);
                                else
                                    cellOut.SetValue(cellData.Value);
                            }
                            if (cellData.Format != null)
                            {
                                cellOut.SetFormat(cellData.Format);
                            }
                        }
                        currentColumnIndex++;
                    }
                }
            }

            // Re-apply merged cell ranges obtained from SpreadProcessing
            foreach (var mergedRange in mergedCellRanges)
            {
                worksheetExporter.MergeCells(
                    mergedRange.FromIndex.RowIndex,
                    mergedRange.FromIndex.ColumnIndex,
                    mergedRange.ToIndex.RowIndex,
                    mergedRange.ToIndex.ColumnIndex);
            }
        }
    }
}
```

### Important Notes

* **Repeating section marker**: This implementation requires that each section in the source worksheet starts with an identical, repeating cell value (e.g., a report title or header label). Every occurrence of this value is treated as the beginning of a new section. If your document uses a different structure to delimit sections, adjust the detection logic accordingly.
* **Number formatting**: Values like currency amounts and percentages must be set as numeric types (e.g., `double`) rather than strings. Calling `cellOut.SetValue("900")` stores the value as text, which causes number formats to be ignored. Use `double.TryParse` to detect numeric values and set them correctly.
* **Column widths**: [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}) does not support auto-fitting column widths. You must either supply widths manually or retrieve them from SpreadProcessing as shown above. See [Columns]({%slug radspreadstreamprocessing-model-columns%}) and [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%}) for more details.
* **Merged cells**: [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%}) supports merging cells via [IWorksheetExporter.MergeCells]({%slug radspreadstreamprocessing-model-cells%}#merge-cells), but the source ranges must be obtained externally (e.g., from SpreadProcessing).

## See Also

* [RadSpreadStreamProcessing Overview]({%slug radspreadstreamprocessing-overview%})
* [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
* [Columns in RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-model-columns%})
* [Cells in RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-model-cells%})
* [Get Cell Content Size]({%slug radspreadstreamprocessing-features-text-measuring%})
* [Merge and Unmerge Cells in RadSpreadProcessing]({%slug radspreadprocessing-features-merge-unmerge-cells%})
* [Performance Tips and Tricks in RadSpreadProcessing]({%slug radspreadprocessing-performance%})
* [Accessing Specific Cells in RadSpreadStreamProcessing]({%slug accessing-specific-cells-radspreadstreamprocessing%})
* [Handling Empty Cells with RadSpreadStreamProcessing]({%slug handle-empty-cells-radspreadstreamprocessing%})
