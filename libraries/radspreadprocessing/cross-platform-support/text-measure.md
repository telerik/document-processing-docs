---
title: Text Measuring
page_title: Text Measuring
description: Read the topic to get a better understanding of how you can control the way the text is measured when exporting spreadsheets to PDF using SpreadProcessing for .NET Standard.
slug: radspreadprocessing-cross-platform-text-measure
tags: cross,platform,text, pdf,spreadsheet, measure
platforms: blazor, core, xamarin, winui, maui
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
- [SkiaTextMeasurer](#skiatextmeasurer): A cross-platform text measurer that supports advanced font features like kerning, ligatures, and contextual shaping.
- [Custom implementation](#custom-text-measurer): Implementing the abstract SpreadTextMeasurerBase class enables you to provide your own implementation for text measuring.

## SimpleTextMeasurer

This is the measurer used by default when exporting to PDF.

The width of the columns in Excel is stored as a character count calculated based on the maximum width of the digits from 0 to 9 with the Normal Style of the document applied to them. SimpleTextMeasurer uses the measured width of the digits for a predefined set of font families to calculate the column width based on the length of the text multiplied by the calculated character size. 

* **TextMeasurer**: Gets or sets a *SpreadTextMeasurerBase* instance used to provide text measuring. The TextMeasurer has a *SimpleTextMeasurer* as a default value.

> The SimpleTextMeasurer provides basic functionality for text measuring and the results might not be satisfying in each case. For better results, use [SpreadFixedTextMeasurer](#spreadfixedtextmeasurer).

## SpreadFixedTextMeasurer

This implementation uses PdfProcessing to obtain the size of the text and provides great precision. You need to explicitly set it to the **TextMeasurer** property of **SpreadExtensibilityManager**.

>note Due to the [Font Limitations]({%slug radpdfprocessing-cross-platform-fonts%}) of the [PdfProcessing]({%slug radpdfprocessing-overview%}) library in .NET Standard, you should provide a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) as well.

>important To use the **SpreadFixedTextMeasurer** class, you must add a reference to **Telerik.Documents.Fixed.dll**.

#### [C#] Example 1: Set the SpreadFixedTextMeasurer as a text measurer

{{region cs-radspreadprocessing-cross-platform_1}}

    SpreadTextMeasurerBase fixedTextMeasurer = new SpreadFixedTextMeasurer();
    SpreadExtensibilityManager.TextMeasurer = fixedTextMeasurer;
{{endregion}}

## SkiaTextMeasurer

The SkiaTextMeasurer is a cross-platform text measurer that provides consistent text layout behavior across all supported platforms. Unlike other available measurer implementations, it also supports advanced font features like kerning, ligatures, contextual shaping, and more. This implementation reduces the need for maintaining multiple text measurement implementations across different platforms.

### Required References

To use the **SkiaTextMeasurer** class, you can reference it in one of the following ways:

**Using NuGet Packages (Recommended)**

- **Telerik.Documents.TextMeasurer.Skia** - This package automatically includes all required dependencies

**Using Assembly References**

If you prefer to reference assemblies directly, you need:

- **Telerik.Documents.TextMeasurer.Skia.dll** - Main assembly containing the SkiaTextMeasurer class
- **Telerik.Text.Skia.dll** - Required dependency of Telerik.Documents.TextMeasurer.Skia.
- **SkiaSharp.HarfBuzz.dll** (and all of its dependencies) - Required dependency of Telerik.Text.Skia.dll, along with all its dependencies

#### [C#] Example 2: Set the SkiaTextMeasurer as a text measurer

<snippet id='libraries-spread-crossplatform-textmeasuring-setskiatextmeasurer'/>

## Custom Text Measurer

You can assign any **SpreadTextMeasurerBase** implementation to the **SpreadExtensibilityManager.TextMeasurer** property. All you should do is to inherit the abstract **SpreadTextMeasurerBase**, implement the required members and set the new implementation to the TextMeasurer property.

#### **[C#] Example 3: Create a custom implementation inheriting the SpreadTextMeasurerBase abstract class**

{{region cs-radspreadprocessing-custommeasurer}}

    public class CustomTextMeasurer : SpreadTextMeasurerBase 
    { 
        private static readonly double ratioX = 1.035; 
        private static readonly double ratioY = 1; 
        private static readonly double ratioBaseline = 1; 
     
        private readonly SpreadTextMeasurerBase originalMeasurer; 
     
        public CustomTextMeasurer(SpreadTextMeasurerBase originalMeasurer) 
        { 
            this.originalMeasurer = originalMeasurer; 
        } 
     
        public override TextMeasurementInfo MeasureText(TextProperties textProperties, FontProperties fontProperties) 
        { 
            TextMeasurementInfo info = originalMeasurer.MeasureText(textProperties, fontProperties); 
     
            Size size = info.Size; 
            return new TextMeasurementInfo() 
            { 
                BaselineOffset = info.BaselineOffset * ratioBaseline, 
                Size = new Size( 
                    size.Width * ratioX, 
                    size.Height * ratioY), 
            }; 
        } 
     
        public override TextMeasurementInfo MeasureTextWithWrapping(TextProperties textProperties, FontProperties fontProperties, double wrappingWidth) 
        { 
            TextMeasurementInfo info = originalMeasurer.MeasureText(textProperties, fontProperties); 
     
            Size size = info.Size; 
            return new TextMeasurementInfo() 
            { 
                BaselineOffset = info.BaselineOffset * ratioBaseline, 
                Size = new Size( 
                    size.Width * ratioX, 
                    size.Height * ratioY), 
            }; 
        } 
    } 
{{endregion}}


#### **[C#] Example 4: Set the custom implementation as a text measurer**

{{region cs-radspreadprocessing-custommeasurer2}}

    SpreadTextMeasurerBase customTextMeasurer = new CustomTextMeasurer(); 
    SpreadExtensibilityManager.TextMeasurer = customTextMeasurer; 
{{endregion}}


## See Also
 * [How to Eliminate Formatting Issues when Exporting XLSX to PDF Format]({%slug exporting-xlsx-to-pdf-formatting-issues%})
 * [Cross-Platform Support]({%slug radspreadprocessing-cross-platform%})
 * [Using XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})
 * [Using PdfFormatProvider]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%})
 * [PdfProcessing Library Documentation]({%slug radpdfprocessing-overview%})
 * [How to Measure Text in WordsProcessing .NET Framework]({%slug wordsprocessing-measure-text-netframework%})
 * [How to Measure Text in WordsProcessing .NET Standard]({%slug wordsprocessing-measure-text-netstandard%})
