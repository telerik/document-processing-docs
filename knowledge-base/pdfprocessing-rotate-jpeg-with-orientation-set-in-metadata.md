---
title: Handle the import of JPEG images with orientation set in their metadata different than 0 (normal) | Telerik Document Processing
description: This article shows how to rotate a JPEG image with orientation set in its metadata and then insert it into a RadFixedPage.
type: how-to
page_title: Handle the import of JPEG images with orientation set in their metadata different than 0 (normal)
slug: pdfprocessing-rotate-jpeg-with-orientation-set-in-metadata
position: 0
tags: rotation, orientation, metadata, jpeg, image, exif
res_type: kb
---

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2022.2.620| RadPdfProcessing |[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)| 

## Description

This article shows how to rotate a **JPEG** image with orientation set in its metadata ([EXIF](https://en.wikipedia.org/wiki/Exif) data) and then insert it into a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

EXIF data is useful information about a JPEG image, hidden inside the file`s metadata. When images are photographed, digital cameras use orientation sensors to store an EXIF orientation value for how the camera is held. The same behavior can be observed when using specific image processing software as well.

## Solution

In the following example, we are using the _System.Drawing._**Bitmap** class in order to load a rotated **JPEG** image and then pass it to a helper method to rotate the image according to the appropriate rotation angle. 
After the image is successfully rotated we are inserting it into the **RadFixedPage**.

#### __Insert a JPEG image with orientation set in its metadata into a RadFixedDocument using a helper method__

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

Here is an example of rotating the image according to its EXIF orientation.

#### __The helper method__

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
