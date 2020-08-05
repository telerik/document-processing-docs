---
title: Create archive from a directory
description: Learn how to zip a folder using RadZipLibrary
type: how-to
page_title: Create archive from a directory
slug: archive-directory
position: 0
tags: zip, archive, files, folder
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.2.504|RadZipLibrary|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|

## Description
 
You need to create an archive from the files in a folder. 

## Solution

Use [RadZipLibrary]({%slug radziplibrary-overview%}) to create and export the archive.

#### __C#__

{{region kb-archive-directory1}}

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
                                        
{{endregion}}