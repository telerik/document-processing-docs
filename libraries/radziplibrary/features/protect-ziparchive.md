---
title: Protect ZipArchive
page_title: Protect ZipArchive
description: Learn how to create and read password-protected ZIP archives with RadZipLibrary using PKWARE and AES encryption algorithms.
slug: radziplibrary-protect-ziparchive
tags: protection, archive, radziplibrary, zip, password, encryption, aes, pkware
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

## Create a Password-Protected ZipArchive

To create a password-protected ZIP archive, pass a `PasswordEncryptionSettings` object to the `ZipArchive` constructor along with the `CompressionSettings` and `Encoding` parameter.

`PasswordEncryptionSettings` has a `Password` property of type `string`, which represents the used password.

**Example 1: Create a password-protected ZIP archive**

<snippet id='libraries-zip-features-protect-ziparchive-1'/>

>tip Always dispose of the ZIP archive object when all operations are completed. Declare and instantiate the ZIP archive object in a `using` statement. If that is not possible, call the `Dispose()` method when you complete all operations.

## Read a Password-Protected ZipArchive

To open a password-protected `ZipArchive`, pass a `DefaultEncryptionSettings` object with the password that was used to create the archive in the first place.

**Example 2: Open and read a password-protected ZIP archive**

<snippet id='libraries-zip-features-protect-ziparchive-2'/>

>tip Always dispose of the ZIP archive object when all operations are completed. Declare and instantiate the ZIP archive object in a `using` statement. If that is not possible, call the `Dispose()` method when you complete all operations.

## See Also

* [Getting Started]({%slug radziplibrary-gettingstarted%})
* [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
* [ZipLibrary Archive Protection Demo](https://demos.telerik.com/document-processing/ziplibrary/archive_protection)
* [How to Read Folder's Content from a Protected Archive Using Telerik ZipLibrary]({%slug read-folder-encrypted-archive%})
