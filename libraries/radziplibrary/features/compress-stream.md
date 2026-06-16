---
title: Compressing a Stream
page_title: Compressing a Stream
description: Learn how to compress and decompress streams with the CompressedStream class in RadZipLibrary using Deflate, LZMA, or Store settings.
slug: radziplibrary-compress-stream
tags: compression, stream, radziplibrary, zip, compressedstream, decompress, dotnet, archive
published: True
position: 3
---

# Compressing a Stream

**RadZipLibrary** helps you compress a stream, for example, to send it over the internet. The library provides the `CompressedStream` class that compresses and decompresses streams.

This article covers the following topics:

* [API Overview](#api-overview)

* [Compressing a Stream](#compressing-a-stream)

* [Decompressing a Stream](#decompressing-a-stream)

* [CompressedStream Properties](#compressedstream-properties)

## API Overview

The `CompressedStream` class allows you to compress and decompress a stream. Initialize the class with one of the constructor overloads:

* `CompressedStream(Stream baseStream, StreamOperationMode mode, CompressionSettings settings)`

* `CompressedStream(Stream baseStream, StreamOperationMode mode, CompressionSettings settings, bool useCrc32, EncryptionSettings encryptionSettings)`

The parameters accepted by the constructors serve the following functions:

* `Stream baseStream`—A reference to a stream where the compressed result is written when compressing data or the compressed stream that needs to be decompressed when decompressing data.

* `StreamOperationMode mode`—Specifies the operation mode of the compressed stream. Use `Write` for compressing data and `Read` for decompressing.

* `CompressionSettings settings`—The settings used for the compression. The compression settings can be of type `DeflateSettings`, `LzmaSettings`, and `StoreSettings`. You can read more on the topic in the [Compression Settings]({%slug radziplibrary-compression-settings%}) article.

* `bool useCrc32`—Indicates whether to use CRC32 (`true`) or Adler32 (`false`) checksum algorithm.

* `EncryptionSettings encryptionSettings`—Specifies the encryption settings that are used. If a `null` value is passed, encryption is not performed. More information on the topic is available in the [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%}) article.

## Compressing a Stream

You can create a compressed stream by initializing a new instance of the `CompressedStream` class. Pass as a parameter the stream in which the compressed data is written. Set the operation mode to `Write` and the compression settings that the operation uses.

**Example 1: Write to a compressed stream**

<snippet id='codeblock-dsh'/>

If you want to compress a specific stream (`inputStream`), you need to copy it to the compressed stream that you created.

**Example 2: Write a stream to a compressed stream**

<snippet id='codeblock-dsi'/>

## Decompressing a Stream

Decompressing a stream follows the same pattern as compressing it. Create a new instance of the `CompressedStream` class and pass it the stream from which the compressed data is extracted, operation mode `Read`, and the compression settings that need to be used.

**Example 3: Decompress a stream**

<snippet id='codeblock-dsj'/>

## CompressedStream Properties

`CompressedStream` derives from the `Stream` class and supports all its properties. It also exposes a set of properties that provide further information about the compressed stream:

* `BaseStream`—Property of type [Stream](https://learn.microsoft.com/en-us/dotnet/api/system.io.stream), which obtains the stream that is compressed.

* `Checksum`—Numeric value representing the checksum of the compressed stream.

* `CompressedSize`—The size of the compressed stream.

* `Length`—The uncompressed size of the stream.

## See Also

* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
* [Compression Settings]({%slug radziplibrary-compression-settings%})
* [ZipLibrary Stream Compression Demo](https://demos.telerik.com/document-processing/ziplibrary/compress_stream)
