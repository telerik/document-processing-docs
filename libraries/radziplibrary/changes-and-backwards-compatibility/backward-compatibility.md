---
title: Backward Compatibility
page_title: Backward Compatibility
slug: radziplibrary-backward-compatibility
tags: backward,compatibility
published: True
position: 1
---

# Backward Compatibility
This article lists the breaking changes and how they can be fixed when upgrading from a specific version of the controls to the next one.

## What's Different in 2024 Q1  

The following constructors are obsolete:

* **ZipArchive(Stream stream)**
* **ZipArchive(Stream stream, ZipArchiveMode mode, bool leaveOpen, Encoding entryNameEncoding)** 
* **ZipArchive(Stream stream, ZipArchiveMode mode, bool leaveOpen, Encoding entryNameEncoding, CompressionSettings compressionSettings, EncryptionSettingsBase encryptionSettings)**

### What to do now

Use the static methods instead:

* **ZipArchive.Create(Stream stream)**
* **ZipArchive.Create(Stream stream, Encoding entryNameEncoding)**
* **ZipArchive.Create(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, EncryptionSettings encryptionSettings)**
* **ZipArchive.Read(Stream stream)**
* **ZipArchive.Read(Stream stream, Encoding entryNameEncoding)**
* **ZipArchive.Read(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, DecryptionSettings decryptionSettings)**
* **ZipArchive.Update(Stream stream)**
* **ZipArchive.Update(Stream stream, Encoding entryNameEncoding)**
* **ZipArchive.Update(Stream stream, Encoding entryNameEncoding, CompressionSettings compressionSettings, DecryptionSettings decryptionSettings)**

>note The new static methods are leaving the stream open (the previously provided parameter "leave stream open" is obsoleted and the customer has the care to close the stream.

### Changed

The **GetCryptoProvider** method accepts **EncryptionSettingsBase** instead of **EncryptionSettings**.

The **DefaultCryptoProvider** class is obsolete. Use PkzipCryptoProvider instead.

The **DefaultEncryptionSettings** class is obsolete. Use the static creation methods of the EncryptionSettings class instead.

## What's Different in 2016 R3  


### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to do now

Use the assemblies with a version number ending with .40 suffix. The library doesn't contain code specific for .NET Framework 4.5, thus an additional version is not needed.


## What's Different in 2015 Q1 - 2015.1.0225


### Changed

The __Telerik.Windows.Zip.ZipPackage__ class is obsolete.


### What to do now

Use the [__Telerik.Windows.Zip.ZipArchive__]({%slug radziplibrary-gettingstarted%}) class instead.            


### Changed

The __Telerik.Windows.Zip.ZipPackageEntry__ class is obsolete.


### What to do now

Use the [__Telerik.Windows.Zip.ZipArchiveEntry__]({%slug radziplibrary-gettingstarted%}) class instead.


### Changed

The __Telerik.Windows.Zip.ZipOutputSrteam__ and __Telerik.Windows.Zip.ZipInputSrteam__ classes are obsolete.


### What to do now

Use the [__Telerik.Windows.Zip.CompressedStream__]({%slug radziplibrary-compress-stream%}) class instead.


## What's Different in 2014 Q1 - 2014.1.0226

### Changed

The __Telerik.Windows.Zip.LZMA.LzmaEncoder__ class is removed as it is intended for internal use only.
            

### Changed

The __Telerik.Windows.Zip.ZipInputStream(System.IO.Stream, System.Boolean)__ constructor is removed.
            

### What to do now

Use the __Telerik.Windows.Zip.ZipInputStream(System.IO.Stream)__ constructor instead.
            

### Changed

The __System.Void Telerik.Windows.Zip.ZipPackage::Add(System.String[])__ method is removed.
            

### What to do now

You can use the __System.Void Telerik.Windows.Zip.ZipPackage::Add(System.Collections.Generic.IEnumerable<string>)__   method instead.
            

### Changed

The __System.Void Telerik.Windows.Zip.ZipPackage::Add(System.String[])__ method is removed.
            

### What to do now

You can use the __System.Void Telerik.Windows.Zip.ZipPackage::Add(System.Collections.Generic.IEnumerable<string>)__  method instead.
            

### Changed

The __System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.String, System.IO.Stream)__ method is removed.
            

### What to do now

You can use the __System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.IO.Stream, System.String)__ method instead.
            

### Changed

The __System.Void Telerik.Windows.Zip.ZipPackage::AddStream(Telerik.Windows.Zip.ZipCompression, System.String, System.IO.Stream, System.DateTime)__ method is removed.
            

### What to do now

You can use the __System.Void Telerik.Windows.Zip.ZipPackage::AddStream(System.IO.Stream, System.String, Telerik.Windows.Zip.ZipCompression, System.DateTime)__ method instead.
            

### Changed

The __Telerik.Windows.Zip.ZipPackage Telerik.Windows.Zip.ZipPackage::Open(System.IO.Stream, System.IO.FileAccess)__ method is removed.
            

### What to do now

You can use the __Telerik.Windows.Zip.ZipPackage Telerik.Windows.Zip.ZipPackage::Open(System.IO.Stream)__ method instead.
            
