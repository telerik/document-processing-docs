---
title:  Adding an Image Border in PdfProcessing
description: Learn how to draw borders around images in the Telerik PdfProcessing library.
type: how-to
page_title: Drawing Borders for Images in Telerik PdfProcessing
meta_title: Drawing Borders for Images in Telerik PdfProcessing
slug: pdf-image-border
tags: pdf,processing,telerik, document ,image,export,border
res_type: kb
ticketid: 1698380
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to add borders around [images]({%slug radpdfprocessing-model-image%}) in the generated PDF document.

## Solution

To draw borders around images follow one of the approaches below:

### Approach 1: Using a Table with Borders

Insert a table with a single [TableCell]({%slug radpdfprocessing-editing-table-tablecell%}) and put the image in the cell:

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage(); 
FixedContentEditor editor = new FixedContentEditor(page);
int thickness = 3;

RgbColor bordersColor = new RgbColor(255, 0, 0);
Border border = new Border(thickness, Telerik.Windows.Documents.Fixed.Model.Editing.BorderStyle.Single, bordersColor);
TableCellBorders tableCellsBorder = new TableCellBorders(border, border, border, border, null, null);
Table table = new Table();
table.Borders = new TableBorders(border);
table.DefaultCellProperties.Borders = tableCellsBorder;
TableRow imgRow = table.Rows.AddTableRow();
TableCell imgCell = imgRow.Cells.AddTableCell();
imgCell.Borders = tableCellsBorder;
Block imageBlock = imgCell.Blocks.AddBlock();
imageBlock.HorizontalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment.Center;
imageBlock.InsertImage(new FileStream("banner.png", FileMode.Open));

table.Draw(editor, new Rect(5, 5, page.Size.Width, page.Size.Height));

PdfFormatProvider pdfProvider = new PdfFormatProvider();
using (Stream output = File.OpenWrite(@"..\..\exported.pdf"))
{
    pdfProvider.Export(document, output);
}
``` 

![Using a Table with Borders ><](images/image-table-cell-border.png)    

### Approach 2: Using FixedContentEditor to Draw a Rectangle Border

An alternative approach is to draw a rectangular border around an image in a PDF using RadPdfProcessing, you can use the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) to draw both the image and the rectangle:

```csharp
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();
FixedContentEditor editor = new FixedContentEditor(page);

double thickness = 3; 
double x = 10; 
double y = 10; 
double width = 150; 
double height = 150; 
string imagePath = "banner.png";

// Determine image dimensions
using (FileStream fs = new FileStream(imagePath, FileMode.Open, FileAccess.Read))
{
    using (var img = System.Drawing.Image.FromStream(fs, false, false))
    {
        width = img.Width;
        height = img.Height;
    }
}

// Draw rectangle border
editor.Position.Translate(x - thickness, y - thickness);
editor.SaveGraphicProperties();
editor.GraphicProperties.StrokeColor = new RgbColor(255, 0, 0);
editor.GraphicProperties.StrokeThickness = thickness;
editor.DrawRectangle(new Rect(0, 0, width + thickness * 2, height + thickness * 2));
editor.RestoreGraphicProperties();

// Draw image
using (FileStream fs = new FileStream(imagePath, FileMode.Open, FileAccess.Read))
{
    editor.Position.Translate(x, y);
}

PdfFormatProvider pdfProvider = new PdfFormatProvider();
using (Stream output = File.OpenWrite(@"..\..\exported.pdf"))
{
    pdfProvider.Export(document, output);
}
```

![Using a FixedContentEditor to Draw the Image Border ><](images/image-fixedcontenteditor-border.png)   

## See Also
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) 
- [TableCell]({%slug radpdfprocessing-editing-table-tablecell%})
- [Images]({%slug radpdfprocessing-model-image%}) 
