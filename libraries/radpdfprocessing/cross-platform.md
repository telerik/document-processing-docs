---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radpdfprocessing-cross-platform
tags: cross,platform
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.
* [Assembly References](#assembly-references)

* [What's New](#whats-new)

* [Limitations in .Net Standard](#limitations-in-net-standard)

## Assembly References

In order to use the model of the **RadPdfProcessing** library in your Cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Documents.Fixed.dll**

> Please note that for .NET Framework & .NET Core compatibility pack projects, the references contain "Windows" in their assembly names (e.g. **Telerik.Windows.Documents.Core.dll**)

## What's New

### New APIs

The [Limitations in .Net Standard](#limitations-in-net-standard) require some additional settings to be done, therefore, the **RadPdfProcessing** library exposes a FixedExtensibilityManager class used for providing extensibility mechanisms.

#### FixedExtensibilityManager class

The new **FixedExtensibilityManager** class is exposing one property:

* **FontsProvider**: Gets or sets a *FontsProviderBase* instance used to provide missing fonts.

    > .NET Standard specification does not define APIs for getting specific fonts. Thus, in order to create them a custom implementation inheriting the FontsProviderBase abstract class have to be set to the FontsProvider property inside the FixedExtensibilityManager. Please, keep in mind if there is no custom implementation set a fallback to a default Font will be applied.

    **Example 1** shows how you can create a custom implementation inheriting the FontsProviderBase abstract class in Windows environment.

    #### **[C#] Example 1: Windows Example: Creating custom implementation inheriting the FontsProviderBase abstract class**
    {{region cs-radpdfprocessing-cross-platform_0}}

        public class FontsProvider : FontsProviderBase
        {
            public override byte[] GetFontData(FontProperties fontProperties)
            {
                if (fontProperties.FontFamilyName == "Arial")
                {
                    using (FileStream fileStream = File.OpenRead("arial.tff"))
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

    **Example 2** shows how to set the custom implementation inheriting the FontsProviderBase abstract class to the FontsProvider property of the FixedExtensibilityManager and register a new Font to the FontsRepository dictionary.

    #### **[C#] Example 2: Set the custom implementation inheriting the FontsProviderBase abstract class and register a new Font to the FontsRepository dictionary**
    {{region cs-radpdfprocessing-cross-platform_1}}

        FontsProviderBase fontsProvider = new FontsProvider();
        FixedExtensibilityManager.FontsProvider = fontsProvider;

        FontFamily fontFamily = new FontFamily("Arial");
        FontsRepository.RegisterFont(fontFamily, new FontStyle(), new FontWeight(), fontsProvider.GetFontData(new FontProperties(fontFamily)));
    {{endregion}}


## Limitations in .Net Standard

#### Additional settings required
Some functionalities require additional settings to be done:
* In order to export specific fonts, the fonts have to be registered in the FontsRepository dictionary and a custom implementation inheriting the FontsProviderBase abstract class have to be set to the FontsProvider property inside the FixedExtensibilityManager.

#### Currently not supported
Referencing .Net Standard binaries you can add SignatureField but can not sign or import signed documents.

## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
 * [PDF Format]({%slug radpdfprocessing-formats-and-conversion-pdf-pdf%})
