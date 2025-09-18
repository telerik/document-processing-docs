---
title: Version 2024.3.802 (2024 Q3)
page_title: What is new in 2024.3.802 (2024 Q3) for the Document Processing Libraries
description: 2024.3.802 (2024 Q3)
slug: release-notes-2024-3-731
tags: 2024.3.802,2024,Q3
published: True
position: 97
---


# 2024.3.802 (2024 Q3)


## PdfProcessing


![new](../images/new.png)

* Introduced support for annotations of type StrikeOut.
* Introduced support for annotations of type Stamp.
* Introduced support for annotations of type Popup.
* Introduced support for annotations of type Text.
* Introduced support for annotations of type Highlight.
* Introduced SVG to FormSource conversion.
* Introduced support for annotations of type Line.
* Added SVG element in a RadFixedPage so that it can be exported to PDF via the RadPdfProcessing library.
* Handle documents with mismatched font Subtype and FontFile type.
* Introduced support for Strikethrough text property.
* Introduced support for Dotted, Dashed, and DashSmallGap borders.
* Added System.Formats.Asn1 to address CVE-2024-38095 (CVSS 7.5) in System.Security.Cryptography.Pcks.

![fixed](../images/fixed.png)

* Some documents are not displayed correctly when changing the culture to Right to Left in the .NET 5 or later project.
* An invalid annotation position leads to missing content.
* SkiaImageFormatProvider: Text is exported with a wrong position.
* SkiaImageFormatProvider: Darker and lower quality image export on macOS.
* An InvalidCastException is thrown when importing a PDF document with embedded files.
* The page content is broken when exporting a document and inversing a non-invertible concat matrix.
* The text is not displayed when CFF Private DICT has leading zeroes.
* Missing text content is caused by a handled OverflowException while parsing Type1 font file.

## SpreadProcessing


![new](../images/new.png)

* Introduced support for SVG FormSource images.
* Handle importing and reading cached formula value when the formula contains external references.

![fixed](../images/fixed.png)

* An InvalidOperationException is thrown when importing a specific document.
* Incorrect calculation of UsedCellRange when conditional formatting is applied to a large cell range.
* A FormatException is thrown when getting the formatted cell value as a string using the H format.
* CellValueFormat comes out incorrect on export when it contains a specific sequence.
* An ArgumentNullException is thrown when importing documents containing comments with no DateTime.
* Wrong sheet name appears in the exception message when adding sheet with an already existing name.

## WordsProcessing


![new](../images/new.png)

* Introduced support for SVG FormSource images.
* Introduced support for exporting text with a strikethrough to PDF.

![fixed](../images/fixed.png)

* A NullReferenceException is thrown when exporting a document with a field spanning multiple paragraphs inside a list to PDF.
* PageField does not respect StartingPageNumber.
* RtfFormatProvider: Indentation for bullets and numbering changes on export.
* Inserting a Content Control in some cases is not added to the model.
* Import from HTML doesn't apply style from class names in CSS.
* A FileNotFoundException is thrown when using HtmlFormatProvider.Import.
* DocFormatProvider: EndOfStreamException when importing a document with a specific image.
* Replace doesn't match the text when it contains a BookmarkRangeStart/End objects.
* The numbered list marker font is not properly exported to PDF.
* List indent is not correct when exported to PDF.
* Incorrect calculation of indentation occurs when a paragraph in the list has applied local indent, and the list style defines indent.
* The hanging indent is not respected when exporting paragraphs with tabs to PDF.
