---
title: How to retain a zipped file's internal file and folder structure when unzipping
description: This example shows how to retain a zipped file's internal file and folder structure upon unzipping.
type: how-to
page_title: Example on how to 
slug: retain-file-folder-structure-when-unzipping
position: 
tags: 
ticketid: 1563646
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>2022.2.428</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>RadZipLibrary for Document Processing</td>
		</tr>
	</tbody>
</table>


## Description
This example shows how to retain the original file and folder structure of a .zip file with multiple files and folders upon unzipping.

## Solution


#### __C#__

{{region kb-retain-file-folder-structure-when-unzipping}}

    string existingZipPath = @"TestZip.zip";
    
    using (FileStream output = File.OpenRead(existingZipPath))
    {
        using (ZipArchive zipArchive = new ZipArchive(output, ZipArchiveMode.Read, true, null, null, null))
        {
            string zipFullName = existingZipPath.Remove(existingZipPath.Length - 4); // Removes ".zip" from the zipFullName
    
            if (!Directory.Exists(zipFullName))
            {
                Directory.CreateDirectory(zipFullName);
            }
    
            foreach (ZipArchiveEntry entry in zipArchive.Entries) // Entries include both files and folders
            {
                string[] pathParts = entry.FullName.Split(new char[] { '/' }).ToArray();
                string fileName = pathParts[pathParts.Length - 1];
    
                if (fileName == "") // If the last part of the entry Fullname is an empty string, it is a folder
                {
                    if (!Directory.Exists(entry.FullName))
                    {
                        Directory.CreateDirectory(entry.FullName);
                    }
                }
    
                else // If not, it is a file
                {
                    using (Stream entryStream = entry.Open()) // Do not close the stream opened by the ZipArchiveEntry.Open() method. Otherwise the result is unpredictable.
                    using (FileStream fileStream = File.OpenWrite(entry.FullName))
                    {
                        entryStream.CopyTo(fileStream);
                    }
                }
            }
        }
    }
	
{{endregion}}
