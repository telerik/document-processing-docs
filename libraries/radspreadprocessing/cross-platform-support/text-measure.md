---
title: Text Measuring
page_title: Text Measuring
description: Read the topic to get a better understanding of how you can control the way the text is measured when exporting spreadsheets to PDF using SpreadProcessing for .NET Standard.
slug: radspreadprocessing-cross-platform-text-measure
tags: cross,platform,text, pdf,spreadsheet, measure
platforms: core, blazor, xamarin, wuinui
published: True
position: 1
---

# Text Measuring

SpreadProcessing provides a built-in functionality and an extensibility point for text measuring to overcome the limitation of .NET Standard. Since the platform is intended to work on different devices, it doesn't expose text measuring API and SpreadProcessing must have its own one to find out the letters and words size when exporting to PDF.

This topic describes the default and the extended implementations used to measure text while exporting to PDF.

## Using a Text Measurer

The **SpreadExtensibilityManager** static class exposes the **TextMeasurer** property. This property defines the specific implementation that is used to measure the text content when needed. You can use the following values for this property:

- [SimpleTextMeasurer](#simpletextmeasurer): This is the default value.
- [SpreadFixedTextMeasurer](#spreadfixedtextmeasurer): An additional implementation that provides more accurate results than the SimpleTextMeasurer.
- [Custom implementation](#custom-text-measurer): Implementing the abstract SpreadTextMeasurerBase class enables you to provide your own implementation for text measuring.

## SimpleTextMeasurer

This is the measurer used by default when exporting to PDF.

The width of the columns in Excel is stored as a character count calculated based on the maximum width of the digits from 0 to 9 with the Normal Style of the document applied to them. SimpleTextMeasurer uses the measured width of the digits for a predefined set of font families to calculate the column width based on the length of the text multiplied by the calculated character size. 

* **TextMeasurer**: Gets or sets a *SpreadTextMeasurerBase* instance used to provide text measuring. The TextMeasurer has a *SimpleTextMeasurer* as a default value.

> The SimpleTextMeasurer provides basic functionality for text measuring and the results might not be satisfying in each case. For better results, use [SpreadFixedTextMeasurer](#spreadfixedtextmeasurer).

## SpreadFixedTextMeasurer

This implementation uses PdfProcessing to obtain the size of the text and provides great precision. You need to explicitly set it to the **TextMeasurer** property of **SpreadExtensibilityManager**.

>To use this class, you must add a reference to **Telerik.Documents.Fixed.dll**.

#### [C#] Example 1: Set custom implementation inheriting the SpreadTextMeasurerBase abstract class

{{region cs-radspreadprocessing-cross-platform_2}}

    SpreadTextMeasurerBase fixedTextMeasurer = new SpreadFixedTextMeasurer();
    SpreadExtensibilityManager.TextMeasurer = fixedTextMeasurer;
{{endregion}}

## Custom Text Measurer

You can assign any **SpreadTextMeasurerBase** implementation to the **SpreadExtensibilityManager.TextMeasurer** property. All you should do is to inherit the abstract **SpreadTextMeasurerBase**, implement the required members and set the new implementation to the TextMeasurer property.

#### **[C#] Example 2: Set custom implementation inheriting the SpreadTextMeasurerBase abstract class**
{{region cs-radspreadprocessing-cross-platform_2}}

    SpreadTextMeasurerBase customTextMeasurer = new TextInfo();
    SpreadExtensibilityManager.TextMeasurer = customTextMeasurer;
{{endregion}}

## See Also

 * [Cross-Platform Support]({%slug radspreadprocessing-cross-platform%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
 * [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
 * [PdfProcessing Library Documentation]({%slug radpdfprocessing-overview%})