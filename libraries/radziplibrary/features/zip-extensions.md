---
title: Zip Extensions
page_title: Zip Extensions
slug: radziplibrary-zipextensions
tags: zip, extensions
published: True
position: 6
platforms: ajax, mvc, wpf, winforms
---

# Zip Extensions

In addition to the main __ZipLibrary__ control, you could take advantage of a set of helper methods, divided in two classes, which will help you to implement your scenarios faster. All these methods are in the __Telerik.Windows.Zip.Extensions.dll__. 

>In [**UI for WinForms**](https://docs.telerik.com/devtools/winforms/introduction), the classes are merged in **Telerik.WinControls.dll**, so you will need to refer that assembly instead of Telerik.Windows.Zip.Extensions.dll.

In this article you will find the classes and their members.


## The ZipFile class

With the __ZipFile__ class, you can utilize static methods to create, extract, or open zip archives with minimal code. Starting with the **Q2 2025** release, some methods now include an additional optional parameter `(TimeSpan? timeout)`. The older overloads of these specific methods, which do not include this parameter, are now obsolete. 

* **[ZipArchiveEntry]({%slug radziplibrary-update-ziparchive%}) CreateEntryFromFile(this ZipArchive destination, string sourceFileName, string entryName, _TimeSpan? timeout_)** – Archives a file by compressing it and adding it to the zip archive. You can also specify the __CompressionLevel__ or __CompressionSettings__ of the __ZipEntry__ using other overloads.

* **void CreateFromDirectory(string sourceDirectoryName, string destinationArchiveFileName, _TimeSpan? timeout_)**: Creates a zip archive containing the files and directories from the specified directory. Additional overloads allow you to configure various settings for the entries.

* **void ExtractToDirectory(string sourceArchiveFileName, string destinationDirectoryName, _TimeSpan? timeout_)**: Extracts all the files in the specified zip archive to a directory on the file system.

* **void ExtractToFile(this ZipArchiveEntry source, string destinationFileName, _TimeSpan? timeout_)**: Extracts an entry in the zip archive to a file. You can also specify whether to overwrite an existing file with the same name as the destination file.

* __ZipArchive Open(string archiveFileName, ZipArchiveMode mode)__: Opens a zip archive at the specified path and in the specified mode. Another overload allows specifying the encoding to use when reading or writing entry names in this archive. Specify a value for this parameter only when an encoding is required for interoperability with zip archive tools and libraries that do not support UTF-8 encoding for entry names.

* __ZipArchive OpenRead(string archiveFileName)__: Opens a zip archive for reading at the specified path. 

* __bool IsDirectoryEmpty(DirectoryInfo directoryInfo)__: Indicates whether specified directory is empty or not. 


## The DotNetPlatformManager class

This class implements the [IPlatformManager](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.IPlatformManager.html) interface, which provides platform-specific operations. In the general case you won't need to implement new platform managers, as this default implementation already take advantage of the current platform (.NET Framework) as much as possible.

### Properties

* __string AltDirectorySeparatorChar__: Gets a platform-specific alternate character used to separate directory levels in a path string that reflects a hierarchical file system organization.

* __Encoding DefaultEncoding__: Gets default encoding for this platform.

* __string DirectorySeparatorChar__: Gets a platform-specific character used to separate directory levels in a path string that reflects a hierarchical file system organization.

* __TemporaryStreamType TemporaryStreamType__: Gets or sets type of the temporary stream. The default value is TemporaryStreamType.Memory.


### Methods

* __stream CreateTemporaryStream()__: Creates temporary stream. Stream will be used for temporary operations.

* __void DeleteTemporaryStream(Stream stream)__: Deletes temporary stream.

* __ICryptoProvider GetCryptoProvider(EncryptionSettingsBase settings)__: Gets crypto provider initialized using given encryption settings.

* __bool IsEncodingSupported(Encoding encoding)__: Indicates whether specified encoding is supported for this platform. <returns>true if encoding is allowed in the ZIP file.


## See Also

* [Compression Settings]({%slug radziplibrary-compression-settings%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
