---
title: Adding a .HEIC Image to PDF Documents in PdfProcessing
description: Learn how to convert .HEIC images before adding them to PDF documents using Telerik Document Processing libraries.
type: how-to
page_title: Adding a .HEIC Image to PDF Documents in PdfProcessing
meta_title: Adding a .HEIC Image to PDF Documents in PdfProcessing
slug: convert-heic-images-to-jpg
tags: pdf, processing, telerik, document, heic, image, convert
res_type: kb
ticketid: 1710179
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.210| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|.NET (Target OS: Windows) or .NET Framework|Target Framework||
|14.10.3|Magick.NET||

## Description

**.HEIC** images are not natively supported by RadPdfProcessing. The library supports JPEG, JPEG2000, and PNG formats for image insertion into PDF documents. To handle HEIC images in your PDF document, you need to convert them to a supported format (JPEG or PNG) before adding them to the PDF. This article shows a sample approach how to do the conversion from HEIC to JPG image format.

## Solution

Use an external library or tool to convert HEIC files to JPEG or PNG. For .NET, libraries such as ImageMagick or SixLabors.ImageSharp can perform this conversion.

1. Install `Magick.NET-Q16-AnyCPU`  (version 14.10.3)  via NuGet for HEIC conversion.
1. Implement the custom logic for converting .HEIC images to JPG.
1. Add a check for the image format before processing. If the image is HEIC, convert it to JPEG or PNG first, then proceed as usual to add it to the PDF.

```csharp

        /// <summary>
        /// If input is HEIC/HEIF, converts to JPG or PNG and returns the output path.
        /// Otherwise returns the original input path.
        /// </summary>
        /// <param name="receiptImagePath">Path to the source image.</param>
        /// <param name="outputDirectory">Optional directory for converted output; defaults to input directory.</param>
        /// <param name="targetFormat">"jpg" or "png". Defaults to "jpg".</param>
        /// <returns>Path to the converted file (if HEIC) or the original path (if not HEIC).</returns>
        public static string ConvertHeicToJpegOrPng(string receiptImagePath= "sample1.heic", string? outputDirectory = @"..\..\", string targetFormat = "jpg")
        {
            // This implementation requires installing Magick.NET-Q16-AnyCPU (version 14.10.3) via NuGet

            if (string.IsNullOrWhiteSpace(receiptImagePath))
                throw new ArgumentException("Input path is null or empty.", nameof(receiptImagePath));
            if (!File.Exists(receiptImagePath))
                throw new FileNotFoundException("Input image not found.", receiptImagePath);

            targetFormat = targetFormat.Trim().ToLowerInvariant();
            if (targetFormat != "jpg" && targetFormat != "jpeg" && targetFormat != "png")
                throw new ArgumentOutOfRangeException(nameof(targetFormat), "targetFormat must be 'jpg' or 'png'.");

            if (!IsHeic(receiptImagePath))
            {
                // Not HEIC – just return the original path.
                return receiptImagePath;
            }

            // Determine output path
            var dir = string.IsNullOrWhiteSpace(outputDirectory)
                ? Path.GetDirectoryName(receiptImagePath)!
                : outputDirectory;
            Directory.CreateDirectory(dir);

            var baseName = Path.GetFileNameWithoutExtension(receiptImagePath);
            var ext = (targetFormat == "png") ? ".png" : ".jpg";
            var outputPath = Path.Combine(dir, baseName+ext);

            // Convert using Magick.NET
            using (var image = new MagickImage(receiptImagePath))
            {
                if (targetFormat == "png")
                {
                    image.Format = MagickFormat.Png;
                    // Optional: tune PNG compression/quality
                    image.Settings.SetDefine(MagickFormat.Png, "compression-filter", "5");
                    image.Quality = 95; // Not heavily used for PNG, but safe
                }
                else
                {
                    image.Format = MagickFormat.Jpeg;
                    image.Quality = 92; // Good balance for receipts/photos
                                        // Optional: strip metadata to reduce size
                    image.Strip();
                }
                image.Write(outputPath);
            }
            File.WriteAllBytes(outputPath, File.ReadAllBytes(outputPath)); // Ensure file is fully written and accessible
            return outputPath;
        }

        /// <summary>
        /// Heuristically determines if the file is HEIC/HEIF by header and extension.
        /// </summary>
        private static bool IsHeic(string path)
        {
            // Quick extension check
            var ext = Path.GetExtension(path).ToLowerInvariant();
            if (ext is ".heic" or ".heif" or ".heifs" or ".heix" or ".hevc")
                return true;

            // Magic bytes check (ISO Base Media File: look for 'ftyp....' brands)
            try
            {
                using var fs = File.OpenRead(path);
                // Read first 64 bytes (enough to cover ftyp box and major brand)
                Span<byte> header = stackalloc byte[64];
                int read = fs.Read(header);
                if (read < 12) return false;

                // Look for "ftyp" then brand tokens
                var headerStr = System.Text.Encoding.ASCII.GetString(header[..read]);
                if (!headerStr.Contains("ftyp", StringComparison.Ordinal))
                    return false;

                // Common HEIF brands
                string[] brands = { "heic", "heix", "hevc", "hevs", "mif1", "msf1" };
                foreach (var b in brands)
                {
                    if (headerStr.Contains("ftyp" + b, StringComparison.Ordinal))
                        return true;
                }
            }
            catch
            {
                // If header read fails, fall back to extension result (already checked)
            }

            return false;
        }

```

## See Also
- [Images in PdfProcessing]({%slug radpdfprocessing-model-image%})

