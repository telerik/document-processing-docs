---
title: Achieving Consistent Fonts in Client-Side and Server-Side PDF Formatting with Telerik Document Processing
description: Resolve font formatting discrepancies between client-side and server-side PDF generation using Telerik Document Processing.
type: how-to
page_title: Resolving PDF Formatting Differences Between Client and Server in Telerik Document Processing
meta_title: Resolving PDF Formatting Differences Between Client and Server in Telerik Document Processing
slug: consistent-pdf-font-formatting
tags: pdf, font,telerik, document, processing,formatting,server-side,client-side,export
res_type: kb
ticketid: 1700632
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I was using a Kendo Grid in an Angular application to export data to PDF. Due to a large dataset, it was suggested to switch to server-side PDF generation with [Telerik Document Processing PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview). However, the server-generated PDF looked significantly different from the client-side version. To meet business requirements, I need the server-generated PDF to match the formatting of the client-side version. Manually replicating the Kendo layout on the server seems complex and time-consuming. I need a streamlined approach to achieve consistent formatting between server and client-side PDFs.

This knowledge base article also answers the following questions:
- How can I ensure server-side PDF formatting matches the client-side PDF?  
- How to set custom fonts for server-side PDF generation in Telerik Document Processing?  
- How to use server-side PDF generation to replicate client-side formatting?  

## Solution

To achieve consistent formatting between the client-side and server-side PDFs, follow these steps:

1. Install the [Telerik.Documents.Fixed](https://docs.telerik.com/devtools/document-processing/getting-started/installation/nuget-packages) NuGet package.
2. Specify the font explicitly for text elements in the server-side PDF generation code.
3. Load the required font file and register it with the `FontsRepository`.

Use one of the following options to set the font for text blocks:

### Option 1: Explicitly Set Font for Blocks
Register and apply the font as shown in the example below:

```csharp
byte[] fontData = File.ReadAllBytes(@"C:\Windows\Fonts\calibri.ttf");
FontFamily fontFamily = new FontFamily("Calibri");
FontsRepository.RegisterFont(fontFamily, FontStyles.Normal, FontWeights.Normal, fontData);

FontBase calibriFont;
bool success = FontsRepository.TryCreateFont(fontFamily, FontStyles.Normal, FontWeights.Normal, out calibriFont);

var c0 = row.Cells.AddTableCell();
c0.PreferredWidth = preferredWidths[0];
Block block1 = c0.Blocks.AddBlock();
block1.TextProperties.Font = calibriFont;
block1.InsertText(reportItem.JobNumber ?? string.Empty);
```

### Option 2: Use FontFamily for Text Insertion
Alternatively, utilize the `FontFamily` directly during text insertion:

```csharp
byte[] fontData = File.ReadAllBytes(@"C:\Windows\Fonts\calibri.ttf");
FontFamily fontFamily = new FontFamily("Calibri");
FontsRepository.RegisterFont(fontFamily, FontStyles.Normal, FontWeights.Normal, fontData);

var c10 = row.Cells.AddTableCell();
c10.PreferredWidth = preferredWidths[10];
c10.Blocks.AddBlock().InsertText(fontFamily, reportItem.StatusDate?.ToString("dd/MM/yyyy") ?? string.Empty);
```

Ensure consistent usage of fonts between client-side and server-side export processes. Use the same font family and size as implemented in the client-side export.

## See Also

- [Cross-Platform Fonts]({%slug radpdfprocessing-cross-platform-fonts%})

