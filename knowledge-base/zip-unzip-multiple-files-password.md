---
title: How to zip and unzip multiple files with a password
description: The example is showing how to zip and unzip multiple files with a password.
type: how-to
page_title: Example on how to zip and unzip multiple files with a password
slug: zip-unzip-multiple-files-password
position: 
tags: 
ticketid: 1493695
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>2020.2.617</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>RadZipLibrary for Document Processing</td>
		</tr>
	</tbody>
</table>


## Description
The example is showing how to all files from a directory to a password-protected zip archive.

## Solution

The following code snippet is traversing all the files in a directory then add the contents of each file to a new Entry in the ZipArchive. The password for the archive is passed through the DefaultEncryptionSettings class. After zipping all the files a new folder named TestZip is created and the contents of the ZipArchive are unzipped into the new folder.

```csharp

    DefaultEncryptionSettings protectionSettings = new DefaultEncryptionSettings() { Password = "test" };

    using (FileStream output = File.OpenWrite("TestZip.zip"))
    {
        using (ZipArchive zipArchive = new ZipArchive(output, ZipArchiveMode.Create, true, null, null, protectionSettings))
        {
            string currentDirectory = Directory.GetCurrentDirectory();
            string[] files = Directory.GetFiles(currentDirectory);
            IEnumerable<string> txtFiles = files.Where(p => Path.GetExtension(p) == ".txt");

            foreach (string file in txtFiles)
            {
                using (FileStream stream = File.OpenRead(file))
                {
                    using (ZipArchiveEntry entry = zipArchive.CreateEntry(Path.GetFileName(file)))
                    {
                        Stream entryStream = entry.Open();
                        stream.CopyTo(entryStream);
                    }
                }
            }
        }
    }

    string unzipDir = "TestZip";
    if (!Directory.Exists(unzipDir))
    {
        Directory.CreateDirectory(unzipDir);
    }

    using (FileStream output = File.OpenRead("TestZip.zip"))
    {
        using (ZipArchive zipArchive = new ZipArchive(output, ZipArchiveMode.Read, true, null, null, protectionSettings))
        {
            foreach (ZipArchiveEntry entry in zipArchive.Entries)
            {
                using (Stream entryStream = entry.Open())
                using (FileStream fileStream = File.OpenWrite(string.Format("{0}/{1}", unzipDir, entry.FullName)))
                {
                    entryStream.CopyTo(fileStream);
                }
            }
        }
    }

```

