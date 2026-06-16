---
title: Create Custom JpegImageConverter in .Net Standard
description: Learn how to create a custom implementation of the JpegImageConverterBase abstract class for .NET Standard to convert images to JPEG format in RadPdfProcessing.
type: how-to
page_title: Create custom implementation of JpegImageConverterBase in .Net Standard
slug: create-custom-jpeg-image-converter-net-standard
position: 0
tags: radpdfprocessing, jpeg, converter, image, netstandard, document, processing, extension
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
<td>up to 2023.1.410</td>
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

The **.NET Standard** specification does not define APIs for converting images or scaling their quality. When you insert images in a PDF document in a format different than JPEG and JPEG2000, or with `ImageQuality` different than High, you must implement the `JpegImageConverterBase` abstract class. Pass this implementation to the `JpegImageConverter` property of the `FixedExtensibilityManager`.

>important With the [R2 2023 changes](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/changes-and-backward-compatibility/backward-compatibility#whats-different-in-2023-r2) SkiaSharp replaced ImageSharp as the required dependency.

## Solution

The following code snippets show how to create a custom implementation of the `JpegImageConverterBase` abstract class by using the [SixLabors.ImageSharp](https://github.com/SixLabors/ImageSharp) library and set it to the `JpegImageConverter` property of the `FixedExtensibilityManager`. The ImageSharp library converts the images from one of its supported formats to JPEG and changes their quality if set. This approach is valid up to version 2023.1.410 of RadPdfProcessing.

**Example 1: Create a custom implementation inheriting the JpegImageConverterBase abstract class**

```csharp

        public class CustomJpegImageConverter : JpegImageConverterBase
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
 
```

**Example 2: Set the custom implementation to the JpegImageConverter property of the FixedExtensibilityManager**

```csharp

            JpegImageConverterBase customJpegImageConverter = new CustomJpegImageConverter();
            FixedExtensibilityManager.JpegImageConverter = customJpegImageConverter;

            // RadPdfProcessing version up to 2023.1.410
            PdfFormatProvider provider = new PdfFormatProvider();
            string imageFolderPath = @"..\..\..\images";
            string[] imageFiles = Directory.GetFiles(imageFolderPath);
            RadFixedDocument fixedDocument = new RadFixedDocument();
            RadFixedDocumentEditor documentEditor = new RadFixedDocumentEditor(fixedDocument);
            
            foreach (string imageFilePath in imageFiles)
            {
                FileStream fileStream = new FileStream(imageFilePath, FileMode.Open);
                Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource _imageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(fileStream);
                documentEditor.InsertImageInline(_imageSource);
                documentEditor.InsertLineBreak();
            }
            
            documentEditor.Dispose();      
            string outputFilePath = @"output.pdf";
            File.Delete(outputFilePath);
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(fixedDocument, output);
            }
            
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });

```


## See Also

* [Cross-Platform Images]({%slug radpdfprocessing-cross-platform-images%})
