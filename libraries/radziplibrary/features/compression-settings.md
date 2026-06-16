---
title: Compression Settings
page_title: Compression Settings
description: Learn how to configure compression settings in RadZipLibrary including Deflate, LZMA, and Store algorithms for ZIP archive operations.
slug: radziplibrary-compression-settings
tags: compression, settings, radziplibrary, zip, deflate, algorithm, level, zlib, archive
published: True
position: 4
---

# Compression Settings

**RadZipLibrary** allows you to compress and decompress data in your application. There are different settings that you can use for compression. This article discusses all of them.

## Deflate Settings

Deflate settings compress data using a combination of the LZ77 algorithm and Huffman coding.

>tip You can find more information on the Deflate data compression algorithm [in Wikipedia](https://en.wikipedia.org/wiki/DEFLATE).

The `DeflateSettings` class exposes the following configurable parameters:

* `CompressionLevel`—Property of type `CompressionLevel` that represents the level of compression of the algorithm.

* `HeaderType`—Represents the compression stream header type. The possible values are `None` and `ZLib`.

**Example 1: Create DeflateSettings**

<snippet id='codeblock-dsk'/>

## LZMA Settings

LZMA settings compress data using the Lempel-Ziv-Markov chain algorithm (LZMA).

>tip You can read more about LZMA [in Wikipedia](https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Markov_chain_algorithm).

The configurable parameters of the `LzmaSettings` class are as follows:

* `DictionarySize`—The size of the used dictionary. Allowed values are in the range [0–27] and the default value is 23 (8 MB).

* `PositionStateBits`—The number of position state bits. Allowed values are in the range [0–4]. The default value is 2.

* `LiteralContextBits`—The number of literal context bits. Allowed values are in the range [0–4]. The default value is 3.

* `LiteralPositionBits`—The number of literal position bits. Allowed values are in the range [0–4]. The default value is 3.

* `FastBytes`—The number of fast bytes. Allowed values are in the range [5–273]. The default value is 32.

* `MatchFinderType`—The type of the match finder. Allowed values are BT2 (match finder that uses two bytes for the hash) and BT4 (uses four bytes for the hash).

**Example 2: Create LzmaSettings**

<snippet id='codeblock-dsl'/>

## Store Settings

Store settings store the data without applying any compression.

**Example 3: Create StoreSettings**

<snippet id='codeblock-dsm'/>

## See Also

* [Compressing a Stream]({%slug radziplibrary-compress-stream%})
