---
title: Protect ZipArchive
page_title: Protect ZipArchive
slug: radziplibrary-protect-ziparchive
tags: protect,ziparchive
published: True
position: 1
---

# Protect ZipArchive

__RadZipLibrary__ lets you protect a ZIP archive with a password. This help article will teach you to use __RadZipLibrary__ to password-protect files and how to open files that are protected with a password. To protect a ZIP archive and all [ZipArchiveEntry]({%slug radziplibrary-update-ziparchive%}) items in it, you should specify encryption settings when creating the [ZipArchive]({%slug radziplibrary-gettingstarted%}) object.     

__RadZipLibrary__ supports the following encryption algorithms:

* Traditional **PKWARE** encryption algorithm -the settings for this encryption type are represented by the **PasswordEncryptionSettings** class.

*  Strong **AES** encryption algorithm - introduced in **2024 Q1**. Currently, RadZipLibrary supports **only reading/extracting** AES-protected archives.  

>note AES encryption (Advanced Encryption Standard) is commonly used to secure sensitive information, such as credit card numbers, passwords, and personal data. It uses a symmetric-key algorithm, meaning the same key is used for both encrypting and decrypting the data. AES encryption uses a fixed-length key of 128, 192, or 256 bits to encrypt and decrypt data.

* [Create a Password-protected ZipArchive](#create-a-password-protected-ziparchive)

* [Read a Password-protected ZipArchive](#read-a-password-protected-ziparchive)

## Create a Password-Protected ZipArchive

In order to create a password-protected ZIP archive, you need to pass a **PasswordEncryptionSettings** object to the __ZipArchive__'s constructor along with the **CompressionSettings** and **Encoding** parameter.
        
**PasswordEncryptionSettings** has a __Password__ property of type string, which represents the used password.
 
#### __[C#] Example 1: Create a password-protected ZIP archive__

{{region cs-radziplibrary-protect-ziparchive_0}}

	using (Stream stream = File.Open("test.zip", FileMode.Create))
	{
		PasswordEncryptionSettings encryptionSettings =  EncryptionSettings.CreatePkzipPasswordEncryptionSettings();
    		encryptionSettings.Password = "password"; 
    		CompressionSettings compressionSettings = null;
    		Encoding encoding = null;
    		using (ZipArchive archive = ZipArchive.Create(stream, encoding, compressionSettings, encryptionSettings))
    		{
        		using (ZipArchiveEntry entry = archive.CreateEntry("text.txt"))
        		{
            		StreamWriter writer = new StreamWriter(entry.Open());
            		writer.WriteLine("Hello world!");
            		writer.Flush();
        		}
    		}
	}

{{endregion}}

#### __[VB.NET] Example 1: Create a password-protected ZIP archive__

{{region vb-radziplibrary-protect-ziparchive_0}}

	Using stream As Stream = File.Open("test.zip", FileMode.Create)
    		Dim encryptionSettings As PasswordEncryptionSettings = encryptionSettings.CreatePkzipPasswordEncryptionSettings()
    		encryptionSettings.Password = "password"
    		Dim compressionSettings As CompressionSettings = Nothing
    		Dim encoding As Encoding = Nothing

    		Using archive As ZipArchive = ZipArchive.Create(stream, encoding, compressionSettings, encryptionSettings)

        		Using entry As ZipArchiveEntry = archive.CreateEntry("text.txt")
            			Dim writer As StreamWriter = New StreamWriter(entry.Open())
            			writer.WriteLine("Hello world!")
            			writer.Flush()
        		End Using
    		End Using
	End Using

{{endregion}}


>tip You must always dispose of the ZIP archive object when all operations that use it are completed. Telerik Support recommends that you declare and instantiate the ZIP archive object in a using statement. If it is not possible for some reason, then do not forget to call the __Dispose()__ method when you complete all operations.
          
## Read a Password-Protected ZipArchive

In order to open a password-protected __ZipArchive__, you need to pass a __DefaultEncryptionSettings__ object with the password that was used to create the archive in the first place.
                

#### __[C#] Example 2: Open and read a password-protected ZIP archive__

{{region cs-radziplibrary-protect-ziparchive_1}}
	    
	using (FileStream stream = File.Open("test.zip", FileMode.Open))
	{ 
    		DecryptionSettings decryptionSettings = EncryptionSettings.CreateDecryptionSettings();
    		decryptionSettings.PasswordRequired += (s, a) => a.Password = "password";
    		CompressionSettings compressionSettings = null;
    		Encoding encoding = null;
    		using (ZipArchive zipArchive = ZipArchive.Read(stream, encoding, compressionSettings, decryptionSettings))
    		{
        		// Display the list of the files in the selected zip file using the ZipArchive.Entries property. 
    		}
	}

{{endregion}}

#### __[VB.NET] Example 2: Open and read a password-protected ZIP archive__

{{region vb-radziplibrary-protect-ziparchive_1}}

	Sub Main()	
 		Using stream As FileStream = File.Open("test.zip", FileMode.Open)
     			Dim decryptionSettings As DecryptionSettings = EncryptionSettings.CreateDecryptionSettings()
     			AddHandler decryptionSettings.PasswordRequired, AddressOf DecryptionSettings_PasswordRequired
     			Dim compressionSettings As CompressionSettings = Nothing
     			Dim encoding As Encoding = Nothing

     			Using zipArchive As ZipArchive = ZipArchive.Read(stream, encoding, compressionSettings, decryptionSettings)
         			'  Display the list of the files in the selected zip file using the ZipArchive.Entries property. 
     			End Using
 		End Using
	End Sub

	Private Sub DecryptionSettings_PasswordRequired(ByVal sender As Object, ByVal e As PasswordRequiredEventArgs)
        	e.Password = "passw0rd"
    	End Sub
{{endregion}}

>tip You must always dispose of the ZIP archive object when all operations that use it are completed. We recommend that you declare and instantiate the ZIP archive object in a **using** statement. If it is not possible for some reason, then do not forget to call the __Dispose()__ method when you complete all operations.
          

## See Also

 * [Getting Started]({%slug radziplibrary-gettingstarted%})
 * [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
