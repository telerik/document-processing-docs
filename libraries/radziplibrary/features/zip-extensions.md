---
title: Zip Extensions
page_title: Zip Extensions
slug: radziplibrary-zipextensions
tags: extensions, radziplibrary, zip, zipfile, extract, create, dotnet, helpers
published: True
position: 6
platforms: ajax, mvc, wpf, winforms
---

# Zip Extensions

In addition to the main __ZipLibrary__ control, you could take advantage of a set of helper methods, divided in two classes, which will help you to implement your scenarios faster. All these methods are in the __Telerik.Windows.Zip.Extensions__ NuGet package. 

>In [**UI for WinForms**](https://docs.telerik.com/devtools/winforms/introduction), the classes are merged in **Telerik.WinControls**, so you will need to refer that package instead of Telerik.Windows.Zip.Extensions.

In this article you will find the classes and their members.

## The ZipFile class

With the `ZipFile` class, you can utilize static methods to create, extract, or open zip archives with minimal code. Starting with the **Q2 2025** release, some methods now include an additional optional parameter `(TimeSpan? timeout)`. The older overloads of these specific methods, which do not include this parameter, are now obsolete.

The following table describes the methods of the `ZipFile` class:

| Method | Description |
|---|---|
| `CreateEntryFromFile(this ZipArchive destination, string sourceFileName, string entryName, TimeSpan? timeout)` | Archives a file by compressing it and adding it to the zip archive. Other overloads allow specifying `CompressionLevel` or `CompressionSettings`. See [ZipArchiveEntry]({%slug radziplibrary-update-ziparchive%}). |
| `CreateFromDirectory(string sourceDirectoryName, string destinationArchiveFileName, TimeSpan? timeout)` | Creates a zip archive containing the files and directories from the specified directory. Additional overloads allow configuring various settings for the entries. |
| `ExtractToDirectory(string sourceArchiveFileName, string destinationDirectoryName, TimeSpan? timeout)` | Extracts all the files in the specified zip archive to a directory on the file system. |
| `ExtractToFile(this ZipArchiveEntry source, string destinationFileName, TimeSpan? timeout)` | Extracts an entry in the zip archive to a file. You can also specify whether to overwrite an existing file with the same name as the destination file. |
| `Open(string archiveFileName, ZipArchiveMode mode)` | Opens a zip archive at the specified path and in the specified mode. Another overload allows specifying the encoding for entry names. |
| `OpenRead(string archiveFileName)` | Opens a zip archive for reading at the specified path. |
| `IsDirectoryEmpty(DirectoryInfo directoryInfo)` | Indicates whether the specified directory is empty or not. |


## The DotNetPlatformManager class

This class implements the [IPlatformManager](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Zip.IPlatformManager.html) interface, which provides platform-specific operations. In the general case you won't need to implement new platform managers, as this default implementation already take advantage of the current platform (.NET Framework) as much as possible.

### Properties

The following table describes the properties of the `DotNetPlatformManager` class:

| Property | Description |
|---|---|
| `AltDirectorySeparatorChar` | Gets a platform-specific alternate character used to separate directory levels in a path string. |
| `DefaultEncoding` | Gets the default encoding for this platform. |
| `DirectorySeparatorChar` | Gets a platform-specific character used to separate directory levels in a path string. |
| `TemporaryStreamType` | Gets or sets the type of the temporary stream. The default value is `TemporaryStreamType.Memory`. |


### Methods

The following table describes the methods of the `DotNetPlatformManager` class:

| Method | Description |
|---|---|
| `CreateTemporaryStream()` | Creates a temporary stream used for temporary operations. |
| `DeleteTemporaryStream(Stream stream)` | Deletes the temporary stream. |
| `GetCryptoProvider(EncryptionSettingsBase settings)` | Gets a crypto provider initialized using the given encryption settings. |
| `IsEncodingSupported(Encoding encoding)` | Indicates whether the specified encoding is supported for this platform. Returns `true` if the encoding is allowed in the ZIP file. |


## See Also

* [Compression Settings]({%slug radziplibrary-compression-settings%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
