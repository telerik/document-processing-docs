---
title: How to Extract Assemblies Contained inside a NuGet Package
description: Learn How to Extract Assemblies Contained inside a NuGet Package.
type: how-to
page_title: How to Extract Assemblies Contained inside a NuGet Package
slug: extract-assemblies-from-nuget
tags: extract, dll, reference, assembly, nuget, package 
res_type: kb 
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| Q1 2025 | Document Processing Libraries |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates how to extract the signed Tesseract.dll from the Telerik.Windows.Documents.TesseractOcr NuGet package.

>note A similar approach can be followed for any other NuGet package in order to extract the assemblies contained inside the **.nupkg**.

## Solution

1\. Right-click on the Telerik.Windows.Documents.TesseractOcr NuGet package and select **Extract** Using 7-Zip:

![Extract from NuGet](images/extract-from-nuget.png)     

2\. Find the contained assemvlies in the lib folder:

![Extracted Assemblies](images/extracted-assemblies.png)    

3\. Use explicitly this Tesseract.dll in your project.

## See Also

* [Prerequisites]({%slug radpdfprocessing-formats-and-conversion-ocr-prerequisites%})
* [Using OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
* [Available NuGet Packages]({%slug available-nuget-packages%})
