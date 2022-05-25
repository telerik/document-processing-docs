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
The code snippets below show how to create a custom implementation of the **FixedExtensibilityManager** and properly set it. 

## Setting and Exporting Fonts

PdfProcessing needs to have access to the font data so that it can read it and add it to the PDF file. That is why, to allow the library to create and use fonts, you will need to provide an implementation of the FontsProviderBase abstract class and set this implementation to the <u>FontsProvider</u> property of the **FixedExtensibilityManager**.

The code snippets below show how to create a custom <u>FontsProvider</u> implementation and how to set it.

>important If the FontsProvider property is not set, a default font will be used when exporting the document.

#### **[C#] Example 1: Creating custom implementation by inheriting the FontsProviderBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_0}}

        public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
        {
            public override byte[] GetFontData(FontProperties fontProperties)
            {
                string fontFileName = fontProperties.FontFamilyName + ".ttf";
                string fontFolder = Environment.GetFolderPath(Environment.SpecialFolder.Fonts);
                string targetPath = Path.Combine(fontFolder, fontFileName);
    
                DirectoryInfo directory = new DirectoryInfo(fontFolder);
                FileInfo[] fontFiles = directory.GetFiles("*.ttf");
                if (fontFiles.Any(s => s.Name.Equals(fontFileName, StringComparison.InvariantCultureIgnoreCase)))
                {
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

#### **[C#] Example 2: Set the custom implementation inheriting the FontsProviderBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_1}}

        Telerik.Windows.Documents.Extensibility.FontsProviderBase fontsProvider = new FontsProvider();
        Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.FontsProvider = fontsProvider;
    {{endregion}}
	
