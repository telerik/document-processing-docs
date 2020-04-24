---
title: Cross-Platform Support
page_title: Cross-Platform Support
description: Cross-Platform Support
slug: radwordsprocessing-cross-platform
tags: cross,platform
published: True
position: 2
---

# Cross-Platform Support

**Telerik Document Processing** comes with **.NET Core** & **.NET Standard** support. There is a set of binaries built against the .NET Core & .NET Standard which you can reference in an application.

## Assembly References

In order to use the model of the **RadWordsProcessing** library in your cross-platform project, you need to add references to the following **.Net Standard** assemblies:

* **Telerik.Documents.Core.dll**
* **Telerik.Documents.Flow.dll**
* **Telerik.Zip.dll**

If you need to export documents to PDF format, you will need to refer the following assemblies:
* **Telerik.Documents.Flow.FormatProviders.Pdf.dll**
* **Telerik.Documents.Fixed.dll**

If you need to export to PDF format documents containing images different than **Jpeg** and **Jpeg2000** or **ImageQuality** different than High, you will need to refer the following assembly:
* **Telerik.Documents.ImageUtils.dll**

> Note that for .NET Framework & .NET Core with Windows Compatibility Pack projects, the references contain "Windows" in their names (e.g. **Telerik.Windows.Documents.Core.dll**)
 
## Limitations in .Net Standard

### Additional settings required

Some functionalities require additional settings to be done:
* In order to **export to PDF** format documents containing images different than Jpeg and Jpeg2000 or ImageQuality different than High, the **JpegImageConverter** property inside the **FixedExtensibilityManager** has to be set. For more information check the FixedExtensibilityManager in the [PdfProcessing`s Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}).

## See Also

 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Run]({%slug radwordsprocessing-model-run%})
