---
title: Extract the contents of a zip file to a directory
description: The example is showing how to extract the contents of a zip file to a directory.
type: how-to
page_title: Extract the contents of a zip file to a directory
slug: zip-library-extract-files-from-archive
position: 0
tags: extract, zip, archive
ticketid: 1070451
res_type: kb
---


|Product Version|Product|Author|
|----|----|----|
|2021.1.325|RadZipLibrary|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The example is showing how to extract the contents of a zip file to a directory. The example preserves the file structure inside the archive. 

## Solution

The following code snippet is iterating all the files in the archive and extracts each file in the respected directory.

```csharp

    using (Stream stream = File.Open("test.zip", FileMode.Open))
    {
        using (ZipArchive archive = new ZipArchive(stream))
        {
            string fullName = Directory.CreateDirectory("Extracted Content").FullName;
    
            foreach (ZipArchiveEntry entry in archive.Entries)
            {
                string fullPath = Path.GetFullPath(Path.Combine(fullName, entry.FullName));
                if (Path.GetFileName(fullPath).Length != 0)
                {
                    Directory.CreateDirectory(Path.GetDirectoryName(fullPath));
                    using (Stream fileStream = File.Open(fullPath, FileMode.Create, FileAccess.Write, FileShare.None))
                    {
                        using (Stream entryStream = entry.Open())
                        {
                            entryStream.CopyTo(fileStream);
                        }
                    }
                }
                else
                {
                    Directory.CreateDirectory(fullPath);
                }
            }
        }
    }

```