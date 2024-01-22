---
title: How to implement FontsProvider
description: How to implement FontsProvider in .NET Standard due to font limitations in PdfProcessing.
type: how-to 
page_title:  Implement FontsProvider
slug: pdfprocessing-implement-fontsprovider
position: 0
tags: pdf, fonts, PdfProcessing, fontsprovider, netstandard
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2023.3.1106|PdfProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description
 
This article describes how to implement a **FontsProvider** in .NET Standard due to font limitations in [PdfProcessing]({%radpdfprocessing-overview%}). 

[PdfProcessing]({%radpdfprocessing-overview%}) needs to have access to the font data so that it can read it and add it to the PDF file. The .NET Standard version of the library does not offer a default mechanism to do that which is why, to allow the library to create and use fonts, an implementation of the **FontsProviderBase** abstract class needs to be provided and set to the **FontsProvider** property of the **FixedExtensibilityManager**.

## Solution

You must know the fonts the PDF file contains beforehand. Then all fonts must be manually added to the implementation in a similar pattern in order to obtain each font file. Through validation the corresponding font files are extracted.

In the validation each font name (FontFamilyName) must be explicitly specified (e.g. "Calibri", "Century Gothic") along with the different font styles (e.g. "Italic", "Bold", "Bold Italic"). Depending on the combination of the font name and font properties a corresponding font file is obtainded. The font file names must also be manually specified and known beforehand because each font has a different naming convention which cannot be predicted or automated (e.g. "calibri**z** - gothic**bi**" - both used for the Bold Italic style).

>important If the **FontsProvider** property is not set, a default font will be used when exporting the document.

#### **[C#] Creating custom implementation by inheriting the FontsProviderBase abstract class**
	{{region kb-radpdfprocessing-fontsprovider_0}}
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
	{{endregion}}

#### **[C#] Set the custom implementation inheriting the FontsProviderBase abstract class**
    {{region kb-radpdfprocessing-fontsprovider_1}}

        Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
    {{endregion}}
