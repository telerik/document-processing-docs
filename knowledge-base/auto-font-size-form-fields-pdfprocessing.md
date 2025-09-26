---
title: Adjust Font Size and Flatten Form Fields in PDFs with PdfProcessing
description: Learn how to calculate and adjust the font size of text fields when flattening form fields of a PDF document with PdfProcessing.
type: how-to
page_title: Adjust Font Size and Flatten Form Fields in PDFs with PdfProcessing
meta_title: Adjust Font Size and Flatten Form Fields in PDFs with PdfProcessing
slug: auto-font-size-form-fields-pdfprocessing
tags: pdf, processing, text, box, field, flatten, font, size, recalculation, acroform, fixed, calculate, auto, fit
res_type: kb
ticketid: 1697695
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to adjust the font size of textbox fields to fit the whole text content while processing a PDF form.

![Adjust TextBox Font Size ><](images/textboxfield-calculculate-font-size.gif)   

## Solution

To auto-size text in [TextBoxFields]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}), set the `TextBoxField.TextProperties.FontSize` property to `0`. This enables the font size to adjust automatically to fit the content when the document is **displayed** in a viewer. 

```csharp
TextBoxField textBoxField = new TextBoxField("AutoSizeTextBox");
textBoxField.TextProperties.FontSize = 0; // Auto-size when displayed in a PDF viewer
textBoxField.TextProperties.Font = FontsRepository.HelveticaBold;
textBoxField.Value = "Sample text for auto-sizing.";
```

However, if you want to adjust the font size and flatten the [form fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) to produce a non-editable PDF document, it would be necessary to calculate the appropriate font size according to the rectangle occupied by the [widget]({%slug radpdfprocessing-model-annotations-widgets%}).

The following code snippet shows how to calculate the font size manually to fit the content using the following approach:

```csharp
public static double CalculateFontSizeForRectangle(string text, Rect rect, FontBase font)
{
    double fontSize = 0;
    Size measuredSize = new Size(0, 0);
    Size availableSize = rect.Size;

    while (measuredSize.Width < availableSize.Width && measuredSize.Height < availableSize.Height)
    {
        fontSize++;
        Block block = new Block();
        block.TextProperties.FontSize = fontSize;
        block.TextProperties.Font = font;
        block.InsertText(text);
        measuredSize = block.Measure();
    }

    return fontSize - 1;
}
```

Use this calculated font size to create the textbox field:

```csharp
        static void Main(string[] args)
        {
            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage(); 
            FontBase font = FontsRepository.Helvetica;
            string wideText = "This is a wide textbox that demonstrates horizontal fitting of text content.";
            Rect wideRect = new Rect(200, 500, 400, 30);
            double wideFontSize = CalculateFontSizeForRectangle(wideText, wideRect, font);

            TextBoxField wideTextBoxField = CreateTextBoxWithCalculatedFont("WideTextBox", wideText, wideRect, wideFontSize, font);
            document.AcroForm.FormFields.Add(wideTextBoxField);
            var wideWidget = wideTextBoxField.Widgets.First();
            page.Annotations.Add(wideWidget);
            wideWidget.RecalculateContent();
            string outputPath = "AutoSizeTextBoxForm.pdf";
            using (FileStream output = File.Create(outputPath))
            {
                PdfFormatProvider provider = new PdfFormatProvider();
                provider.Export(document, output, TimeSpan.FromSeconds(10));
            }

            Process.Start(new ProcessStartInfo() { FileName = outputPath, UseShellExecute = true });
          
        }

        /// <summary>
        /// Creates a TextBoxField with calculated font size for the given rectangle
        /// </summary>
        private static TextBoxField CreateTextBoxWithCalculatedFont(string name, string text, Rect rect, double fontSize, FontBase font)
        {
            TextBoxField field = new TextBoxField(name);
       
            field.TextProperties.FontSize = Unit.DipToPoint(fontSize);
            field.TextProperties.Font = font;
            field.Value = text;

            var widget = field.Widgets.AddWidget();
            widget.Rect = rect;
            widget.Border.Width = 0;
            widget.TextProperties.FontSize = Unit.DipToPoint(fontSize); ;
            widget.TextProperties.Font = font;

            return field;
        }

        /// <summary>
        /// Calculates the optimal font size for text to fit within a specific rectangle
        /// </summary>
        public static double CalculateFontSizeForRectangle(string text, Rect rect, FontBase font)
        {
            double fontSize = 0;
            Size measuredSize = new Size(0, 0);
            Size availableSize = rect.Size;
            while (measuredSize.Width<availableSize.Width && measuredSize.Height< availableSize.Height)
            {
                fontSize++;
                Block block = new Block();
                block.TextProperties.FontSize = fontSize;
                block.TextProperties.Font = font;
                block.InsertText(text);
                measuredSize = block.Measure();
            }

            return fontSize-1;
        }
```
 

## See Also

- [PdfProcessing Overview]({%slug radpdfprocessing-overview%})
- [Flatten Form Fields]({%slug radpdfprocessing-flatten-form-fields%})
- [TextBoxFields]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%})
- [Widget]({%slug radpdfprocessing-model-annotations-widgets%})
