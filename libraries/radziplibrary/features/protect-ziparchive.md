---
title: Protect ZipArchive
page_title: Protect ZipArchive
description: Learn how to create and read password-protected ZIP archives with RadZipLibrary using PKWARE and AES encryption algorithms. Handle invalid passwords with InvalidPasswordException.
slug: radziplibrary-protect-ziparchive
tags: protection, archive, radziplibrary, zip, password, encryption, aes, pkware, invalidpasswordexception
published: True
position: 1
---

# Protect ZipArchive

**RadZipLibrary** lets you protect a ZIP archive with a password. This article describes how to use **RadZipLibrary** to password-protect files and how to open files that are protected with a password. To protect a ZIP archive and all [`ZipArchiveEntry`]({%slug radziplibrary-update-ziparchive%}) items in it, specify encryption settings when creating the [`ZipArchive`]({%slug radziplibrary-gettingstarted%}) object.

**RadZipLibrary** supports the following encryption algorithms:

* Traditional **PKWARE** encryption algorithm—the settings for this encryption type are represented by the `PasswordEncryptionSettings` class.

* Strong **AES** encryption algorithm—introduced in **2024 Q1**.

>note AES encryption (Advanced Encryption Standard) is commonly used to secure sensitive information, such as credit card numbers, passwords, and personal data. It uses a symmetric-key algorithm, meaning the same key encrypts and decrypts the data. AES encryption uses a fixed-length key of 128, 192, or 256 bits to encrypt and decrypt data.

* [Create a Password-protected ZipArchive](#create-a-password-protected-ziparchive)
* [Read a Password-protected ZipArchive](#read-a-password-protected-ziparchive)
* [Handle Invalid Passwords](#handle-invalid-passwords)

## Create a Password-Protected ZipArchive

To create a password-protected ZIP archive, pass a `PasswordEncryptionSettings` object to the `ZipArchive` constructor along with the `CompressionSettings` and `Encoding` parameter.

`PasswordEncryptionSettings` has a `Password` property of type `string`, which represents the used password.

**Example 1: Create a password-protected ZIP archive**

<snippet id='codeblock-dsn'/>

>tip Always dispose of the ZIP archive object when all operations are completed. Declare and instantiate the ZIP archive object in a `using` statement. If that is not possible, call the `Dispose()` method when you complete all operations.

## Read a Password-Protected ZipArchive

To open a password-protected `ZipArchive`, pass a `DecryptionSettings` object (created via `EncryptionSettings.CreateDecryptionSettings()`) and handle the `PasswordRequired` event to supply the password.

**Example 2: Open and read a password-protected ZIP archive**

<snippet id='codeblock-dso'/>

>tip Always dispose of the ZIP archive object when all operations are completed. Declare and instantiate the ZIP archive object in a `using` statement. If that is not possible, call the `Dispose()` method when you complete all operations.

## Handle Invalid Passwords

Starting with **2026 Q3**, when you open a password-protected archive and supply an incorrect password, **RadZipLibrary** throws an `InvalidPasswordException`.

`InvalidPasswordException` is thrown for both PKWARE and AES encryption in the following scenarios:

* **AES**: When the password verification byte or the AES authentication code does not match.
* **PKZIP**: When the 12-byte decryption header verifier byte does not match the supplied password.

**Example 3: Handle an incorrect password**

```csharp
DecryptionSettings decryptionSettings = EncryptionSettings.CreateDecryptionSettings();
decryptionSettings.PasswordRequired += (s, a) => a.Password = "wrongPassword";

try
{
    using (Stream stream = File.Open("test.zip", FileMode.Open))
    using (ZipArchive zipArchive = ZipArchive.Read(stream, null, null, decryptionSettings))
    {
        foreach (ZipArchiveEntry entry in zipArchive.Entries)
        {
            using (Stream entryStream = entry.Open())
            {
                entryStream.CopyTo(destinationStream);
            }
        }
    }
}
catch (InvalidPasswordException ex)
{
    Console.WriteLine("Invalid password: " + ex.Message);
}
```

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [ZipLibrary Archive Protection Demo](https://demos.telerik.com/document-processing/ziplibrary/archive_protection)
* [How to Read Folder's Content from a Protected Archive Using Telerik ZipLibrary]({%slug read-folder-encrypted-archive%})
