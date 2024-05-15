---
title: Fonts
page_title: Fonts
description: RadPdfProcessing is a processing library that allows you to create, import and export PDF documents.
slug: radpdfprocessing-concepts-fonts
tags: fonts, pdf, framework, standard, embed
published: True
position: 3
---

# Fonts

**RadPdfProcessing** uses fonts represented by **FontBase** objects to specify the look of the text that is exported to PDF format. Currently, it supports two font types: 

* Standard 

* Embedded

>note As of **Q2 2024** RadPdfProcessing offers support for OTF (OpenType Font) font file format.

## Standard Fonts

There are 14 standard fonts that are not embedded in the document when you use them. These fonts can be accessed through the [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html) class. The standard fonts are listed below:
       
|Font Name|
|----|
|Helvetica|
| Helvetica-Bold|
| Helvetica-Oblique|
| Helvetica-BoldOblique|
| Courier|
| Courier-Bold|
| Courier-Oblique|
| Courier-BoldOblique|
| Times-Roman|
| Times-Bold|
| Times-Italic|
| Times-BoldItalic|
| Symbol|
| ZapfDingbats|

## Embedded Fonts

All fonts, which are not included in the 14 standard ones, should be **embedded** in the PDF document. Otherwise, the result may be unpredictable when the document is rendered. In __RadPdfProcessing__ you have the ability to embed fonts following the approaches described below.
        
>If you do not wish to embed the fonts in the document set the **FontEmbeddingType** property of the [ExportSettings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}).

### Registering a Font

If you want to use a font, that is not part of the standard ones, you can register it using the __RegisterFont()__ method of the __FontRepository__ static class. The method requires four parameters - FontFamily, FontStyle and FontWeight objects describing the font and a byte array containing the raw font data.
         
__Example 1__ demonstrates how you can use the RegisterFont() method.
            
#### __[C#] Example 1: Register font in .NET Framework application__

{{region cs-radpdfprocessing-concepts-fonts_0}}

	// Read the font file
	byte[] fontData = File.ReadAllBytes("some-font.ttf");
	System.Windows.Media.FontFamily fontFamily = new System.Windows.Media.FontFamily("Some Font");
	
	// Register the font
	 Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamily, System.Windows.FontStyles.Normal, System.Windows.FontWeights.Normal, fontData);
{{endregion}}

#### __[C#] Example 1: Register font in .NET Standard application__

{{region cs-radpdfprocessing-concepts-fonts_2}}

	// Read the font file
	byte[] fontData = File.ReadAllBytes("some-font.ttf");
	Telerik.Documents.Core.Fonts.FontFamily fontFamily = new Telerik.Documents.Core.Fonts.FontFamily("Some Font");
	
	// Register the font
	 Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.RegisterFont(fontFamily, Telerik.Documents.Core.Fonts.FontStyles.Normal, Telerik.Documents.Core.Fonts.FontWeights.Normal, fontData);
{{endregion}}

### Creating a Font

>tip Each registered font can be obtained from the font repository as __FontBase__ object and applied to a __[TextFragment]({%slug radpdfprocessing-model-textfragment%})__ through its __Font__ property.

__Example 2__ shows how to create a font using the FontsRepository.
            

#### __[C#] Example 2: Create FontBase__

{{region cs-radpdfprocessing-concepts-fonts_1}}
	FontBase font;
	bool success = FontsRepository.TryCreateFont(fontFamily, fontStyle, fontWeight, out font);
{{endregion}}

You can create fonts that are not explicitly registered. Creating a font that is not registered in the repository with the code from __Example 2__ tries to find the font from the ones installed on the machine. 

>caution Due to security limitations in Silverlight, creating a font that is not present in the repository with the code from __Example 2__ is expected to fail - the application doesn't have the permissions to get the font from the file system.

## See Also
 * [Cross-Platform Support for Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
 * [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html)
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})

