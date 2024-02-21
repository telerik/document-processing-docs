---
title: How to Resolve InvalidDataException Central directory header is broken
description: This article provides a solution for the InvalidDataException that occurs when trying to import a DOC file using RadWordsProcessing
type: troubleshooting
page_title: How to Resolve InvalidDataException Central directory header is broken
slug: fix-invalid-data-exception-generating-word-document
tags: troubleshooting, RadZipLibrary, Document Processing, InvalidDataException
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The following exception may occur when trying to import a DOC file using RadWordsProcessing:

![InvalidDataException](images/InvalidDataException.png)   


## Solution

To resolve this issue, please follow these steps:

1. Make sure that you are using the correct format provider for importing the DOC file. Use the [DocFormatProvider]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%}) instead of the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}) for importing the DOC file.

2. After importing the document, if you need to export it as a DOCX file, use the `DocxFormatProvider`.

By following these steps, you should be able to import the DOC file without encountering the `InvalidDataException`.

## See Also

* [DocFormatProvider]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%})
* [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})

