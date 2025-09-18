---
title: Overview
description: Learn how to use Telerik RadPdfProcessing for cross-platform PDF generation, editing, and digital signing in .NET applications.
page_title: Overview
slug: radpdfprocessing-cross-platform
tags: cross, platform, font, image, blazor, core, xamarin, winui, maui, net, standard, linux, ios 
platforms: blazor, core, xamarin, winui, maui
published: True
position: 0
---

# Cross-Platform Support

The [Telerik Document Processing]({%slug introduction%}) libraries are compatible across different .NET implementations, including .NET Standard, {{site.dotnetversions}} (Target OS: *None*), and newer versions. There is a set of binaries built against the .NET Standard version which you can reference in an application.

>note The binaries compatible with .NET Standard, {{site.dotnetversions}} (Target OS: *None*) are distributed with the packages targeting .NET Standard. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor**, **UI for Xamarin**, and **UI for WinUI** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadPdfProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies/ NuGet packages:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Fixed.dll**
* ~~Telerik.Zip.dll~~*

>note As of [Q2 2025](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history/progress-telerik-document-processing-2025-2-520-changelog) the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

To export images different than Jpeg and Jpeg2000 or ImageQuality different than High you will need to add references to the following **.Net Standard** assembly:

* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>

> Note that for .NET Framework, {{site.dotnetversions}} with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)

## Fonts and Images

The .NET Framework and .NET (Target OS: *Windows*) versions of PdfProcessing comes with out-of-the-box functionality to read fonts, convert images, and scale their quality. The .NET Standard specification, however, does not specify APIs to provide such functionalities built in the library.
In order to provide the necessary extensibility mechanisms for working with fonts and images, the .NET Standard version of **RadPdfProcessing** exposes the **FixedExtensibilityManager** class. 
More information, including code samples on how to configure the **FixedExtensibilityManager** is available in the [**Fonts**]({%slug radpdfprocessing-cross-platform-fonts%}) and [**Images**]({%slug radpdfprocessing-cross-platform-images%}) articles respectively.

## See Also

 * [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})
 * [What Versions of Document Processing Libraries are Distributed with the Telerik Products](%slug distribute-telerik-document-processing-libraries-net-versions%)
 * [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
 * [Images]({%slug radpdfprocessing-cross-platform-images%})




