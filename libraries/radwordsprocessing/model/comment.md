---
title: Comment
description: Learn how to add and manage annotation comments in RadWordsProcessing flow documents.
page_title: Comment
slug: radwordsprocessing-model-comment
tags: comment, word, docx, document, flow, model, annotation, review, inline
published: True
position: 14
---

# Comment

A `Comment` holds annotation markers, which specify the range of document elements it refers to. Every `Comment` has a corresponding `CommentRangeStart` and `CommentRangeEnd`, which are inline elements. These two elements specify the comment location as follows:

* `CommentRangeStart`: Specifies the start of a comment annotation.
* `CommentRangeEnd`: Specifies the end of a comment annotation.

## Inserting a Comment

**Example 1** shows how to create a `Comment` and add its `CommentRangeStart` and `CommentRangeEnd` elements in a paragraph.

**Example 1: Add a Comment to a Paragraph**

<snippet id='libraries-flow-model-comment-1'/>

The `AddComment()` method of the `Comments` collection of a document creates a new comment and returns it. The comment location is around a run with text "*text*". The paragraph must belong to the same document as the one passed to the constructor of the `Comment`. Otherwise, an exception is thrown.

**Example 2** shows how to insert a previously created `Comment` object in a document by using [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}). The `InsertComment()` method inserts the comment start and end elements.

**Example 2: Insert a Previously Created Comment**

<snippet id='libraries-flow-model-comment-2'/>

**Example 3** demonstrates how to use another overload of the `InsertComment()` method of `RadFlowDocumentEditor`. In this case, a string representing the text of the `Comment` and two inline elements are passed. The two inline elements specify the element before which the `CommentRangeStart` is added and the element after which the `CommentRangeEnd` is added.

**Example 3: Insert a Comment Around a Run**

<snippet id='libraries-flow-model-comment-3'/>

## Modifying a Comment

The `Comment` class exposes several properties that allow you to customize information about it:

* `Author`: Property of type `string` that specifies the author of the comment.
* `Initials`: Property of type `string` that specifies the author initials.
* `Date`: `DateTime` property that shows the moment the comment was created.

## Operating with a Comment

`Comment` derives [BlockContainerBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html), inheriting the `Blocks` property of `BlockCollection` type. You can add [Paragraph]({%slug radwordsprocessing-model-paragraph%}) and [Table]({%slug radwordsprocessing-model-table%}) objects to that collection.

**Example 4** shows how to add a `Table` to a `Comment`.

**Example 4: Add Blocks to a Comment**

<snippet id='libraries-flow-model-comment-4'/>

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Table]({%slug radwordsprocessing-model-table%})
