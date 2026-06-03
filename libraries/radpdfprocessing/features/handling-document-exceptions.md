---
title: Handling Exceptions
description: Learn how to intercept and handle exceptions during PDF document import and export using RadPdfProcessing's exception handling events.
page_title: Handling Exceptions
slug: radpdfprocessing-handling-exceptions
tags: exceptions, handling, pdf, import, export, radpdfprocessing, events, errors
position: 4
---
# Handling Exceptions

|Minimum Version|R2 2020|
|----|----|

**RadPdfProcessing** has an exception handling mechanism. It allows you to intercept and handle exceptions when the document is imported or loaded. This functionality introduces the following events:

| Event | Description |
|---|---|
| `PdfImportSettings.DocumentUnhandledException` | Fired when an exception occurs during document import. If `ReadingMode` is `AllAtOnce`, the entire document is loaded on import and this event covers the full load. |
| `RadFixedDocument.DocumentUnhandledException` | Fired when an exception occurs while loading document pages. Raised when the document is imported with **OnDemand** `ReadingMode` and a particular page is loaded after import. |
| `PdfExportSettings.DocumentUnhandledException` | Fired when an exception occurs while exporting document pages. Introduced in **Q1 2025**. |
| `SkiaImageExportSettings.DocumentUnhandledException` | Fired when an exception occurs while exporting a PDF page. Introduced in **Q3 2025**. *(Available in the .NET Standard version of the libraries.)* |

When the events are raised, the `DocumentUnhandledExceptionEventArgs` argument is passed. This argument contains the following properties:

| Property | Description |
|---|---|
| `Exception` | Gets the document exception. |
| `Handled` | Gets or sets whether the exception is handled. The default value is `false`. |

>note The exception handling mechanism handles exceptions at the very beginning of the import as well. In such a case, the event is raised and an empty document instance is returned. The exception handling mechanism **does not handle** exceptions while parsing **fonts glyph data** or parsing **images** during document rendering in the UI viewers.

## Using ImportSettings.DocumentUnhandledException

To use this functionality, handle the `PdfImportSettings.DocumentUnhandledException` event. The `Handled` property in the event arguments indicates whether the exception is handled by the code in the event handler or the exception is thrown.

<snippet id='libraries-pdf-features-handling-exceptions-import-settings'/>

## Using RadFixedDocument.DocumentUnhandledException

When you use the **OnDemand** reading mode, handle the `RadFixedDocument.DocumentUnhandledException` event. The `Handled` option in the event arguments indicates whether the exception is handled by the code in the event handler or the exception is thrown.

**Example 2: Using the DocumentUnhandledException Event While Loading on Demand**

<snippet id='libraries-pdf-features-handling-exceptions-radfixeddocument'/>

## Using ExportSettings.DocumentUnhandledException

Starting with **Q1 2025**, the [PdfExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings) offers the `DocumentUnhandledException` event that allows you to handle exceptions while exporting a document.

**Example 3: Using the DocumentUnhandledException Event While Exporting**

<snippet id='libraries-pdf-features-handling-exceptions-export-settings'/>

## Exceptions

|Exception|Description|
|------|-----------|
| `DuplicatedEmbeddedFileNameException`| Represents an exception for embedding a file with a duplicated name.|
| `InvalidActionException`| Represents an exception for importing an invalid action.|
| `InvalidGraphicOperandsCountException`| Represents an exception for importing a graphic operator with an invalid number of operands.|
| `NotSupportedActionException`| Represents an exception for an action that is not supported.|
| `NotSupportedCCITTFaxDecodeFilterException`| Represents an exception for a scan decoder that is not supported.|
| `NotSupportedCharsetFormatException`| Represents an exception for a charset format that is not supported. This exception has a `CharsetFormat` property that specifies the name of the CharsetFormat.|
| `NotSupportedColorSpaceException`| Represents an exception for a color space that is not supported. This exception has a `ColorSpace` property that specifies the name of the ColorSpace. |
| `NotSupportedCompressionMethodException`| Represents an exception for importing a FlateDecode method that is not supported.|
| `NotSupportedEncryptionException`| Represents an exception for an encryption that is not supported. This exception has an `EncryptionCode` property that specifies the code of the encryption. |
| `NotSupportedEncryptionRevisionException`| Represents an exception for an encryption revision that is not supported. This exception has a `RevisionCode` property that specifies the name of the RevisionCode. |
| `NotSupportedFeatureException`| Represents an exception for a feature that is not supported.|
| `NotSupportedFilterException`| Represents an exception for a filter that is not supported. This exception has a `FilterName` property that specifies the name of the filter. |
| `NotSupportedFontException`| Represents an exception for a font that is not supported. This exception has a `FontType` property that specifies the type of the font.|
| `NotSupportedFontFamilyException`| Represents an exception for a font family that is not supported.|
| `NotSupportedFunctionTypeException`| Represents an exception for a function type that is not supported. This exception has a `FunctionType` property that specifies the name of the FunctionType.|
| `NotSupportedPaintTypeException`| Represents an exception for a paint type that is not supported. This exception has a `PaintType` property that specifies the name of the PaintType.|
| `NotSupportedPredefinedCMapException`| Represents an exception for a predefined CMap that is not supported. This exception has a `CMapName` property that specifies the name of the predefined CMap.|
| `NotSupportedReservedMethodException`| Represents an exception for importing a FlateDecode reserved method that is not supported.|
| `NotSupportedScanDecoderException`| Represents an exception for a document with a scan decoder that is not supported.|
| `NotSupportedScanEncoderException`| Represents an exception for a scan decoder that is not supported.|
| `NotSupportedShadingTypeException`| Represents an exception for a shading type that is not supported. This exception has a `ShadingType` property that specifies the type of the shading.|
| `NotSupportedStreamTypeException`| Represents an exception for a stream type that is not supported. A stream is not supported if it does not support read or seek. This exception has `SupportSeek` and `SupportRead` properties that specify whether the stream supports them.|
| `NotSupportedXObjectTypeException`| Represents an exception for a document with an XObject type that is not supported.|
|`DuplicatedJavaScriptNameException`|Represents an exception for JavaScript with a duplicated name.|
|`NotSupportedImageFormatException`|Represents an exception thrown when attempting to use an image format that is not supported by the library.|
|`InvalidAnnotationException`|Represents an exception for an annotation that is not valid.|
|`NotSupportedAnnotationException`|Represents an exception for an annotation that is not supported.|
|`InvalidImageDataException`|Represents an exception for importing invalid image data.|
|`NotSupportedPdfPrimitivesConversionException`|Represents an exception thrown when attempting to convert unsupported PDF primitive types.|
|`InvalidStructureTreeException`|Thrown when the PDF structure tree contains invalid or malformed elements during import. This exception wraps lower-level errors such as invalid page references or object references encountered while parsing the document logical structure.|
|`InvalidObjectReferenceException`|Thrown when a PDF object reference is invalid during import or processing. This occurs when a structure element object reference points to an unrecognized object type.|
|`InvalidPageReferenceException`|Thrown when a PDF page reference is invalid during import or processing. This occurs when a structure element Page property references a non-page object.|

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [SkiaImageExportSettings]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageexportsettings%})
