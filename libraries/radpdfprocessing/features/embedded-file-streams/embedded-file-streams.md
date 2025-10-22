---
title: Overview
page_title: Overview
slug: radpdfprocessing-embedded-file-streams-overview
tags: pdf, file, stream, embedded
position: 0
---

# Embedded File Streams - Overview

As of **2024 Q1** RadPdfProcessing allows embedding file streams into the document. Thus, the content of the referenced files is embedded directly within the body of the PDF file.

## The EmbeddedFile Class

RadFixedDocument stores the integrated files in an **EmbeddedFilesCollection** accessed by the **EmbeddedFiles** property. Each **EmbeddedFile** contains **Name** (string) and **Data** (byte[]) properties. The specified Name should be unique and it represents the textual description of the embedded file, which can be displayed in the user interface of a viewer application. The Data stores the byte[] of the file stream. 

>important The Name for the EmbeddedFile should contain the file extension as well, e.g. *MySampleTextFile.txt*.

>note [PdfProcessing Embedding File Streams Demo](https://demos.telerik.com/document-processing/pdfprocessing/embed_file_streams)

### Creating an Embedded File Stream
 
#### **[C#] Creating an embedded file stream**

<snippet id='pdf-create-embedded-file-stream'/>

>important **DuplicatedEmbeddedFileNameException** is thrown when adding an embedded file with a name that is already added to the collection.

#### Attachments section in Adobe 
![Embedded Files in a PDF document](images/embedded_files_0.png)

### Creating an Embedded Electronic (ZUGFeRD) Invoice

RadPdfProcessing provides support for embedding of [ZUGFeRD](https://de.wikipedia.org/wiki/ZUGFeRD) (acronym for Zentraler User Guide des Forums elektronische Rechnung Deutschland) invoices.

#### **[C#] Add ZUGFeRD invoice**

<snippet id='pdf-add-zugferd-invoice'/>

>note Only a single XML invoice attachment is allowed according to ZUGFeRD standard.

>important The PDF/A standard requires all fonts used in a document to be embedded. Prior to **Q3 2025**, the [14 standard fonts]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) were not embedded in the file, which caused the document to be non-compliant. As of **Q3 2025**, these standard fonts are automatically embedded when PDF/A compliance is enabled. More information about font embedding is available in the [Fonts]({%slug radpdfprocessing-concepts-fonts%}) article.

#### **[C#] Remove ZUGFeRD invoice**

<snippet id='pdf-remove-zugferd-invoice'/>

### Using the MergedEmbeddedFileNameResolving event

The **MergedEmbeddedFileNameResolving** event occurs when trying to resolve conflicts between the embedded file names while merging RadFixedDocument instances. The **DuplicatedEmbeddedFileNameResolvingEventArgs** allows you to specify the **NewName** to be used for adding the file to the EmbeddedFiles collection.

|**DuplicatedEmbeddedFileNameResolvingEventArgs**|**Description**|
|----|----|
|**Name**|Gets the current embedded file name.|
|**NewName**|Gets or sets the new embedded file name.|
|**UsedNames**|Gets the names that are already used for embedded files in the same RadFixedDocument.|

#### **[C#] Resolving Duplicated Names**

<snippet id='pdf-duplicated-file-names'/>

#### Resolved Duplicated Names 
![Resolving duplicated Names in Embedded Files](images/embedded_files_1.png) 

### Using the PdfImportSettings.DuplicatedEmbeddedFileNameResolving event 

When importing a PDF document containing embedded files, the **DuplicatedEmbeddedFileNameResolving** event that the [PdfImportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) offers, allows you to handle duplicated names and properly resolve them.

## See Also

* [PdfProcessing Embedding File Streams Demo](https://demos.telerik.com/document-processing/pdfprocessing/embed_file_streams)

