---
title: ZipArchive Entry
page_title: ZipArchive Entry
description: ZipArchive Entry
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

    #### **[C#] Example 1: Get entry`s compressed length**
    {{region cs-radziplibrary-ziparchive-entry_0}}
                    
        ZipArchiveEntry entry;
        using (entry = archive.CreateEntry("file.txt"))
        {
            StreamWriter writer = new StreamWriter(entry.Open());
            writer.WriteLine("Progress!");
            writer.Flush();
        }

        long compressedLength = entry.CompressedLength;
    {{endregion}}

* **ExternalAttributes**: Gets or sets external [file attributes](https://docs.microsoft.com/en-us/dotnet/api/system.io.fileattributes?view).
    
    #### **[C#] Example 2: Set entry`s external attributes**

    {{region cs-radziplibrary-ziparchive-entry_1}}
                    
        entry.ExternalAttributes = (int)File.GetAttributes(sourceFileName);
    {{endregion}}

* **FullName**: Gets the relative path of the entry in the zip archive.
  
    #### **[C#] Example 3: Get entry`s relative path**
    
    {{region cs-radziplibrary-ziparchive-entry_2}}
                    
        string fullName = entry.FullName;
    {{endregion}}

* **LastWriteTime**: Gets or sets the last time the entry in the zip archive was changed.
    
    #### **[C#] Example 4: Set last entry`s write time**

    {{region cs-radziplibrary-ziparchive-entry_3}}

        DateTime lastWriteTime = File.GetLastWriteTime(sourceFileName);
        entry.LastWriteTime = lastWriteTime;
    {{endregion}}

* **Length**: Gets the uncompressed size of the entry in the zip archive.
    > The archive length can be obtained only after the **ZipArchiveEntry** is disposed of, so in the following example, we are ensuring the correct disposing of the object by [using statement](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-statement).

    #### **[C#] Example 5: Get entry`s length**

    {{region cs-radziplibrary-ziparchive-entry_4}}
                    
        ZipArchiveEntry entry;
        using (entry = archive.CreateEntry("file.txt"))
        {
            StreamWriter writer = new StreamWriter(entry.Open());
            writer.WriteLine("Progress!");
            writer.Flush();
        }

        long length = entry.CompressedLength;
    {{endregion}}

* **Name**: Gets the file name of the entry in the zip archive.

    #### **[C#] Example 6: Get entry`s name**

    {{region cs-radziplibrary-ziparchive-entry_5}}
                    
        string name = entry.Name;
    {{endregion}}


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

#### **[C#] Example 7: Get ZipArchiveEntry**

{{region cs-radziplibrary-ziparchive-entry_6}}
                
    ZipArchiveEntry entry = archive.GetEntry("file.txt");
{{endregion}}


### Create ZipArchiveEntry
Creates an empty entry that has the specified path and entry name in the zip archive.

#### **[C#] Example 8: Create ZipArchiveEntry**

{{region cs-radziplibrary-ziparchive-entry_7}}
                    
    ZipArchiveEntry entry = archive.CreateEntry("file.txt");

    // OR

    ZipArchiveEntry entry = archive.CreateEntry("file.txt", compressionSettings);
{{endregion}}


## Operating with ZipArchiveEntry
Specific examples of using the ZipArchiveEntry.

### Using ZipArchiveEntry Properties
A complete example including all the properties discussed above.

#### **[C#] Example 9: Complete example**

{{region cs-radziplibrary-ziparchive-entry_8}}
                
    string[] files = Directory.GetFiles("SampleFiles");
    string zipFileName = "ZipArchive.zip";

    using (Stream stream = File.Open(zipFileName, FileMode.Create))
    {
        using (ZipArchive archive = new ZipArchive(stream, ZipArchiveMode.Create, false, null))
        {
            foreach (string file in files)
            {
                string sourceFileName = file;
                string fileName = file.Split(new string[] { "\\" }, StringSplitOptions.None).Last();

                ZipArchiveEntry entry;
                using (entry = archive.CreateEntry(fileName))
                {
                    using (Stream fileStream = File.Open(sourceFileName, FileMode.Open, FileAccess.Read, FileShare.Read))
                    {
                        // Setting the ExternalAttributes property
                        entry.ExternalAttributes = (int)File.GetAttributes(sourceFileName);

                        DateTime lastWriteTime = File.GetLastWriteTime(sourceFileName);
                        // Setting the LastWriteTime property
                        entry.LastWriteTime = lastWriteTime;

                        // Getting the FullName property
                        string fullName = entry.FullName;

                        // Getting the Name property
                        string name = entry.Name;

                        using (Stream entryStream = entry.Open())
                        {
                            fileStream.CopyTo(entryStream);
                        }
                    }
                }

                // Getting the CompressedLength property
                long compressedLength = entry.CompressedLength;

                // Getting the Length property
                long length = entry.Length;
            }
        }
    }
{{endregion}}

### Working with Folders/Directories

#### **[C#] Example 10: Creating folders/directories**

{{region cs-radziplibrary-ziparchive-entry_9}}
                
    ZipArchiveEntry entry = archive.CreateEntry("Documents/Sample/");
{{endregion}}

#### **[C#] Example 11: Opening Files in folders/directories**

{{region cs-radziplibrary-ziparchive-entry_10}}
                
    ZipArchiveEntry entry = archive.GetEntry("Documents/Sample/file.txt");
{{endregion}}

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Compression Settings]({%slug radziplibrary-compression-settings%})
