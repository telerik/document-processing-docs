---
title: Fonts
description: Learn how to manage and embed fonts in PDF documents using Telerik RadPdfProcessing for cross-platform .NET applications.
page_title: Fonts
slug: radpdfprocessing-cross-platform-fonts
tags: cross, platform, font, blazor, core, xamarin, winui, maui, net, standard, linux, ios 
platforms: blazor, core, xamarin, winui, maui
published: True
position: 1
---

# Fonts

Unlike the .NET Framework and .NET (Target OS: *Windows*) version, the RadPdfProcessing's **.NET Standard** and **.NET (Target OS: *None*)** version does not offer a default mechanism for reading fonts. The **FixedExtensibilityManager** class is exposed to help implement this functionality.

## Setting and Exporting Fonts

RadPdfProcessing needs access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the **FontsProviderBase** abstract class and set this implementation to the **<u>FontsProvider</u>** property of the **FixedExtensibilityManager**.

You can find a detailed **FixedExtensibilityManager** and **FontsProvider** description and implementation in the [How to implement a FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) article. 

>caution If the FontsProvider property is not set, a default font will be used when exporting the document in cross-platform applications.

>important When converting a document (e.g., DOCX, HTML, etc.) to PDF format in **.NET Standard** and **.NET (Target OS: *None*)** projects, fonts from the original document are not automatically maintained in the PDF unless you explicitly provide the font data. This is especially important when the original document uses non-standard or custom fonts. The PdfProcessing library requires access to the actual font files to embed them in the PDF. If font data is not provided, the PDF model will substitute the missing fonts with standard ones, resulting in a mismatch between the original document and the exported PDF file.

## Implementing a FontsProviderBase

<snippet id='libraries-pdf-cross-platform-fonts-fontsprovider-implementation'/>

<snippet id='libraries-pdf-cross-platform-fonts-set-fontsprovider'/>
	
## See Also

 * [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%})
 * [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) 
 * [Images]({%slug radpdfprocessing-cross-platform-images%})
 * [Inserting Special Symbols in PDF using RadPdfProcessing]({%slug inserting-special-symbols-pdf-radpdfprocessing%})
 * [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%})
 * [Resolving Missing Content in Exported PDF Files]({%slug missing-content-word-to-pdf-radwordsprocessing%})
 * [Validating Fonts when Using Telerik Document Processing]({%slug validating-fonts-pdf-document-processing%})
 * [Preserving Original Bold, Italic and Regular Fonts When Exporting PDF Documents Using PdfProcessing  in .NET Standard]({%slug pdfprocessing-prevent-font-conversion-embedding-fonts%})
 * [Resolving Font Differences Between Client and Server-Side PDF generation in Telerik Document Processing]({%slug consistent-pdf-font-formatting%})


