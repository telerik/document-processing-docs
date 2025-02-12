---
title: Version 2025.1.205 (2025 Q1)
page_title: What is new in 2025.1.205 (2025 Q1) for the Document Processing Libraries
description: 2025.1.205 (2025 Q1)
slug: release-notes-2025-1-205
tags: 2025.1.205,2025,Q1
published: True
position: 99
---


# 2025.1.205 (2025 Q1)


## What's Changed


![changed](../images/changed.png)

* Starting with 2025 Q1, all users of the Telerik and Kendo UI components and tools, will need to apply a valid license key file to both new and existing projects. For details, see our [Licensing Documentation]({%slug license-key%}).

## What's New


![new](../images/new.png)

* Introduced support for Optical Character Recognition (OCR), allowing the conversion of images of typed, handwritten, or printed text into machine-encoded text from a scanned document.

## DocumentProcessing


![fixed](../images/fixed.png)

* OpenXML formats are susceptible to DoS attacks passing through the timeout mechanism.

## PdfProcessing


![new](../images/new.png)

* Introduced support for Optical Character Recognition (OCR), allowing the conversion of images of typed, handwritten, or printed text into machine-encoded text from a scanned document.
* Introduced support for adding barcodes to a PDF document.
* Introduced option for setting height to table rows.
* Introduced API allowing optimization and reduction of the size of existing PDF files.
* Handled import of documents with missing MediaBox operator.
* Introduced support for import-export of XFA fields.
* Introduced support for Named actions.
* Introduced support for ResetForm action.

![fixed](../images/fixed.png)

* SkiaImageFormatProvider: An AggregateException: 'The given key 'Abc.Visuals.IAbcStrokedRectangle' was not present in the dictionary' is thrown when exporting the pages with SkiaImageFormatProvider. **<sup>.NET Standard</sup>**
* SkiaImageFormatProvider: Signature omitted on export.  **<sup>.NET Standard</sup>**
* SkiaImageFormatProvider: Missing elements on rendered image. **<sup>.NET Standard</sup>**
* SkiaImageFormatProvider: Export to image is slow and the consumed memory is huge. **<sup>.NET Standard</sup>**
* A NullReferenceException is thrown when importing a file with explicitly set UserInterfaceName annotation property to null.
* A NullReferenceException is thrown when importing a document and enumerate the pages.
* A NullReferenceException is thrown when cloning or merging documents containing a Link with Action collection.
* A NotSupportedException is thrown when parsing CFF Type1 font.
* A NotSupportedException is thrown when exporting an image with ICCBased color space and the default ImageCompression is changed.
* Some text is missing when the culture is German.
* А KeyNotFoundException is thrown when reading glyph data with Type1Font.
* A KeyNotFoundException is thrown when loading a document with unsupported annotation.
* An InvalidOperationException: 'Position is out of range.' is thrown while reading the font in the import process.
* An InvalidCastException is thrown when parsing the font for a specific document.
* An IndexOutOfRangeException is thrown when encoding an image with Grayscale color space.
* Images are inverted after export.
* ImageFormatProvider: System.AggregateException exception is thrown when exporting a document to an image. **<sup>.NET Standard</sup>**
* An error in Adobe when inspecting a page with DeviceGray ColorSpace image after import-export.
* An ArgumentNullException is thrown when importing a document with missing indirect reference object.
* An ArgumentException: 'Name cannot contain .(period).' when merging PDF files with form fields.
* SkiaImageFormatProvider: OverflowException is thrown when converting a document to an image.  **<sup>.NET Standard</sup>**
* PdfStreamWriter: JavaScript actions are broken after merging documents.
* A NullReferenceException when Type1 font with random bytes count (lenIV) is set to 0.
* An InvalidCastException is thrown when importing a file with missing space.
* An InvalidCastException is thrown when importing a document with a missing state separator in the object stream.
* A NullReferenceException is thrown when importing a form XObject with null Resources in PDF dictionary.

## SpreadProcessing


![fixed](../images/fixed.png)

* The Export method does not respect the timeout parameter.
* A NullReferenceException is thrown when exporting a workbook with no sheets. A message indicating that a workbook should contain at least one visible sheet is now displayed.
* Name Conflict window is displayed when an XLS file is imported and then exported to XSLX.
* Export to PDF fails in single-threaded platforms.  **<sup>.NET Standard</sup>**
* Duplicating a worksheet with the CopyFrom method does not copy the defined conditional formatting rules.
* An ArgumentNullException is thrown when importing a document containing a rule with no format set.

## WordsProcessing


![fixed](../images/fixed.png)

* Remediated Security Vulnerability [CVE-2024-11629]({%slug kb-security-excessive-iteration-cve-2024-11629%}).  <sup>.NET Standard</sup>

## ZipLibrary


![fixed](../images/fixed.png)

* Remediated Security Vulnerability [CVE-2024-11343]({%slug kb-security-excessive-iteration-cve-2024-11343%}).
