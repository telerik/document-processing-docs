---
title: Using OcrFormatProvider
description: Learn how to convert scanned images to searchable PDF content with OcrFormatProvider, including setup, Tesseract usage, platform constraints, and troubleshooting.
page_title: RadPdfProcessing OcrFormatProvider Overview
slug: radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider
tags: ocrformatprovider, pdf, ocr, radpdfprocessing, recognition, image, conversion, scanned
published: True
position: 1
---

# Using OcrFormatProvider

| Minimum version | Q1 2025 |
|----|----|

Use `OcrFormatProvider` to recognize text in scanned images and turn that image content into searchable PDF content. The provider imports an image, runs an Optical Character Recognition (OCR) engine over it, and returns a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) that you can place in a PDF document.

By default, `OcrFormatProvider` works with `TesseractOcrProvider`, which uses the third-party [Tesseract OCR engine](https://github.com/tesseract-ocr/tesseract). If the default provider does not match your platform or deployment model, you can plug in a [custom OCR provider implementation]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}) instead.

>note
>
> See the [PdfProcessing Optical Character Recognition demo](https://demos.telerik.com/document-processing/pdfprocessing/optical_character_recognition) for a working example of the feature.

Review the [OCR prerequisites article]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}) before you start. That article contains the required packages, `tessdata` setup, native Tesseract dependencies, and Linux-specific installation steps.

Use this article when you need to:

* Convert a scanned image into a searchable PDF page.
* Configure `TesseractOcrProvider` for one or more recognition languages.
* Understand which platforms support the default Tesseract-based provider.
* Decide when to use a custom OCR provider.
* Diagnose common OCR setup and recognition issues.

## Supported Platforms

The default `TesseractOcrProvider` implementation is supported on **Windows** and **Linux**. If your application runs on a platform where the default Tesseract integration is unavailable, use a [custom OCR provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}).

For **Blazor WebAssembly**, do not assume that the default Tesseract-based provider is available. Review the package guidance in [OCR prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}) and use a custom provider when your deployment model cannot use the default native Tesseract integration.

If your application uses cross-platform image processing dependencies, also review [Cross-Platform Support - Images]({%slug radpdfprocessing-cross-platform-images%}).

## End-to-End OCR Workflow

In a typical OCR workflow, the input is a scanned image file and the output is a searchable PDF page inside a `RadFixedDocument`:

1. Set up the required OCR packages and native dependencies.
2. Place the `tessdata` folder in a location that your application can access.
3. Create a `TesseractOcrProvider` and point it to the parent folder that contains `tessdata`.
4. Configure the OCR options, such as language codes and parse level.
5. Create an `OcrFormatProvider` with that OCR provider.
6. Import the image and get a `RadFixedPage` result.
7. Add the returned page to a `RadFixedDocument` and export the document to PDF if needed.

This flow gives you a PDF page that contains the recognized text in a searchable form instead of a plain image-only scan.

## TesseractOcrProvider Public API

The following example shows the usual setup for `OcrFormatProvider` and `TesseractOcrProvider`.

<snippet id='libraries-pdf-formats-and-conversion-ocr-ocrformatprovider'/>

After the import completes, the provider returns a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) that you can add to a document, inspect, or export.

## TesseractOcrProvider Settings

Use these members to control how the default OCR engine behaves:

| Method or property | Description |
|----|----|
| `TesseractOcrProvider(string dataPath)` | Initializes the provider with the path to the parent directory that contains the `tessdata` folder. |
| `LanguageCodes` | Sets the language codes for the Tesseract OCR engine. The default value is `eng`. Download the required trained data files from the [Tesseract tessdata repository](https://github.com/tesseract-ocr/tessdata). |
| `CorrectVerticalPosition` | Tries to correct the vertical position of the recognized text. This option is not available in .NET Framework. |
| `DataPath` | Gets or sets the path to the parent directory that contains the `tessdata` folder. |
| `ParseLevel` | Controls whether OCR parsing returns text by line or by word through `OcrParseLevel.Line` or `OcrParseLevel.Word`. |
| `GetAllTextFromImage` | Extracts all recognized text from an image and returns it as a single string. |
| `GetTextFromImage` | Extracts recognized text and returns words together with their bounding rectangles. |

## Setup Tips for Better OCR Results

Check these setup points before you troubleshoot recognition quality:

* Use images with **300 DPI** when possible.
* Make sure the `tessdata` folder contains `eng.traineddata` and any additional languages that you configure in `LanguageCodes`.
* Pass the parent folder of `tessdata` to `TesseractOcrProvider`, not the `tessdata` folder itself.
* Verify that the required native Tesseract files are available on the target machine.
* On Linux, complete the extra installation steps from [OCR prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}).

## Troubleshooting

Use these checks when OCR does not behave as expected:

* OCR initialization fails: Confirm that the required packages and native dependencies are installed.
* No text is recognized: Verify image quality, DPI, and whether the correct trained language files are present in `tessdata`.
* Wrong language is recognized: Check the `LanguageCodes` setting and confirm that the matching `.traineddata` files are deployed.
* Text positions look off: Try the `CorrectVerticalPosition` option when the runtime supports it.
* The feature does not run on the target platform: Confirm whether the application uses the default Windows and Linux Tesseract integration or whether it needs a [custom OCR provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}).

## Next Steps

Continue with the article that matches your next task:

1. Use [OCR prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}) to complete package and native dependency setup.
2. Review [Implementing a Custom OCR Provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}) if you need a different OCR engine or unsupported platform coverage.
3. Use [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%}) when you need to process searchable PDF content after OCR.

>note
>
> A complete example that implements `OcrFormatProvider` is available in the [Document Processing SDK repository](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/TesseractOcrProviderDemo).

## See Also

* [OCR prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Implementing a Custom OCR Provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%})
* [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%})
* [PdfProcessing Optical Character Recognition demo](https://demos.telerik.com/document-processing/pdfprocessing/optical_character_recognition)
