---
title: Create Custom Text Measurer in .NET Standard
description: How to implement custom text measuring functionality in SpreadProcessing for .NET Standard.
type: how-to
page_title: Create Custom Text Measurer .NET Standard
slug: create-custom-text-measurer-net-standard
position: 0
tags: spreadsheet, custom, text, measurer, netstandard
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.1.212</td>
		<td>RadSpreadProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

Due to **.NET Standard** APIs limitations, the _SimpleTextMeasurer_ provides basic functionality for text measuring and it is not expected to be an all-purpose measurer. So in order to measure the specific text in a more precise way, you will need to create a custom implementation of a text measure and set it to the _TextMeasurer_ property of the _SpreadExtensibilityManager_.

## Solution

In the example below, we are demonstrating how to create a custom [TextMeasurer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.core.textmeasurer) inheriting the _SpreadTextMeasurerBase_ abstract class and set it to the _TextMeasurer_ property of the _SpreadExtensibilityManager_.

#### __Creating a CustomTextMeasurer__

```csharp

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
```

The following example shows how to set the custom implementation inheriting the SpreadTextMeasurerBase abstract class to the TextMeasurer property of the SpreadExtensibilityManager.

#### __Setting the CustomTextMeasurer__

```csharp

    SpreadTextMeasurerBase customTextMeasurer = new CustomTextMeasurer(SpreadExtensibilityManager.TextMeasurer); 
    SpreadExtensibilityManager.TextMeasurer = customTextMeasurer; 
```

## See Also
 * [How to Measure Text in WordsProcessing .NET Framework]({%slug wordsprocessing-measure-text-netframework%})
 * [How to Measure Text in WordsProcessing .NET Standard]({%slug wordsprocessing-measure-text-netstandard%})