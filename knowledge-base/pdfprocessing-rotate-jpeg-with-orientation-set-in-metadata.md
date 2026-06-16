---
title: Handle the import of JPEG images with orientation set in their metadata different than 0 (normal) | Telerik Document Processing
description: Learn how to rotate a JPEG image based on its EXIF orientation metadata and insert it into a RadFixedPage with the RadPdfProcessing library.
type: how-to
page_title: Handle the import of JPEG images with orientation set in their metadata different than 0 (normal)
slug: pdfprocessing-rotate-jpeg-with-orientation-set-in-metadata
position: 0
tags: radpdfprocessing, pdf, jpeg, image, rotation, metadata, document, processing
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2022.2.620| RadPdfProcessing |[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)| 

## Description

This article shows how to rotate a JPEG image with orientation set in its metadata ([EXIF](https://en.wikipedia.org/wiki/Exif) data) and then insert it into a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

EXIF data is useful information about a JPEG image, hidden inside the file's metadata. When images are photographed, digital cameras use orientation sensors to store an EXIF orientation value for how the camera is held. The same behavior occurs when you use specific image processing software.

## Solution

The following example uses the `System.Drawing.Bitmap` class to load a rotated JPEG image and then passes it to a helper method that rotates the image to the appropriate angle. After the image is rotated, insert it into the `RadFixedPage`.

**Example 1: Insert a JPEG Image with Orientation Set in Its Metadata into a RadFixedDocument**

```csharp
string imagePath = "Progress_DevCraft_rotated.jpg";
Image bitmap = new Bitmap(imagePath);
Image rotatedBitmap = ExifRotate(bitmap);

MemoryStream ms = new MemoryStream();
rotatedBitmap.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);

ImageSource imageSource = new ImageSource(ms);

var image = new Telerik.Windows.Documents.Fixed.Model.Objects.Image
{
    ImageSource = imageSource
};

RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();
page.Content.Add(image);
```

The following example rotates the image according to its EXIF orientation:

**Example 2: The Helper Method**

```csharp
public static Image ExifRotate(Image img)
{
    int exifOrientationID = 0x0112;

    if (!img.PropertyIdList.Contains(exifOrientationID))
    {
        return img;
    }

    var prop = img.GetPropertyItem(exifOrientationID);
    int val = BitConverter.ToUInt16(prop.Value, 0);
    RotateFlipType rot = RotateFlipType.RotateNoneFlipNone;

    if (val == 3 || val == 4)
    {
        rot = RotateFlipType.Rotate180FlipNone;
    }
    else if (val == 5 || val == 6)
    {
        rot = RotateFlipType.Rotate90FlipNone;
    }
    else if (val == 7 || val == 8)
    {
        rot = RotateFlipType.Rotate270FlipNone;
    }

    if (val == 2 || val == 4 || val == 5 || val == 7)
    {
        rot |= RotateFlipType.RotateNoneFlipX;
    }

    if (rot != RotateFlipType.RotateNoneFlipNone)
    {
        img.RotateFlip(rot);
    }

    return img;
}
```

## See Also

* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
