---
title: Changing the Value of a Checkbox Content Control
description: Learn how to check or uncheck a checkbox content control based on an object's property value.
type: how-to
page_title: How to Change the Value of a Checkbox Content Control
slug: changing-value-checkbox-content-control
tags: checkbox, content control, object property, WordsProcessing
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | ---- |
| 2023.3.1106 | RadWordsProcessing|Vladislav Todorov|

## Description
This article demonstrates how to change the value of a checkbox content control based on an object's property value.

## Solution
Content controls consist of two main parts: the SDT (Structured Document Tag) properties and the SDT content. The SDT properties provide information to the editor application about the current state of the content control, while the SDT content represents the actual document elements that are displayed in place of the content control.

To change the value of a checkbox content control, we need to modify both the SDT properties and the SDT content. Here's an example code snippet that demonstrates how to do this:

```csharp
private static SdtRangeStart GetSdtFromAlias(RadFlowDocument document, string alias)
{
    return document.EnumerateChildrenOfType<SdtRangeStart>().Where(s => s.SdtProperties.Alias == alias).FirstOrDefault();
}

private static void ChangeCheckboxState(SdtRangeStart sdt)
{
    if (sdt == null || sdt.SdtProperties.Type != SdtType.CheckBox)
    {
        return;
    }

    // Get the paragraph that is the parent of the checkbox
    Paragraph paragraph = sdt.Paragraph;

    // Get the index of the SDT start in the paragraph's child collection
    int index = paragraph.Inlines.IndexOf(sdt);

    // Get the Run that represents the checkbox's value
    // Note that there is only one Run because the SDT is a checkbox
    Run checkBoxValue = paragraph.Inlines[index + 1] as Run;
    CheckBoxProperties properties = (CheckBoxProperties)sdt.SdtProperties;

    if (!properties.Checked.HasValue || !properties.Checked.Value)
    {
        // Change the state of the checkbox
        properties.Checked = true;

        if (checkBoxValue != null)
        {
            // Change the font family of the Run containing the text that represents the checkbox's checked value
            checkBoxValue.Properties.FontFamily.LocalValue = new ThemableFontFamily(properties.CheckedState.Font);

            // Change the Run content with the character that represents the checkbox's checked value
            checkBoxValue.Text = ((char)properties.CheckedState.CharacterCode).ToString();
        }
    }
    else
    {
        // Change the state of the checkbox
        properties.Checked = false;

        if (checkBoxValue != null)
        {
            // Change the font family of the Run containing the text that represents the checkbox's checked value
            checkBoxValue.Properties.FontFamily.LocalValue = new ThemableFontFamily(properties.UncheckedState.Font);

            // Change the Run content with the character that represents the checkbox's unchecked value
            checkBoxValue.Text = ((char)properties.UncheckedState.CharacterCode).ToString();
        }
    }
}
```

Please note that this code snippet assumes you have access to a `RadFlowDocument` instance and that you have already obtained the `SdtRangeStart` object representing the checkbox content control using its alias.

## Notes
- This code demonstrates how to change the value of a checkbox content control using the Telerik RadWordsProcessing library.
- The code updates both the SDT properties and the SDT content to reflect the new state of the checkbox.
- Make sure to replace `alias` with the appropriate alias value for your checkbox content control.
- Remember to adjust the code as necessary to suit your specific implementation.

## See Also
- [RadWordsProcessing Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/introduction)
- [Working with Content Controls](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/openxml-content-controls)
