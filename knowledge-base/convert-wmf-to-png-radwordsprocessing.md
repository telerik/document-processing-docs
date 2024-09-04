---
title: Converting WMF Images to PNG in RTF Documents with RadWordsProcessing
description: Learn how to programmatically convert WMF images to PNG within RTF files using RadWordsProcessing.
type: how-to
page_title: How to Convert WMF to PNG in RTF Files Using Telerik Document Processing
slug: convert-wmf-to-png-radwordsprocessing
tags: wordsprocessing, rtf, wmf, png, document, processing, image, conversion
res_type: kb
ticketid: 1662500
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadWordsProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates a sample approach how to convert the images in WMF format to PNG within an [RTF]({%slug radwordsprocessing-formats-and-conversion-rtf%}) document.

## Solution

To convert WMF images to PNG format within an RTF document using RadWordsProcessing, follow these steps:

1. [Import the RTF file](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/rtf/rtfformatprovider#import) as a `RadFlowDocument`.

2. Iterate through the [floating images]({%slug radwordsprocessing-model-floatingimage%}) in the document.

3. Convert each WMF image to PNG format.

4. [Export the modified document](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/rtf/rtfformatprovider#export).

Here is a sample code snippet demonstrating this process:

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

### Notes

- Ensure you have referenced all necessary assemblies and namespaces, particularly those related to Telerik Document Processing and System.Drawing for image conversion.
- The code snippet assumes the presence of a WMF image in the document. If your document contains images in formats other than WMF, they won't be affected.
- This solution applies to floating images. For inline images, a similar approach can be taken with slight adjustments to target [InlineImage]({%slug radwordsprocessing-model-imageinline%}) instances if necessary.

## See Also

- [RadWordsProcessing Documentation]({%slug radwordsprocessing-overview%})
- [RadFlowDocument Overview]({%slug radwordsprocessing-model-radflowdocument%})
- [RtfFormatProvider Documentation]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})
