---
title: Update ZipArchive
page_title: Update ZipArchive
description: Learn how to update existing ZIP archives with RadZipLibrary by adding, deleting, updating, and copying entries programmatically.
slug: radziplibrary-update-ziparchive
tags: ziparchive, update, radziplibrary, zip, entries, add, delete, archive
published: True
position: 0
---

# Update ZipArchive

With **RadZipLibrary** you can update an existing ZIP archive to add new entries to it, delete entries, or update existing ones.

The `ZipArchive` class provides three modes: `Read`, `Create`, and `Update`. More information on creating and reading an archive is available in the [Getting Started]({%slug radziplibrary-gettingstarted%}) article.

The code snippet from **Example 1** opens a ZIP archive in update mode using the `ZipArchive` class.

**Example 1: Open for update**

<snippet id='libraries-zip-features-update-ziparchive-1'/>

## Add Entry

To add a new entry into the ZIP archive, perform the following steps:

1. Use the `CreateEntry()` method of the `ZipArchive` object to create a new entry.

1. Open the entry to get a stream for writing.

1. Write the necessary information into the entry.

1. Dispose the entry when all necessary information is written. In the `Update` mode this step is optional. You can omit it if you need to add, delete, or update other entries in the archive.

>note More information about `ZipArchiveEntry` is available in the [ZipArchiveEntry]({%slug radziplibrary-ziparchive-entry%}) help article.

**Example 2: Add entry**

<snippet id='libraries-zip-features-update-ziparchive-2'/>

## Delete Entry

The `ZipArchive` class provides a `GetEntry()` method, which allows you access to a particular entry in the archive.

**Example 3** shows how to get an entry and delete it from the ZIP archive using the `Delete()` method.

**Example 3: Delete entry**

<snippet id='libraries-zip-features-update-ziparchive-3'/>

## Update Entry

To update an existing entry in the ZIP archive, perform the following steps:

1. Use the `GetEntry()` method of the `ZipArchive` object to get an existing entry.

1. Open the entry to get a stream for reading and writing.

1. Read or write the necessary information from or to the entry.

1. Dispose the entry when all necessary information is written. In the `Update` mode this step is optional. You can omit it if you need to add, delete, or update other entries in the archive.

**Example 4: Update entry**

<snippet id='libraries-zip-features-update-ziparchive-4'/>

## Copy Entry

Starting with the **Q2 2025** release, **RadZipLibrary** introduces a new extension method `CopyTo` for the `Stream` class. Use this method to copy data from one stream to another with an optional timeout parameter for more control over long-running operations. This is particularly useful when you work with large files in ZIP archives.

The following example shows how to use the `CopyTo` method to copy the contents of a large file from a ZIP archive to a memory stream with a specified timeout.

**Example 5: Copy entry with timeout**

<snippet id='libraries-zip-features-update-ziparchive-copy-entry'/>

This method ensures that the operation does not hang indefinitely. It is useful for scenarios that involve large files or limited resources.

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
