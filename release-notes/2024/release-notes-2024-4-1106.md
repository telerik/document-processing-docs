---
title: Version 2024.4.1106 (Q4 2024)
page_title: What is new in 2024.4.1106 (Q4 2024) for the Document Processing Libraries
description: 2024.4.1106 (Q4 2024)
slug: release-notes-2024-4-1106
tags: 2024.4.1106,Q4,2024
published: True
position: 0
---


# 2024.4.1106 (Q4 2024)


## What's New


![new](../images/new.png)

* PDF Processing: Introduced support for JavaScript actions.
* PDF Processing: Introduced support for ligatures.
* WordsProcessing: Introduced support for Justify text alignment.

## What's Changed


![changed](../images/changed.png)

* Document Processing Libraries: Remediated [CVE-2024-8049](https://www.cve.org/CVERecord?id=CVE-2024-8049) - [Timeout Mechanism]({%slug timeout-mechanism-in-dpl%}) for importing and exporting documents was introduced.

## PdfProcessing


![new](../images/new.png)

* Introduced support for Matte color for Soft-Mask Images (SMasks).
* Introduced support for creating documents using CMYK colors.
* Introduced support for JavaScript actions API.
* SkiaImageFormatProvider: Introduced support for Text, TextMarkup, Line, and Stamp annotations.
* Respect the ExtGState`s current stroking alpha constant (CA &amp; ca) when rendering images.
* Introduced support for ligatures.
* Introduced handling the import of documents with the wrong type of action key.
* Introduced support for Trigger Events API related to JS actions.
* Introduced API for setting Image opacity.
* Introduced support for RTL (Right-To-Left) text.
* Introduced Soft-Mask Dictionaries in ExtGState object.
* Implemented Blend Mode parameter of ExtGState object.
* Introduced support for Trigger Events.
* Justified text is now supported.
* Introduced support for Transparency Group XObjects.

![fixed](../images/fixed.png)

* An InvalidOperationException is thrown while parsing the Post table of a specific font file on export.
* Wrong colors are exported in Separation colorspaces with ICCBased containing LabColor due to incorrect calculations in Tint transformation function.
* Win32Exception is thrown during a long-running process importing many documents with images.
* An unexpected trace warning when SVG document does not contain clipping.
* Distorted SVG after exporting.
* SkiaImageFormatProvider: Export to image is blocked when Export method is used instead of ExportAsync.
* A NullReferenceException is thrown when writing image content with the PdfPageStreamWriter.
* ArgumentNullException is thrown when resolving DecodeParms collection in Image XObject.
* Form XObject does not takes graphic state color from its content stream context.
* Document text overlaps and is not possible to read for a specific document.
* Decreased performance when loading thumbnails.
* Wrong color appears when the Separation color space with name is set to None.
* Watermark transparency is not imported correctly.
* The Form object does no inherit the graphics state of the page.
* RTL (right-to-left) text is reversed when inserting it directly to a document.

## SpreadProcessing


![fixed](../images/fixed.png)

* Exporting a workbook with two or more charts with axes produces an invalid document.
* Built-in number formats are not reevaluated after changing the culture.

## SpreadStreamProcessing


![new](../images/new.png)

* Introduced support for importing files with absolute relationship targets.

![fixed](../images/fixed.png)

* Cell iteration is interrupted when it hits a cell containing an error.

## WordsProcessing


![new](../images/new.png)

* Introduced support for Justify text alignment.

![fixed](../images/fixed.png)

* RtfFormatProvider: Heading color is not properly exported.
* An InvalidOperationException is thrown when exporting a document containing table with no cells.
* DocFormatProvider: IndexOutOfRangeException is thrown when importing a specific document with defined section columns.
* ArgumentException is thrown during MailMerge of a document with an inline shape.

## ZipLibrary


![fixed](../images/fixed.png)

* An invalid content appears after updating an empty password-protected archive.
