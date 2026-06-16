---
title: How to implement FontsProvider
description: Learn how to implement FontsProvider in .NET Standard to resolve font limitations when exporting PDF documents with RadPdfProcessing.
type: how-to 
page_title:  Implement FontsProvider
slug: pdfprocessing-implement-fontsprovider
position: 0
tags: radpdfprocessing, pdf, font, fontsprovider, netstandard, document, processing, provider
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2023.3.1106|PdfProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description
 
This article describes how to implement a `FontsProvider` in .NET Standard due to font limitations in [PdfProcessing]({%slug radpdfprocessing-overview%}). 

[PdfProcessing]({%slug radpdfprocessing-overview%}) must have access to the font data so that it can read it and add it to the PDF file. The .NET Standard version of the library does not offer a default mechanism for this. To allow the library to create and use fonts, provide an implementation of the `FontsProviderBase` abstract class and set it to the `FontsProvider` property of the `FixedExtensibilityManager`.

## Solution

You must know the fonts the PDF file contains beforehand. Then all fonts must be manually added to the implementation in a similar pattern to obtain each font file. Through validation, the corresponding font files are extracted.

In the validation, each font name (`FontFamilyName`) must be explicitly specified (for example, "Calibri", "Century Gothic") along with the different font styles (for example, "Italic", "Bold", "Bold Italic"). Depending on the combination of the font name and font properties, the implementation obtains a corresponding font file. The font file names must also be manually specified and known beforehand because each font has a different naming convention that cannot be predicted or automated (for example, "calibri**z** - gothic**bi**" — both used for the Bold Italic style).

>important If the `FontsProvider` property is not set, a default font is used when exporting the document.

### Creating a Custom Implementation by Inheriting the FontsProviderBase Abstract Class
	
```csharp
	public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
	{
    	public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
    	{
        	string fontFileName = fontProperties.FontFamilyName + ".ttf";
        	string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);

        	//The fonts can differ depending on the file
        	if (fontProperties.FontFamilyName == "Calibri")
        	{
	            if (fontProperties.FontStyle == FontStyles.Italic && fontProperties.FontWeight == FontWeights.Bold)
            	{
	                fontFileName = $"calibriz.ttf";
            	}
            	else if (fontProperties.FontStyle == FontStyles.Italic)
            	{
	                fontFileName = $"calibrii.ttf";
            	}
            	else if (fontProperties.FontWeight == FontWeights.Normal)
            	{
	                fontFileName = "calibri.ttf";
            	}
            	else if (fontProperties.FontWeight == FontWeights.Bold)
            	{
	                fontFileName = $"calibrib.ttf";
            	}
        	}

        	else if (fontProperties.FontFamilyName == "Century Gothic")
        	{
	            if (fontProperties.FontStyle == FontStyles.Italic && fontProperties.FontWeight == FontWeights.Bold)
            	{
	                fontFileName = $"gothicbi.ttf";
            	}
            	else if (fontProperties.FontStyle == FontStyles.Italic)
            	{
	                fontFileName = $"gothici.ttf";
            	}
            	else if (fontProperties.FontWeight == FontWeights.Normal)
            	{
	                fontFileName = "gothic.ttf";
            	}
            	else if (fontProperties.FontWeight == FontWeights.Bold)
            	{
	                fontFileName = $"gothicb.ttf";
            	}
        	}

        	else if (fontProperties.FontFamilyName == "Wingdings")
        	{
	            if (fontProperties.FontWeight == FontWeights.Normal)
            	{
	                fontFileName = $"wingding.ttf";
            	}
        	}

        	//...add more fonts if needed...

        	DirectoryInfo directory = new DirectoryInfo(fontFolder);
        	FileInfo[] fontFiles = directory.GetFiles();

        	var fontFile = fontFiles.FirstOrDefault(f => f.Name.Equals(fontFileName, StringComparison.InvariantCultureIgnoreCase));
        	if (fontFile != null)
        	{
	            var targetPath = fontFile.FullName;
            	using (FileStream fileStream = File.OpenRead(targetPath))
            	{
	                using (MemoryStream memoryStream = new MemoryStream())
                	{
	                    fileStream.CopyTo(memoryStream);
                    	return memoryStream.ToArray();
                	}
            	}
        	}

        	return null;
    	}
	}
```

### Setting the Custom FontsProvider Implementation
    
```csharp
        Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
```

## See Also

* [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%})
* [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
* [Inserting Special Symbols in PDF using RadPdfProcessing]({%slug inserting-special-symbols-pdf-radpdfprocessing%})
* [How to Prevent Text with Special Characters from Being Cut Off when converting HTML to PDF using RadWordsProcessing]({%slug prevent-text-cut-off-pdf-conversion-radwordsprocessing%})
