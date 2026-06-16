---
title: Creating and Reading Password-Protected ZIP Archives with Folder Structure Using ZipLibrary
description: Learn how to create a password-protected ZIP archive that maintains the folder structure and extract files from it using ZipLibrary.
type: how-to
page_title: Creating Password-Protected ZIP Archives with Folder Structure
meta_title: Creating Password-Protected ZIP Archives with Folder Structure
slug: read-folder-encrypted-archive
tags: radziplibrary, zip, encryption, archive, password, folders, document, processing
res_type: kb
ticketid: 1702323
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| ZipLibrary|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article shows how to create a password-protected ZIP archive with ZipLibrary that maintains the folder structure and includes subfolders and files. It also shows how to extract all files from the encrypted ZIP archive and read the text content of each file.

This knowledge base article also answers the following questions:
* How to create a ZIP archive with subfolders using ZipLibrary?
* How to encrypt a ZIP file using ZipLibrary?
* How to extract files from an encrypted ZIP archive?

## Solution

### Creating a Password-Protected ZIP Archive

Consider the following folder structure where the goal is to zip the root folder with all of its content:

* MyFolder
    * Subfolder1
        * textFile1.txt
        * textFile2.txt
    * Subfolder2
        * textFile3.txt
        * textFile4.txt

To create a password-protected ZIP archive with the correct folder structure, follow these steps:

1. Iterate through all files in the source directory and subdirectories.
2. Create a separate entry for each file by using its relative path.
3. Apply password protection by using `PasswordEncryptionSettings`.

**Example 1: Creating a Password-Protected ZIP Archive**

```csharp
        static void Main(string[] args)
        {
            string zipFileName = @"..\..\TestZip.zip";
            string sourceFolder = @"..\..\MyFolder";

            File.Delete(zipFileName);
            Telerik.Windows.Zip.Extensions.ZipFile.CreateFromDirectory(sourceFolder, zipFileName, TimeSpan.FromSeconds(10));

            string encryptedZipPath = "encrypted.zip";
            string password = "pw";

            // Open the existing ZIP archive
            using (Stream inputStream = File.OpenRead(zipFileName))
            using (ZipArchive sourceArchive = ZipArchive.Read(inputStream))
            {
                // Set AES encryption settings
                PasswordEncryptionSettings aesEncryptionSettings = EncryptionSettings.CreateAesPasswordEncryptionSettings();
                aesEncryptionSettings.Password = password;

                // Create the encrypted ZIP archive
                using (Stream outputStream = File.Open(encryptedZipPath, FileMode.Create))
                using (ZipArchive encryptedArchive = ZipArchive.Create(outputStream, null, null, aesEncryptionSettings))
                {
                    foreach (ZipArchiveEntry sourceEntry in sourceArchive.Entries)
                    {
                        using (Stream sourceEntryStream = sourceEntry.Open())
                        using (ZipArchiveEntry encryptedEntry = encryptedArchive.CreateEntry(sourceEntry.FullName))
                        using (Stream encryptedEntryStream = encryptedEntry.Open())
                        {
                            sourceEntryStream.CopyTo(encryptedEntryStream);
                        }
                    }
                }
            }
            File.Delete(zipFileName);
            Process.Start(new ProcessStartInfo() { FileName = encryptedZipPath, UseShellExecute = true });

            bool extracted = ExtractFile(encryptedZipPath,  @"..\..\");
        }

```

### Extracting Files from an Encrypted ZIP Archive

To extract files from an encrypted ZIP archive and read the content, follow these steps:

1. Use `EncryptionSettings.CreateDecryptionSettings()` for decryption settings.
2. Handle the `PasswordRequired` event to assign the correct password.
3. Iterate through the entries and extract the desired files.

**Example 2: Extracting Files from an Encrypted ZIP Archive**

```csharp
        public static bool ExtractFile(string zipFileName, string targetPath)
        {
            DecryptionSettings decryptionSettings = EncryptionSettings.CreateDecryptionSettings();
            decryptionSettings.PasswordRequired += (s, a) => a.Password = "pw";
            CompressionSettings compressionSettings = null;
            Encoding encoding = null;

            try
            {
                using (Stream inputStream = File.OpenRead(zipFileName))
                using (ZipArchive archive = ZipArchive.Read(inputStream, encoding, compressionSettings, decryptionSettings))
                {
                    foreach (ZipArchiveEntry entry in archive.Entries)
                    {
                        if (entry.Length == 0)
                        {
                            continue;
                        }

                        byte[] data = new byte[entry.Length];

                        using (Stream entryStream = entry.Open())
                        {
                            BinaryReader reader = new BinaryReader(entryStream);
                            reader.Read(data, 0, data.Length);
                        }
                        string text = Encoding.UTF8.GetString(data);
                        Debug.WriteLine($"EXTRACTED file: {entry.Name}, Content: {text}");
        
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error extracting file: " + ex.Message);
            }

            return true;
        }
```

## See Also

* [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
