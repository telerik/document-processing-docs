---
title: Copying Images from RadFixedDocument to Windows Clipboard
description: Learn how to extract and copy multiple images from a PDF to the Windows clipboard and paste them into MS Word as a single instance.
type: how-to
page_title: Extracting Images from PDF and Copying Them to Clipboard for MS Word
slug: extract-images-radfixeddocument-windows-clipboard-to-ms-word
tags: pdf, clipboard, images, extraction, html, windows, word, radfixeddocument, document, processing
res_type: kb
ticketid: 1709015
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2026.1.304| RadPdfProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

How to extract multiple images from a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) and copy them to the Windows clipboard in a format that allows pasting into MS Word or other applications. The goal is to paste all images at once into MS Word as a single clipboard instance.

This KB article also answers the following questions:

* How can I copy all images from a PDF to the clipboard?
* How can I paste multiple images from a clipboard into MS Word?
* How can I convert images in a RadFixedDocument to HTML format for clipboard use?

## Solution

To copy images from a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) to the clipboard and paste them into MS Word, follow these steps:

1. Extract all images from the document pages.
2. Convert each image to PNG format and embed it in an HTML fragment as Base64 data URIs.
3. Set both HTML and bitmap formats on the clipboard.

The following code snippet demonstrates the implementation:

```csharp
using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Media.Imaging;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Objects;

[STAThread]
static void Main(string[] args)
{
    string pdfFilePath = "PDF with images.pdf";

    PdfFormatProvider pdfProvider = new PdfFormatProvider();
    RadFixedDocument document;

    using (FileStream stream = File.OpenRead(pdfFilePath))
    {
        document = pdfProvider.Import(stream, null);
    }

    var data = new DataObject();
    var bitmapSources = new List<BitmapSource>();

    foreach (RadFixedPage page in document.Pages)
    {
        var images = page.Content.Where(e => e is Image)
                                 .Cast<Image>();

        foreach (var image in images)
        {
            ImageSource imageSource = image.ImageSource;
            var bitmapSource = imageSource.GetBitmapSource();
            bitmapSources.Add(bitmapSource);
        }
    }

    string htmlFragment = CreateHtmlFragmentWithImages(bitmapSources);
    data.SetData(DataFormats.Html, htmlFragment);

    if (bitmapSources.Count > 0)
    {
        data.SetImage(bitmapSources[0]);
    }

    Clipboard.SetDataObject(data, true);
}

static string CreateHtmlFragmentWithImages(List<BitmapSource> images)
{
    var html = new System.Text.StringBuilder();
    html.AppendLine("<html><body>");

    foreach (var bitmapSource in images)
    {
        using (MemoryStream ms = new MemoryStream())
        {
            PngBitmapEncoder encoder = new PngBitmapEncoder();
            encoder.Frames.Add(BitmapFrame.Create(bitmapSource));
            encoder.Save(ms);

            string base64 = Convert.ToBase64String(ms.ToArray());
            html.AppendLine($"<img src=\"data:image/png;base64,{base64}\" /><br/>");
        }
    }

    html.AppendLine("</body></html>");
    return CreateHtmlFormat(html.ToString());
}

static string CreateHtmlFormat(string html)
{
    string header = "Version:0.9\r\nStartHTML:{0:000000}\r\nEndHTML:{1:000000}\r\nStartFragment:{2:000000}\r\nEndFragment:{3:000000}\r\n";
    string startFragment = "<!--StartFragment-->";
    string endFragment = "<!--EndFragment-->";

    string htmlFragment = startFragment + html + endFragment;
    int startHTML = header.Length;
    int endHTML = startHTML + htmlFragment.Length;
    int startFragment_idx = startHTML + htmlFragment.IndexOf(startFragment);
    int endFragment_idx = startHTML + htmlFragment.IndexOf(endFragment);

    return string.Format(header, startHTML, endHTML, startFragment_idx, endFragment_idx) + htmlFragment;
}
```

**Notes:**

* The HTML format allows the clipboard to hold multiple images as Base64 data URIs.
* Applications supporting HTML clipboard format, like MS Word, will paste all images simultaneously.
* The [GetBitmapSource]({%slug radpdfprocessing-model-imagesource%}#methods) method is used to extract images from the PDF.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [Image]({%slug radpdfprocessing-model-image%})
