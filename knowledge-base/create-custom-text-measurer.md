---
title: Create Custom Text Measurer
description: How to Create Custom Text Measurer
type: how-to
page_title: Create Custom Text Measurer
slug: create-custom-text-measurer
position: 0
tags: spreadsheet, custom, text, measurer
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

How to create a custom [TextMeasurer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.core.textmeasurer).

## Solution

In the example below, we are demonstrating how to create a custom [TextMeasurer](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.core.textmeasurer) inheriting the _SpreadTextMeasurerBase_ abstract class and set it to the _TextMeasurer_ property of the _SpreadExtensibilityManager_.

#### __[C#] Creating a CustomTextMeasurer__

{{region kb-create-custom-text-measurer1}}

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
