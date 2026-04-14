---
title: ZipArchive Entry
page_title: ZipArchive Entry
slug: radziplibrary-ziparchive-entry
tags: zip, ziparchive
published: True
position: 2
platforms: ajax, mvc, wpf, winforms
---

# ZipArchive Entry

**ZipArchiveEntry** represents every single compressed file within a zip archive. 

## What Is ZipArchiveEntry

The root element of the [RadZipLibrary]({%slug radziplibrary-overview%}) is the [ZipArchive](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.zip.ziparchive). The **ZipArchive**, on the other hand, consists of **ZipArchiveEntries** hosting all entries in the zip archive. You can [Get ZipArchiveEntry](#get-ziparchiveentry) or [Create ZipArchiveEntry](#create-ziparchiveentry) using the **ZipArchive** instance.

### Properties

* **CompressedLength**: Gets the compressed size of the entry in the zip archive. 

    > The archive compressed length can be obtained only after the **ZipArchiveEntry** is disposed of, so in the following example, we are ensuring the correct disposing of the object by [using statement](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-statement).

    #### **Example 1: Get entry's compressed length**
    <snippet id='codeblock-dst'/>

* **ExternalAttributes**: Gets or sets external [file attributes](https://docs.microsoft.com/en-us/dotnet/api/system.io.fileattributes?view).
    
    #### **Example 2: Set entry's external attributes**

    <snippet id='codeblock-dsu'/>

* **FullName**: Gets the relative path of the entry in the zip archive.
  
    #### **Example 3: Get entry's relative path**
    
    <snippet id='codeblock-dsv'/>

* **LastWriteTime**: Gets or sets the last time the entry in the zip archive was changed.
    
    #### **Example 4: Set last entry's write time**

    <snippet id='codeblock-dsw'/>

* **Length**: Gets the uncompressed size of the entry in the zip archive.
    > The archive length can be obtained only after the **ZipArchiveEntry** is disposed of, so in the following example, we are ensuring the correct disposing of the object by [using statement](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-statement).

    #### **Example 5: Get entry's length**

    <snippet id='codeblock-dsx'/>

* **Name**: Gets the file name of the entry in the zip archive.

    #### **Example 6: Get entry's name**

    <snippet id='codeblock-dsy'/>


### Methods

* **Delete**: Deletes the entry from the zip archive.
* **Dispose**: Releases the resources used by the current instance of the ZipArchiveEntry class.
* **Open**: Opens the entry from the zip archive.

### Events
* **PropertyChanged**: Occurs when a property value changes.

## ZipArchive and ZipArchiveEntry
There are several operations, which you can execute over a **ZipArchive** instance.

### Get ZipArchiveEntry
Retrieves a wrapper for the specified entry in the zip archive.

#### **Example 7: Get ZipArchiveEntry**

<snippet id='codeblock-dsz'/>


### Create ZipArchiveEntry
Creates an empty entry that has the specified path and entry name in the zip archive.

#### **Example 8: Create ZipArchiveEntry**

<snippet id='codeblock-dta'/>


### Extract ZipArchiveEntry
Extract an entry to a specific folder/directory.

#### **Example 9: Extracting a ZipArchiveEntry to folder/directory**

<snippet id='codeblock-dtb'/>

>tip This functionality could be achieved by using the [Zip Extensions']({%slug radziplibrary-zipextensions%}) _ExtractToFile_ method as well.

## Operating with ZipArchiveEntry
Specific examples of using the ZipArchiveEntry.

### Using ZipArchiveEntry Properties
A complete example including all the properties discussed above.

#### **Example 10: Complete example**

<snippet id='codeblock-dtc'/>

### Working with Folders/Directories

#### **Example 11: Creating folders/directories**

<snippet id='codeblock-dtd'/>

#### **Example 12: Opening Files in folders/directories**

<snippet id='codeblock-dte'/>

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Compression Settings]({%slug radziplibrary-compression-settings%})
