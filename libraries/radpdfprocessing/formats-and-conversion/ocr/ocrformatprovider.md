---
title: Using OcrFormatProvider
description: Learn how to convert scanned images to searchable PDF format using the OcrFormatProvider class in RadPdfProcessing with Tesseract OCR.
page_title: Using OcrFormatProvider
slug: radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider
tags: ocrformatprovider, pdf, ocr, radpdfprocessing, recognition, image, conversion, scanned
published: True
position: 1
---

# Using OcrFormatProvider

|Minimum Version|Q1 2025|
|----|----|

RadPdfProcessing supports **Optical Character Recognition (OCR)**. OCR is the electronic or mechanical conversion of images of typed, handwritten, or printed text into machine-encoded text from a scanned document. The `OcrFormatProvider` class imports an image and returns it as a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). By default, `OcrFormatProvider` takes a `TesseractOcrProvider` implementation as a parameter. This implementation uses the third-party library [Tesseract](https://github.com/tesseract-ocr/tesseract). You can also provide any [custom implementation]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}) instead.

>note [PdfProcessing Optical Character Recognition (OCR) Demo](https://demos.telerik.com/document-processing/pdfprocessing/optical_character_recognition)

You can find all the dependencies and required steps in the [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}) article.

## TesseractOcrProvider Public API

The following table lists the available methods and properties:

|Method/Property|Description|
|----|----|
|**TesseractOcrProvider(string dataPath)**|Constructor that takes the path to the **parent** directory containing the "**tessdata**" folder.|
|`LanguageCodes`|The language codes to use for the Tesseract OCR engine. You can find the corresponding trained data for each language and their codes in the [Tesseract tessdata repository](https://github.com/tesseract-ocr/tessdata). The value is "_eng_" by default.|
|`CorrectVerticalPosition`|Indicates whether the OCR processor tries to correct the vertical position of the text. (**Not available in .NET Framework**)|
|`DataPath`|The path to the **parent** directory that contains the "**tessdata**" folder.|
|`ParseLevel`|Indicates the level of parsing that the OCR processor performs - `OcrParseLevel.Line` or `OcrParseLevel.Word`.|
|`GetAllTextFromImage`|Extracts all text from an image and returns it as a single string.|
|`GetTextFromImage`|Extracts the text from an image and returns the words and their bounding rectangles.|

<snippet id='libraries-pdf-formatsandconversion-ocr-ocrformatprovider'/>

>note You can find a complete example of [implementing an OcrFormatProvider](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/TesseractOcrProviderDemo) in the SDK repository.
        
## See Also

* [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Implementing a Custom OCR Provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%})
* [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%})
* [PdfProcessing Optical Character Recognition (OCR) Demo](https://demos.telerik.com/document-processing/pdfprocessing/optical_character_recognition)
