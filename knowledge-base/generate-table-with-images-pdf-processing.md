---
title: How to Generate a Table with Images with PdfProcessing
description: Learn how to generate a table with images with PdfProcessing.
type: how-to
page_title: How to Generate a Table with Images with PdfProcessing
slug: generate-table-with-images-pdf-processing
tags: radpdfprocessing, radfixeddocument, image, height, width, retain
res_type: kb
---

# Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

# Description

Learn how to create a PDF document containing a [Table]({%slug radpdfprocessing-editing-table-overview%}) with [images]({%slug radpdfprocessing-model-image%}).

# Solution

[RadPdfProcessing]({%slug radpdfprocessing-overview%}) is suitable for such a requirement and it allows a convenient API for creating a RadFixedDocument from scratch and populating a table with image content:

Here is an example of how to implement this solution:

```csharp
         static void Main(string[] args)
        {

            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage();
            page.Size = new System.Windows.Size(1800, 1200);
            FixedContentEditor editor = new FixedContentEditor(page);
            int thickness = 3;

            RgbColor bordersColor = new RgbColor(255, 0, 0);
            Border border = new Border(thickness, Telerik.Windows.Documents.Fixed.Model.Editing.BorderStyle.Single, bordersColor);
            TableCellBorders tableCellsBorder = new TableCellBorders(border, border, border, border, null, null);
            Table table = new Table();
            table.Borders = new TableBorders(border);
            table.DefaultCellProperties.Borders = tableCellsBorder;
            table.DefaultCellProperties.Padding = new System.Windows.Thickness(thickness);
            TableRow imgRow = table.Rows.AddTableRow();
            TableCell imgCell;
            Block imageBlock;
            string imagesFolderPath = @"..\..\Images";
            string[] pdfFilePaths = Directory.GetFiles(imagesFolderPath);
            foreach (string imageFilePath in pdfFilePaths)
            {
                imgCell = imgRow.Cells.AddTableCell();
                imgCell.Borders = tableCellsBorder;
                imageBlock = imgCell.Blocks.AddBlock();
                imageBlock.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
                imageBlock.InsertImage(new FileStream(imageFilePath, FileMode.Open));
            }
            imgRow = table.Rows.AddTableRow();
            imgCell = imgRow.Cells.AddTableCell();
            imgCell.ColumnSpan = 3;
            imgCell.Borders = tableCellsBorder;
            imageBlock = imgCell.Blocks.AddBlock();
            imageBlock.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
            imageBlock.InsertImage(new FileStream("Telerik-Document-Processing.png", FileMode.Open));


            double top = 5;
            double left = 5;
            table.Draw(editor, new Rect(left, top, page.Size.Width, page.Size.Height));

            string outputPath = @"..\..\exported.pdf";
            File.Delete(outputPath);
            PdfFormatProvider pdfProvider = new PdfFormatProvider();
            using (Stream output = File.OpenWrite(outputPath))
            {
                pdfProvider.Export(document, output);
            }
            Process.Start(new ProcessStartInfo() { FileName = outputPath, UseShellExecute = true });

        }
```

  ![Table with Images](images/pdf-table-with-images.png)   

# See Also
- [RadPdfProcessing]({%slug radpdfprocessing-overview%}})
- [Table]({%slug radpdfprocessing-editing-table-overview%})
- [Images]({%slug radpdfprocessing-model-image%})

Remember to adjust the code according to your specific requirements and environment.
