---
title: ZipArchive Entry
page_title: ZipArchive Entry
description: Learn how to use ZipArchiveEntry to work with individual compressed files in a ZIP archive using RadZipLibrary properties and methods.
slug: radziplibrary-ziparchive-entry
tags: ziparchiveentry, radziplibrary, zip, archive, entry, compressed, stream, files
published: True
position: 2
platforms: ajax, mvc, wpf, winforms
---

# ZipArchive Entry

`ZipArchiveEntry` represents each compressed file within a ZIP archive.

## What Is ZipArchiveEntry

The root element of the [RadZipLibrary]({%slug radziplibrary-overview%}) is the [`ZipArchive`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.zip.ziparchive). The `ZipArchive` consists of `ZipArchiveEntry` objects that host all entries in the ZIP archive. You can [get a ZipArchiveEntry](#get-ziparchiveentry) or [create a ZipArchiveEntry](#create-ziparchiveentry) by using the `ZipArchive` instance.

### Properties

The following table describes the properties of `ZipArchiveEntry`:

| Property | Description |
|---|---|
| `CompressedLength` | Gets the compressed size of the entry in the ZIP archive. This value is available only after the `ZipArchiveEntry` is disposed. |
| `ExternalAttributes` | Gets or sets external [file attributes](https://learn.microsoft.com/en-us/dotnet/api/system.io.fileattributes). |
| `FullName` | Gets the relative path of the entry in the ZIP archive. |
| `LastWriteTime` | Gets or sets the last time the entry in the ZIP archive was changed. |
| `Length` | Gets the uncompressed size of the entry in the ZIP archive. This value is available only after the `ZipArchiveEntry` is disposed. |
| `Name` | Gets the filename of the entry in the ZIP archive. |

**Example 1: Get the compressed length of an entry**

<snippet id='codeblock-dst'/>

**Example 2: Set external attributes of an entry**

<snippet id='codeblock-dsu'/>

**Example 3: Get the relative path of an entry**

<snippet id='codeblock-dsv'/>

**Example 4: Set the last write time of an entry**

<snippet id='codeblock-dsw'/>

**Example 5: Get the length of an entry**

<snippet id='codeblock-dsx'/>

**Example 6: Get the name of an entry**

<snippet id='codeblock-dsy'/>

### Methods

The following table describes the methods of `ZipArchiveEntry`:

| Method | Description |
|---|---|
| `Delete` | Deletes the entry from the ZIP archive. |
| `Dispose` | Releases the resources used by the current instance of the `ZipArchiveEntry` class. |
| `Open` | Opens the entry from the ZIP archive. |

### Events

| Event | Description |
|---|---|
| `PropertyChanged` | Occurs when a property value changes. |

## ZipArchive and ZipArchiveEntry

You can perform several operations on a `ZipArchive` instance.

### Get ZipArchiveEntry

Retrieves a wrapper for the specified entry in the ZIP archive.

**Example 7: Get ZipArchiveEntry**

<snippet id='codeblock-dsz'/>

### Create ZipArchiveEntry

Creates an empty entry that has the specified path and entry name in the ZIP archive.

**Example 8: Create ZipArchiveEntry**

<snippet id='codeblock-dta'/>

### Extract ZipArchiveEntry

Extracts an entry to a specific folder or directory.

**Example 9: Extract a ZipArchiveEntry to a folder**

<snippet id='codeblock-dtb'/>

>tip You can also achieve this by using the [Zip Extensions]({%slug radziplibrary-zipextensions%}) `ExtractToFile` method.

## Operating with ZipArchiveEntry

The following examples show specific uses of `ZipArchiveEntry`.

### Using ZipArchiveEntry Properties

The following example includes all the properties discussed in the previous section.

**Example 10: Complete example**

<snippet id='codeblock-dtc'/>

### Working with Folders and Directories

**Example 11: Create folders and directories**

<snippet id='codeblock-dtd'/>

**Example 12: Open files in folders and directories**

<snippet id='codeblock-dte'/>

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Compression Settings]({%slug radziplibrary-compression-settings%})
