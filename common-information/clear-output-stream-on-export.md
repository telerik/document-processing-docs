---
title: Automatic Output Stream Clearing on Export
description: The Export methods of all format providers automatically clear the output stream before writing, preventing corrupted documents when reusing streams.
page_title: Automatic Output Stream Clearing on Export
slug: common-export-output-stream-clearing
tags: export, stream, clear, format, provider, document, processing
published: True
position: 0
---

# Automatic Output Stream Clearing on Export

|Minimum Version|Q2 2026|
|----|----|

Starting with Q2 2026, the `Export()` methods of all [format providers]({%slug introduction%}#supported-formats) in the Telerik Document Processing Libraries automatically clear the output stream before writing new content. When the `Export()` method is called on a seekable stream, the stream is truncated to zero length before writing, ensuring that no stale data remains.

## Behavioral Change

When reusing a `Stream` for multiple consecutive export operations, for example, exporting to a `MemoryStream` or a `FileStream` opened with `FileMode.OpenOrCreate`, the previously written content could remain at the tail of the stream if the new document was smaller than the old one. This caused corrupted output files because trailing bytes from the earlier export persisted after the new export completed.

The base classes that all format providers inherit from now perform the stream clearing automatically. The affected format providers include:

| Library | Format Providers |
|---|---|
| RadPdfProcessing | `PdfFormatProvider`, `SkiaImageFormatProvider` |
| RadWordsProcessing | `DocxFormatProvider`, `DocFormatProvider`, `RtfFormatProvider`, `HtmlFormatProvider`, `TxtFormatProvider`, `PdfFormatProvider` |
| RadSpreadProcessing | `XlsxFormatProvider`, `XlsFormatProvider`, `XlsmFormatProvider`, `CsvFormatProvider`, `TxtFormatProvider`, `PdfFormatProvider`, `JsonFormatProvider` |

>note The stream is cleared only when `Stream.CanSeek` returns `true`. Non-seekable streams (such as network streams) are not affected and continue to behave as before.

No code changes are required on the consumer side. The clearing happens automatically inside the `Export()` methods.

## Using the Export Methods with Reused Streams

**Example 1: Reusing a MemoryStream for Multiple Exports**

<snippet id='reuse-stream-for-multiple-exports'/>

When reusing a stream, the second `Export()` call truncates the stream to zero length before writing, so only the new document data is present.

**Example 2: Exporting to a FileStream**

<snippet id='export-to-filestream'/>

Even when opening the file with `FileMode.OpenOrCreate`, the stream is cleared automatically so no leftover data from a previous file remains.

>tip If you open a `FileStream` with `FileMode.Create`, the file is already truncated by the OS, so the automatic clearing has no additional effect in that scenario.

## Backward Compatibility

>important This is a **behavioral change** in existing `Export()` methods. Code that intentionally preserves prior stream content before calling `Export()` is affected. The stream is now always truncated before writing. If you need to prepend content, write it after the export completes, or use a separate stream and combine them afterward.

For the majority of usage scenarios, where the stream is either freshly created or being reused for a new export, this change is transparent and prevents potential file corruption.

## See Also

* [Using PdfFormatProvider in RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [Using DocxFormatProvider in RadWordsProcessing]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})
* [Timeout Mechanism in Document Processing Libraries]({%slug timeout-mechanism-in-dpl%})