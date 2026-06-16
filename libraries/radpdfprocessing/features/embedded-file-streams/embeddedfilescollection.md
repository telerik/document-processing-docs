---
title: EmbeddedFilesCollection
description: Learn how to access, add, and remove embedded file streams in a PDF document using the EmbeddedFilesCollection class in RadPdfProcessing.
page_title: EmbeddedFilesCollection
slug: radpdfprocessing-embeddedfilescollection
tags: embedded, files, collection, pdf, streams, radpdfprocessing, attachments, api
position: 1
---

# EmbeddedFilesCollection

The `EmbeddedFilesCollection` class holds a collection of `EmbeddedFile` instances, assigned to the `EmbeddedFiles` property of the document. The collection exposes properties and methods that allow you to access, add, or remove the embedded file streams in a document.

## Properties

|Property|Description|
|----|----|
|`Names`|Gets a collection containing the names in the collection.|  
|`Count`|Gets the number of embedded files in the collection.|
|`ContainsZugferdInvoice`|Determines whether the collection contains a ZUGFeRD invoice name.|

## Methods
 
|Method|Description|
|----|----| 
|`GetEnumerator()`|Returns an enumerator that iterates through the collection.|
|`Remove(string name)`|Removes the embedded file with the specified name from the collection.|
|`Rename(string oldName, string newName)`|Renames an embedded file in the collection.|
|`Add(string name, byte[] data)`|Adds a named embedded file with the specified name and value to the collection and returns it.|
|`ContainsName(string name)`|Determines whether the collection contains the specified name.|
|`Clear()`|Removes all embedded files from the collection.| 
|`AddZugferdInvoice(byte[] data)`|Adds an embedded ZUGFeRD-compliant file to the collection and returns it. The conformance level is set to Basic. Only a single XML invoice attachment is allowed in ZUGFeRD.|
|`RemoveZugferdInvoice()`|Removes the embedded ZUGFeRD file with the specified name from the collection.|

## See Also

* [Embedded File Streams]({%slug radpdfprocessing-embedded-file-streams-overview%})
* [ZUGFeRD Invoices]({%slug radpdfprocessing-embedded-file-streams-zugferd-invoices%})
* [PDF Portfolio]({%slug radpdfprocessing-pdf-portfolio-overview%})
