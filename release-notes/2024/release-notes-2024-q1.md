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

|||
|----|----|
|![new](./images/new.png)|Exposed the IsBold property of FontBase.|
|![new](./images/new.png)|Added support for embedding ZUGFeRD invoices.|
|![new](./images/new.png)|Introduced support for embedding file streams.|
|![new](./images/fixed.png)|An unwanted Stopwatch is contained in the DocumentCatalog class. |
|![new](./images/fixed.png)|A NullReferenceException is thrown when getting the hash code of CFF font`s UnderlineThickness.  |
|![new](./images/fixed.png)|A NullReferenceException is thrown on import because the value of the TransformMethod property is not obtained when Refence is set as an indirect reference. |
|![new](./images/fixed.png)|A NullReferenceException is thrown on export because the value of TransformMethod property is not obtained.  |
|![new](./images/fixed.png)|A NotSupportedException is thrown when decoding a CalRgb ColorSpace image. |
|![new](./images/fixed.png)|Missing characters when exporting a document containing different font types but with the same name and properties. |
|![new](./images/fixed.png)|Import-export specific document with Type1Font mangles text.  |
|![new](./images/fixed.png)|DrawTable is not setting the HasPendingContent property correctly.  |
|![new](./images/fixed.png)|Some characters in Wingdings (or custom) font are exported with a different font.  |

## SpreadProcessing

|||
|----|----|
|![new](./images/fixed.png)|The XlsxFormatProvider.Import method closes the stream passed to it as an argument.|
|![new](./images/fixed.png)|An InvalidOperationException is thrown: The axes are incorrectly paired exception on import.|
|![new](./images/fixed.png)|Left and Top-most borders are not rendered when exporting to PDF.|

## WordsProcessing

|||
|----|----|
|![new](./images/fixed.png)|Inline image surrounded by bookmarks is incorrectly measured when the document contains numbering fields..|


## ZipLibrary

|||
|----|----|
|![new](./images/new.png)|Added support for extraction of AES-encrypted archives.|
|![new](./images/changed.png)|Changed GetCryptoProvider() method signature. It now accepts EncryptionSettingsBase instead of EncryptionSettings. |
|![new](./images/changed.png)|Removed long-time obsoleted classes: CompressionType, ZipCompression, ZipInputStream, ZipOutputStream, ZipPackage, ZipPackageEntry. Use ZipArchive, CompressedStream, and ZipArchiveEntry instead. |
