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

## Supported Font Types

>tip *A character is an abstract symbol, whereas a glyph is a specific graphical rendering of a character. Glyphs are organized into fonts. A font defines glyphs for a particular character set; for example, the Helvetica and Times fonts define glyphs for a set of standard Latin characters. A font for use with a PDF consumer application is prepared in the form of a program. Such a font program is written in a special-purpose language, such as the Type 1 or TrueType font format, that is understood by a specialized font interpreter. In PDF, the term `font` refers to a font dictionary, a PDF object that identifies the font program and contains additional information about it. There are several different font types, identified by the Subtype entry of the font dictionary. For most font types, the font program is defined in a separate font file, which may be either embedded in a PDF stream object or obtained from an external source. The font program contains glyph descriptions that generate glyphs. A content stream paints glyphs on the page by specifying a font dictionary and a string object that is interpreted as a sequence of one or more character codes identifying glyphs in the font. * (PDF Reference 1.7)

A font is represented in PDF as a dictionary specifying the type of font, its PostScript name, its encoding, and information that can be used to provide a substitute when the font program is not available. Optionally, the font program can be embedded as a stream object in the PDF file. 

The following table lists the font types defined in PDF. Type 0 fonts are called *Composite* fonts; other types of fonts are called *Simple* fonts. In addition to fonts, PDF supports two classes of font-related objects, called CIDFonts and CMaps.

|Font Type|Support/Not Supported | Subset Export Option|Description|
|----|----|----|----|
|Type 0|Supported|No|A composite font - a font composed of glyphs from a descendant CIDFont|
|Type 1|Supported|No|A font that defines glyph shapes using Type 1 font technology|
|Type 3|Supported|No|A font that defines glyphs with streams of PDF graphics operators|
|TrueType|Supported|Yes|A font based on the TrueType font format|
|CIDFont|Supported|No|CIDFontType0: A CIDFont whose glyph descriptions are based on Type 1 font technology.  CIDFontType2: A CIDFont whose glyph descriptions are based on TrueType font technology|

>tip The most predictable and dependable results are produced when all font programs used to show text are embedded in the PDF file. If a PDF file refers to font programs that are not embedded, the results depend on the availability of fonts in the consumer application's environment. 

### Simple Fonts

All *Simple* fonts have the following properties:

* Glyphs in the font are selected by single-byte character codes obtained from a string that is shown by the text-showing operators. Logically, these codes index into a table of 256 glyphs; the mapping from codes to glyphs is called the font's encoding. Each font program has a built-in encoding.

* Each glyph has a single set of metrics, including a horizontal displacement or width.

* Except for Type 0 fonts, Type 3 fonts in non-Tagged PDF documents, and certain standard Type 1 fonts, every font dictionary contains a subsidiary dictionary, the font descriptor, containing font-wide metrics and other attributes of the font. 

### Composite Fonts

A *Composite* font, also called a Type 0 font, is one whose glyphs are obtained from a fontlike object called a CIDFont. A composite font is represented by a font dictionary whose Subtype value is Type 0. The Type 0 font is known as the root font, and its associated CIDFont is called its descendant. 

>note *Composite* fonts in PDF are analogous to composite fonts in PostScript but with some limitations. In particular, PDF requires that the character encoding be defined by a CMap, which is only one of several encoding methods available in PostScript. Also, PostScript allows a Type 0 font to have multiple descendants, which might also be Type 0 fonts. PDF supports only a single descendant, which must be a CIDFont. * (PDF Reference 1.7)

When the current font is *Composite*, the text-showing operators behave differently than with *Simple* fonts. For *Simple* fonts, each byte of a string to be shown selects one glyph, whereas for composite fonts, a sequence of one or more bytes can be decoded to select a glyph from the descendant CIDFont. This facility supports the use of very large character sets, such as those for the Chinese, Japanese, and Korean languages. It also simplifies the organization of fonts that have complex encoding requirements. 

## Standard Fonts

There are 14 *Type 1* fonts, known as the standard 14 fonts, that are not embedded in the document when you use them. These fonts can be accessed through the [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html) class. The standard fonts are listed below:
       
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

>tip These fonts, or their font metrics and suitable substitution fonts, must be available to the consumer application.

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

