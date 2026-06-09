---
title: Missing symbols in PdfProcessing
description: Learn how to resolve missing symbols in a PDF document exported with RadPdfProcessing by embedding a font that contains the required characters.
type: how-to troubleshooting
page_title:  Missing symbols in PdfProcessing
slug: missing-symbols-in-pdf
position: 0
tags: radpdfprocessing, pdf, symbols, font, umlaut, document, processing, encoding
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2020.1.218|RadPdfProcessing|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

## Description

Missing symbols occur when the characters cannot be found in a specific font. In this case, `RadPdfProcessing` either falls back to another font or draws nothing.

## Solution

To resolve this issue, embed a font that contains the required symbols in the document. Use the `FontsRepository.RegisterFont` method to register the font and then create it with `FontsRepository.TryCreateFont`:

```csharp
var fontData = File.ReadAllBytes(@"..\\..\SegoeUI.ttf");
FontsRepository.RegisterFont(new FontFamily("Segoe UI"), FontStyles.Normal, FontWeights.Normal, fontData);

FontBase font;
FontsRepository.TryCreateFont(new FontFamily("Segoe UI"), FontStyles.Normal, FontWeights.Normal, out font);
```

## See Also

* [Fonts]({%slug radpdfprocessing-concepts-fonts%})
* [FontsRepository]({%slug radpdfprocessing-fontsrepository%})