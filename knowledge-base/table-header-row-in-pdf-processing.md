---
title: How to Achieve Table Header Row in PdfProcessing
description: Learn how to simulate table header row in PdfProcessing.
type: how-to
page_title: How to Achieve a Table Header Row in PdfProcessing
slug: table-header-row-in-pdf-processing
tags: pdf, table, header, row, bold
res_type: kb
---
## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

[RadPdfProcessing]({%slug radpdfprocessing-overview%}) allows you to create [Tables]({%slug radpdfprocessing-editing-table-overview%}). A common requirement is to have a header row for the table. This article shows how to simulate such functionality.

## Solution
Table header row can be added as a standard TableRow with bold text. 

```csharp        
            FontFamily fFamily = new FontFamily("Verdana");
            RadFixedDocument fixedDocument = new RadFixedDocument();
            Table table = new Table();
            int thickness = 1;
            RgbColor borderColor = new RgbColor(0, 0, 0);
            Border b = new Border(thickness, BorderStyle.Single, borderColor);
            table.DefaultCellProperties.Borders = new TableCellBorders(b, b, b, b);
            table.DefaultCellProperties.Padding = new Thickness(2, 2, 2, 2);
            TableRow tableRow = table.Rows.AddTableRow();
            TableCell firstCell = tableRow.Cells.AddTableCell();
            firstCell.PreferredWidth = 200;
            firstCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Bold, "First Name");
            TableCell secondCell = tableRow.Cells.AddTableCell();
            secondCell.PreferredWidth = 200;
            secondCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Bold, "Last Name");
            TableCell thirdCell = tableRow.Cells.AddTableCell();
            thirdCell.PreferredWidth = 100;
            thirdCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Bold, "City");
            tableRow = table.Rows.AddTableRow();
            firstCell = tableRow.Cells.AddTableCell();
            firstCell.PreferredWidth = 200;
            firstCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Normal, "Mickey");
            secondCell = tableRow.Cells.AddTableCell();
            secondCell.PreferredWidth = 200;
            secondCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Normal, "Mouse");
            thirdCell = tableRow.Cells.AddTableCell();
            thirdCell.PreferredWidth = 100;
            thirdCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Italic, FontWeights.Normal, "Disneyland");

            FixedContentEditor fixedEditor = new FixedContentEditor(fixedDocument.Pages.AddPage());
            fixedEditor.Position.Translate(10, 100);
            fixedEditor.DrawTable(table);

            string outputFilePath = @"..\..\output.pdf";
            File.Delete(outputFilePath);
            PdfFormatProvider provider = new PdfFormatProvider();
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(fixedDocument, output);
            }
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });

```

![Table Row Header](images/pdf-table-header-row.png)    

>note For .NET Standard projects, it is necessary to implement a FontsProvider to get the correct font: [Fonts]({%slug radpdfprocessing-cross-platform-fonts%}).

## See Also

* [How to implement FontsProvider]({%slug pdfprocessing-implement-fontsprovider%})
* [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [TableCell]({%slug radpdfprocessing-editing-table-tablecell%})
* [Table]({%slug radpdfprocessing-editing-table-overview%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
