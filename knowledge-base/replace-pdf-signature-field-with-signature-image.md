---
title: Replacing a PDF Signature Field with a Handwritten Signature Image
description: Learn how to replace a signature field in a PDF document with a handwritten signature image that your application captures, using RadPdfProcessing.
type: how-to
page_title: Replacing a PDF Signature Field with a Signature Image - RadPdfProcessing
slug: pdf-replace-signature-field-with-signature-image
tags: radpdfprocessing, pdf, field, signaturewidget, image, handwritten, signature, signaturepad, fixedcontenteditor, document, processing, fixed
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| 2026.3.1027 | RadPdfProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

A common requirement is to let users sign a PDF document with a handwritten signature. The PDF already contains a signature field, and the captured signature image must appear in place of this field.

[RadPdfProcessing]({%slug radpdfprocessing-overview%}) is UI-independent. For this reason, it does not provide a built-in mechanism for capturing a handwritten signature. Your application must obtain the signature image. Use any signature pad control or another input method that fits your application.

After the application captures the signature and saves it as an image, RadPdfProcessing can insert the image into the PDF. You can locate the existing signature widget, remove it, and draw the captured image in its place.

This article demonstrates only the PdfProcessing part of the scenario, so the approach is not tied to a specific UI framework. For an example that captures the signature with the Telerik UI for Xamarin SignaturePad control, see [how to use a SignaturePad signature with a PDF]({%slug signaturepad-pdf-insert-written-signature%}).

## Solution

To replace the signature field with the captured image, follow these steps:

1. Capture the signature in your application and save it as a PNG or JPEG image. This step is outside the scope of RadPdfProcessing.
2. Import the PDF document into a [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) by using [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}).
3. Create an [ImageSource]({%slug radpdfprocessing-model-imagesource%}) from the signature image.
4. Find the [SignatureWidget]({%slug radpdfprocessing-model-annotations-widgets%}) annotations on each page.
5. Draw the image at the position and with the size of each widget by using [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}), and then remove the widget from the page.
6. Export the document to a new PDF file.

The following example replaces every signature widget in the document with the same image. It expects the application to have saved the signature image as `signature.png`.

```csharp
using System;
using System.IO;
using System.Linq;
using Telerik.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Documents.Fixed.Model;
using Telerik.Documents.Fixed.Model.Annotations;
using Telerik.Documents.Fixed.Model.Editing;
using Telerik.Documents.Fixed.Model.Resources;

namespace ReplaceSignatureFieldExample
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string inputPdfPath = "document-to-sign.pdf";
            string signatureImagePath = "signature.png";
            string outputPdfPath = "signed-document.pdf";

            PdfFormatProvider pdfProvider = new PdfFormatProvider();
            RadFixedDocument document;

            using (FileStream inputStream = File.OpenRead(inputPdfPath))
            {
                document = pdfProvider.Import(inputStream, TimeSpan.FromSeconds(10));
            }

            ImageSource signatureImage;

            using (FileStream imageStream = File.OpenRead(signatureImagePath))
            {
                signatureImage = new ImageSource(imageStream);
            }

            int replacedCount = 0;

            foreach (RadFixedPage page in document.Pages)
            {
                // Copy the widgets to a list because the loop removes them.
                var signatureWidgets = page.Annotations
                    .OfType<SignatureWidget>()
                    .ToList();

                foreach (SignatureWidget signatureWidget in signatureWidgets)
                {
                    var widgetRect = signatureWidget.Rect;

                    FixedContentEditor editor = new FixedContentEditor(page);
                    editor.Position.Translate(widgetRect.X, widgetRect.Y);
                    editor.DrawImage(signatureImage, widgetRect.Width, widgetRect.Height);

                    page.Annotations.Remove(signatureWidget);
                    replacedCount++;
                }
            }

            using (FileStream outputStream = File.Create(outputPdfPath))
            {
                pdfProvider.Export(document, outputStream, TimeSpan.FromSeconds(10));
            }

            Console.WriteLine("Replaced {0} signature widget(s).", replacedCount);
        }
    }
}
```

The code moves the editor to the position of each widget and draws the image with the width and height of the widget. The `ToList()` call creates a copy of the widgets, so the loop can safely remove them from the page.

>tip To replace only specific fields, check the name of the field that owns the widget before you draw the image. For example, use `signatureWidget.Field.Name == "Signature1"`. This lets you use a different image for each signer.

### Remove the Signature Fields

Removing a widget from the page does not remove its [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) from the document. The exported PDF still contains the field, but the field has no widget and is not visible on the page.

To remove the fields as well, delete them from the form fields collection after the page loop:

```csharp
var signatureFields = document.AcroForm.FormFields
    .OfType<Telerik.Documents.Fixed.Model.InteractiveForms.SignatureField>()
    .ToList();

foreach (var signatureField in signatureFields)
{
    document.AcroForm.FormFields.Remove(signatureField);
}
```

### Use PNG Images in Cross-Platform Projects

The .NET Framework packages process PNG images without extra setup. The .NET Standard does not define APIs for decoding images, so a PNG signature requires additional configuration in cross-platform projects. Without it, the export throws an `InvalidOperationException`. JPEG images do not need this setup.

To use PNG images in a cross-platform project, reference the `Telerik.Documents.ImageUtils` NuGet package and set the default `ImagePropertiesResolver` before you export the document:

```csharp
Telerik.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver =
    new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
```

The default resolver depends on the SkiaSharp library. For the required packages and for custom implementations, see [how to configure image processing in cross-platform projects]({%slug radpdfprocessing-cross-platform-images%}).

## See Also

* [Using a SignaturePad signature with a PDF]({%slug signaturepad-pdf-insert-written-signature%})
* [Signing a PDF document with a SignatureWidget]({%slug sign-pdf-with-signature-widget%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [ImageSource]({%slug radpdfprocessing-model-imagesource%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Cross-platform image processing]({%slug radpdfprocessing-cross-platform-images%})
