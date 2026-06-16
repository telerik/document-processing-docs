---
title: Backward Compatibility
description: Learn about the breaking changes in RadZipLibrary and how to migrate your code when upgrading between different versions of the library.
page_title: Backward Compatibility
slug: radziplibrary-backward-compatibility
tags: migration, compatibility, radziplibrary, zip, breaking, versions, upgrade, archive
published: True
position: 1
---

# Backward Compatibility

This article lists the breaking changes and how to fix them when upgrading from a specific version of the library to the next one.

## What Is Different in 2024 Q1

### Changed

The following constructors are obsolete:

* `ZipArchive(Stream stream)`
* `ZipArchive(Stream stream, ZipArchiveMode mode, bool leaveOpen, Encoding entryNameEncoding)`
* `ZipArchive(Stream stream, ZipArchiveMode mode, bool leaveOpen, Encoding entryNameEncoding, CompressionSettings compressionSettings, EncryptionSettingsBase encryptionSettings)`

### What to Do Now

Use the static methods instead:

* `ZipArchive.Create(Stream stream)`
* `ZipArchive.Create(Stream stream, Encoding entryNameEncoding)`
* `ZipArchive.Create(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, EncryptionSettings encryptionSettings)`
* `ZipArchive.Read(Stream stream)`
* `ZipArchive.Read(Stream stream, Encoding entryNameEncoding)`
* `ZipArchive.Read(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, DecryptionSettings decryptionSettings)`
* `ZipArchive.Update(Stream stream)`
* `ZipArchive.Update(Stream stream, Encoding entryNameEncoding)`
* `ZipArchive.Update(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, DecryptionSettings decryptionSettings)`

>note The new static methods leave the stream open. The previously provided parameter "leave stream open" is obsolete and the consumer is responsible for closing the stream.

### Changed

The `GetCryptoProvider` method accepts `EncryptionSettingsBase` instead of `EncryptionSettings`.

The `DefaultCryptoProvider` class is obsolete. Use `PkzipCryptoProvider` instead.

The `DefaultEncryptionSettings` class is obsolete. Use the static creation methods of the `EncryptionSettings` class instead.

## What Is Different in 2016 R3

### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to Do Now

Use the assemblies with a version number ending with .40 suffix. The library does not contain code specific to .NET Framework 4.5, so an additional version is not needed.

## What Is Different in 2015 Q1 - 2015.1.0225

### Changed

The `Telerik.Windows.Zip.ZipPackage` class is obsolete.

### What to Do Now

Use the [`Telerik.Windows.Zip.ZipArchive`]({%slug radziplibrary-gettingstarted%}) class instead.

### Changed

The `Telerik.Windows.Zip.ZipPackageEntry` class is obsolete.

### What to Do Now

Use the [`Telerik.Windows.Zip.ZipArchiveEntry`]({%slug radziplibrary-gettingstarted%}) class instead.

### Changed

The `Telerik.Windows.Zip.ZipOutputSrteam` and `Telerik.Windows.Zip.ZipInputSrteam` classes are obsolete.

### What to Do Now

Use the [`Telerik.Windows.Zip.CompressedStream`]({%slug radziplibrary-compress-stream%}) class instead.

## What Is Different in 2014 Q1 - 2014.1.0226

### Changed

The `Telerik.Windows.Zip.LZMA.LzmaEncoder` class is removed because it is intended for internal use only.

### Changed

The `Telerik.Windows.Zip.ZipInputStream(System.IO.Stream, System.Boolean)` constructor is removed.

### What to Do Now

Use the `Telerik.Windows.Zip.ZipInputStream(System.IO.Stream)` constructor instead.

### Changed

The `System.Void Telerik.Windows.Zip.ZipPackage::Add(System.String[])` method is removed.

### What to Do Now

Use the `System.Void Telerik.Windows.Zip.ZipPackage::Add(System.Collections.Generic.IEnumerable<string>)` method instead.

### Changed

The `System.Void Telerik.Windows.Zip.ZipPackage::Add(System.String[])` method is removed.

### What to Do Now

Use the `System.Void Telerik.Windows.Zip.ZipPackage::Add(System.Collections.Generic.IEnumerable<string>)` method instead.

### Changed

The `System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.String, System.IO.Stream)` method is removed.

### What to Do Now

Use the `System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.IO.Stream, System.String)` method instead.

### Changed

The `System.Void Telerik.Windows.Zip.ZipPackage::AddStream(Telerik.Windows.Zip.ZipCompression, System.String, System.IO.Stream, System.DateTime)` method is removed.

### What to Do Now

Use the `System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.IO.Stream, System.String, Telerik.Windows.Zip.ZipCompression, System.DateTime)` method instead.

### Changed

The `Telerik.Windows.Zip.ZipPackage Telerik.Windows.Zip.ZipPackage::Open(System.IO.Stream, System.IO.FileAccess)` method is removed.

### What to Do Now

Use the `Telerik.Windows.Zip.ZipPackage Telerik.Windows.Zip.ZipPackage::Open(System.IO.Stream)` method instead.
