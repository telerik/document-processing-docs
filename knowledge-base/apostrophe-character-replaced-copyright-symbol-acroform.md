---
title: Resolving Apostrophe Character Being Replaced with Copyright Symbol in Filled PDF AcroForm
description: Learn how to address the issue where an apostrophe character is replaced by a copyright symbol in a filled PDF AcroForm using RadPdfProcessing for Document Processing.
type: how-to
page_title: Fixing Apostrophe Display Issue in PDF AcroForm Fields
meta_title: Fixing Apostrophe Display Issue in PDF AcroForm Fields
slug: apostrophe-character-replaced-copyright-symbol-acroform
tags: processing, document, pdf, acroform, font, encoding, text, field
res_type: kb
ticketid: 1692742
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.2.520| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to address the issue where a special symbol (e.g. apostrophe character) is replaced by a copyright (or other) symbol in a filled PDF AcroForm using RadPdfProcessing. When the form is opened for editing in a viewer (like Adobe Acrobat), the character appears correctly as an apostrophe in the editor itself. 

>note This might be reproduced with other symbols as well, not only with the apostrophe character.

## Solution

This issue is likely caused by the font encoding used in the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform%}) fields. If the font does not properly support the character encoding for the apostrophe or is not embedded or referenced correctly, such substitution may occur.

To resolve this issue, set the font of the AcroForm fields to one of the [14 standard PDF fonts]({%slug radpdfprocessing-concepts-fonts%}), such as Helvetica, Times, or Courier. These fonts have broad character support and do not require embedding.

### Steps:

1. Iterate through all form fields in `RadFixedDocument.AcroForm.FormFields`.
2. Check if the field type is [TextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) or [CombTextBox]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%}).
3. Set the widget font and text properties font to `FontsRepository.HelveticaBold`.

### Code Implementation

Use the following code snippet to update the font for all text fields in the PDF document:

```csharp
foreach (FormField field in document.AcroForm.FormFields)
{
    if (field.FieldType == FormFieldType.TextBox || field.FieldType == FormFieldType.CombTextBox)
    {
        TextField textBox = (TextField)field;
        
        // Set the font for the text field widgets
        textBox.Widgets.First().TextProperties.Font = FontsRepository.HelveticaBold;
        
        // Set the font for the text field text properties
        textBox.TextProperties.Font = FontsRepository.HelveticaBold;
    }
}
```
After applying the code, the apostrophe character will render correctly in the filled PDF.

## See Also
- [Fonts in RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/concepts/fonts)
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Working with AcroForm Fields](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/features/interactive-forms)

---
