---
title: Replace Image in PDF Document
description: Check this topic to learn how to replace image in PDF document with PdfProcessing.
type: how-to
page_title: Replace Image in PDF Document
slug: replace-image-in-pdf-document
position: 0
tags: radpdfprocessing, pdf, image, replace, document, processing, fixed, content
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
		<td>2021.1.212</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

How to replace an image in a **PDF** document.

## Solution

In the example below, we are demonstrating how to find a specific image in a PDF document imported into a [RadFixedDocument](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/radfixeddocument), preserve its size and [Position](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/position), and replace it with another [Image](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/image).

#### Replace Image in Imported PDF Document

```csharp
using System.Diagnostics;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;

namespace ReplaceImageInPdf
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Necessary for .NET Standard image exporting
            Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
            Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

            string inputFilePath = "input.pdf";
            PdfFormatProvider provider= new PdfFormatProvider();
            RadFixedDocument document = provider.Import(File.ReadAllBytes(inputFilePath), TimeSpan.FromSeconds(10));
            RadFixedPage firstPage = document.Pages[0];

            Telerik.Windows.Documents.Fixed.Model.Objects.Image image = firstPage.Content.First(ce => ce is Telerik.Windows.Documents.Fixed.Model.Objects.Image) as Telerik.Windows.Documents.Fixed.Model.Objects.Image;

            string newImagePath = "ProgressNinjas.png";
            Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource newImageSource;
            using (FileStream source = File.Open(newImagePath, FileMode.Open))
            {
                newImageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(source);
            }

            Telerik.Windows.Documents.Fixed.Model.Objects.Image newImage = new Telerik.Windows.Documents.Fixed.Model.Objects.Image
            {
                ImageSource = newImageSource,
                Position = image.Position,
                Width = image.Width,
                Height = image.Height
            };

            int imageIndex = firstPage.Content.IndexOf(image);
            firstPage.Content.RemoveAt(imageIndex);
            firstPage.Content.Insert(imageIndex, newImage);

            string outputFilePath = "output.pdf";
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(document, output, TimeSpan.FromSeconds(10));
            }
            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
        }
    }
}
```

### Required NuGet Packages

* Telerik.Documents.Fixed
* Telerik.Documents.ImageUtils
