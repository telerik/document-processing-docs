---
title: Create Repeating Table Header Row in PdfProcessing
description: Learn how to create repeating table header row using the PdfProcessing library.
type: how-to  
page_title: Create Repeating Table Header Row in PdfProcessing
slug: pdfprocessing-create-repeat-header-row
position: 0
tags:  repeat, header, row, PdfProcessing
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.1.113|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

This example demonstrates how one can create the repeating row functionality. When you have a table that does not fit on a single page you may need to repeat the header row on each page so the column headers are visible. 

## Solution

The solution would be to split the table on each page and draw a second table that contains only the headers. The bellow example looks complex but I believe that it can be easily pugged in a real application. 

#### __C#__

{{region kb-pdfprocessing-create-repeat-header-row}}

    class Program
    {
        private const string LoremIpsumText = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam 
        nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud 
        exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in
        hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait
    
        private static readonly string[] headers = { "Header 1", "Header 2", "Header 3", "Header 4" };
        private static readonly Size pageSize = new Size(Unit.MmToDip(297), Unit.MmToDip(210));
        private static readonly double pageMargin = Unit.MmToDip(10);

        static void Main()
        {
            RadFixedDocument document = new RadFixedDocument();

            // Draw paragraph in the beginning splitting it onto pages.
            FixedContentEditor currentPageEditor = Program.CreateNewPage(document);
            Size availablePageSize = Program.CalculateRemainingSize(currentPageEditor);
            Block paragraph = Program.CreateParagraphInBeginningOfDocument();
            currentPageEditor.DrawBlock(paragraph, availablePageSize);

            while (paragraph.HasPendingContent)
            {
                paragraph = paragraph.Split();
                currentPageEditor = Program.CreateNewPage(document);
                currentPageEditor.DrawBlock(paragraph, availablePageSize);
            }

            // Start table on different page if there is not enough place for the first header row.
            currentPageEditor.Position.Translate(pageMargin, pageMargin + paragraph.DesiredSize.Height);
            Size remainingSize = Program.CalculateRemainingSize(currentPageEditor);
            Size repeatRowMeasureSize = new Size(CalculateRemainingWidth(), double.MaxValue);
            Size headerRowSize = CreateRepeatRowTable().Measure(repeatRowMeasureSize);

            if (headerRowSize.Height > remainingSize.Height)
            {
                currentPageEditor = Program.CreateNewPage(document);
            }
            
            // Draw table with repeating header row splitting it on multiple pages.
            Table table = Program.CreateTableWithData(150);                     
            do
            {
                if (table.HasPendingContent)
                {
                    currentPageEditor = Program.CreateNewPage(document);
                    table = table.Split();
                }

                Table rowToRepeat = Program.CreateRepeatRowTable();   
                currentPageEditor.DrawTable(rowToRepeat, repeatRowMeasureSize);
                currentPageEditor.Position.Translate(pageMargin, headerRowSize.Height + currentPageEditor.Position.Matrix.OffsetY);
                remainingSize = Program.CalculateRemainingSize(currentPageEditor);
                currentPageEditor.DrawTable(table, remainingSize);

            } while (table.HasPendingContent);
            
            ExportAndPreviewFile(document, "test.pdf");
        }

        private static FixedContentEditor CreateNewPage(RadFixedDocument document)
        {
            RadFixedPage currentPage = document.Pages.AddPage();
            currentPage.Size = pageSize;
            FixedContentEditor currentPageEditor = new FixedContentEditor(currentPage);
            currentPageEditor.Position.Translate(pageMargin, pageMargin);

            return currentPageEditor;
        }

        private static Block CreateParagraphInBeginningOfDocument()
        {
            Block block = new Block();
            block.InsertText(Program.GetParagraphText(8));

            return block;
        }

        private static string GetParagraphText(int repeatCount)
        {
            StringBuilder builder = new StringBuilder();

            for (int i = 0; i < repeatCount; i++)
            {
                builder.Append(LoremIpsumText);
            }

            return builder.ToString();
        }

        private static Table CreateRepeatRowTable()
        {
            return CreateTableWithData(1, (row, column) => headers[column]);
        }

        private static Table CreateTableWithData(int numberOfRows)
        {
            return CreateTableWithData(numberOfRows, (row, column) => string.Format("data in row{0} column{1}", row, column));
        }

        private static Table CreateTableWithData(int numberOfRows, Func<int, int, string> getDataByRowColumn)
        {
            Table table = new Table();
            Border border = new Border(1, new RgbColor(0, 0, 0));
            table.DefaultCellProperties.Borders = new TableCellBorders(border, border, border, border);
            double cellWidth = (CalculateRemainingWidth()) / headers.Length;

            for (int rowIndex = 0; rowIndex < numberOfRows; rowIndex++)
            {
                TableRow row = table.Rows.AddTableRow();

                for (int columnIndex = 0; columnIndex < headers.Length; columnIndex++)
                {
                    TableCell cell = row.Cells.AddTableCell();
                    cell.Blocks.AddBlock().InsertText(getDataByRowColumn(rowIndex, columnIndex));
                    cell.PreferredWidth = cellWidth;
                }
            }

            return table;
        }

        private static Size CalculateRemainingSize(FixedContentEditor editor)
        {
            return new Size(CalculateRemainingWidth(), pageSize.Height - pageMargin - editor.Position.Matrix.OffsetY);
        }

        private static double CalculateRemainingWidth()
        {
            return pageSize.Width - 2 * pageMargin;
        }

        private static void ExportAndPreviewFile(RadFixedDocument document, string fileName)
        {
            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }

            File.WriteAllBytes(fileName, new PdfFormatProvider().Export(document));

            Process.Start(fileName);
        }
    }

{{endregion}}


