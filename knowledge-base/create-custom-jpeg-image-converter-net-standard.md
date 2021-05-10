---
title: Create Custom JpegImageConverter in .Net Standard
description: Describes how to create a custom implementation of JpegImageConverterBase in .Net Standard
type: how-to
page_title: Create custom implementation of JpegImageConverterBase in .Net Standard
slug: create-custom-jpeg-image-converter-net-standard
position: 0
tags: image, converter, jpeg, jpegimageconverter, netstandard
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
		<td>2020.2.513</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

**.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to export to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the of **FixedExtensibilityManager**.

## Solution

The following code snippets demonstrates how to create a custom implementation of the JpegImageConverterBase abstract class using the [SixLabors.ImageSharp](https://github.com/SixLabors/ImageSharp) library and set it to the JpegImageConverter property of the FixedExtensibilityManager. We are using the ImageSharp library to convert the images from one of the library's supported formats to Jpeg and to change their quality if it is set.

#### __[C#] Create a custom implementation inheriting the JpegImageConverterBase abstract class__

{{region kb-create-custom-jpeg-image-converter1}}

	internal class CustomJpegImageConverter : JpegImageConverterBase
    {
        public override bool TryConvertToJpegImageData(byte[] imageData, ImageQuality imageQuality, out byte[] jpegImageData)
        {
            string[] imageSharpImageFormats = new string[] { "jpeg", "bmp", "png", "gif" };
            string imageFormat;

            if (this.TryGetImageFormat(imageData, out imageFormat) && imageSharpImageFormats.Contains(imageFormat.ToLower()))
            {
                using (Image imageSharp = Image.Load(imageData))
                {
                    imageSharp.Mutate(x => x.BackgroundColor(Color.White));

                    JpegEncoder options = new JpegEncoder
                    {
                        Quality = (int)imageQuality,
                    };

                    using (MemoryStream ms = new MemoryStream())
                    {
                        image.SaveAsJpeg(ms, options);

                        jpegImageData = ms.ToArray();
                    }
                }

                return true;
            }

            jpegImageData = null;
            return false;
        }
    }
 
{{endregion}}

#### __[C#] Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager__

{{region kb-create-custom-jpeg-image-converter2}}

	JpegImageConverterBase customJpegImageConverter = new CustomJpegImageConverter(); 
	FixedExtensibilityManager.JpegImageConverter = customJpegImageConverter; 
{{endregion}}
