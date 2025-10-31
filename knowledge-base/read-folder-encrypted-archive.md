---
title: How to Read Folder's Content from a Protected Archive Using Telerik ZipLibrary
description: Learn how to pack a folder and subfolders into an encrypted archive using Telerik ZipLibrary while maintaining the correct ZIP structure.
type: how-to
page_title: How to Create Password-Protected ZIP Archives with Folder Structure
meta_title: How to Create Password-Protected ZIP Archives with Folder Structure
slug: read-folder-encrypted-archive
tags: zip, library, telerik, document, processing, aes, encryption, archive, folders, password, protection
res_type: kb
ticketid: 1702323
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| ZipLibrary|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article aims to demonstrate a sample approach how to create a password-protected ZIP archive with Telerik ZipLibrary that maintains the folder structure and includes subfolders and files. Then, extract all files from the encrypted ZIP archive reading the text content of each file.

This knowledge base article also answers the following questions:
- How to create a ZIP archive with subfolders using Telerik ZipLibrary?
- How to encrypt a ZIP file using Telerik ZipLibrary?
- How to extract files from an encrypted ZIP archive?

## Solution

### Creating a Password-Protected ZIP Archive

To create a password-protected ZIP archive with the correct folder structure, perform the following steps:

1. Iterate through all files in the source directory and subdirectories.
2. Create a separate entry for each file using its relative path.
3. Apply password protection using `PasswordEncryptionSettings`.

Here is the modified code:

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
            //Process.Start(new ProcessStartInfo() { FileName = encryptedZipPath, UseShellExecute = true });

            bool extracted = ExtractFile(encryptedZipPath,  @"..\..\");


        }

```

### Extracting Files from an Encrypted ZIP Archive

To extract files from an encrypted ZIP archive, perform the following steps:

1. Use `EncryptionSettings.CreateDecryptionSettings()` for decryption settings.
2. Handle the `PasswordRequired` event to assign the correct password.
3. Iterate through the entries and extract the desired files.

Here is the code for extracting files:

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

### See Also

- [Protect ZipArchive]({%slug radziplibrary-protect-ziparchive%})
