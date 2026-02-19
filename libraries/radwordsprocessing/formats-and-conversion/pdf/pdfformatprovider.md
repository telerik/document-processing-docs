---
title: Using PdfFormatProvider
page_title: Using PdfFormatProvider
slug: radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider
tags: using,pdfformatprovider
published: True
position: 2
---

# Using PdfFormatProvider

RadWordsProcessing provides a __PdfFormatProvider__ class that allows you to export a __RadFlowDocument__ to PDF.      

All you have to do in order to use __PdfFormatProvider__ is add references to the packages listed below:
      
* Telerik.Windows.Documents.Core
* Telerik.Windows.Documents.Flow
* Telerik.Windows.Documents.Flow.FormatProviders.Pdf
* Telerik.Windows.Documents.Fixed

>note *As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

## Export

In order to export a document to PDF you need to use the __Export()__ method of __PdfFormatProvider__.

>note The **.NET Standard** specification does not define APIs for getting specific fonts. PdfFormatProvider needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the **FontsProviderBase** abstract class and set this implementation to the **FontsProvider** property of **FixedExtensibilityManager**. For detailed information, check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.

>note **.NET Standard**: In order to export images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})

The code snippet in __Example 1__ shows how to create a __PdfFormatProvider__ instance and use it to export __RadFlowDocument__ to a file.
        
>The PdfFormatProvider class of RadWordsProcessing is located in the **Telerik.Windows.Documents.Flow.FormatProviders.Pdf namespace**.

#### __Example 1: Export to PDF file__
<snippet id='codeblock-cc'/>


The result from the method is a document that can be opened in any application that supports PDF documents.
        

__Example 2__ demonstrates how to export the contents of a __RadFlowDocument__ to a __RadFIxedDocument__. 


#### __Example 2: Export to RadFixedDocument__
<snippet id='codeblock-cd'/>


>tip __RadFixedDocument__ is the base class of the __RadPdfProcessing__ library. Additional information on the library and its functionality can be found [here]({%slug radpdfprocessing-overview%}).


## See Also

* [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%})
* [[WordsProcessing PDF Export Demo](https://demos.telerik.com/document-processing/wordsprocessing/pdf_export)]
