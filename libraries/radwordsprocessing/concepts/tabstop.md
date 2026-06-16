---
title: TabStop
description: Learn about tab stops in RadWordsProcessing and how to use them to align text by inserting tab characters in paragraphs.
page_title: TabStop
slug: radwordsprocessing-concepts-tabstop
tags: tab, stop, word, flow, docx, alignment, paragraphs, text, document, indentation
published: True
position: 3
---

# TabStop

A *tab stop* is the location where the caret stops after you press the Tab key. Tab stops allow you to align text by inserting the Tab symbol. Each paragraph contains a number of tabs, which you can place wherever needed.


## TabStop Overview

The `TabStop` class is immutable, meaning you must set its properties when initializing an instance.

* `Position`: The position of the tab stop. The value is in device-independent pixels (1/96 inch).

* `Type`: The type of the tab stop. Defines the behavior of the tab stop. All possibilities are described with the [`TabStopType` enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Styles.TabStopType.html):

	* `Left`: The text following the tab stop is left aligned with respect to the tab stop position. This is the *default* value.
	* `Center`: The text following the tab stop is centered around the tab stop position.
	* `Right`: The text following the tab stop is right aligned with respect to the tab stop position.
	* `Decimal`: Text before the decimal point is positioned to the left and text after the decimal point is positioned to the right side of the tab stop.
	* `Bar`: A vertical bar is shown at the tab position.
	* `Clear`: Clears an inherited tab stop.

* `Leader`: Specifies the character that fills the space in front of a tab. All possibilities are described with the [`TabStopLeader` enumeration](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Styles.TabStopLeader.html):

	* `None`: The space before the tab is left empty. This is the default value.
	* `Dot`: The space before the tab is filled with dots.
	* `Hyphen`: The space before the tab is filled with hyphens.
	* `Underscore`: The space before the tab is filled with underscores.
	* `MiddleDot`: The space before the tab is filled with middle dots.

The distance between automatic tab stops is determined by the [`RadFlowDocument`]({%slug radwordsprocessing-model-radflowdocument%}).`DefaultTabStopWidth` property. Automatic tab stops refer to the tab stop locations that occur after all custom tab stops in the current paragraph have been surpassed.


## TabStopCollection Overview

This class derives from `System.Collections.Generic.IEnumerable<T>` and represents a collection of `TabStop` objects. The collection is immutable, and it holds the tab stops in a [Paragraph]({%slug radwordsprocessing-model-paragraph%}).

The `TabStopCollection` class exposes the following members:

* `Count`: The count of `TabStop` elements in the collection.
* `Insert()`: Returns a new instance of `TabStopCollection` with the specified tab stop inserted in it.
* `Remove()`: Returns a new instance of `TabStopCollection` with the specified tab stop removed.


## Working with TabStopCollection


### Create a TabStopCollection

Excluding the default constructor, the `TabStopCollection` class exposes an overload that allows you to directly pass a collection of `TabStop` objects:

<a name="example1"></a>

**Example 1: Create a TabStopCollection**

<snippet id='codeblock-bba'/>


### Insert Item in a TabStopCollection

**Example 2** demonstrates how to insert items in the `TabStopCollection` created in [Example 1](#example1). Keep in mind that this collection is immutable, so the `Insert()` method returns a **new instance** of the class.

**Example 2: Insert item in a TabStopCollection**
<snippet id='codeblock-cca'/>


### Remove Item from a TabStopCollection

The following snippet shows how to remove an item from the `TabStopCollection` created in [Example 1](#example1). Keep in mind that this collection is immutable, so the `Remove()` method returns a new instance of the class.

**Example 3: Remove item from a TabStopCollection**
<snippet id='codeblock-dda'/>


## Working with TabStop

In RadWordsProcessing, the tab stops are stored as a collection in the [Paragraph]({%slug radwordsprocessing-model-paragraph%}). This section shows how to work with the `TabStop` element.


### Create a TabStop

The code from **Example 4** demonstrates how to create a tab stop.

<a name="example4"></a>

**Example 4: Create a TabStop**

<snippet id='codeblock-eea'/>

### Add a TabStop

**Example 5** shows how to add the tab stop created in [Example 1](#example1) to an existing `Paragraph` through the `TabStops` property of type `TabStopCollection`.

**Example 5: Insert a TabStop**

<snippet id='codeblock-ffa'/>

### Remove a TabStop

The following code-snippet shows how to remove the tab stop created in [Example 4](#example4):

**Example 6: Remove a TabStop**

<snippet id='codeblock-gga'/>

### Use a TabStop in the Content

Once you have applied the desired tab stops to a paragraph, insert tabs (\t) so that the content aligns to the specified tab stops. The code in **Example 7** inserts tab stops at three positions with different properties. It then aligns three words on the tab stop positions using tabs.

**Example 7: Add tabs to align to the tab stops**

<snippet id='codeblock-hha'/>

## See Also

* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
