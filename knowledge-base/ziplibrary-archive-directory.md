---
title: Creating an Archive from a Directory
description: Learn how to create a zip archive from all files in a directory by using RadZipLibrary for Telerik Document Processing.
type: how-to
page_title: Creating an Archive from a Directory
slug: archive-directory
position: 0
tags: radziplibrary, zip, archive, folder, directory, document, processing, compression
res_type: kb
---

## Environment

|Product Version|Product|
|----|----|
|2020.2.504|RadZipLibrary|

## Description

You want to create a zip archive that contains all files from a specific directory.

## Solution

Use [RadZipLibrary]({%slug radziplibrary-overview%}) to iterate through the files in a folder, read their content, and write each file as an entry in a new zip archive.

**Example 1: Creating a Zip Archive from a Directory**

```csharp
class Program
{
    static void Main(string[] args)
    {
        CreateZip();
    }

    protected static void CreateZip()
    {
        using (FileStream stream = File.OpenWrite("example.zip"))
        {
            using (ZipArchive archive = new ZipArchive(stream, ZipArchiveMode.Create, true, null))
            {
                foreach (FileObject dataItem in GetData())
                {
                    using (ZipArchiveEntry entry = archive.CreateEntry(dataItem.Name))
                    {
                        BinaryWriter writer = new BinaryWriter(entry.Open());
                        writer.Write(dataItem.Data);
                        writer.Flush();
                    }
                }
            }
        }
    }

    private static List<FileObject> _files;
    public static IList<FileObject> GetData()
    {
        _files = new List<FileObject>();
        foreach (var file in Directory.GetFiles("../../../TestFiles"))
        {
            var fileObj = new FileObject { Name = Path.GetFileName(file) };

            using (MemoryStream ms = new MemoryStream())
            using (FileStream fileStream = new FileStream(file, FileMode.Open, FileAccess.Read))
            {
                byte[] bytes = new byte[fileStream.Length];
                fileStream.Read(bytes, 0, (int)fileStream.Length);
                ms.Write(bytes, 0, (int)fileStream.Length);
                fileObj.Data = ms.ToArray();
            }

            _files.Add(fileObj);
        }
        return _files;
    }
}

public class FileObject
{
    public string Name { get; set; }
    public byte[] Data { get; set; }
}
```

## See Also

* [RadZipLibrary Overview]({%slug radziplibrary-overview%})
* [Compressing a Stream]({%slug radziplibrary-compress-stream%})