---
title: Missing symbols in PdfProcessing
description:  Learn how you can deal with missing symbols in PDF document when exported with PdfProcessing.
type: how-to troubleshooting
page_title:  Missing symbols in PdfProcessing
slug: missing-symbols-in-pdf
position: 0
tags: pdf, umlaut, symbol
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|PdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Problem 
This can happen when the characters cannot be found in a specific font. In this case, the RadPdfProcessing either falls back to another font or draws nothing. 

## Solution

To ensure that these symbols are available you need to embed a font that contains them to the document. 

```csharp

    var fontData = File.ReadAllBytes(@"..\\..\SegoeUI.ttf");
    FontsRepository.RegisterFont(new FontFamily("Segoe UI"), FontStyles.Normal, FontWeights.Normal, fontData);

    FontBase font;
    FontsRepository.TryCreateFont(new FontFamily("Segoe UI"), FontStyles.Normal, FontWeights.Normal, out font);

```