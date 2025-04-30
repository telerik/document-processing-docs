---
title: Overview
page_title: Overview
slug: radpdfprocessing-cross-platform
tags: cross,platform
platforms: blazor, core, xamarin, winui, maui
published: True
position: 0
---


# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor**, **UI for Xamarin**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadPdfProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Fixed.dll**
* **Telerik.Zip.dll**

To export images different than Jpeg and Jpeg2000 or ImageQuality different than High you will need to add references to the following **.Net Standard** assembly:

* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>

> Note that for .NET Framework, {{site.dotnetversions}} with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## Fonts and Images

The .NET Framework version of PdfProcessing comes with out-of-the-box functionality to read fonts, convert images, and scale their quality. The .NET Standard specification, however, does not specify APIs to provide such functionalities built in the library.
In order to provide the necessary extensibility mechanisms for working with fonts and images, the .NET Standard version of **RadPdfProcessing** exposes the **FixedExtensibilityManager** class. 
More information, including code samples on how to configure the **FixedExtensibilityManager** is available in the [**Fonts**]({%slug radpdfprocessing-cross-platform-fonts%}) and [**Images**]({%slug radpdfprocessing-cross-platform-images%}) articles respectively.

## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})





