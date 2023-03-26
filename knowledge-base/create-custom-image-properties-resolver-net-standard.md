---
title: Create Custom ImagePropertiesResolver in .Net Standard
description: Describes how to create a custom implementation of ImagePropertiesResolver in .Net Standard.
type: how-to
page_title: Create custom implementation of ImagePropertiesResolverBase in .Net Standard
slug: create-custom-image-properties-resolver-net-standard
position: 0
tags: image, resolver, jpeg, imagepropertiesresolver, netstandard
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
		<td>2023.1.315</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/yoan-karamanov">Yoan Karamanov</a></td>
	</tr>
</tbody>
</table>

## Description

**.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to export to PDF format a document containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **ImagePropertiesResolver** abstract class. This property enables you to set a resolver implementation that can parse the image raw data to separate its colors and alpha channel. This implementation should be passed to the **ImagePropertiesResolver** property of the of **FixedExtensibilityManager**.

## Solution

The following code snippets demonstrates how to create a custom implementation of the ImagePropertiesResolver abstract class using the [SixLabors.ImageSharp](https://github.com/SixLabors/ImageSharp) library and set it to the ImagePropertiesResolver property of the FixedExtensibilityManager.

#### __[C#] Create a custom implementation inheriting the ImagePropertiesResolverBase abstract class__

{{region kb-create-custom-image-properties-resolver1}}
public class ImagePropertiesResolver : ImagePropertiesResolverBase
{
    public override TelerikSize GetImageSize(byte[] imageData)
    {
        TelerikSize size = TelerikSize.Empty;
        try
        {
            using (ImageSharp image = ImageSharp.Load(imageData))
            {
                size = new TelerikSize(image.Width, image.Height);
            }
        }
        catch (UnknownImageFormatException ex)
        {
            // Image format not recognized.
            throw new NotSupportedException("Unsupported image format.", ex);
        }

        return size;
    }

    public override bool TryGetRawImageData(byte[] imageData, out byte[] rawRgbData, out byte[] rawAlpha, out TelerikSize size)
    {
        try
        {
            IImageFormat imageFormat;
            using (ImageSharp image = ImageSharp.Load(imageData, out imageFormat))
            {
                size = new TelerikSize(image.Width, image.Height);

                IImageDecoder decoder = null;
                Dictionary<Type, Action> decoderSwitch = new Dictionary<Type, Action>
                    {
                        { typeof(PngFormat), () => decoder = new PngDecoder() },
                        { typeof(BmpFormat), () => decoder = new BmpDecoder() },
                        { typeof(GifFormat), () => decoder = new GifDecoder() },
                        { typeof(JpegFormat), () => decoder = new JpegDecoder() },
                        { typeof(PbmFormat), () => decoder = new PbmDecoder() },
                        { typeof(TgaFormat), () => decoder = new TgaDecoder() },
                        { typeof(TiffFormat), () => decoder = new TiffDecoder() },
                        { typeof(WebpFormat), () => decoder = new WebpDecoder() },
                    };

                if (decoderSwitch.ContainsKey(imageFormat.GetType()))
                {
                    decoderSwitch[imageFormat.GetType()]();
                }
                else
                {
                    rawRgbData = null;
                    rawAlpha = null;

                    return false;
                }

                Configuration configuration = new Configuration();
                ImageSharp decodedImage = decoder.Decode(configuration, new MemoryStream(imageData));

                ImageFrame frame = decodedImage.Frames[0];

                ImageFrame<Rgb24> frameRgb24 = frame as ImageFrame<Rgb24>;
                if (frameRgb24 != null)
                {
                    GetRawDataFromRgbSource(frameRgb24, out rawRgbData);
                    rawAlpha = null;

                    return true;
                }

                ImageFrame<Rgba32> frameRgba32 = frame as ImageFrame<Rgba32>;
                if (frameRgba32 != null)
                {
                    GetRawDataFromRgbaSource(frameRgba32, out rawRgbData, out rawAlpha);

                    return true;
                }

                throw new NotSupportedException("Not supported image pixel format.");
            }
        }
        catch (Exception ex)
        {
            if (ex is UnknownImageFormatException || ex is ImageProcessingException)
            {
                rawRgbData = null;
                rawAlpha = null;
                size = new TelerikSize();

                return false;
            }
            else
            {
                throw ex;
            }
        }
    }

    private static void GetRawDataFromRgbSource(ImageFrame<Rgb24> source, out byte[] data)
    {
        byte[] pixels = new byte[source.PixelBuffer.Width * source.PixelBuffer.Height * 3];
        Span<byte> span = new Span<byte>(pixels);
        source.CopyPixelDataTo(span);
        data = span.ToArray();
    }

    private static void GetRawDataFromRgbaSource(ImageFrame<Rgba32> source, out byte[] data, out byte[] alpha)
    {
        byte[] pixels = new byte[source.PixelBuffer.Width * source.PixelBuffer.Height * 4];
        Span<byte> span = new Span<byte>(pixels);
        source.CopyPixelDataTo(span);

        data = new byte[source.PixelBuffer.Width * source.PixelBuffer.Height * 3];
        alpha = new byte[source.PixelBuffer.Width * source.PixelBuffer.Height];
        bool shouldExportAlpha = false;

        for (int i = 0; i < pixels.Length; i += 4)
        {
            byte r = pixels[i];
            byte g = pixels[i + 1];
            byte b = pixels[i + 2];
            byte a = pixels[i + 3];

            data[3 * i / 4] = r;
            data[3 * i / 4 + 1] = g;
            data[3 * i / 4 + 2] = b;
            alpha[i / 4] = a;

            if (a != 255)
            {
                shouldExportAlpha = true;
            }
        }

        if (!shouldExportAlpha)
        {
            alpha = null;
        }
    }
}
{{endregion}}

#### __[C#] Set the custom implementation to the ImagePropertiesResolver property of the FixedExtensibilityManager__

{{region kb-create-custom-image-properties-resolver2}}

	ImagePropertiesResolver customImagePropertiesResolver  = new ImagePropertiesResolver(); 
	FixedExtensibilityManager.ImagePropertiesResolver = customImagePropertiesResolver; 
{{endregion}}