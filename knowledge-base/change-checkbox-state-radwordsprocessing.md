---
title: Changing Checkbox State in Word Templates with RadWordsProcessing
description: Learn how to programmatically change the state of a checkbox in a Word document template using RadWordsProcessing.
type: how-to
page_title: How to Programmatically Modify Checkbox States in Word Document Templates Using RadWordsProcessing
slug: change-checkbox-state-radwordsprocessing
tags: radwordsprocessing, document processing, checkbox, word, template
res_type: kb
ticketid: 1656247
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2024.2.426|RadWordsProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

When working with Word templates that include checkboxes as content controls, you may need to change the state of a checkbox based on certain conditions. This KB article provides a method to programmatically check or uncheck a checkbox using the RadWordsProcessing library.

This KB article also answers the following questions:
- How can I programmatically check a checkbox in a Word document?
- How do I modify the state of a checkbox in a Word template?
- What is the method to change checkbox states in Word documents using C#?

## Solution

To change the state of a checkbox in a Word document, follow these steps:

1. Identify the content control that represents the checkbox.
2. Change the checkbox's state to either checked or unchecked.
3. Update the visual representation of the checkbox accordingly.

Below is a method that demonstrates how to achieve this:

```csharp
private static void ChangeCheckboxState(SdtRangeStart sdt)
{
    if (sdt == null || sdt.SdtProperties.Type != SdtType.CheckBox)
    {
        return;
    }

    // Get the paragraph that is parent of the checkbox
    Paragraph paragraph = sdt.Paragraph;

    // Get the index of the SDT start in the paragraph's child collection
    int index = paragraph.Inlines.IndexOf(sdt);

    // Get the Run that represents the checkbox' value
    Run checkBoxValue = paragraph.Inlines[index + 1] as Run;
    CheckBoxProperties properties = (CheckBoxProperties)sdt.SdtProperties;
    if (!properties.Checked.HasValue || !properties.Checked.Value)
    {
        properties.Checked = true;

        if (checkBoxValue != null)
        {
            checkBoxValue.Properties.FontFamily.LocalValue = new ThemableFontFamily(properties.CheckedState.Font);
            checkBoxValue.Text = ((char)properties.CheckedState.CharacterCode).ToString();
        }
    }
    else
    {
        properties.Checked = false;

        if (checkBoxValue != null)
        {
            checkBoxValue.Properties.FontFamily.LocalValue = new ThemableFontFamily(properties.UncheckedState.Font);
            checkBoxValue.Text = ((char)properties.UncheckedState.CharacterCode).ToString();
        }
    }
}
```

To apply this method, iterate through the content controls in your document, and call `ChangeCheckboxState` for each checkbox you wish to modify.

## Notes

- Ensure that you have identified the correct content control by checking its tag or other properties.
- The visual representation of the checkbox is determined by the font family and character code specified in the `CheckedState` and `UncheckedState` of the `CheckBoxProperties`.

## See Also

- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
