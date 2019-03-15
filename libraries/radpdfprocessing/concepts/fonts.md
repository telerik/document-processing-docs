---
title: Fonts
page_title: Fonts
description: Fonts
slug: radpdfprocessing-concepts-fonts
tags: fonts
published: True
position: 3
---

# Fonts



__RadPdfProcessing__ uses fonts represented by __FontBase__ objects to specify the look of the text that is exported to PDF. Currently, it supports two font types: Standard and Embedded.
      

## Standard Fonts
There are 14 standard fonts that are not embedded in the document when you use them. These fonts can be accessed through the [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html) class and are listed below.

        

* Helvetica
* Helvetica Bold
* Helvetica Oblique
* Helvetica BoldOblique
* Courier
* Courier Bold
* Courier Oblique
* Courier BoldOblique
* Times Roman
* Times Bold
* Times Italic
* Times BoldItalic
* Symbol
* ZapfDingbats

## Embedded Fonts

All fonts, which are not included in the 14 standard ones should be embedded in the PDF document. Otherwise, the result when the document is rendered is unpredictable. In __RadPdfProcessing__ you have the ability to embed fonts following the approaches described below.
        

### Registering a Font

If you want to use a font, which is not part of the standard ones, you can register it using the __RegisterFont()__ method of the __FontRepository__ static class. The method requires four parameters - FontFamily, FontStyle and FontWeight objects describing the font and a byte array containing the raw font data.
            

__Example 1__ demonstrates how you can use the RegisterFont() method.
            

#### __[C#] Example 1: Register font__

{{region cs-radpdfprocessing-concepts-fonts_0}}
	FontsRepository.RegisterFont(fontFamily, fontStyle, fontWeight, data);
{{endregion}}



### Creating a Font

>tipEach registered font can be obtained from the font repository as __FontBase__ object and applied to a __[TextFragment]({%slug radpdfprocessing-model-textfragment%})__ through its __Font__ property.
            

__Example 2__ shows how to create a font using the FontsRepository.
            

#### __[C#] Example 2: Create FontBase__

{{region cs-radpdfprocessing-concepts-fonts_1}}
	FontBase font;
	bool success = FontsRepository.TryCreateFont(fontFamily, fontStyle, fontWeight, out font);
{{endregion}}


>You can create fonts that are not explicitly registered. Creating a font that is not registered in the repository with the code from __Example 2__ tries to find the font from the ones installed on the machine. 
>
>Note that due to security limitations in Silverlight, creating a font that is not present in the repository with the code from __Example 2__ is going to fail - the application doesn't have the permissions to get the font from the file system.



## See Also
 * [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html)
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})

