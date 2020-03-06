---
title: RadPdfProcessing manually register font
description: RadPdfProcessing manually register font
type: how-to
page_title: RadPdfProcessing manually register font
slug: load-fonts-with-net-standard
position: 0
tags: pdf, register, fonts
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2020.1.114|RadPdfProcessing for Net Standard|[Dimitar Karamfilov](https://www.telerik.com/blogs/author/dimitar-karamfilov)|

# Problem

The __RadPdfProcessing__ version for .NET standard does not look for the fonts on the operating system and falls back to the [standard fonts](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/fonts#standard-fonts).  

# Solution

Manually register the fonts in your application. 

```` C#
var fontData = File.ReadAllBytes(@"..\..\..\Roboto-Bold.TTF");
FontsRepository.RegisterFont(new FontFamily("Roboto"), FontStyles.Normal, FontWeights.Bold, fontData);

Block block = new Block();

block.InsertText(new FontFamily("Roboto"), FontStyles.Normal, FontWeights.Bold, "Text");
editor.Position.Translate(100, 100);
editor.DrawBlock(block);

````



