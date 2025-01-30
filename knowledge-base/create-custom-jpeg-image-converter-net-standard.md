---
title: Create Custom JpegImageConverter in .Net Standard
description: Describes how to create a custom implementation of JpegImageConverterBase in .Net Standard.
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
<td>up to 2023.1.315</td>
<td>RadPdfProcessing</td>
<td rowspan="2" ><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
</tr>
<tr>
<td>2.1.6</td>
<td>ImageSharp</td>
</tr>
</tbody>
</table>

## Description

**.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to export to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the **FixedExtensibilityManager**.

>important With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

## Solution

The following code snippets demonstrate how to create a custom implementation of the JpegImageConverterBase abstract class using the [SixLabors.ImageSharp](https://github.com/SixLabors/ImageSharp) library and set it to the JpegImageConverter property of the FixedExtensibilityManager. We are using the ImageSharp library to convert the images from one of the library's supported formats to Jpeg and to change their quality if it is set.

#### __[C#] Create a custom implementation inheriting the JpegImageConverterBase abstract class__

{{region kb-create-custom-jpeg-image-converter1}}

	internal class CustomJpegImageConverter : JpegImageConverterBase
    {
        public override bool TryConvertToJpegImageData(byte[] imageData, ImageQuality imageQuality, out byte[] jpegImageData)
        {
            try
            {
                IImageFormat imageFormat;
                using (SixLabors.ImageSharp.Image image = SixLabors.ImageSharp.Image.Load(imageData, out imageFormat))
                {
                    if (imageFormat.GetType() == typeof(PngFormat))
                    {
                        image.Mutate(x => x.BackgroundColor(Color.White));
                    }

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
            catch (Exception ex)
            {
                if (ex is UnknownImageFormatException || ex is ImageProcessingException)
                {
                    jpegImageData = null;
                    return false;
                }
                else
                {
                    throw ex;
                }
            }
        }
    }
 
{{endregion}}

#### __[C#] Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager__

{{region kb-create-custom-jpeg-image-converter2}}

       JpegImageConverterBase customJpegImageConverter = new CustomJpegImageConverter();
       FixedExtensibilityManager.JpegImageConverter = customJpegImageConverter;


       // RadPdfProcessing version 2023.1.307
       PdfFormatProvider provider = new PdfFormatProvider();
       provider.ExportSettings.ImageQuality = ImageQuality.High;
       provider.ExportSettings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.FlateDecode };
       RadFixedDocument document;
       string input = "input.pdf";
       using (Stream stream = File.OpenRead(input))
       {
           document = provider.Import(stream);
       }

       string outputFilePath = "output.pdf";
       File.Delete(outputFilePath);
       using (Stream output = File.OpenWrite(outputFilePath))
       {
           provider.Export(document, output);
       }
       Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });

{{endregion}}


# See Also

- [Cross platform >> Images]({%slug radpdfprocessing-cross-platform-images%})
