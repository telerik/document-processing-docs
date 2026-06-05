---
title: Create Custom Text Measurer in .NET Standard
description: Learn how to create a custom text measurer implementation for SpreadProcessing in .NET Standard to measure text with higher precision.
type: how-to
page_title: Create Custom Text Measurer .NET Standard
slug: create-custom-text-measurer-net-standard
position: 0
tags: radspreadprocessing, text, measurer, netstandard, spreadsheet, document, processing, extension
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

Due to **.NET Standard** API limitations, the `SimpleTextMeasurer` provides basic text measuring functionality and is not an all-purpose measurer. To measure specific text with higher precision, create a custom implementation of a text measurer and set it to the `TextMeasurer` property of the `SpreadExtensibilityManager`.

## Solution

The following example shows how to create a custom [`TextMeasurer`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.core.textmeasurer) that inherits the `SpreadTextMeasurerBase` abstract class and set it to the `TextMeasurer` property of the `SpreadExtensibilityManager`.

**Example 1: Create a CustomTextMeasurer**

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

The following example shows how to set the custom implementation inheriting the `SpreadTextMeasurerBase` abstract class to the `TextMeasurer` property of the `SpreadExtensibilityManager`.

**Example 2: Set the CustomTextMeasurer**

```csharp

    SpreadTextMeasurerBase customTextMeasurer = new CustomTextMeasurer(SpreadExtensibilityManager.TextMeasurer); 
    SpreadExtensibilityManager.TextMeasurer = customTextMeasurer; 
```

## See Also

* [How to Measure Text in WordsProcessing .NET Framework]({%slug wordsprocessing-measure-text-netframework%})
* [How to Measure Text in WordsProcessing .NET Standard]({%slug wordsprocessing-measure-text-netstandard%})