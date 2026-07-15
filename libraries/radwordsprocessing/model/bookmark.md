---
title: Bookmark
description: Learn how to create and use bookmarks in RadWordsProcessing flow documents to mark specific locations by name.
page_title: Bookmark
slug: radwordsprocessing-model-bookmark
tags: bookmark, word, docx, document, flow, model, navigation, named, reference
published: True
position: 13
---

# Bookmark

A `Bookmark` refers to a location in the document and has a unique name, which identifies it. Every `Bookmark` has a corresponding `BookmarkRangeStart` and `BookmarkRangeEnd`, which are inline elements. These two elements specify the bookmark location as follows:

* `BookmarkRangeStart`: Specifies the start of a bookmark annotation.
* `BookmarkRangeEnd`: Specifies the end of a bookmark annotation.

## Inserting a Bookmark

**Example 1** shows how to create a `Bookmark` and add its `BookmarkRangeStart` and `BookmarkRangeEnd` elements in a [Paragraph]({%slug radwordsprocessing-model-paragraph%}):

**Example 1: Create a bookmark and place its start and end markers around a run in a paragraph**

<snippet id='codeblock-cw'/>

The paragraph must belong to the same document that is passed to the constructor of the `Bookmark` object. Otherwise, an exception is thrown. The bookmark location is specified around a run with text "*text*".

You can also insert a `Bookmark` in the document with the [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) class as shown in **Example 2**:

**Example 2: Insert a bookmark named MyBookmark with RadFlowDocumentEditor**

<snippet id='codeblock-cx'/>

The `InsertBookmark()` method from **Example 2** creates a `Bookmark` with name "*MyBookmark*" and inserts its `BookmarkRangeStart` and `BookmarkRangeEnd` elements one after another.

## Removing a Bookmark

You can remove an inserted `Bookmark` by using the `DeleteBookmark()` method of `RadFlowDocumentEditor`. Pass the name of the bookmark to remove, or the `Bookmark` instance itself, to the method.

**Example 3** demonstrates how to delete the bookmark created in **Example 2**.

**Example 3: Delete a bookmark by name with RadFlowDocumentEditor**

<snippet id='codeblock-cy'/>

## See Also

* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [Finding a Table Containing a Specific Bookmark in Word Documents]({%slug radwordsprocessing-find-table-by-bookmark%})
* [Change Bookmark Content While Preserving Formatting]({%slug radwordsprocessing-change-bookmark-content-preserve-formatting%})
