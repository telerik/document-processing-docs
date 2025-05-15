---
title: Version 2025.2.513 (2025 Q2)
page_title: What is new in 2025.2.513 (2025 Q2) for the Document Processing Libraries
description: 2025.2.513 (2025 Q2)
slug: release-notes-2025-2-513
tags: 2025.2.513,2025,Q2
published: True
position: 98
---


# 2025.2.513 (2025 Q2)


## Breaking Changes


![new](../images/new.png)

* Trial and commercial users now use the same product package. The trial and commercial product versions merged into a single unified distribution package. The product access now depends on a license key file. This eliminates the need for separate trial downloads. For more information, please refer to the &lt;documentation article&gt;.
* For basic compression/decompression tasks, the Telerik Document Processing Libraries now use System.IO.Compression instead of Telerik.Zip.

## What's New


![new](../images/new.png)

* Added support for querying and summarizing PDF content using AI, enabling users to interact with and extract insights from PDF files.
* Introduced multiple Digital Signatures support.
* Document Processing Libraries no longer support .NET 6. Please use .NET 8 as minimal supported .NET version.
* Document Processing Libraries is now built against .NET 8. New .NET 8 assets are available.

![dependencies](../images/dependencies.png)

* SkiaSharp dependency is updated to version 3.116.1.

## PdfProcessing


![new](../images/new.png)

* Introduced multiple Digital Signatures support.
* Introduced support for Marked Content.
* вRadFixedPage.CropBox is now respected when exporting to image with SkiaImageFormatProvider.
* Hierarchical document structure (import-export) is now preserved.
* PdfStreamWriter: AdditionalActions (AA) are now exported when merging pages.
* Introduced support for UnShrinking - Method 1.
* Introduced partial support for GoToR action.
* Handled the import of documents with null elements in the Associated Files (/AF)  collection.
* Handled the import of documents with Associated Files elements whose content is set to null.
* Exposed Clone methods for cloning PositionContentElements (Path, Image, Form, TextFragment).
* Tesseract OCR now works on Linux platforms.
* Introduced support for Launch action.
* Added support for querying and summarizing PDF content using AI, enabling users to interact with and extract insights from PDF files.
* Fields that are not in the fields dictionary are not imported.

![fixed](../images/fixed.png)

* Wrong image export when a document is signed and has indexed color space.
* Wrong font is loading when FontFile2 is CFF (Compact Font Format).
* System.NotImplementedException is thrown when calling Type1FontSource.GetCapHeight() method.
* The StokeAlphaConstant is not handled correctly when applied on a TextFragment.
* SkiaImageFormatProvider: Wrong glyph rendering due to incorrectly parsed Type1Font glyph data.
* SkiaImageFormatProvider: IndexOutOfRangeException is thrown due to wrongly processed image data.
* A NullReferenceException is thrown when the GetAllTextFromImage method is executed on a blank image without text.
* A NotImplementedException is thrown for the SvgFontDefn's MeasureCharacters method.
* An InvalidDataException: 'Unknown compression method (0x3C)' when importing a file with XRef table defined in an object with FlateDecode filter.
* An InvalidCastException is thrown when importing a document with an annotation declared in the Fields collection.
* Exporting a specific PDF file generates large amounts of ExtGState entries.
* An ArgumentOutOfRangeException is thrown when creating a CapPathRound for an SVG element.
* An ArgumentNullException is thrown when importing a document with widget annotations and null state appearance.
* A NullReferenceException is thrown while importing document without AcroForm, containing fields defined in the widget annotation.
* Form Fields are not copied when merging documents` pages using PdfStreamWriter.

![breaking-changes](../images/breaking-changes.png)

* Removed PdfExportSettings.ShouldEmbedFonts obsoleted API.

## SpreadProcessing


![new](../images/new.png)

* Updated the implementation of the SimpleTextMeasurer to use AvarageFontWeigth.

![fixed](../images/fixed.png)

* XlsFormatProvider: FormulaParseException is thrown when importing a document with formulas referencing non-existent named ranges.
* InvalidOperationException is thrown when a comment uses legacyDrawingHF element instead of legacyDrawing.
* Incorrect timestamp of DateTime with custom number format.
* Exception Sequence contains no matching element is thrown on importing a document with a comment without an author.
* Using timeout with Timespan.MaxValue results in ArgumentOutOfRangeException: 'Specified argument was out of the range of valid values. (Parameter 'delay').
* Incorrect format result when the fraction format is applied and the worksheet contains fractions with a fractional part higher than 0.5.

## WordsProcessing


![fixed](../images/fixed.png)

* Simulated bold text loses its boldness after exporting a DOCX file to PDF format.
* NullReferenceException is thrown when importing documents with moved content when Track Changes is enabled.
* HTMLFormatProvider: Exporting to HTML does not preserve line spacing.
* Document's East Asia font falls back to a different font when opened in MS Word.
* If At Least line spacing is smaller than the font size, it causes squished lines when exported to HTML.
* Wrong glyph rendering when the Type3FontGlyphSource.Width is not consistent with the font`s Width.
* InvalidOperationException is thrown when document with comment on a deleted text is imported.
* An ArgumentException is thrown when a theme element does not have a name.

## ZipLibrary


![new](../images/new.png)

* EncryptionSettingsBase constructor and Algorithm property have been removed; use the static creation methods instead.
* Implemented timeout for creating, updating and reading of zip archives.

![breaking-changes](../images/breaking-changes.png)

* ZipArchive constructors have been removed. Use the static methods instead.
* DefaultCryptoProvider class has been removed. Use PkzipCryptoProvider instead.
* DefaultEncryptionSettings class is now removed. Use the static creation methods of the EncryptionSettings class instead.
* ShouldEmbedFonts property of the PdfExportSettings has been removed. Use FontEmbeddingType instead.
