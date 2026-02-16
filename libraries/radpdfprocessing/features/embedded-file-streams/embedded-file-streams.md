---
title: Overview
page_title: Overview
slug: radpdfprocessing-embedded-file-streams-overview
tags: pdf, file, stream, embedded
position: 0
---

# Embedded File Streams - Overview

|Minimum Version|Q1 2024|
|----|----|

RadPdfProcessing allows embedding file streams into the document. Thus, the content of the referenced files is embedded directly within the body of the PDF file.

## The EmbeddedFile Class

RadFixedDocument stores the integrated files in an **EmbeddedFilesCollection** accessed by the **EmbeddedFiles** property. Each **EmbeddedFile** requires **Name** (string) and **Data** (byte[]) properties. The specified Name should be unique and it represents the textual description of the embedded file, which can be displayed in the user interface of a viewer application. The Data stores the byte[] of the file stream. 

>important The Name for the EmbeddedFile should contain the file extension as well, e.g. *MySampleTextFile.txt*.

|Property|Description|
|----|----|
|**Name**|Gets or sets the attachment's display file name (including extension) shown in viewer UIs.|
|**Data**|Represents the file data as a byte array.|
|**MimeType**|Gets or sets the MIME type of the embedded file. The MIME type string (e.g., "application/xml", "text/xml", etc.). If not specified, the default value of "application/octet-stream" will be used. (*introduced in Q1 2026*) |

>note [PdfProcessing Embedding File Streams Demo](https://demos.telerik.com/document-processing/pdfprocessing/embed_file_streams)

### Creating an Embedded File Stream
 
#### **Creating an embedded file stream**

<snippet id='pdf-create-embedded-file-stream'/>

>important **DuplicatedEmbeddedFileNameException** is thrown when adding an embedded file with a name that is already added to the collection.

#### Attachments section in Adobe 

![Embedded Files in a PDF document](images/embedded_files_0.png)

### Specifying the MIME Type

|Minimum Version|Q1 2026|
|----|----|

RadPdfProcessing allows you to explicitly set the correct MIME type when embedding the file into the PDF. This is especially important for standards like PDF/A-3 and Factur-X, which require strict metadata and MIME type declarations for embedded files.

<snippet id='pdf-set-mime-type'/>

### Creating an Embedded Electronic (ZUGFeRD) Invoice

RadPdfProcessing provides support for embedding [ZUGFeRD invoices]({%slug radpdfprocessing-embedded-file-streams-zugferd-invoices%}). 

### Using the MergedEmbeddedFileNameResolving event

The **MergedEmbeddedFileNameResolving** event occurs when trying to resolve conflicts between the embedded file names while merging RadFixedDocument instances. The **DuplicatedEmbeddedFileNameResolvingEventArgs** allows you to specify the **NewName** to be used for adding the file to the EmbeddedFiles collection.

|**DuplicatedEmbeddedFileNameResolvingEventArgs**|**Description**|
|----|----|
|**Name**|Gets the current embedded file name.|
|**NewName**|Gets or sets the new embedded file name.|
|**UsedNames**|Gets the names that are already used for embedded files in the same RadFixedDocument.|

#### **Resolving Duplicated Names**

<snippet id='pdf-duplicated-file-names'/>

#### Resolved Duplicated Names 
![Resolving duplicated Names in Embedded Files](images/embedded_files_1.png) 

### Using the PdfImportSettings.DuplicatedEmbeddedFileNameResolving event 

When importing a PDF document containing embedded files, the **DuplicatedEmbeddedFileNameResolving** event that the [PdfImportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) offers, allows you to handle duplicated names and properly resolve them.

## See Also

* [PdfProcessing Embedding File Streams Demo](https://demos.telerik.com/document-processing/pdfprocessing/embed_file_streams)

