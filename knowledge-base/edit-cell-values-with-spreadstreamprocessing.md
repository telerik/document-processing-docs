---
title: Editing Cell Values of Existing Documents using SpreadStreamProcessing
description: Learn how to edit cell values of existing worksheet documents with the Telerik SpreadStreamProcessing library.
type: how-to
page_title: How to Edit Cell Values of Existing Documents using SpreadStreamProcessing
meta_title: How to Edit Cell Values of Existing Documents using SpreadStreamProcessing
slug: edit-cell-values-with-spreadstreamprocessing
tags: spread, stream, processing, document, worksheet, workbook, excel, cell, update, edit
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadSpreadStreamProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

RadSpreadStreamProcessing cannot directly edit existing cell values in-place. It is designed as a forward-only, low-memory streaming API. This design gives you great performance for very large Excel files, but it also introduces an important limitation:

* Read existing Excel files sequentially
* Generate new Excel files sequentially
* **Cannot** seek back or modify cells in an already-existing XLSX document in place

Once a row or cell has been read from the stream, you cannot go back and change it. Likewise, you cannot open an XLSX file and update a cell while keeping the same file instance.

This article demonstrates a sample approach how to achieve editing of cells in existing XLSX documents using the SpreadStreamProcessing library. 

## Solution

You can effectively edit data by:

1. Reading the existing Excel file with RadSpreadStreamProcessing
1. Modifying values during the read
1. Writing everything to a new XLSX file


   ```csharp
           static void Main(string[] args)
        {
            string inputFilePath = "input.xlsx";
            string outputFilePath = "modified.xlsx";

            CreateWorksheet(inputFilePath); 
            UpdateExistingWorksheet(inputFilePath, outputFilePath);
            
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true }); 
        }
        private static void CreateWorksheet(string inputFilePath)
        {

            File.Delete(inputFilePath);
            using (FileStream stream = new FileStream(inputFilePath, FileMode.Create, FileAccess.Write))
            using (IWorkbookExporter workbookExporter =
                   SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, stream))
            {
                using (IWorksheetExporter worksheetExporter =
                       workbookExporter.CreateWorksheetExporter("DummyData"))
                {
                    for (int row = 0; row < 10; row++)
                    {
                        using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
                        {
                            for (int col = 0; col < 10; col++)
                            {
                                using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                                {
                                    cellExporter.SetValue($"R{row + 1}C{col + 1}");
                                }
                            }
                        }
                    }
                }
            }

            Console.WriteLine("Excel file generated successfully.");

        }
        private static void UpdateExistingWorksheet(string inputFilePath, string outputFilePath)
        {

            File.Delete(outputFilePath);
            using (FileStream input = File.OpenRead(inputFilePath))
            using (FileStream output = File.Create(outputFilePath))

            using (IWorkbookImporter importer = SpreadImporter.CreateWorkbookImporter(SpreadDocumentFormat.Xlsx, input))
            {
                using (IWorkbookExporter exporter = SpreadExporter.CreateWorkbookExporter(SpreadDocumentFormat.Xlsx, output))
                {
                    foreach (IWorksheetImporter worksheetImporter in importer.WorksheetImporters)
                    {
                        using (IWorksheetExporter worksheetExporter = exporter.CreateWorksheetExporter(worksheetImporter.Name))
                        {
                            foreach (IRowImporter rowImporter in worksheetImporter.Rows)
                            {
                                using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
                                {
                                    foreach (ICellImporter cellImporter in rowImporter.Cells)
                                    {
                                        using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                                        {
                                            string value = cellImporter.Value;

                                            if (cellImporter.ColumnIndex == 2 && cellImporter.RowIndex == 1)
                                            {
                                                value = "Updated value";
                                            }

                                            cellExporter.SetValue(value);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
   ```


## See Also

- [SpreadProcessing Overview](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/overview)
- [Export Chart to PDF](https://www.telerik.com/document-processing-libraries/documentation/libraries/radspreadprocessing/features/charts/pdf-export)
- [Exporting Spreadsheets with Charts to PDF with RadSpreadProcessing and WinForms RadChartView](https://www.telerik.com/document-processing-libraries/documentation/knowledge-base/export-charts-to-pdf-radspreadprocessing)
- [SpreadStreamProcessing: Add Support for Charts](https://feedback.telerik.com/document-processing/1356233-spreadstreamprocessing-add-support-for-charts)
- [SpreadProcessing: NetStandard: Export Charts to PDF](https://feedback.telerik.com/document-processing/1623065-spreadprocessing-netstandard-export-charts-to-pdf)
