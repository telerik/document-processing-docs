---
title: Paragraph
description: Learn about the Paragraph element in RadWordsProcessing and how it organizes inline content in flow documents.
page_title: Paragraph
slug: radwordsprocessing-model-paragraph
tags: paragraph, word, flow, docx, document, model, inline, text, runs
published: True
position: 3
---

# Paragraph

The `Paragraph` class allows you to separate the content into paragraphs. It is responsible for displaying inline elements such as [Run]({%slug radwordsprocessing-model-run%}), [FloatingImage]({%slug radwordsprocessing-model-floatingimage%}), [ImageInline]({%slug radwordsprocessing-model-imageinline%}), and others. You can also configure the appearance of the paragraph by modifying its parameters.

* [Inserting a Paragraph](#inserting-a-paragraph)

* [Modifying a Paragraph](#modifying-a-paragraph)

* [Operating with a Paragraph](#operating-with-a-paragraph)

## Inserting a Paragraph

Paragraphs can be added as a child of a [BlockContainer](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html) element—[Section]({%slug radwordsprocessing-model-section%}), [TableCell]({%slug radwordsprocessing-model-tablecell%}), [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})—through the `Blocks` collection.

The code snippet from **Example 1** creates and inserts a `Paragraph` in a `Section`.

**Example 1: Insert paragraph in section**

<snippet id='libraries-flow-model-paragraph-1'/>

>tip The parent `BlockContainer` element (in this case, the section) must belong to the same document that is passed to the constructor of the `Paragraph`.

You can add a paragraph at a specific index in the `Blocks` collection of a `BlockContainer` using the `Insert()` method. **Example 2** demonstrates how to add a paragraph at the beginning of a section.

**Example 2: Insert a paragraph at a specific position of the Blocks collection**

<snippet id='libraries-flow-model-paragraph-2'/>

You can also use the `AddParagraph()` method of the `Blocks` collection of a `BlockContainer`. The method creates a new `Paragraph` instance, adds it to the container, and returns it.

**Example 3: Create a new paragraph and add it to a section**

<snippet id='libraries-flow-model-paragraph-3'/>

You can also insert a new `Paragraph` in the document with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class.

**Example 4: Insert a paragraph using the RadFlowDocumentEditor**

<snippet id='libraries-flow-model-paragraph-4'/>

## Modifying a Paragraph

`Paragraph` exposes several properties that allow you to customize the layout of the elements placed underneath it. The following list describes them:

* `Properties`: Gets all paragraph properties as a `ParagraphProperties` object. More information on how to use section properties is available in the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

* `StyleId`: Represents the ID of the style applied on the `Paragraph` element.

* `Inlines`: Represents the inline elements in the paragraph. Exposes methods for adding a `Run`, an `ImageInline`, and a `FloatingImage` element.

* `FlowDirection`: Specifies the text flow direction. The default value is *LeftToRight*.

* `TextAlignment`: Represents the alignment of the text inside the `Paragraph`.

* `Spacing`: Defines the `Paragraph` spacing.

* `KeepOnOnePage`: Indicates whether the `Paragraph` is rendered on one page when the document is shown in page view mode.

* `KeepWithNextParagraph`: Indicates whether the `Paragraph` is rendered at least partly on the same page with the following paragraph when this is possible and when the document is shown in page view mode.

* `OutlineLevel`: Defines the level of the `Paragraph` in a TOC field. The default value is Level9 (no level).

* `ApplyEastAsianLineBreakingRules`: Specifies whether East-Asian line breaking rules are applied to the `Paragraph`.

* `PageBreakBefore`: Specifies whether the `Paragraph` is rendered on a new page when the document is shown in page view mode.

* `Borders`: Defines the borders of the `Paragraph`.

* `ContextualSpacing`: Defines whether spacing before/after is ignored when the preceding/following paragraph has the same paragraph style.

* `MirrorIndents`: Defines whether left and right indents are swapped on odd pages.

* `Indentation`: Defines a set of indentations that can be applied to a `Paragraph` element through a `ParagraphIndentation` object. `ParagraphIndentation` is a composite object and its properties are listed below. All the values of these properties are in device independent pixels (1/96 inch).

    * `FirstLineIndent`: Indicates the additional indentation that is applied to the first line of the paragraph.
    * `HangingIndent`: Specifies a value that is removed from the indentation of the first line of the paragraph, by moving the indentation on the first line back towards the beginning of the direction of text flow.
    * `LeftIndent`: Indicates the indentation that is applied to the left side of the whole paragraph.
    * `RightIndent`: Indicates the indentation that is applied to the right side of the whole paragraph.


* `Shading`: Represents the shading applied to the paragraph. It is a composite object and is read-only. You can obtain the following properties from it:
    * `BackgroundColor`: Specifies the background color for the shading.
    * `PatternColor`: Specifies the pattern color for the shading.
    * `Pattern`: Specifies the pattern that is used to lay the pattern color over the background color for the shading.

* `AllowOverflowPunctuation`: Defines whether the last punctuation character on a line can overflow in paragraph margin/indent.

* `ListId`: Specifies the list ID.

* `ListLevel`: Gets a value indicating that the paragraph references a list style. The default value is -1, meaning that list style is not referenced.

* `TabStops`: Immutable collection that holds the tab stops of the `Paragraph`. More information is available in the [TabStop]({%slug radwordsprocessing-concepts-tabstop%}) article.


## Operating with a Paragraph

You can add inline elements to a `Paragraph` instance.

### Adding a Run

**Example 5** illustrates how to add a run to an existing paragraph.

**Example 5: Insert run in a paragraph**

<snippet id='libraries-flow-model-paragraph-5'/>

For more information about the `Run` element, refer to the [Run]({%slug radwordsprocessing-model-run%}) article.

### Adding an ImageInline

**Example 6** adds an inline image to an existing paragraph.

**Example 6: Insert image inline**

<snippet id='libraries-flow-model-paragraph-6'/>

For more information about the `ImageInline` element, refer to the [ImageInline]({%slug radwordsprocessing-model-imageinline%}) article.

### Adding a FloatingImage

The code snippet from **Example 7** adds a floating image to an existing paragraph.

**Example 7: Add floating image**

<snippet id='libraries-flow-model-paragraph-7'/>

For more information about the `FloatingImage` element, refer to the [FloatingImage]({%slug radwordsprocessing-model-floatingimage%}) article.


### Adding a TabStop

**Example 8** demonstrates how to add a tab stop to the paragraph's collection.

**Example 8: Insert TabStop**

<snippet id='libraries-flow-model-paragraph-8'/>

You can refer to the [TabStop]({%slug radwordsprocessing-concepts-tabstop%}) article for more details about this element.

### Setting Borders

**Example 9** shows how to create borders and set them to a `Paragraph`.

**Example 9: Setting Borders**

<snippet id='libraries-flow-model-paragraph-9'/>

## See Also

* [Paragraph API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Paragraph.html)
* [Section]({%slug radwordsprocessing-model-section%})
* [TableCell]({%slug radwordsprocessing-model-tablecell%})
* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
* [Run]({%slug radwordsprocessing-model-run%})
* [Bullet List with Paragraph Styles]({%slug create-bullet-list-using-paragraph-styles-radwordsprocessing%})
