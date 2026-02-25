---
title: Getting Started
page_title: Getting Started
slug: radziplibrary-gettingstarted
tags: getting,started
published: True
position: 1
---

# Getting Started

__RadZipLibrary__ allows you to load data from existing ZIP archives or create and edit ZIPs that can be used by other applications. You can also create ZIP archives in memory or use a stream to get data and add it to a ZIP archive.
      

>note If you still don't have **Telerik Document Processing** installed, check the **[First Steps]({%slug getting-started-first-steps%})** topic to learn how you can obtain the packages through the different suites. 

The ZIP archive is represented by __ZipArchive__ class. It can be used in 3 modes:

* __Read__: Allows reading of the existing ZIP archive. In this mode it is not possible to add or update archive entries.
          
* __Create__: Allows creation of a new archive. In this mode you can add new entries in the archive but cannot read or update content of the entries which have been written already.
          
* __Update__: Allows update of the existing ZIP archive. In this mode you can add new entries, read and update existing entries.

## Required References

You can find the required references in the [ZipLibrary NuGet packages]({%slug available-nuget-packages%}#ziplibrary-packages) section.

## Open Zip Archive

The code snippet from __Example 1__ demonstrates how to open existing Zip archive using the __ZipArchive__ class.
        

#### __Example 1: Open archive__

```csharp
	            
	using (Stream stream = File.Open("test.zip", FileMode.Open))
	{
	    using (ZipArchive archive = ZipArchive.Create(stream))
	    {
	        // Display the list of the files in the selected zip file using the ZipArchive.Entries property.
	    }
	}
```

The *archive* variable holds the files that are compressed in the selected zip. You can access the list of these files through the __ZipArchive.Entries__ property. It holds a collection of [ZipArchiveEntry]({%slug radziplibrary-update-ziparchive%}) elements - the elements that describe the files archived in the zip file. You can use these elements to get the name of the compressed file, its uncompressed and compressed size and other file attributes.
        
## Create Zip Archive

__Example 2__ shows how to create a new Zip archive using the __ZipArchive__ class and place a text file in it.
        

#### __Example 2: Create archive__

```csharp
	    
	using (Stream stream = File.Open("test.zip", FileMode.Create))
	{
	    using (ZipArchive archive = ZipArchive.Create(stream, null))
	    {
	        using (ZipArchiveEntry entry = archive.CreateEntry("text.txt"))
	        {
	            StreamWriter writer = new StreamWriter(entry.Open());
	            writer.WriteLine("Hello world!");
	            writer.Flush();
	        }
	    }
	}
```

>tip If you use __StreamWriter__ to write content to the stream, you should call the Flush() method in order to flush the data to the stream.
          
>Do not close the stream opened by the __ZipArchiveEntry.Open()__ method. Otherwise the result is unpredictable.
          
The constructor of ZipArchive lets you specify whether you would like to keep the stream associated to the instance open. If you decide to set the `leaveOpen` parameter to `false`, the underlying stream will be closed once the ZipArchive instance is disposed. In case you need to continue working with that stream (to send it as a responce, for example), you should pass `true` for the `leaveOpen` parameter.

#### __Example 3: Create archive in a MemoryStream__

```csharp

    Stream memoryStream = new MemoryStream();

    // The third parameter of ZipArchive's constructor specifies that the stream should be left open 
    using (ZipArchive archive = ZipArchive.Create(memoryStream, null))
    {
        using (ZipArchiveEntry entry = archive.CreateEntry("text.txt"))
        {
            Stream entryStream = entry.Open();
            StreamWriter writer = new StreamWriter(entryStream);
            writer.WriteLine("Hello world!");
            writer.Flush();
        }
    }
    
    // Save memoryStream to a file or send it to client

```

For more complete examples head to the [Developer Focused Examples]({%slug radziplibrary-sdk-examples%}) section of the library.

## See Also

* [First Steps in Using Telerik Document Processing]({%slug getting-started-first-steps%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [ZipLibrary Basic Usage Demo](https://demos.telerik.com/document-processing/ziplibrary)
