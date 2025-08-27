---
title: Converting WEBP Images to PNG in HTML Documents using Telerik WordsProcessing
description: Learn how to handle converting .webp format images in DOCX files using Telerik WordsProcessing when importing HTML content.
type: how-to
page_title: Converting WEBP Images to PNG in HTML Documents using Telerik WordsProcessing
meta_title: Converting WEBP Images to PNG in HTML Documents using Telerik WordsProcessing
slug: convert-webp-to-png-radwordsprocessing
tags: words,processing, telerik,document, image, webp, html,import, docx,export
res_type: kb
ticketid: 1695863
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The current implementation of Telerik Document Processing libraries is not intended to process `.webp` format images when importing HTML content and exporting the output using [RadWordsProcessing]({%slug radwordsprocessing-overview%}). This article shows how to convert `.webp` images to the [supported formats]({%slug radwordsprocessing-model-imageinline%}) like PNG in Telerik WordsProcessing.

## Solution

To handle `.webp` images, convert them to a supported format like `.png`. Follow the steps below:

1. Install the `SixLabors.ImageSharp` NuGet package for image conversion.

2. Import the HTML content using [HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%}).

3. Iterate through the images in the document and convert `.webp` images to `.png` format.

4. Replace the `.webp` image sources with the converted `.png` sources.

5. Export the document to [DOCX]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}).

Here is the complete implementation:

```csharp
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Editing;
using Telerik.Windows.Documents.Flow.FormatProviders.Docx;
using Telerik.Windows.Documents.Flow.FormatProviders.Html;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Png;
using System.IO;
using System.Diagnostics;

// Import HTML content
RadFlowDocument document = new RadFlowDocument();
DocxFormatProvider docxProvider = new DocxFormatProvider();
HtmlFormatProvider htmlFormatProvider = new HtmlFormatProvider();

string path = "sample.html";
using (Stream stream = File.Open(path, FileMode.Open, FileAccess.Read))
{
    document = htmlFormatProvider.Import(stream, new TimeSpan(0, 0, 60));
}

// Convert inline Webp images to PNG
ConvertInlineWebpImagesToPng(document);

void ConvertInlineWebpImagesToPng(RadFlowDocument document)
{
    foreach (ImageInline imageInline in document.EnumerateChildrenOfType<ImageInline>())
    {
        if (imageInline.Image.ImageSource.Extension.Equals("webp", StringComparison.InvariantCultureIgnoreCase))
        {
            using (MemoryStream webpStream = new MemoryStream(imageInline.Image.ImageSource.Data))
            {
                using var image = SixLabors.ImageSharp.Image.Load(webpStream);
                using var pngImageStream = new MemoryStream();
                image.Save(pngImageStream, new PngEncoder());
                imageInline.Image.ImageSource = new ImageSource(pngImageStream.ToArray(), "png");
            }
        }
    }
}

// Export the document to DOCX
string outputFilePath = "result.docx";
using var ms = new MemoryStream();
docxProvider.Export(document, ms, new TimeSpan(0, 0, 60));
File.WriteAllBytes(outputFilePath, ms.ToArray());

// Open the resulting DOCX
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

## See Also

- [Supported Image Formats]({%slug radwordsprocessing-model-imageinline%})
- [RadWordsProcessing]({%slug radwordsprocessing-overview%})
