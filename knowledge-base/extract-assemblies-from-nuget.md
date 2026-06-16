---
title: How to Extract Assemblies Contained inside a NuGet Package
description: Learn how to extract assemblies contained inside a NuGet package by renaming it to a .zip file or using 7-Zip with the Telerik Document Processing libraries.
type: how-to
page_title: How to Extract Assemblies Contained inside a NuGet Package
slug: extract-assemblies-from-nuget
tags: nuget, assembly, dll, telerik, document, processing, extract, packages
res_type: kb 
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| Q1 2025 | Document Processing Libraries |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates how to extract the signed `Tesseract.dll` from the `Telerik.Windows.Documents.TesseractOcr` NuGet package.

>note You can follow a similar approach for any other NuGet package to extract the assemblies contained inside the `.nupkg` file.

## Solution

1. Right-click the `Telerik.Windows.Documents.TesseractOcr` NuGet package and select **Extract** with 7-Zip:

    ![Extract from NuGet](images/extract-from-nuget.png)     

2. Find the contained assemblies in the `lib` folder:

    ![Extracted Assemblies](images/extracted-assemblies.png)    

3. Reference the extracted `Tesseract.dll` in your project.

## See Also

* [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%})
* [Using OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
* [Available NuGet Packages]({%slug available-nuget-packages%})
