---
title: Adjusting Widgets' Font Size to Fit the Whole Content in Form Fields Using PdfProcessing
description: Learn how to adjust font size for text fields, flatten form fields, and handle calculations in PDFs using PdfProcessing in Telerik Document Processing.
type: how-to
page_title: Adjust Font Size and Flatten Form Fields in PDFs with PdfProcessing
meta_title: Adjust Font Size and Flatten Form Fields in PDFs with PdfProcessing
slug: auto-font-size-form-fields-pdfprocessing
tags: pdf, processing, textbox, field, flatten, font, size, recalculation, acroform
res_type: kb
ticketid: 1697695
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I need to adjust the font size of textboxes to fit the text content while processing a PDF form. Multiline textboxes help with most fields, but columns with longer text require auto-sizing or manual font size adjustments. Additionally, flattening form fields causes textbox text to disappear unless specific methods are applied. There are challenges with radio buttons and total calculations across different PDF viewers like Google Chrome and Adobe Acrobat. The goal is to find solutions for consistent text display, radio button functionality, and handling totals.

This knowledge base article also answers the following questions:
- How to auto-size text in PDF textboxes using PdfProcessing?
- How to ensure radio buttons display correctly in PDFs across viewers?
- How to manually calculate totals in PDF forms when using PdfProcessing?

## Solution

### Adjusting Font Size for Textboxes

To auto-size text in textboxes, set the `TextBoxField.TextProperties.FontSize` property to `0`. This enables the font size to adjust automatically to fit the content.

```csharp
TextBoxField textBoxField = new TextBoxField("AutoSizeTextBox");
textBoxField.TextProperties.FontSize = 0; // Auto-size
textBoxField.TextProperties.Font = FontsRepository.HelveticaBold;
textBoxField.Value = "Sample text for auto-sizing.";
```

Alternatively, calculate the font size manually to fit the content using the following approach:

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
TextBoxField field = new TextBoxField("CalculatedFontSizeField");
field.TextProperties.FontSize = CalculateFontSizeForRectangle("Long text content", new Rect(200, 200, 400, 60), FontsRepository.HelveticaBold);
field.TextProperties.Font = FontsRepository.HelveticaBold;
field.Value = "Long text content";
```

### Flattening Form Fields

Flattening form fields ensures consistent appearance across PDF viewers. Use the `FlattenFormField` method for individual fields or `FlattenFormFields` for all fields.

```csharp
document.AcroForm.FlattenFormFields();
```

To ensure textbox values are visible after flattening, call the `RecalculateContent` method for each widget:

```csharp
foreach (var widget in textBoxField.Widgets)
{
    widget.RecalculateContent();
}
```

### Handling Radio Button Display

For consistent radio button display across viewers, flatten radio buttons after selection. Use the following approach:

```csharp
document.AcroForm.FlattenFormField(radioButtonField);
```

### Calculating Totals

PdfProcessing does not support automatic calculations for totals triggered by JavaScript or embedded actions. Manually calculate totals in your application and update the corresponding fields via code:

```csharp
TextBoxField totalsField = new TextBoxField("TotalsField");
totalsField.Value = calculatedTotal.ToString();
document.AcroForm.FormFields.Add(totalsField);
```

## See Also

- [PdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Flatten Form Fields](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/features/flatten-form-fields)
- [Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/knowledge-base/multiply-form-field-with-javascript-action-radpdfprocessing)
- [JavaScript Actions in PDFs](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/actions/js-actions/javascript-actions)
