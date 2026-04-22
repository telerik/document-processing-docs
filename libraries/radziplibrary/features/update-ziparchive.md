---
title: Update ZipArchive
page_title: Update ZipArchive
slug: radziplibrary-update-ziparchive
tags: ziparchive, update, radziplibrary, zip, entries, add, delete, archive
published: True
position: 0
---

# Update ZipArchive

With __RadZipLibrary__ you can update existing ZIP archive in order to add new entries to it, delete or update existing ones.
      
The __ZipArchive__ class provides three modes: *Read*, *Create* and *Update*. More information on creating and reading an archive is available [here]({%slug radziplibrary-gettingstarted%}).     

The code snippet from __Example 1__ opens a ZIP archive in update mode using __ZipArchive__ class.    

#### __Example 1: Open for update__

<snippet id='codeblock-dsp'/>

## Add Entry

In order to add a new entry into the ZIP archive, you should perform the following steps:
        
1. Use __CreateEntry()__ method of the __ZipArchive__ object to create a new entry.
            

1. Open the entry to obtain a stream for writing.
            

1. Write the necessary information into the entry.
            

1. Dispose entry when all necessary information is written. In the *Update* mode this step is optional. You can omit it if you are going to add/delete/update other entries in the archive.

>note More information about ZipArchiveEntry you can find in [ZipArchiveEntry]({%slug radziplibrary-ziparchive-entry%}) help article. 
            

#### __Example 2: Add entry__

<snippet id='codeblock-dsq'/>

## Delete Entry

The __ZipArchive__ class provides a __GetEntry()__ method, which allows you access to a particular entry in the archive.
        

__Example 3__ shows how you could obtain an entry and delete it from the ZIP archive using the __Delete()__ method.
        

#### __Example 3: Delete entry__

<snippet id='codeblock-dsr'/>

## Update Entry

In order to update an existing entry in the ZIP archive, you should perform the following steps:
        

1. Use __GetEntry()__ method of the __ZipArchive__ object to obtain existing entry.
            

1. Open entry to get a stream for reading/writing.
            

1. Read/Write the necessary information from/to the entry.
            

1. Dispose entry when all necessary information is written. In the __Update__ mode this step is optional. You can omit it if you are going to add/delete/update other entries in the archive.
            

#### __Example 4: Update entry__
	
<snippet id='codeblock-dss'/>

## Copy Entry

Starting with the **Q2 2025** release, the __RadZipLibrary__ introduces a new extension method `CopyTo` for the `Stream` class. This method allows you to copy data from one stream to another with an optional timeout parameter, providing more control over long-running operations. This is particularly useful when working with large files in ZIP archives.

The following example demonstrates how to use the `CopyTo` method to copy the contents of a large file from a ZIP archive to a memory stream with a specified timeout.

#### __Example 5: Copy entry with timeout__

<snippet id='libraries-zip-features-update-ziparchive-copy-entry'/>

This method ensures that the operation will not hang indefinitely, making it a valuable addition for scenarios involving large files or limited resources.



## See Also

 * [Getting Started]({%slug radziplibrary-gettingstarted%})
