---
title: FileFormatDetector
description: Detect file formats automatically using the FileFormatDetector of the Telerik Document Processing libraries.
page_title: FileFormatDetector
slug: fileformatdetector
position: 1
published: True
tags: file, format, detection, detector, pdf, docx, xlsx, zip, doc, xls, xlsm, txt, document, processing, libraries
---

# FileFormatDetector

The **FileFormatDetector** API provides automatic file format detection capabilities for various document types supported by Telerik Document Processing libraries. This utility enables you to programmatically identify the format of a document stream before attempting to process it, making it easier to handle documents of unknown types and providing better error handling in your applications.

The detector analyzes file signatures, headers, and content patterns to accurately identify document formats including PDF, DOCX, XLSX, RTF, and other supported formats. This is particularly useful when working with user-uploaded files or when processing documents from external sources where the file format might not be immediately known.

## Key Features

* **Automatic Format Detection**: Identifies document formats from a stream without requiring file extensions
* **Multiple Format Support**: Detects PDF, DOCX, XLSX, PPTX, RTF, and other document formats
* **Stream-Based**: Works directly with streams, making it compatible with various input sources
* **Error Handling**: Provides detailed error messages when detection fails
* **Lightweight**: Minimal overhead with efficient signature and header analysis

## API

**Namespace:** Telerik.Documents.Utilities.Detectors.FileFormat

### FileFormatDetector

The main class for detecting file formats.

| Member | Type | Description |
|--------|------|-------------|
| **Detect(Stream stream)** | Method | Detects the format of a file from a stream. Returns a **FileFormatDetectionResult** containing the detection outcome. |

### FileFormatDetectionResult

Represents the result of a file format detection operation.

| Member | Type | Description |
|--------|------|-------------|
| **IsSuccessful** | Property (bool) | Gets a value indicating whether a specific file format was successfully detected. Returns false if the format is unknown or detection failed. |
| **Format** | Property (DocumentFormatType) | Gets the detected document format type. Returns **DocumentFormatType.Unknown** if detection was unsuccessful. |
| **ErrorMessage** | Property (string) | Gets the error message if detection failed, or null if successful. |

## Using FileFormatDetector

The following example demonstrates how to detect the format of a document from a file stream:

<snippet id='libraries-common-fileformatdetector-detect-format'/>

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [RadWordsProcessing Overview]({%slug radwordsprocessing-overview%})
* [RadSpreadProcessing Overview]({%slug radspreadprocessing-overview%})
