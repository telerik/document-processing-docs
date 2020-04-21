---
title: Getting Started
page_title: Getting Started
description: Getting Started
slug: radziplibrary-gettingstarted
tags: getting,started
published: True
position: 1
---

# Getting Started

__RadZipLibrary__ allows you to load data from existing ZIP archives or create and edit ZIPs that can be used by other applications. You can also create ZIP archives in memory or use a stream to get data and add it to a ZIP archive.
      

The ZIP archive is represented by __ZipArchive__ class. It can be used in 3 modes:
      

* __Read__: Allows reading of the existing ZIP archive. In this mode it is not possible to add or update archive entries.
          

* __Create__: Allows creation of a new archive. In this mode you can add new entries in the archive but cannot read or update content of the entries which have been written already.
          

* __Update__: Allows update of the existing ZIP archive. In this mode you can add new entries, read and update existing entries.

## Assembly References

>The libraries support .NET 4 and later. .NET Standard-compatible binaries are available as well. The assemblies for .NET Standard don't include 'Windows' in their names. (e.g. **Telerik.Zip.dll**). 

<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
	</tr>
</thead>
	<tr>
	    <td><b>Telerik.Windows.Zip.dll</b></td>
		<td><b>Telerik.Zip.dll</b></td>
	</tr>
</tbody>
</table>                

## Open Zip Archive

The code snippet from __Example 1__ demonstrates how to open existing Zip archive using the __ZipArchive__ class.
        

#### __[C#] Example 1: Open archive__

{{region cs-radziplibrary-gettingstarted_0}}
	            
	using (Stream stream = File.Open("test.zip", FileMode.Open))
	{
	    using (ZipArchive archive = new ZipArchive(stream))
	    {
	        // Display the list of the files in the selected zip file using the ZipArchive.Entries property.
	    }
	}
{{endregion}}



#### __[VB.NET] Example 1: Open archive__

{{region vb-radziplibrary-gettingstarted_0}}
	Using stream As Stream = File.Open("test.zip", FileMode.Open)
	    Using archive As New ZipArchive(stream)
	        ' Display the list of the files in the selected zip file using the ZipArchive.Entries property.
	    End Using
	End Using
{{endregion}}


The *archive* variable holds the files that are compressed in the selected zip. You can access the list of these files through the __ZipArchive.Entries__ property. It holds a collection of __ZipArchiveEntry__ elements - the elements that describe the files archived in the zip file. You can use these elements to get the name of the compressed file, its uncompressed and compressed size and other file attributes.
        

## Create Zip Archive

__Example 2__ shows how to create a new Zip archive using the __ZipArchive__ class and place a text file in it.
        

#### __[C#] Example 2: Create archive__

{{region cs-radziplibrary-gettingstarted_1}}
	    
	using (Stream stream = File.Open("test.zip", FileMode.Create))
	{
	    using (ZipArchive archive = new ZipArchive(stream, ZipArchiveMode.Create, false, null))
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



#### __[VB.NET] Example 2: Create archive__

{{region vb-radziplibrary-gettingstarted_1}}
	Using stream As Stream = File.Open("test.zip", FileMode.Create)
	    Using archive As New ZipArchive(stream, ZipArchiveMode.Create, False, Nothing)
	        Using entry As ZipArchiveEntry = archive.CreateEntry("text.txt")
	            Dim writer As New StreamWriter(entry.Open())
	            writer.WriteLine("Hello world!")
	            writer.Flush()
	        End Using
	    End Using
	End Using
{{endregion}}



>tipIf you use __StreamWriter__ to write content to the stream, you should call the Flush() method in order to flush the data to the stream.
          

>Do not close the stream opened by the __ZipArchiveEntry.Open()__ method. Otherwise the result is unpredictable.
          


## See Also

 * [Update ZipArchive]({%slug radziplibrary-update-ziparchive%})
