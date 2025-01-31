---
title: Using OcrFormatProvider
description: Learn how to convert scanned images to PDF format using OcrFormatProvider.
page_title: Using OcrFormatProvider
slug: radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider
tags: pdf, processing, ocr, image, optical, character, recognition
published: True
position: 1
---

# Using OcrFormatProvider

Since _Q1 2025_ the __RadPdfProcessing__ library supports Optical Character Recognition (OCR). OCR is the electronic or mechanical conversion of images of typed, handwritten, or printed text into machine-encoded text from a scanned document. The library uses the **OcrFormatProvider** class that allows you to import an image which is returned as a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}). By default, the **OcrFormatProvider** takes as a parameter a **TesseractOcrProvider** implementation which is achieved by using the third-party library [Tesseract](https://github.com/tesseract-ocr/tesseract), however you can provide any [custom implementation]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}) instead.

You can find all the dependencies and required steps for the implementation in the [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%}) article.

## TesseractOcrProvider Public API

|Method/Property|Description|
|----|----|
|**TesseractOcrProvider(string dataPath)**|Constructor that takes as a parameter the path to the **parent** directory that contains the "**tessdata**" folder.|
|**LanguageCodes**|The language codes to use for the Tesseract OCR engine. You can find the corresponding trained data for each language and their codes [here](https://github.com/tesseract-ocr/tessdata). The value is "_eng_" by default.|
|**CorrectVerticalPosition**|Indicates whether the OCR processor will try to correct the vertical position of the text. (**Not available in .NET Framework**)|
|**DataPath**|The path to the **parent** directory that contains the "**tessdata**" folder.|
|**ParseLevel**|Indicates the level of parsing that the OCR processor will perform - OcrParseLevel.**Line** or OcrParseLevel.**Word**.|
|**GetAllTextFromImage**|Extracts all text from an image and returns it as a single string.|
|**GetTextFromImage**|Extracts the text from an image and returns the words and their bounding rectangles.|

<snippet id='libraries-pdf-formatsandconversion-ocr-ocrformatprovider'/>

>note You can find a complete example of [implementing an OcrFormatProvider](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/TesseractOcrProviderDemo) in our SDK repository.
        
## See Also

* [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%})
* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [Implementing a Custom OCR Provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%})
* [Extracting Text from PDF Documents]({%slug extract-text-from-pdf%})
