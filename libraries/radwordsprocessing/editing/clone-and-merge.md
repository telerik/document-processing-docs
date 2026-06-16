---
title: Clone and Merge
description: Learn how to clone and merge RadFlowDocument instances in RadWordsProcessing.
page_title: Clone and Merge
slug: radwordsprocessing-editing-clone-and-merge
tags: clone, merge, word, flow, docx, editing, document, copy, combine
published: True
position: 0
---

# Clone and Merge

* [Merging Documents](#merging-documents)
* [Cloning RadFlowDocument](#cloning-radflowdocument)
* [Cloning Document Elements](#cloning-document-elements)
* [Cloning Other Objects](#cloning-other-objects)

## Merging Documents

**RadWordsProcessing** allows you to merge two `RadFlowDocument` instances using the `Merge()` method overloads. The document to which you wish to add content is called *target* and the document from which you wish to take the content is called *source*.

#### **Example 1: Merge Two Instances of RadFlowDocument**

<snippet id='codeblock-bn'/>

The `Merge` method performs two distinct operations:

* Adds all sections from the source document into the target document. The sections from the source document are inserted at the end of the target document.
* Adds all styles from the source `StyleRepository` to the target `StyleRepository`.

You can pass the `MergeOptions` parameter as an argument to the `Merge()` method to better control the merge process. It provides the following customization options:

* `ConflictingStylesResolutionMode`: This option controls how conflicts between styles in target and source style repositories are resolved. Styles are in conflict when they have the same ID (`Style.Id`). Possible values are:

    * `UseTargetStyle`: In case of conflict, the style from the target document stays in the target repository and the style from the source document is not added to the target repository.

    * `RenameSourceStyle`: In case of conflict, the style from the target document stays in the target repository and the style from the source document is added to the target repository with a changed ID (with "_1" suffix).

**Example 2** shows how to merge documents by specifying the `MergeOptions` parameter.

#### **Example 2: Merge Documents with MergeOptions**

<snippet id='codeblock-bo'/>

>tip You can insert one document into another at a specified position using the `InsertDocument()` method of `RadFlowDocumentEditor`. For more information, refer to [Insert Documents]({%slug radwordsprocessing-editing-insert-documents%}).

## Cloning RadFlowDocument

`RadFlowDocument` provides a `Clone()` method, which creates a deep copy of the whole document structure, including all document elements and styles:

#### **Example 3: Clone a RadFlowDocument**

<snippet id='codeblock-bp'/>

## Cloning Document Elements

You can create a deep copy of most document elements using the `Clone()` method overloads. The following list shows document elements that provide such methods:

* `RadFlowDocument`
* `Section`
* `Paragraph`
* `Run`
* `Table`
* `TableRow`
* `TableCell`
* `ImageInline`
* `FloatingImage`

The `Clone()` method has two overloads:

* `Clone()`: Creates a deep copy of the document element and associates it with the same document.
* `Clone(RadFlowDocument)`: Creates a deep copy of the element and associates it with the provided `RadFlowDocument`. This allows cloned elements to be added to the element tree of the provided document at a later time and is convenient if you want to move an element from one document to another.

#### **Example 4: Clone a Section**

<snippet id='codeblock-bq'/>

>tip With the `DocumentElementImporter` class you can import a document element from one document (source) and insert it into another (target). For more details, refer to [Import Document Element]({%slug radwordsprocessing-editing-import-document-element%}).

## Cloning Other Objects

The following styling objects also implement the `Clone()` method, which you can use to create deep copies of them:

* `Style`
* `List`
* `ListLevel`
* `Watermark`

## See Also

* [Document Model]({%slug radwordsprocessing-model%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
