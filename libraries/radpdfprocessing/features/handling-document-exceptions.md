---
title: Handling Exceptions
page_title: Handling Exceptions
slug: radpdfprocessing-handling-exceptions
tags: exception, import
position: 4
---
# Handling Exceptions

Since R2 2020 RadPdfProcessing has and exception handling mechanism. It allows to intercept and handle exceptions when the document is imported or loaded. This functionality introduces two events.

* __PdfImportSettings.DocumentUnhandledException:__ The event is fired when an exception occurs during document import. If the ReadingMode is set to AllAtOnce the entire document will be loaded on document import and there is no need to use the other event.
* __RadFixedDocument.DocumentUnhandledException:__ The event is fired when an exception occurs while loading the document pages. This event can be fired when the document is imported with OnDemand ReadingMode and a particular page is loaded after the import.

When both events are raised, the  __DocumentUnhandledExceptionEventArgs__ argument is passed. This argument contains two properties:
* __Exception:__ Gets the document exception.
* __Handled:__ Gets or sets if the exception should be handled. The default value is *false*. 

>note The exception handling mechanism handles exceptions at the very beginning of the import as well. In such a case, the event will be raised and an empty document instance is returned. The exception handling mechanism does not handle exceptions while parsing fonts glyph data or parsing images during document rendering in the UI viewers.


### Using ImportSettings.DocumentUnhandledException

To use this functionality you should handle the __PdfImportSettings.DocumentUnhandledException__ event. The __Handled__ property in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 

#### __C# Example 1: Using the DocumentUnhandledException event while loading the entire document__ 

{{region radpdfprocessing-handling-exceptions_0}}

    public RadFixedDocument ImportDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.AllAtOnce;
        provider.ImportSettings.DocumentUnhandledException += ImportSettings_DocumentUnhandledException;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        return document;
    }

    private void ImportSettings_DocumentUnhandledException(object sender, DocumentUnhandledExceptionEventArgs e)
    {
        MessageBox.Show("The document is corrupted and cannot be loaded: " + e.Exception.Message);
        e.Handled = true;
    }

{{endregion}}


### Using RadFixedDocument.DocumentUnhandledException

When using the OnDemand reading mode you should handle the __RadFixedDocument.DocumentUnhandledException__ event. The __Handled__ option in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 

#### __C# Example 2: Using the DocumentUnhandledException event while loading on demand__

{{region radpdfprocessing-handling-exceptions_1}}

    public void LoadDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.OnDemand;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        document.DocumentUnhandledException += Document_DocumentUnhandledException;
    }

    private void Document_DocumentUnhandledException(object sender, DocumentUnhandledExceptionEventArgs e)
    {
        MessageBox.Show("The document is corupted and some pages cannot be loaded: " + e.Exception.Message);
        e.Handled = true;
    }

{{endregion}}

### Exceptions

|Exception|Description|
|------|-----------|
| __DuplicatedEmbeddedFileNameException__| Represents an exception for embedding a file with a duplicated name.|
| __InvalidActionException__| Represents an exception for importing an invalid action.|
| __InvalidGraphicOperandsCountException__| Represents an exception for importing a graphic operator with an invalid number of operands.|
| __NotSupportedActionException__| Represents an exception for an action which is not supported.|
| __NotSupportedCCITTFaxDecodeFilterException__| Represents an exception for a scan decoder which is not supported.|
| __NotSupportedCharsetFormatException__| Represents an exception for an charset format which is not supported. This exception has a CharsetFormat property which specifies the name of the CharsetFormat.|
| __NotSupportedColorSpaceException__| Represents an exception for a color space which is not supported. This exception has a ColorSpace property which specifies the name of the ColorSpace. |
| __NotSupportedCompressionMethodException__| Represents an exception for importing a FlateDecode method which is not supported.|
| __NotSupportedEncryptionException__| Represents an exception for an encryption which is not supported. This exception has e EncryptionCode property which specifies the code of the encryption. |
| __NotSupportedEncryptionRevisionException__| Represents an exception for an encryption revision which is not supported. This exception has a RevisionCode property which specifies the name of the RevisionCode. |
| __NotSupportedFeatureException__| Represents an exception for a feature which is not supported.|
| __NotSupportedFilterException__| Represents an exception for a filter which is not supported. This exception has a FilterName property which specifies the name of the filter. 
| __NotSupportedFontException__| Represents an exception for a font which is not supported. This exception has a FontType property which specifies the type of the font.|
| __NotSupportedFontFamilyException__| Represents an exception for a font family which is not supported.|
| __NotSupportedFunctionTypeException__| Represents an exception for a function type which is not supported. This exception has a FunctionType property which specifies the name of the FunctionType.|
| __NotSupportedPaintTypeException__| Represents an exception for a paint type which is not supported. This exception has a PaintType property which specifies the name of the PaintType.|
| __NotSupportedPredefinedCMapException__| Represents an exception for a predefined CMap which is not supported. This exception has a CMapName which specifies the name of the predefined CMap.|
| __NotSupportedReservedMethodException__| Represents an exception for importing a FlateDecode reserved method which is not supported.|
| __NotSupportedScanDecoderException__| Represents an exception for a document with a scan decoder which is not supported.|
| __NotSupportedScanEncoderException__| Represents an exception for a scan decoder which is not supported.|
| __NotSupportedShadingTypeException__| Represents an exception for a shading type which is not supported. This exception has e ShadingType property which specifies the type of the shading.|
| __NotSupportedStreamTypeException__| Represents an exception for a stream type which is not supported. A stream is not supported if it does not support read or seek. This exception has a SupportSeek and SupportRead properties which specify whether the stream supports them.|
| __NotSupportedXObjectTypeException__| Represents an exception for document with an XObject type which is not supported.|
|**DuplicatedJavaScriptNameException**|Represents an exception for JavaScript with a duplicated name.|

# See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})