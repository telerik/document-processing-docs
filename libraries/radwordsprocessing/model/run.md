---
title: Run
description: Learn about the Run inline element in RadWordsProcessing that contains a formatted text run within a paragraph.
page_title: Run
slug: radwordsprocessing-model-run
tags: run, word, docx, document, flow, model, text, inline, formatting
published: True
position: 4
---

# Run

`Run` is an inline-level flow content element intended to contain a run of formatted text.

* [Inserting a Run](#inserting-a-run)

* [Modifying a Run](#modifying-a-run)

## Inserting a Run

The code in **Example 1** creates a `Run` element and adds it to a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).

**Example 1: Create an empty Run and add it to a paragraph**

<snippet id='codeblock-dn'/>

>tip The parent `Paragraph` must belong to the same document that is passed to the constructor of the `Run`.

You can add a run at a specific index in the `Inlines` collection of a paragraph using the `Insert()` method. **Example 2** demonstrates how to add a run at the beginning of a paragraph.

**Example 2: Insert an empty Run at the beginning of a paragraph**

<snippet id='codeblock-do'/>

You can also use the `AddRun()` method of the `Inlines` collection of a paragraph. The method creates a new `Run` instance, adds it to the container, and returns it:

**Example 3: Add an empty run and a text-filled run with the AddRun overloads**

<snippet id='codeblock-dp'/>

You can also insert text in the document with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class:

**Example 4: Insert text and a new paragraph line with RadFlowDocumentEditor**

<snippet id='codeblock-dq'/>

## Modifying a Run

The `Run` element exposes several properties that allow you to customize how it is rendered and formatted. Some of these properties are style properties, and some of the values represent a themable object.

>tip Style properties are properties that can be inherited from a style. For more information about styles, refer to the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

>tip Themable objects are objects that can be inherited from a theme. For more information about themes, refer to the [Document Themes]({%slug radwordsprocessing-concepts-document-themes%}) article.

* `Properties`: Retrieves all `CharacterProperties` for this element. For more information about `CharacterProperties`, refer to the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.

* `Text`: Specifies the text for the run.

* `FlowDirection`: Represents the flow direction of the run:

	* `LeftToRight`: Indicates that the text flows from left to right.
	* `RightToLeft`: Indicates that the text flows from right to left.

* `StyleId`: Represents the ID of the style that is applied to this run.

* `FontFamily`: Specifies the font family that is used to render the text. *This is a style property. The value is a themable object.*

* `FontSize`: The font size. The measurement unit used for font size is [Device Independent Pixels]({%slug device-independent-pixels%}) (DIPs). You can convert it to points or other units using the [Unit](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Media.Unit.html) class.

* `Shading`: Represents the shading applied to the run. It is a composite object and is read-only. You can obtain the following properties from it:

    * `BackgroundColor`: Specifies the background color for the shading. *This is a style property. The value is a themable object.*
    * `PatternColor`: Specifies the pattern color for the shading. *This is a style property. The value is a themable object.*
    * `Pattern`: Specifies the pattern that is used to lay the pattern color over the background color for the shading. *This is a style property.*

* `FontStyle`: Specifies the font style. *This is a style property.*

* `FontWeight`: Specifies the font weight. *This is a style property.*

* `ForegroundColor`: Specifies the foreground color. *This is a style property. The value is a themable object.*

* `HighlightColor`: Specifies the highlight color. *This is a style property.*

* `BaselineAlignment`: Specifies how the baseline is positioned on the vertical axis, relative to the established baseline for text. *This is a style property.*

* `Strikethrough`: Specifies whether the text is struck through. *This is a style property.*

* `Underline`: Specifies the underline for the run. It is a composite object and is read-only. You can obtain the following properties from it:

    * `Color`: Indicates the underline color. *This is a style property.*
    * `Pattern`: Indicates the underline pattern. *This is a style property.*

## See Also

* [Run API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Run.html)
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
* [Document Themes]({%slug radwordsprocessing-concepts-document-themes%})
* [How to Make Bold only a Part of the Text in a Paragraph with RadWordsProcessing]({%slug create-bold-text-run-wordsprocessing%})
