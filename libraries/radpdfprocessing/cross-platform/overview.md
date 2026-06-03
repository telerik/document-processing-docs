---
title: Overview
description: Learn how to use Telerik RadPdfProcessing for cross-platform PDF generation, editing, and digital signing in .NET applications.
page_title: Overview
slug: radpdfprocessing-cross-platform
tags: crossplatform, pdf, blazor, maui, nuget, dotnet, radpdfprocessing, standard
platforms: blazor, core, winui, maui
published: True
position: 0
---

# Cross-Platform Support

The [Telerik Document Processing]({%slug introduction%}) libraries are compatible across different .NET implementations, including .NET Standard, {{site.dotnetversions}} (Target OS: *None*), and later versions. A set of packages built against the .NET Standard version is available for you to reference in an application.

>note The binaries compatible with .NET Standard, {{site.dotnetversions}} (Target OS: *None*) are distributed with the packages targeting .NET Standard. You can get the packages through the **UI for ASP.NET Core**, **UI for Blazor**, and **UI for WinUI** suites. NuGet packages are also available if you have a license for one of the suites listed.

## Package References

To use the model of the `RadPdfProcessing` library in your cross-platform project, add references to the following .NET Standard NuGet packages:

* **Telerik.Documents.Core**
* **Telerik.Documents.Fixed**

>note Starting with [Q2 2025](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history/progress-telerik-document-processing-2025-2-520-changelog), the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing libraries (PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing). It will be replaced by `System.IO.Compression`. The Telerik Zip Library will continue to ship as a standalone library so you can still use it separately.

To export images other than JPEG and JPEG2000, or to use `ImageQuality` other than High, add a reference to the following .NET Standard package:

* **Telerik.Documents.ImageUtils**

>note For .NET Framework and {{site.dotnetversions}} with Windows Compatibility Pack projects, the references contain "Windows" in their names (for example, **Telerik.Windows.Documents.Core**).

## Fonts and Images

The .NET Framework and .NET (Target OS: *Windows*) versions of PdfProcessing come with built-in functionality to read fonts, convert images, and scale their quality. The .NET Standard specification, however, does not define APIs that provide such functionality within the library.

To provide the necessary extensibility mechanisms for working with fonts and images, the .NET Standard version of `RadPdfProcessing` exposes the `FixedExtensibilityManager` class. For more information, including code samples on how to configure `FixedExtensibilityManager`, see the [Fonts]({%slug radpdfprocessing-cross-platform-fonts%}) and [Images]({%slug radpdfprocessing-cross-platform-images%}) articles.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [TextFragment]({%slug radpdfprocessing-model-textfragment%})
* [What Versions of Document Processing Libraries Are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})
* [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Images]({%slug radpdfprocessing-cross-platform-images%})

