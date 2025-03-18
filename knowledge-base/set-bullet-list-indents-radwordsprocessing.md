---
title: Setting Bullet List Indents in RadWordsProcessing
description: Learn how to configure bullet list indents including bullet position and text indentation in RadWordsProcessing documents.
type: how-to
page_title: How to Set Bullet List Indents in RadWordsProcessing Documents
slug: set-bullet-list-indents-radwordsprocessing
tags: radwordsprocessing, document, bullet, list, indent, text, position
res_type: kb
ticketid: 1681870
---

## Description

When working with bullet lists in RadWordsProcessing documents, you might need to adjust the bullet position and text indentation to meet specific formatting requirements. This knowledge base article also answers the following questions:

- How can I set text indent for bullet lists in RadWordsProcessing?
- How can I adjust the bullet position in RadWordsProcessing lists?
- What are the calculations behind converting device-independent pixels to centimeters for list indents in RadWordsProcessing?

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>RadWordsProcessing for Document Processing</td>
</tr>
</tbody>
</table>

## Solution

To set the bullet position and text indentation for a bullet list in RadWordsProcessing, follow these steps:

1. Initialize the `RadFlowDocument` and add a section to it.
2. Create a bullet list and configure its levels as needed.
3. Use the `ParagraphProperties.LeftIndent` and `ParagraphProperties.HangingIndent` properties to adjust the bullet position and text indentation.

### Example

```csharp
RadFlowDocument document = new RadFlowDocument();
Section section = document.Sections.AddSection();

document.Lists.Add(ListTemplateType.BulletDefault);
List list = document.Lists.Last();

// Configure the first level of the bullet list
list.Levels[0].NumberTextFormat = "¾";
list.Levels[0].NumberingStyle = NumberingStyle.Bullet;
list.Levels[0].CharacterProperties.FontFamily.LocalValue = new ThemableFontFamily("Wingdings 2");
list.Levels[0].CharacterProperties.FontSize.LocalValue = 16;
list.Levels[0].ParagraphProperties.LeftIndent.LocalValue = 18.933333333333334;
list.Levels[0].ParagraphProperties.HangingIndent.LocalValue = 18.933333333333334;

// Configure the second level of the bullet list
list.Levels[1].NumberTextFormat = "¾";
list.Levels[1].NumberingStyle = NumberingStyle.Bullet;
list.Levels[1].CharacterProperties.FontFamily.LocalValue = new ThemableFontFamily("Wingdings 2");
list.Levels[1].CharacterProperties.FontSize.LocalValue = 13.3333333;
list.Levels[1].ParagraphProperties.LeftIndent.LocalValue = 37.8;
list.Levels[1].ParagraphProperties.HangingIndent.LocalValue = 18.933333333333334;

// Add paragraphs and associate them with list levels
Paragraph paragraph = document.Sections.Last().Blocks.AddParagraph();
paragraph.Inlines.AddRun("Bullet 1");
paragraph.ListId = list.Id;
paragraph.ListLevel = 1;

paragraph = document.Sections.Last().Blocks.AddParagraph();
paragraph.Inlines.AddRun("Bullet 1.1");
paragraph.ListId = list.Id;
paragraph.ListLevel = 2;
```

**Conversion from device-independent pixels to centimeters:**

The conversion from device-independent pixels (DIP) to centimeters (cm) is based on the formula:

\[ \text{cm} = \frac{\text{DIP}}{96} \times 2.54 \]

For instance, to convert 18.9 DIP to cm:

\[ \text{cm} = \frac{18.9}{96} \times 2.54 = 0.5cm \]

This calculation allows you to set the bullet position and text indentation accurately according to your formatting requirements.

## See Also

- [Modifying a Paragraph in RadWordsProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/paragraph#modifying-a-paragraph)
- [Understanding Device Independent Pixels](https://docs.telerik.com/devtools/document-processing/common-information/device-independent-pixels)
