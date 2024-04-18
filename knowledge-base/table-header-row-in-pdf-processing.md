---
title: How to Achieve Table Header Row in PdfProcessing
description: Learn how to simulate table header row in PdfProcessing.
type: how-to
page_title: How to Achieve a Table Header Row in PdfProcessing
slug: table-header-row-in-pdf-processing
tags: pdf, table, header, row, bold
res_type: kb
---
# Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

RadPdfProcessing allows you to create Tables. A common requirement is to have a header row for the table. This articles how to simulates such functionality.

## Solution
Table header row can be added as a standard TableRow with bold text. 

````           Table companyTable = new Table();
                Border b1 = new Border(2, new RgbColor( 255, 0, 0));
                companyTable.DefaultCellProperties.Borders = new TableCellBorders(b1, b1, b1, b1);
                companyTable.DefaultCellProperties.Padding = new Thickness(2, 2, 2, 2);
                companyTable.Margin = new Thickness(0, 20, 2, 15);
                companyTable.LayoutType = TableLayoutType.FixedWidth;
               
                TableRow r1 = companyTable.Rows.AddTableRow();  
                TableCell firstCell = r1.Cells.AddTableCell();
                firstCell.PreferredWidth = 300;
                firstCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.ExtraBold, "CompanyName:");
                TableCell secondCell = r1.Cells.AddTableCell();
                secondCell.PreferredWidth = 200;
                secondCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Regular, "ProductName:");
                TableCell thirdCell = r1.Cells.AddTableCell();
                thirdCell.PreferredWidth = 150;
                thirdCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Bold, "Status: ");

                TableRow r2 = companyTable.Rows.AddTableRow();
                r2.Cells.AddTableCell().Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Regular, "Progress");
                r2.Cells.AddTableCell().Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Regular, string.Empty);
                string StatusNotes = "Closed on " + DateTime.Now.ToString("MM/dd/yyyy");
                r2.Cells.AddTableCell().Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Regular, StatusNotes);

                editor.InsertTable(companyTable);
```

## See Also
- [Drawing Table with RadFixedDocumentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/pdf-structure/table-drawing/draw-table-radfixeddocumenteditor)
- [Drawing Table with FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/pdf-structure/table-drawing/draw-table-fixedcontenteditor)
- [How to Implement FontsProvider](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/common/pdf-fonts/fonts-provider)
- [How to Generate a PDF Document from Images with FixedContentEditor](https://www.telerik.com/support/kb/pdf-processing/details/generate-pdf-document-from-images-with-fixed-content-editor)
- [How to Generate a PDF Document from Images with RadFixedDocumentEditor](https://www.telerik.com/support/kb/pdf-processing/details/generate-pdf-document-from-images-with-radfixeddocumenteditor)
- [Standard Fonts](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/usage/fonts/standard-fonts)
