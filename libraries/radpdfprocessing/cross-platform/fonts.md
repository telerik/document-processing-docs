---
title: Fonts
description: Learn how to manage and embed fonts in PDF documents using Telerik RadPdfProcessing for cross-platform .NET applications.
page_title: Fonts
slug: radpdfprocessing-cross-platform-fonts
tags: fonts, crossplatform, pdf, embedding, provider, radpdfprocessing, dotnet, standard
platforms: blazor, core, winui, maui
published: True
position: 1
---

# Fonts

RadPdfProcessing automatically discovers installed system fonts in cross-platform **.NET Standard** and **.NET (Target OS: *None*)** applications. The `FixedExtensibilityManager` class also lets you provide font data explicitly when your application needs fonts that are not installed on the host system.

## Setting and Exporting Fonts

RadPdfProcessing loads font data when it creates text and exports a PDF. On cross-platform targets, the first access to `FixedExtensibilityManager.FontsProvider` automatically activates the system-font provider. You do not need to register a provider for fonts that are installed in a supported system font directory.

The system-font provider searches the following locations. The provider scans directories recursively and uses supported `.ttf`, `.otf`, and `.ttc` files that it can access and parse.

| Platform | Default font locations |
|---|---|
| Windows | The Windows `Fonts` directory and the current user's `Microsoft\Windows\Fonts` directory. |
| Linux | `/usr/share/fonts`, `/usr/local/share/fonts`, `/var/lib/flatpak/exports/share/fonts`, the user's `~/.fonts` directory, and the user's `~/.local/share/fonts` directory. |
| macOS | `/System/Library/Fonts`, `/Library/Fonts`, and the current user's `~/Library/Fonts` directory. |
| iOS | `/System/Library/Fonts` and `/Library/Fonts`. |
| Android | `/system/fonts`, `/system/product/fonts`, and `/product/fonts`. |

The provider builds its font index lazily. If a directory does not exist, a font file is inaccessible, a file is larger than 50 MB, or a font file is corrupted or unsupported, the provider skips that item. The provider returns no data for a font family that is not found, so the resulting document can use font substitution according to the PDF and application settings.

When you assign a custom provider to `FixedExtensibilityManager.FontsProvider`, the custom provider takes precedence. Use a custom provider when you need to:

* Bundle fonts with your application instead of relying on fonts installed on the host system.
* Use fonts stored in an application-specific location or another data source.
* Control font resolution for repeatable output across machines, containers, or mobile devices.

You can find a detailed `FixedExtensibilityManager` and `FontsProvider` implementation in the [How to implement a FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) article.

>important When converting a document (for example, DOCX or HTML) to PDF format, the system-font provider can resolve a font only when the matching font is installed in a directory that the provider searches. Fonts embedded in the source document, fonts stored in another application location, and custom fonts that are not installed require a custom provider that returns the font data. If the requested font cannot be resolved, the PDF model can substitute another font, which may change the document's appearance or text layout.

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
* [Preserving Original Bold, Italic and Regular Fonts When Exporting PDF Documents Using PdfProcessing in .NET Standard]({%slug pdfprocessing-prevent-font-conversion-embedding-fonts%})
* [Resolving Font Differences Between Client and Server-Side PDF Generation in Telerik Document Processing]({%slug consistent-pdf-font-formatting%})

