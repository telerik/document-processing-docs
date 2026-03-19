---
title: Dealing with FileNotFoundException - Could not Load File or Assembly System.IO.Hashing
description: Learn how to handle the FileNotFoundException - Could not load file or assembly System.IO.Hashing.
type: how-to
page_title: How to Handle FileNotFoundException - Could not load file or assembly System.IO.Hashing
meta_title: How to Handle FileNotFoundException - Could not load file or assembly System.IO.Hashing
slug: handle-system-io-hashing-not-found
tags: document, processing, telerik, pdf, export, hash
res_type: kb 
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.304| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|.NET 8 (or newer) Target OS: Windows|Target Framework|-|

## Description

When exporting a PDF document using the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}), the following error occurs:
`System.IO.FileNotFoundException: 'Could not load file or assembly 'System.IO.Hashing'`.

## Solution

The **Telerik.Windows.Documents.Fixed** NuGet package has a dependency to the System.IO.Hashing introduced in version 2026.1.304.

In case your project throws the exception at runtime, install the [System.IO.Hashing](https://www.nuget.org/packages/System.IO.Hashing/) NuGet package manually.

## See Also

- [PdfProcessing Overview]({%slug radpdfprocessing-overview%})

