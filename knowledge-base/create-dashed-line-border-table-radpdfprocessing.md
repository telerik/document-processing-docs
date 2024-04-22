---
title: Creating a Dashed Line Border for a Table in RadPdfProcessing
description: Learn how to add a dashed line border to a table in RadPdfProcessing.
type: how-to
page_title: Create a Dashed Line Border for a Table in RadPdfProcessing
slug: create-dashed-line-border-table-radpdfprocessing
tags: pdfprocessing, table, border, dash, line
res_type: kb
---
# Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

# Description

Learn how to add a dashed line border in a table using [RadPdfProcessing]({%slug radpdfprocessing-overview%}).

# Solution
To create a dashed line border for a [Table]({%slug radpdfprocessing-editing-table%}) in RadPdfProcessing, you can follow these steps:

1. Set the desired font style properties for the table.
2. Create a `Border` object with the desired thickness, style, and color.
3. Set the `Borders` property of the table's `DefaultCellProperties` to the created `Border` object.
4. Set the `Padding` property of the table's `DefaultCellProperties` to the desired padding values.
5. Add rows and cells to the table and set the preferred width for each cell.
6. Insert text into each cell using the desired font style properties.
7. Use a [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}}) to draw the table on the document page.
8. Specify the desired dashed line style by setting the `StrokeDashArray` property of the `GraphicProperties` of the `FixedContentEditor`.

Here is a sample code snippet that demonstrates how to create a dashed line border for a table in RadPdfProcessing:

![Dashed Table Border](images/pdf-dashed-table-border.png) 

```csharp
FontFamily fFamily = new FontFamily("Verdana");
RadFixedDocument fixedDocument = new RadFixedDocument();
Table table = new Table();
int thickness = 1;
RgbColor borderColor = new RgbColor(255, 0, 0);
Border b = new Border(thickness, BorderStyle.Single, borderColor);    
table.DefaultCellProperties.Borders = new TableCellBorders(b,b,b,b);
table.DefaultCellProperties.Padding = new Thickness(2, 2, 2, 2);        
TableRow r1 = table.Rows.AddTableRow();
TableCell firstCell = r1.Cells.AddTableCell();
firstCell.PreferredWidth = 200;
firstCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.ExtraBold, "Telerik");
TableCell secondCell = r1.Cells.AddTableCell();
secondCell.PreferredWidth = 150;
secondCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Regular, "Document");
TableCell thirdCell = r1.Cells.AddTableCell();
thirdCell.PreferredWidth = 100;
thirdCell.Blocks.AddBlock().InsertText(fFamily, FontStyles.Normal, FontWeights.Bold, "Processing");

FixedContentEditor fixedEditor = new FixedContentEditor(fixedDocument.Pages.AddPage());
fixedEditor.GraphicProperties.IsFilled = true;
fixedEditor.GraphicProperties.StrokeDashArray = new double[] { 2,2};
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

Please note that you can modify the `Borders` property of the `DefaultCellProperties` to specify different border styles for each side of the cell or render a border only at the bottom:
![Bottom Dashed Table Border](images/pdf-bottom-dashed-table-border.png) 

```csharp
table.DefaultCellProperties.Borders = new TableCellBorders(null, null, null,b);
```

## See Also

* [TableCell]({%slug radpdfprocessing-editing-tablecell%})
* [Table]({%slug radpdfprocessing-editing-table%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}})
* [Create Repeating Table Header Row in PdfProcessing]({%slug pdfprocessing-create-repeat-header-row%})


