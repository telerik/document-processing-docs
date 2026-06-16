---
title: Converting WMF Images to PNG in RTF Documents with RadWordsProcessing
description: Learn how to programmatically convert WMF images to PNG within RTF files using RadWordsProcessing.
type: how-to
page_title: How to Convert WMF to PNG in RTF Files Using Telerik Document Processing
slug: convert-wmf-to-png-radwordsprocessing
tags: radwordsprocessing, rtf, wmf, png, image, conversion, document, processing
res_type: kb
ticketid: 1662500
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates how to convert images in WMF format to PNG within an [RTF]({%slug radwordsprocessing-formats-and-conversion-rtf%}) document.

## Solution

To convert WMF images to PNG format within an RTF document using RadWordsProcessing, follow these steps:

1. [Import the RTF file]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%}) as a `RadFlowDocument`.

2. Iterate through the [floating images]({%slug radwordsprocessing-model-floatingimage%}) in the document.

3. Convert each WMF image to PNG format.

4. [Export the modified document]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%}).

The following code snippet demonstrates this process:

```csharp
using System.Diagnostics;
using Telerik.Windows.Documents.Flow.Model;
using Telerik.Windows.Documents.Flow.Model.Shapes;
using Telerik.Windows.Documents.Media;

static void Main(string[] args)
{
    string inputFilePath = "yourfile.rtf";
    Telerik.Windows.Documents.Flow.Model.RadFlowDocument document;

    Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Rtf.RtfFormatProvider();

    using (Stream input = File.OpenRead(inputFilePath))
    {
        document = provider.Import(input);
    }

    ConvertInlineWmfImagesToPng(document);

    string outputFilePath = "converted.rtf";
    File.Delete(outputFilePath);
    using (Stream output = File.Create(outputFilePath))
    {
        provider.Export(document, output);
    }
    Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
}

private static void ConvertInlineWmfImagesToPng(RadFlowDocument document)
{
    foreach (FloatingImage image in document.EnumerateChildrenOfType<FloatingImage>())
    {
        if (image.Image.ImageSource.Extension.Equals("wmf", StringComparison.InvariantCultureIgnoreCase))
        {
            using (MemoryStream wmfImageStream = new MemoryStream(image.Image.ImageSource.Data))
            {
                using (MemoryStream pngImageStream = new MemoryStream())
                {
                    var imageDrawing = System.Drawing.Image.FromStream(wmfImageStream);
                    imageDrawing.Save(pngImageStream, System.Drawing.Imaging.ImageFormat.Png);
                    byte[] pngBytes = pngImageStream.ToArray();

                    image.Image.ImageSource = new ImageSource(pngBytes, "png");
                }
            }
        }
    }
}
```

## Notes

* Add references to all required assemblies and namespaces, particularly those related to Telerik Document Processing and `System.Drawing` for image conversion.
* The code snippet assumes the document contains a WMF image. Images in formats other than WMF are not affected.
* This solution applies to floating images. For inline images, take a similar approach with slight adjustments to target [ImageInline]({%slug radwordsprocessing-model-imageinline%}) instances.

## See Also

* [RadWordsProcessing Documentation]({%slug radwordsprocessing-overview%})
* [RadFlowDocument Overview]({%slug radwordsprocessing-model-radflowdocument%})
* [RtfFormatProvider Documentation]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})
