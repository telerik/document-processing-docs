---
title: Create archive from a list of files
description: Create archive from a list of files
type: how-to
page_title: Create archive from a list of files
slug: archive-a-list-of-files
position: 0
tags: zip, archive, files  
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.219|RadZipLibrary|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description
 
You need to create an archive from a list of files. 

## Solution

Use [RadZipLibrary]({%slug radziplibrary-overview%}) to create and export the archive.

#### __C#__

{{region kb-archive-a-list-of-files1}}
    List<string> fileNames = new List<string>();

    fileNames.Add(@"..\..\text.txt");
    fileNames.Add(@"..\..\text1.txt");
    fileNames.Add(@"..\..\text2.txt");

    string zipFileName = @"..\..\Result.zip";

    using (Stream stream = File.Open(zipFileName, FileMode.Create))
    {
        using (ZipArchive archive = new ZipArchive(stream, ZipArchiveMode.Create, leaveOpen: true, entryNameEncoding: null))
        {
            foreach (var file in fileNames)
            {
                using (ZipArchiveEntry entry = archive.CreateEntry(file))
                {
                    var entryStream = entry.Open();
                    FileStream fs = new FileStream(file, FileMode.Open);
                    fs.CopyTo(entryStream);
                    entryStream.Flush();

                    fs.Close();
                    fs.Dispose();
                }
            }
        }
    }

{{endregion}}