---
title: How to Fit Graphics to Frames
description: How to Fit Graphics
type: how-to
page_title: How to Fit Graphics
slug: how-to-fit-graphics-to-frames
position: 0
tags: pdf, image, graphic, frame
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

How to fit graphics to frames or vice versa.

## Solution

This functionality could be achieved by using the [FixedContentEditor](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/fixedcontenteditor) API. Below are demonstrated the following four different scenarios:

* Fit Content Proportionally
* Fit Frame to Content
* Fit Content To Frame
* Fill Frame Proportionally

For the purposes of the demonstration, we use the side of а square (squareSide) to describe the frame. 

#### __[C#] Fit Content Proportionally__

{{region kb-how-to-fit-graphics-to-frames1}}

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
	
{{endregion}}

#### __[C#] Fit Frame to Content__

{{region kb-how-to-fit-graphics-to-frames2}}

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
 
{{endregion}}

#### __[C#] Fit Content To Frame__

{{region kb-how-to-fit-graphics-to-frames3}}

    FixedContentEditor editor = new FixedContentEditor(document.Pages.AddPage());
    editor.DrawText("Fit Content To Frame");
    editor.Position.Translate(0, 20);
    using (Stream sampleImage = File.OpenRead("image.jpg"))
    {
        Block block = new Block();
        block.InsertImage(sampleImage, squareSide, squareSide);
        editor.DrawBlock(block);
    }
 
{{endregion}}

#### __[C#] Fill Frame Proportionally__

{{region kb-how-to-fit-graphics-to-frames4}}

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
 
{{endregion}}

In the last scenario, we are finding the smallest side of the image and use it to calculate the factor which we are using to scale the position. After that, we are calculating the offset that we are going to use to create an image [Clipping](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/clipping) with the desired size. 
