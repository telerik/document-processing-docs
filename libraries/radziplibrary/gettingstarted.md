---
title: Getting Started
description: Learn how to get started with RadZipLibrary to create, load, and edit ZIP archives in your .NET applications.
page_title: Getting Started
slug: radziplibrary-gettingstarted
tags: radziplibrary, zip, archive, started, nuget, create, extract, dotnet
published: True
position: 1
---

# Getting Started

**RadZipLibrary** allows you to load data from existing ZIP archives or create and edit ZIPs that can be used by other applications. You can also create ZIP archives in memory or use a stream to get data and add it to a ZIP archive.

>note If you do not have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can get the packages through the different suites.

The `ZipArchive` class represents the ZIP archive. You can use it in the following modes:

* `Read`: Allows reading from an existing ZIP archive. In this mode, you cannot add or update archive entries.

* `Create`: Allows creation of a new archive. In this mode, you can add new entries to the archive but cannot read or update entries that are already written.

* `Update`: Allows updating an existing ZIP archive. In this mode, you can add new entries, read existing entries, and update existing entries.

## Required References

Find the required references in the [ZipLibrary NuGet packages]({%slug available-nuget-packages%}#ziplibrary-packages) section.

## Open ZIP Archive

The following code snippet shows how to open an existing ZIP archive with the `ZipArchive` class.

**Example 1: Open Archive**

<snippet id='codeblock-dse'/>

The `archive` variable holds the compressed files in the selected ZIP. You can access these files through the `ZipArchive.Entries` property. It holds a collection of [ZipArchiveEntry]({%slug radziplibrary-update-ziparchive%}) elements that describe the archived files. Use these elements to get the name of the compressed file, its uncompressed and compressed size, and other file attributes.

## Create ZIP Archive

**Example 2** shows how to create a new ZIP archive with the `ZipArchive` class and add a text file to it.

**Example 2: Create Archive**

<snippet id='codeblock-dsf'/>

>tip If you use `StreamWriter` to write content to the stream, call the `Flush()` method to flush the data to the stream.

>important Do not close the stream opened by the `ZipArchiveEntry.Open()` method. Otherwise, the result is unpredictable.

The constructor of `ZipArchive` lets you set whether to keep the stream associated with the instance open. If you set the `leaveOpen` parameter to `false`, the library closes the underlying stream when the `ZipArchive` instance is disposed. If you need to continue working with that stream (to send it as a response, for example), pass `true` for the `leaveOpen` parameter.

**Example 3: Create Archive in a MemoryStream**

<snippet id='codeblock-dsg'/>

For more examples, go to the [Developer Focused Examples]({%slug radziplibrary-sdk-examples%}) section of the library.

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [ZipLibrary Basic Usage Demo](https://demos.telerik.com/document-processing/ziplibrary)
