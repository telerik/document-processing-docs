---
title: 2024.2.426 (2024 Q2)
page_title: What is new in 2024.2.426 (2024 Q2) for the Document Processing Libraries
description: 2024.2.426 (2024 Q2)
slug: release-notes-2024-2-426 
tags: 2024.2.426,2024,Q2
published: True
position: 0
---


# 2024.2.426 (2024 Q2)


## What's New


![new](../images/new.png)

* The minimum supported .NET Framework version for Document Processing Libraries is now 4.6.2.

## Changed


![new](../images/new.png)

* Document Processing Libraries Versions built against .Net Framework 4.0 and NetCore 3.1 are now removed.

## PdfProcessing


![new](../images/new.png)

* Exposed an option to plug logic for embedding a subset of a registered font for frameworks different from .NET Framework.
* Introduced support for OTF font file format.
* Handle documents containing invalidly located clipping path operators.
* Handle documents with invalid structure of path construction operators.

![fixed](../images/fixed.png)

* Text rendering is not correct in scenarios with negative font and/or negative horizontal scaling.
* A NotSupportedCompressionMethodException with the message - Cannot decode stream with a not supported compression method.
* Incorrect characters are displayed when merging multiple PDF documents with the RadFixedDocument.Merge method.
* A NullReferenceException is thrown when exporting a document with CFF Type1 font.
* Import-export causes missing characters with specific document.
* An InvalidOperationException is thrown when exporting font that is available but not used.
* The read-only flag is not respected when importing a document.
* A dictionary with invalid entry cannot be imported correctly and breaks the import process.
* The Form field height is wrong after export with a specific document..
* Wrong character widths when merging documents with exactly the same font but different character widths.

## SpreadProcessing


![new](../images/new.png)

* Introduces Description property for FloatingShapeBase.

## SpreadStreamProcessing


![fixed](../images/fixed.png)

* The application is stuck when importing the last row of a worksheet which has a property set but has no cells.

## WordsProcessing


![fixed](../images/fixed.png)

* A NullReferenceException is thrown when a Hyperlink is placed before a MailMerge group.
* Image in Header or Footer with IsBehindDocument set to True is rendered on top of the text.

## ZipLibrary


![fixed](../images/fixed.png)

* Cannot open newly added files to a password-protected zip archive.
