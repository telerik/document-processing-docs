---
title: How to Eliminate Formatting Issues when Exporting XLSX to PDF Format
description: This article provides a solution to formatting difficulties when exporting an XLSX file to PDF using the RadSpreadProcessing library.
type: troubleshooting
page_title: How to Eliminate Formatting Issues when Exporting XLSX to PDF Format
slug: exporting-xlsx-to-pdf-formatting-issues
tags: excel, pdf, font, width, column, standard
res_type: kb
---

##Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| .NET Standard | RadSpreadProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
This article demonstrates how to deal with formatting difficulties when exporting an XLSX file to PDF using the RadSpreadProcessing library in .NET Standard. 

The most common scenario is:
1. Export an XLSX file to PDF using the RadSpreadProcessing library.
2. Observe the resulting PDF file with truncated columns or different font.

## Solution
The limitations of .NET Standard may cause differences in font and text size (text measuring) when converting to PDF format.

1.To address the issue with the size discrepancy, set a `SpreadFixedTextMeasurer` to handle the problem with the size:
```csharp
SpreadTextMeasurerBase fixedTextMeasurer = new SpreadFixedTextMeasurer();
SpreadExtensibilityManager.TextMeasurer = fixedTextMeasurer;
```

2. Implement a `FontsProvider` to handle differences in fonts. This class provides a mechanism to read the fonts used in the document:
```csharp
public class FontsProvider : Telerik.Windows.Documents.Extensibility.FontsProviderBase
{
    public override byte[] GetFontData(Telerik.Windows.Documents.Core.Fonts.FontProperties fontProperties)
    {
        //...implementation details...
    }
}
```

3. Update the `FontsProvider` implementation to include the necessary fonts and their corresponding font files.

Please refer to the attached sample project for a complete implementation. Test the solution on your end to verify if it resolves the formatting issue.

## Notes
It is important to note that the limitations of .NET Standard may still result in slight differences in font and text size when converting to PDF format.

## See Also
- [RadSpreadProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radspreadprocessing/overview)
- [Troubleshooting Exporting XLSX to PDF in RadSpreadProcessing](https://www.telerik.com/support/kb/document-processing/details/exporting-xlsx-to-pdf-formatting-issues)
