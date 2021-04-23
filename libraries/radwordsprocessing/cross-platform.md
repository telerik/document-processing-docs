---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radwordsprocessing-cross-platform
tags: cross,platform
platforms: netcore, blazor, xamarin
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

>note The binaries compatible with .NET Standard are distributed with the packages targeting .NET Standard and .NET Core. You can obtain the assemblies through the **UI for ASP.NET Core**, **UI for Blazor** and **UI for Xamarin** suites. There are **NuGet** packages as well that you can access if you have a license for one of the above mentioned suites.

## Assembly References

In order to use the model of the **RadWordsProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Flow.dll**
* **Telerik.Zip.dll**

If you need to import DOC files, you will need to refer the following assembly:
* **Telerik.Documents.Flow.FormatProvider.Doc.dll**

If you need to export documents to PDF format, you will need to refer the following assemblies:
* **Telerik.Documents.Flow.FormatProviders.Pdf.dll**
* **Telerik.Documents.Fixed.dll**

If you need to export to PDF format documents containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, you will need to refer the following assembly:
* **Telerik.Documents.ImageUtils.dll**
<br><sub>_This assembly is not available in UI for Xamarin._</sub>

>note The **Telerik.Documents.ImageUtils.dll** assembly depends on **ImageSharp** and **TiffLibrary.ImageSharpAdapter**. In order to use this assembly, you will need to add references to [ImageSharp](https://www.nuget.org/packages/SixLabors.ImageSharp/) and [TiffLibrary.ImageSharpAdapter](https://www.nuget.org/packages/TiffLibrary.ImageSharpAdapter/).

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)
 
## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:
* In order to **export to PDF** format documents containing fonts different than the [Standard Fonts]({%slug radpdfprocessing-concepts-fonts%}), the **FontsProvider** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).
* In order to **export to PDF** format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

## See Also

 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Run]({%slug radwordsprocessing-model-run%})
