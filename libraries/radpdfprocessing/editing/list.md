---
title: List
description: Learn how to create numbered and bulleted list paragraphs in PDF documents using the List class in RadPdfProcessing.
page_title: List
slug: radpdfprocessing-editing-list
tags: list, pdf, bullets, numbered, radpdfprocessing, listlevel, paragraphs, editing
published: True
position: 1
---

# List

The `List` class helps you create a list of numbered paragraphs. You can use lists by adding them to the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) `Lists` collection or by creating `List` class instances and setting the list bullets to some [Block]({%slug radpdfprocessing-editing-block%}) instances.

**Bulleted list output in RadPdfProcessing**

![RadPdfProcessing list output showing bulleted paragraphs](images/RadPdfProcessing_Editing_List_01.png)


The following sections present the list-related API in RadPdfProcessing:

* [Creating List from ListTemplateType](#creating-list-from-listtemplatetype)

* [Creating Custom ListLevel](#creating-custom-listlevel)

* [Creating Custom Bullet](#creating-custom-bullet)

* [Using Lists with RadFixedDocumentEditor](#using-lists-with-radfixeddocumenteditor)

* [Using Lists with Block Class](#using-lists-with-block-class)


## Creating List from ListTemplateType

Each `List` contains a `ListLevelCollection` where the presentation of each list level is defined by a `ListLevel` class instance. For the most common cases you do not need to define each separate list level. Instead, you can use the `ListTemplateType` enumeration to create a list with one of the predefined list templates.

The following snippet shows how to create a list with the `NumberedParentheses` template.

**Create a numbered parentheses list template**

<snippet id='pdf-list-numbered-parentheses'/>

The following image shows the available list template types and their appearance:

**Available list template types and their appearance**

![RadPdfProcessing list template types and their appearance](images/RadPdfProcessing_Editing_List_02.png)

>In .NET Standard due to font limitations, the `BulletDefault` list requires a Wingdings font be provided so its bullets are rendered properly. You can read how to handle these restrictions in the [Fonts]({%slug radpdfprocessing-cross-platform-fonts%}) and [FontsProvider]({%slug pdfprocessing-implement-fontsprovider%}) articles.

## Creating Custom ListLevel


When you need to create a custom `List`, define the presentation of each list level. The appearance of the list level is defined with the properties of the `ListLevel` class. The following list level properties are available in RadPdfProcessing:

* `StartIndex`: Specifies the index from which the list items numbering starts. The default value of this property is 1.

* `RestartAfterLevel`: Specifies the index of the level, which restarts the current level numbering. The default value is negative, which means that all previous levels restart the current level numbering. If this property has a non-negative value, all previous levels that have a level index less than or equal to the `RestartAfterLevel` value restart the current level numbering.

* `ParagraphProperties`: Specifies the paragraph properties of the paragraphs from this list level.

* `CharacterProperties`: Specifies the character properties of the bullet element on this list level.

* `BulletNumberingFormat`: Specifies how the bullet element is formatted on this list level.

* `IndentAfterBullet`: Specifies the amount of indent after the bullet element.


The following snippet shows how to create an empty list and add two custom list levels to its `ListLevelsCollection`. Level 0 has a bullet which displays its current numbering as a two-digit number with a leading zero. Level 1 displays a checkbox as a bullet symbol for all corresponding list items. Additionally, each level defines custom values for the `LeftIndent`, `ForegroundColor`, and `IndentAfterBullet` properties. 

**Create custom list levels**

<snippet id='pdf-list-custom-levels'/>

The following image shows how the custom list levels look when used.

**Custom list levels with two-digit numbering and checkbox bullets**

![RadPdfProcessing custom list levels with two-digit numbering and checkbox bullets](images/RadPdfProcessing_Editing_List_03.png)

## Creating Custom Bullet

When you create a custom list level, you need to specify how the bullet numbering is formatted. With RadPdfProcessing, by implementing `IBulletNumberingFormat` you can choose what `PositionContentElement` to use for each bullet appearance. This way, knowing the current indexes of all list levels, you can create bullets with text, geometry, or image.

If you need a text bullet, use the `TextBulletNumberingFormat` class. This class implements `IBulletNumberingFormat`. When you initialize an instance of this class, its constructor requires a function that returns the string representation of the bullet.

The following code snippet shows how to create the bullets of a numbered hierarchical list using the `TextBulletNumberingFormat` class:

**Create a custom text numbering bullet**

<snippet id='pdf-list-custom-numbering-bullet'/>

When using this list, its bullets look as shown in the following image.

**Custom hierarchical numbered list bullets**

![RadPdfProcessing custom hierarchical numbered list bullets](images/RadPdfProcessing_Editing_List_04.png)


## Using Lists with RadFixedDocumentEditor

To use lists with `RadFixedDocumentEditor`, first add them to the editor `ListCollection`. Each time you add a list item, set the `ListId` and `ListLevel` values in the editor `Paragraph` properties and call the `InsertParagraph()` method.

The following snippet shows how to create a list with `RadFixedDocumentEditor` and insert one item for each list level. The appearance of the list comes from the values in the predefined `ListTemplateType` enumeration.

**Use lists with RadFixedDocumentEditor**

<snippet id='pdf-list-using-raddocumentfixededitor'/>

The resulting document looks like the following image.

**List created with RadFixedDocumentEditor**

![RadPdfProcessing list created with the document editor showing items at different levels](images/RadPdfProcessing_Editing_List_05.png)


## Using Lists with Block Class

As the `Block` class has `Bullet` and `IndentAfterBullet` properties, you can set a custom bullet to any `Block` instance. However, if you want to get an automatically formatted bullet corresponding to some `List` class instance, use the `SetBullet(List list, int listLevel)` method. This way you can set the bullet-related properties so that the bullet displays the correct list numbering and formatting.

The following snippet shows how to create a `List` with the `BulletDefault` template and set the bullet of the first list level to a Block:


**Use lists with the Block class**

<snippet id='pdf-list-using-with-blocks'/>

>The list style is applied for the whole Block element. To generate a list consisting of multiple paragraphs in different list items, use the same count of Block instances as the number of different list items.

The following image demonstrates how the block looks when exported.

**Block with `BulletDefault` list style applied**

![RadPdfProcessing block with the default bullet list style applied](images/RadPdfProcessing_Editing_List_06.png)


## See Also

* [Block]({%slug radpdfprocessing-editing-block%})
* [Table]({%slug radpdfprocessing-editing-table-overview%})
* [TableRow]({%slug radpdfprocessing-editing-table-tablerow%})
* [TableCell]({%slug radpdfprocessing-editing-table-tablecell%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [Customizing the Font of Numbered Lists with RadPdfProcessing]({%slug customize-font-numbered-lists-radpdfprocessing%})
