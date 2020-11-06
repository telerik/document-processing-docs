---
title: Example on how to zip and unzip multiple files with password
description: The example is showing how to add two text files to a password protected zip archive
type: how-to
page_title: Example on how to zip and unzip multiple files with password
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
The example is showing how to add two text files to a password-protected zip archive.

## Solution
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

