---
title: Fonts
page_title: Fonts
slug: radpdfprocessing-cross-platform-fonts
tags: cross,platform
platforms: blazor, core, xamarin, winui, maui
published: True
position: 1
---

# Fonts

Unlike the .NET Framework one, RadPdfProcessing’s .NET Standard version does not offer a default mechanism to read fonts. The **FixedExtensibilityManager** class is exposed to help implement this functionality.

## Setting and Exporting Fonts

PdfProcessing needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the **FontsProviderBase** abstract class and set this implementation to the <u>FontsProvider</u> property of the **FixedExtensibilityManager**.

You can find a detailed **FixedExtensibilityManager** and **FontsProvider** descripiton and implementaion in the [How to implement a FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) article. 

>important If the FontsProvider property is not set, a default font will be used when exporting the document.
	
## See Also

 * [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%})
 * [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%})
 * [Inserting Special Symbols in PDF using RadPdfProcessing]({%slug inserting-special-symbols-pdf-radpdfprocessing%})
 * [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%})

