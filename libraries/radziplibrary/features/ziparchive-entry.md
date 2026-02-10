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
    ```csharp
                    
        ZipArchiveEntry entry;
        using (entry = archive.CreateEntry("file.txt"))
        {
            StreamWriter writer = new StreamWriter(entry.Open());
            writer.WriteLine("Progress!");
            writer.Flush();
        }

        long compressedLength = entry.CompressedLength;
    ```

* **ExternalAttributes**: Gets or sets external [file attributes](https://docs.microsoft.com/en-us/dotnet/api/system.io.fileattributes?view).
    
    #### **Example 2: Set entry's external attributes**

    ```csharp
                    
        entry.ExternalAttributes = (int)File.GetAttributes(sourceFileName);
    ```

* **FullName**: Gets the relative path of the entry in the zip archive.
  
    #### **Example 3: Get entry's relative path**
    
    ```csharp
                    
        string fullName = entry.FullName;
    ```

* **LastWriteTime**: Gets or sets the last time the entry in the zip archive was changed.
    
    #### **Example 4: Set last entry's write time**

    ```csharp

        DateTime lastWriteTime = File.GetLastWriteTime(sourceFileName);
        entry.LastWriteTime = lastWriteTime;
    ```

* **Length**: Gets the uncompressed size of the entry in the zip archive.
    > The archive length can be obtained only after the **ZipArchiveEntry** is disposed of, so in the following example, we are ensuring the correct disposing of the object by [using statement](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-statement).

    #### **Example 5: Get entry's length**

    ```csharp
                    
        ZipArchiveEntry entry;
        using (entry = archive.CreateEntry("file.txt"))
        {
            StreamWriter writer = new StreamWriter(entry.Open());
            writer.WriteLine("Progress!");
            writer.Flush();
        }

        long length = entry.CompressedLength;
    ```

* **Name**: Gets the file name of the entry in the zip archive.

    #### **Example 6: Get entry's name**

    ```csharp
                    
        string name = entry.Name;
    ```


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

```csharp
                
    ZipArchiveEntry entry = archive.GetEntry("file.txt");
```


### Create ZipArchiveEntry
Creates an empty entry that has the specified path and entry name in the zip archive.

#### **Example 8: Create ZipArchiveEntry**

```csharp
                    
    ZipArchiveEntry entry = archive.CreateEntry("file.txt");

    // OR

    ZipArchiveEntry entry = archive.CreateEntry("file.txt", compressionSettings);
```


### Extract ZipArchiveEntry
Extract an entry to a specific folder/directory.

#### **Example 9: Extracting a ZipArchiveEntry to folder/directory**

```csharp
                
    ZipArchiveEntry entry = archive.GetEntry("file.txt");
    string path = Path.Combine(RootDirectory, entry.FullName);

    using (Stream fileStream = File.Open(path, FileMode.Create, FileAccess.Write, FileShare.None))
    {
        using (Stream entryStream = entry.Open())
        {
            entryStream.CopyTo(fileStream);
        }
    }   
```

>tipThis functionality could be achieved by using the [Zip Extensions']({%slug radziplibrary-zipextensions%}) _ExtractToFile_ method as well.

## Operating with ZipArchiveEntry
Specific examples of using the ZipArchiveEntry.

### Using ZipArchiveEntry Properties
A complete example including all the properties discussed above.

#### **Example 10: Complete example**

```csharp
                
    string[] files = Directory.GetFiles("SampleFiles");
    string zipFileName = "ZipArchive.zip";

    using (Stream stream = File.Open(zipFileName, FileMode.Create))
    {
        using (ZipArchive archive = new ZipArchive.Create(stream, null))
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
```

### Working with Folders/Directories

#### **Example 11: Creating folders/directories**

```csharp
                
    ZipArchiveEntry entry = archive.CreateEntry("Documents/Sample/");
```

#### **Example 12: Opening Files in folders/directories**

```csharp
                
    ZipArchiveEntry entry = archive.GetEntry("Documents/Sample/file.txt");
```

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
* [Compress Stream]({%slug radziplibrary-compress-stream%})
* [Compression Settings]({%slug radziplibrary-compression-settings%})
