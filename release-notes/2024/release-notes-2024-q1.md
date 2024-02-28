---
title: 2024 Q1 (version 2024.1.124)
page_title: What is new in Q1 2024 for the Document Processing Libraries
description: 2024 Q1 (version 2024.1.124)
slug: release-notes-2024-q1
tags: q1, 2024, release, notes
published: True
position: 0
---
# 2024 Q1 (version 2024.1.124)

## PdfProcessing

![new](../images/new.png)

* Exposed the IsBold property of FontBase.
* Added support for embedding ZUGFeRD invoices.
* Introduced support for embedding file streams.

![fixed](../images/fixed.png)

* An unwanted Stopwatch is contained in the DocumentCatalog class. 
* A NullReferenceException is thrown when getting the hash code of CFF font`s UnderlineThickness.  
* A NullReferenceException is thrown on import because the value of the TransformMethod property is not obtained when Refence is set as an indirect reference. 
* A NullReferenceException is thrown on export because the value of TransformMethod property is not obtained.  
* A NotSupportedException is thrown when decoding a CalRgb ColorSpace image. 
* Missing characters when exporting a document containing different font types but with the same name and properties. 
* Import-export specific document with Type1Font mangles text.  
* DrawTable is not setting the HasPendingContent property correctly.  
* Some characters in Wingdings (or custom) font are exported with a different font.  

## SpreadProcessing

![fixed](../images/fixed.png)

* The XlsxFormatProvider.Import method closes the stream passed to it as an argument.
* An InvalidOperationException is thrown: The axes are incorrectly paired exception on import.
* Left and Top-most borders are not rendered when exporting to PDF.

## WordsProcessing

![fixed](../images/fixed.png)

* Inline image surrounded by bookmarks is incorrectly measured when the document contains numbering fields.

## ZipLibrary

![new](../images/new.png)

* Added support for extraction of AES-encrypted archives.

![changed](../images/changed.png)

* Changed GetCryptoProvider() method signature. It now accepts EncryptionSettingsBase instead of EncryptionSettings. 
* Removed long-time obsoleted classes: CompressionType, ZipCompression, ZipInputStream, ZipOutputStream, ZipPackage, ZipPackageEntry. Use ZipArchive, CompressedStream, and ZipArchiveEntry instead. 
