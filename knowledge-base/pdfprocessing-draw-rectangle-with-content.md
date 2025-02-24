---
title: Drawing Rectangles with Text and Image Contant with RadPdfProcessing
description: Learn how to draw rectangles with specific styles, add centered text, and images within those rectangles using the RadPdfProcessing library.
type: how-to
page_title: How to Draw Styled Rectangles with Text and Image Content in PDFs with RadPdfProcessing
slug: draw-rectangles-text-images-radpdfprocessing
tags: radpdfprocessing, document processing, rectangles, text, images, drawing, pdf, content, style, format
res_type: kb
ticketid: 1677969
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>RadPdfProcessing for Document Processing</td>
</tr>
</tbody>
</table>

## Description

I have created a block that contains some text and is located at a specific position with a defined size. I need to draw a rectangle at the same position and size, style it with a black stroke and a light blue background, and then place text and an image centered both vertically and horizontally within this rectangle.

This knowledge base article also answers the following questions:
- How can I draw a rectangle and style it using RadPdfProcessing?
- How to add centered text within a rectangle in a PDF document?
- How to insert an image and center it within a rectangle using RadPdfProcessing?

## Solution

To draw a rectangle with a black stroke and a light blue background, add centered text, and insert a centered image within the rectangle using the RadPdfProcessing library, follow these steps:

### Drawing a Rectangle

1. Create a `RectangleGeometry` and define its dimensions.
2. Create a `Path` and set the `RectangleGeometry` to its geometry.
3. Set the `IsFilled` and `IsStroked` properties of the path to true.
4. Specify the `Fill`, `Stroke`, and `StrokeThickness` properties for the path.
5. Add the path to the page content.

```csharp
RectangleGeometry rectangleGeometry = new RectangleGeometry();
rectangleGeometry.Rect = new Rect(100, 100, 100, 300);

Telerik.Windows.Documents.Fixed.Model.Graphics.Path path = new Telerik.Windows.Documents.Fixed.Model.Graphics.Path();
path.Geometry = rectangleGeometry;

path.IsFilled = true;
path.IsStroked = true;

path.Fill = new RgbColor(173, 216, 230); // Light blue
path.Stroke = RgbColors.Black;
path.StrokeThickness = 2;

Page.Content.Add(path);
```

### Adding Centered Text

1. Create a `Block` and insert the text.
2. Apply text and graphic properties as desired.
3. Use a `FixedContentEditor` to draw the block at the desired position and size.

```csharp
Block textBlock = new Block();
textBlock.InsertText("Your text here");
// Apply desired text and graphic properties to textBlock
FixedContentEditor editor = new FixedContentEditor(Page);
editor.Position.Translate(100, 100);
editor.DrawBlock(textBlock, new System.Windows.Size(100, 300));
```

### Inserting a Centered Image

1. Load or create an `ImageSource`.
2. Create an `Image` and set the image source.
3. Use a `FixedContentEditor` to draw the image at the desired position and size.

```csharp
ImageSource imageSource = new ImageSource("path/to/your/image.jpg");
Image image = new Image(imageSource);
// Use FixedContentEditor to draw the image as shown for the text block
```

Following these steps allows you to draw styled rectangles, add centered text, and insert centered images within these rectangles using the RadPdfProcessing library.

## See Also

- [Text and Graphic Properties Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/text-and-graphic-properties)
- [Path Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/path)
- [Geometry Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/geometry)
- [Image Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/image)
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
---
