---
title: How to Fit Graphics to Frames
description: Learn how to fit graphics and images to predefined frames using the FixedContentEditor API in Telerik RadPdfProcessing with proportional and stretch fitting options.
type: how-to
page_title: How to Fit Graphics
slug: how-to-fit-graphics-to-frames
position: 0
tags: radpdfprocessing, pdf, image, graphics, frame, document, processing, fixed
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.1.118</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article shows how to fit images to frames (predefined shapes, or in this case a square with a side length of 90) or vice versa.

## Solution

Use the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) API to achieve this. The following four scenarios demonstrate different fitting approaches:

* Fit Content Proportionally
* Fit Content To Frame (or Stretch fit)
* Fill Frame Proportionally (or Center fit)
* Fit Frame to Content

The following example demonstrates how to fit the image in a square without changing the image aspect ratio.

**Example 1: Fit Content Proportionally**

```csharp

    double squareSide = 90;

    FixedContentEditor editor = new FixedContentEditor(document.Pages.AddPage());
    editor.DrawText("Fit Content Proportionally");
    editor.Position.Translate(0, 20);
    using (Stream sampleImage = File.OpenRead("image.jpg"))
    {
        Block block = new Block();
        block.InsertImage(sampleImage);
        Size imageSize = block.Measure();
        using (editor.SavePosition())
        {
            double largestSide = imageSize.Width > imageSize.Height ? imageSize.Width : imageSize.Height;
            double scaleFactor = squareSide / largestSide;
            editor.Position.Scale(scaleFactor, scaleFactor);
            editor.DrawBlock(block);
        }
    }
	
```

The following example demonstrates how to stretch the image in a square (the image aspect ratio changes).

**Example 2: Fit Content to Frame**

```csharp

    double squareSide = 90;
    
    FixedContentEditor editor = new FixedContentEditor(document.Pages.AddPage());
    editor.DrawText("Fit Content To Frame");
    editor.Position.Translate(0, 20);
    using (Stream sampleImage = File.OpenRead("image.jpg"))
    {
        Block block = new Block();
        block.InsertImage(sampleImage, squareSide, squareSide);
        editor.DrawBlock(block);
    }
 
```

The following example demonstrates how to crop the image to fill a square without changing the image aspect ratio.

**Example 3: Fill Frame Proportionally**

```csharp

    double squareSide = 90;

    RadFixedPage page = document.Pages.AddPage();
    FixedContentEditor editor = new FixedContentEditor(page);
    editor.DrawText("Fill Frame Proportionally");
    editor.Position.Translate(0, 20);
    using (Stream sampleImage = File.OpenRead("image.jpg"))
    {
        Block block = new Block();
        block.InsertImage(sampleImage);
        Size imageSize = block.Measure();
        using (editor.SavePosition())
        {
            double smallestSide = imageSize.Width < imageSize.Height ? imageSize.Width : imageSize.Height;
            double scaleFactor = squareSide / smallestSide;
            editor.Position.Scale(scaleFactor, scaleFactor);
            editor.DrawBlock(block);
            Image image = page.Content[page.Content.Count - 1] as Image;

            Point clippingOffset = editor.Position.Matrix.Transform(new Point());

            if (imageSize.Width == smallestSide)
            {
                clippingOffset.Offset(0, imageSize.Height * scaleFactor / 2 - squareSide / 2);
            }
            else
            {
                clippingOffset.Offset(imageSize.Width * scaleFactor / 2 - squareSide / 2, 0);
            }

            image.Clipping = new Clipping()
            {
                Clip = new RectangleGeometry(new Rect(clippingOffset.X, clippingOffset.Y, squareSide, squareSide)),
            };
        }
    }
 
```

In the last scenario, the code finds the smallest side of the image and uses it to calculate the scale factor. It then calculates the offset used to create an image [Clipping]({%slug radpdfprocessing-concepts-clipping%}) with the desired size.


The following example demonstrates how to insert an image in its original size.

**Example 4: Fit Frame to Content**

```csharp

    FixedContentEditor editor = new FixedContentEditor(document.Pages.AddPage());
    editor.DrawText("Fit Frame To Content");
    editor.Position.Translate(0, 20);
    using (Stream sampleImage = File.OpenRead("image.jpg"))
    {
        Block block = new Block();
        block.InsertImage(sampleImage);
        Size imageSize = block.Measure();
        editor.DrawBlock(block);
    }
 
```
