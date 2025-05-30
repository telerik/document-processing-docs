---
title: Prerequisites
description: Learn how to convert scanned images to PDF format using OcrFormatProvider.
page_title: Prerequisites for Using OcrFormatProvider
slug: radpdfprocessing-formats-and-conversion-ocr-prerequisites
tags: pdf, processing, ocr, image, prerequisites
published: True
position: 0
---

# Prerequisites

**Optical Character Recognition** (a.k.a. OCR) is the electronic or mechanical conversion of images of typed, handwritten, or printed text into a machine-encoded text from a scanned document.

This topic describes the requirements needed by the [PdfProcessing]({%slug radpdfprocessing-overview%}) library to start using the **OcrFormatProvider**.

>important The default Tesseract implementation is at this point **Windows** and **Linux-only**. You can still use the OCR feature with a [custom implementation]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%}).

>note Used images should be **300 DPI** for best results.

## Required Assemblies/ NuGet Packages

In order to use the **OcrFormatProvider** you need to add the following assemblies:

<table>
<thead>
	<tr>
		<th>.NET Framework </th>
		<th>.NET Standard-compatible</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td><b>Telerik.Windows.Documents.Core</b></td>
		<td><b>Telerik.Documents.Core</b></td>
	</tr>
	<tr>
	    <td><b>Telerik.Windows.Documents.Fixed</b></td>
		<td><b>Telerik.Documents.Fixed</b></td>
	</tr>
    <tr>
	    <td><b>Telerik.Windows.Documents.Fixed.FormatProviders.Ocr</b></td>
		<td><b>Telerik.Documents.Fixed.FormatProviders.Ocr</b></td>
	</tr>
     </tr>
		<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
    <td colspan="2">
        This reference is recommended to always be in the form of a NuGet package, as it will add the required Tesseract references and files automatically. Otherwise, a 
        <a href="#manually-set-up-the-tesseract-native-assemblies">manual intervention</a> might be required.
    </td>
</tr>
        <tr>
	    <td><b>Telerik.Windows.Documents.TesseractOcr</b></td>
		<td><b>Telerik.Documents.TesseractOcr</b></td>
	</tr>
    </tr>
		<tr>
	    <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
        <td colspan="2">To export images different than <b>Jpeg</b> and <b>Jpeg2000</b> or ImageQuality different than High you will need to add a reference to the following assembly:</td> 
    </tr>
	<tr>
	    <td><b>-</b></td>
		<td><b>Telerik.Documents.ImageUtils</b>
			<br><sub><i>This assembly is not available in UI for Xamarin.</i></sub>
	</tr>
    <tr>
	    <td><b>-</b></td>
		<td>
        <b><a href="https://www.nuget.org/packages/SkiaSharp/">SkiaSharp</a></b>
        <br>
        <sub><i>Telerik.Documents.ImageUtils depends on SkiaSharp.</i></sub>
    </td>
	</tr>
	<tr>
        <td><b>-</b></td>
		<td>
        <b>SkiaSharp.NativeAssets.*</b> (version 2.88.8)
        <br>
        <sub><i>May differ according to the used platform. For <b>Linux</b> (since <b>Q2 2025</b>) use <b>SkiaSharp.NativeAssets.Linux.NoDependencies</b> and execute the <a href="#linux-specific-steps">required commands.</a></i></sub>
	</tr>
	<tr>
        <td><b>-</b></td>
		<td>
        <b>SkiaSharp.Views.Blazor</b> and <b>wasm-tools</b>
        <br>
        <sub><i>For Blazor Web Assembly.</i></sub>
	</tr>
</tbody>
</table>

>important Ensure that all [Tesseract dependencies are properly set up](#manually-set-up-the-tesseract-native-assemblies).

## Language Data Setup

Create a "**tessdata**" folder and populate it with the desired languages. The languages are in the form of _.traineddata_ files and are crucial for Tesseract OCR because they contain the machine learning models that Tesseract uses to recognize text. English (eng.traineddata) is always required by default. You can download the language data files from the official [Tesseract GitHub repository](https://github.com/tesseract-ocr/tessdata/tree/3.04.00). Results may vary depending on the language version:

![Tesseract Languages Version](images/tesseract-languages-version.png)

The "**tessdata**" folder's placement is determined by the user. The **DataPath** property of the [TesseractOcrProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}#tesseractocrprovider-public-api) points to the parent folder containing "**tessdata**", allowing the provider to locate and use it.

#### "tessdata" Structure:

```plaintext
tessdata
├── due.traineddata
├── eng.traineddata     
└── spa.traineddata
```

## Manually set up the Tesseract native assemblies

Ensure that the following already exist in the root directory of your project:
- The "_Tesseract.dll_" assembly.
- The Tesseract native assemblies (x86, x64): 

![Tesseract Native Assemblies Structure](images/tesseract-native-assemblies-structure.png)

If these requirements are not met, go through the following steps:

1. Download the "_tesseract50.dll_" and "_leptonica-1.82.0.dll_" native assemblies from the listed links:
    * https://github.com/charlesw/tesseract/tree/master/src/Tesseract/x64.
    * https://github.com/charlesw/tesseract/tree/master/src/Tesseract/x86.
1. Create the following structure and add the two folders to the root of the applicaiton.
    * Folder Structure:
    ```plaintext
    RootFolder
    ├── x64
    │   ├── tesseract50.dll
    │   └── leptonica-1.82.0.dll
    └── x86
        ├── tesseract50.dll
        └── leptonica-1.82.0.dll
    ```

### Linux-specific steps
Execute the following commands in the environment:

|Ubuntu|Alpine|Fedora|
|----|----|----|
|```sudo apt update```|```dsudo apk update```|```sudo dnf install tesseract```|
|```sudo apt install tesseract-ocr```|```sudo apk add tesseract-ocr```|```sudo dnf install leptonica```|
|```sudo apt install libleptonica-dev```|```sudo apk add leptonica```||
 
>caution If the generated **tesseract/leptonica** .so files cannot be found, it is likely that they were installed with different names than expected. To resolve this, you can copy their names and location, and set them to the corresponding properties:
> * **TesseractEnvironment.TesseractUnixLibName**
> * **TesseractEnvironment.LeptonicaUnixLibName**
> * **TesseractEnvironment.CustomSearchPath**

## See Also

* [Using OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%})
* [Implementing a Custom OCR Provider]({%slug radpdfprocessing-formats-and-conversion-ocr-custom-ocrprovider%})
* [Cross-Platform Images]({%slug radpdfprocessing-cross-platform-images%})
