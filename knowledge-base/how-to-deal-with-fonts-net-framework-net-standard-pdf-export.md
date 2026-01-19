---
title: How to Deal with Fonts in .NET Framework and .NET Standard when Exporting to PDF Format using Telerik Document Processing
description: Learn how to ensure correct font styles are exported to PDF format using Telerik Document Processing Libraries.
type: how-to
page_title: How to Deal with Fonts in .NET Framework and .NET Standard when Exporting to PDF Format using Telerik Document Processing
meta_title: How to Deal with Fonts in .NET Framework and .NET Standard when Exporting to PDF Format using Telerik Document Processing
slug: how-to-deal-with-fonts-net-framework-net-standard-pdf-export
tags: pdf,telerik, document, processing,font style,export,fontsprovider, provider
res_type: kb
ticketid: 1707405
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

When exporting  a document (DOCX, XLSX, HTML) to **PDF** format with Telerik Document Processing Libraries in .NET Standard (or .NET with Target OS: None), it requires some extra implementation to preserve the font, font family, font style (like **bold**, *italic*), etc. 

## Solution

There are differences between handling fonts in .NET Framework (or .NET target OS Windows) and .NET Standard  (or .NET target OS None): 

- .NET Framework (Windows‑only): Has access to Windows font stacks and APIs (GDI/GDI+, system font folders like C:\Windows\Fonts). Telerik’s Windows-targeted build can rely on those mechanisms to resolve fonts without extra code. Most fonts “just work” and are embedded or referenced as needed.

- .NET Standard / .NET (Target OS: None): Designed to be OS‑agnostic—it intentionally does not define APIs to get specific fonts. Because the runtime might be Linux, macOS, or sandboxed, the library cannot automatically read system fonts. You must provide font data explicitly by [implementing a FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) or registering fonts yourself; otherwise RadPdfProcessing falls back to one of the [14 standard PDF fonts]({%slug radpdfprocessing-concepts-fonts%}) (Helvetica, Times, Courier, etc.).

The following code snippet shows a custom FontsProvider to supply Arial font files for PDF export:

* arial.ttf for regular

* arialbd.ttf for bold

* ariali.ttf for italic

* arialbi.ttf for bold italic

```csharp
        public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
        {
            public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
            {
                string fontFileName = fontProperties.FontFamilyName + ".ttf";
                string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);

                //The fonts can differ depending on the file 
                if (fontProperties.FontFamilyName == "Arial")
                {
                    if (fontProperties.FontStyle == FontStyles.Italic &&
                 fontProperties.FontWeight == FontWeights.Bold)
                    {
                        fontFileName = "arialbi.ttf"; // Bold Italic
                    }
                    else if (fontProperties.FontStyle == FontStyles.Italic)
                    {
                        fontFileName = "ariali.ttf";  // Italic
                    }
                    else if (fontProperties.FontWeight == FontWeights.Bold)
                    {
                        fontFileName = "arialbd.ttf"; // Bold
                    }
                    else
                    {
                        fontFileName = "arial.ttf";   // Regular
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
Please verify that all four font files (.ttf) are present in the specified directory or adjust the `fontFolder` accordingly. If the font files are not available in that folder, the exported font style in the PDF document wouldn't be properly resolved. Usually, for Windows machines, the Arial font files are available in Environment.GetFolderPath(Environment.SpecialFolder.Fonts). 

## See Also

- [PDF Fonts - Cross-Platform Support]({%slug radpdfprocessing-cross-platform-fonts%})
- [How to implement FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) 
