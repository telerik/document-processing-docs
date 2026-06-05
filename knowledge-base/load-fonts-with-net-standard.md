---
title: RadPdfProcessing manually register font
description: Learn how to manually register a font and use it in a PDF document with RadPdfProcessing for .NET Standard when the system fonts are not available.
type: how-to
page_title: RadPdfProcessing manually register font
slug: load-fonts-with-net-standard
position: 0
tags: radpdfprocessing, pdf, font, netstandard, provider, document, processing, register
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2020.1.114|RadPdfProcessing for .NET Standard|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

The **RadPdfProcessing** library for .NET Standard does not search for fonts on the operating system. Instead, it falls back to the [standard fonts]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts).

## Solution

Register the fonts manually in your application.

**Example 1: Register and Use a Custom Font**

```csharp
var fontData = File.ReadAllBytes(@"..\..\..\Roboto-Bold.TTF");
FontsRepository.RegisterFont(new FontFamily("Roboto"), FontStyles.Normal, FontWeights.Bold, fontData);

Block block = new Block();

block.InsertText(new FontFamily("Roboto"), FontStyles.Normal, FontWeights.Bold, "Text");
editor.Position.Translate(100, 100);
editor.DrawBlock(block);
```

## See Also

* [Fonts in RadPdfProcessing]({%slug radpdfprocessing-concepts-fonts%})

