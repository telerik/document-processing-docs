---
title: Avoiding Table Splits Across Pages Using FixedContentEditor in RadPdfProcessing
description: Learn how to measure tables in RadPdfProcessing to prevent them from splitting across pages in a PDF document.
type: how-to
page_title: Prevent Table Splits Across Pages in RadPdfProcessing
slug: avoid-table-splits-across-pages-radpdfprocessing
tags: pdf, processing, table, document, position, page, break, split
res_type: kb
ticketid: 1686584
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When adding tables in [RadPdfProcessing]({%slug radpdfprocessing-overview%}) using the [RadFixedDocumentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/radfixeddocumenteditor), tables may sometimes split across pages if they cannot fit within the remaining space on the current page. To ensure a table fits entirely on one page and starts on a new page if necessary, you can adopt a strategy to measure the table size and calculate the remaining page height.

This article demonstrates how to prevent tables from splitting across pages and apply page breaks before adding tables using FixedContentEditor.

## Solution

Measuring the table and calculating the remaining page height is the suitable approach. For precise positioning, you can use the [FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor). This editor allows you to measure and draw tables with exact positioning. Below is an example implementation:

```csharp
        static void Main(string[] args)
        {
            GeneratedTableWithFixedContentEditor();
        }

        private static void GeneratedTableWithFixedContentEditor()
        {
            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage();

            FixedContentEditor editor = new FixedContentEditor(page);
            Point currentPosition = new Point(0, 0);

            List<Table> tables = new List<Table>(); 
            tables.Add(GenerateTable(50));

            tables.Add(GenerateTable(15)); //can fit
            //tables.Add(GenerateTable(30)); //can't fit

            foreach (Table item in tables)
            {
                Size size = item.Measure();

                if (size.Height < (page.Size.Height - currentPosition.Y))
                {
                    editor.Position.Translate(currentPosition.X, currentPosition.Y);
                    currentPosition = new Point(0, currentPosition.Y + size.Height + 10);
                    editor.DrawTable(item);
                }
                else
                {
                    page = document.Pages.AddPage();
                    editor = new FixedContentEditor(page);
                    editor.DrawTable(item);
                    currentPosition = new Point(0, size.Height + 10);
                }

            }

            PdfFormatProvider provider = new PdfFormatProvider();
            string outputFilePath = "exported.pdf";
            File.Delete(outputFilePath);
            File.WriteAllBytes(outputFilePath, provider.Export(document, TimeSpan.FromSeconds(10)));
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
        }

        private static Telerik.Windows.Documents.Fixed.Model.Editing.Tables.Table GenerateTable(int numberOfRows)
        { 
            Table table = new Table();
            table.LayoutType = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.TableLayoutType.FixedWidth;

            for (int i = 0; i < numberOfRows; i++)
            {
                TableRow row = table.Rows.AddTableRow();
                TableCell cell = row.Cells.AddTableCell();
                cell.Blocks.AddBlock().InsertText("Row: "+i);
            }
            
            return table;
        }
```

## See Also

- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
- [Tables]({%slug radpdfprocessing-editing-table%}) 
