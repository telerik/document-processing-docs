---
title: Changes
page_title: Changes
description: Learn about the new features and changes introduced in RadZipLibrary across different releases including AES encryption and ZIP64 support.
slug: radziplibrary-changes
tags: changes, radziplibrary, zip, releases, aes, encryption, compression, new
published: True
position: 0
---

# Changes

This article summarizes the new functionality introduced in the library and provides links to relevant documentation.

## What Is New in 2024 Q1

The strong AES encryption algorithm was introduced. RadZipLibrary now supports only reading and extracting AES-protected archives. [Read more]({%slug radziplibrary-protect-ziparchive%}).

## What Is New in 2014 Q1 - 2014.1.0226

* The ZIP library was redesigned for better cross-platform compatibility (.NET, Silverlight, Windows Store Apps, and Windows Phone), better support of the standards, and better features.

* The ZIP library now supports both ZIP and ZIP64 specifications. This means large ZIP files with more than 4 GB length are supported.

* The new API supports password protection. Only traditional PKWARE encryption is available now.

* The existing ZIP library API (`ZipPackage`, `ZipPackagerEntry`, `ZipInputStream`, and `ZipOutputStream`) was changed to be a proxy to the new API.
