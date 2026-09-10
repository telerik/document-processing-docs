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

The [Telerik Document Processing]({%slug introduction%}) libraries are compatible with different .NET implementations, including .NET Standard, {{site.dotnetversions}} (Target OS: *None*), and later versions. For cross-platform scenarios, use the packages that target .NET Standard.

>note The binaries compatible with .NET Standard and {{site.dotnetversions}} (Target OS: *None*) are distributed with the packages that target .NET Standard. You can get them through suites such as **UI for ASP.NET Core**, **UI for Blazor**, **UI for .NET MAUI**, and **UI for WinUI**. NuGet packages are also available if you have a license for one of these suites.

## Package References

To use the model of the `RadPdfProcessing` library in your cross-platform project, add references to the following .NET Standard NuGet packages:

* **Telerik.Documents.Core**
* **Telerik.Documents.Fixed**

>note Starting with [Q2 2025](https://www.telerik.com/support/whats-new/telerik-document-processing/release-history/progress-telerik-document-processing-2025-2-520-changelog), the Zip Library is no longer used as an internal dependency in the Document Processing libraries. `System.IO.Compression` replaces it internally. The Telerik Zip Library continues to ship as a standalone library for separate use.

To export images other than JPEG and JPEG2000, or to use `ImageQuality` other than High, add a reference to the following .NET Standard package:

* **Telerik.Documents.ImageUtils**

>note For .NET Framework and {{site.dotnetversions}} projects that use the Windows Compatibility Pack, the assemblies contain `Windows` in their names. One example is `Telerik.Windows.Documents.Core`.

## Fonts and Images

The .NET Framework and .NET (Target OS: *Windows*) versions of `RadPdfProcessing` include built-in functionality to read fonts, convert images, and scale image quality. On .NET Standard and .NET (Target OS: *None*), the library uses cross-platform extensibility points instead.

`RadPdfProcessing` automatically discovers installed system fonts on cross-platform targets through `FixedExtensibilityManager.FontsProvider`. For images, or when you use `ImageQuality` values other than `High`, add `Telerik.Documents.ImageUtils` and configure `FixedExtensibilityManager` as needed. For more information and code examples, see the [Fonts]({%slug radpdfprocessing-cross-platform-fonts%}) and [Images]({%slug radpdfprocessing-cross-platform-images%}) articles.

## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [TextFragment]({%slug radpdfprocessing-model-textfragment%})
* [What Versions of Document Processing Libraries Are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})
* [Fonts]({%slug radpdfprocessing-cross-platform-fonts%})
* [Images]({%slug radpdfprocessing-cross-platform-images%})
