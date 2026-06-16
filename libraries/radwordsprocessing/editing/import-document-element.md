---
title: Import Document Element
description: Learn how to import document elements from one RadFlowDocument into another using RadWordsProcessing.
page_title: Import Document Element
slug: radwordsprocessing-editing-import-document-element
tags: import, word, flow, docx, editing, document, element, copy, transfer
published: True
position: 2
---

# Import Document Element

This article explains how to import a document element from one document into another using the API of **RadWordsProcessing**.


## DocumentElementImporter Class

The `DocumentElementImporter` class represents a utility class that imports document elements from one document to another. It also handles the style repository merging.

### Create a DocumentElementImporter

The constructor of the `DocumentElementImporter` class accepts the following parameters:

| Parameter | Description |
|---|---|
| `targetDocument` | The `RadFlowDocument` instance for which the elements are prepared for inserting. |
| `sourceDocument` | The `RadFlowDocument` from where the elements are imported. |
| `conflictingStylesResolutionMode` | The resolution mode used when a style conflict appears during style repository merging. One of the [ConflictingStylesResolutionMode](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.ConflictingStylesResolutionMode.html) values. |

<a name="example1"><a/>

**Example 1: Create DocumentElementImporter**

<snippet id='codeblock-br'/>



### Use DocumentElementImporter

The `DocumentElementImporter` class exposes the `Import<T>()` method, which prepares a document element from the source document for import into the target document. **Example 2** demonstrates how you can work with this method, using the `DocumentElementImporter` instance created in [Example 1](#example1).

**Example 2: Import a Document Element**

<snippet id='codeblock-bs'/>

You can then insert the imported document element into the target document through the `RadFlowDocumentEditor` class. For more information, refer to [Inserting Document Elements]({% slug radwordsprocessing-editing-radflowdocumenteditor%}#inserting-document-elements).

### Style Repositories Merging

The merging of the styles between the two documents (target and source) runs when the `Import()` method is invoked for the first time.

### Use Cases

**Table 1** describes the behavior of the `Import<T>()` method of `DocumentElementImporter` in different scenarios.

**Table 1**

| Action | Result |
|--------|--------|
| Invoke `Import()` method with a document element. | Returns the document element cloned. |
| Invoke `Import()` method with a paragraph, which contains an unpaired annotation marker (for example, there is a Bookmark spanned between two paragraphs, one of which is passed as a parameter). | Returns the paragraph and all its inlines cloned. **The unpaired annotation marker is cleared.** |
| Invoke `Import()` method with a section, which contains paragraphs that contain unpaired annotations (for example, there is a Bookmark spanned between two paragraphs and their parent section is passed as a parameter). | Returns the section and all its children cloned. The annotation markers are not cleared. |
| Invoke `Import()` method with a paragraph that has a style renamed during the styles merging. | Returns the paragraph and all its children cloned with the correctly renamed `StyleId` property. |
| Invoke `Import()` method with a paragraph that has a style renamed during the styles merging multiple times. | Returns the paragraph and all its children cloned with the correctly renamed `StyleId` property. |
| Invoke `Import()` method with a document element that is not a child of the source document. | Throws an `InvalidOperationException`. |

## See Also

* [Document Model]({%slug radwordsprocessing-model%})
* [Clone and Merge]({%slug radwordsprocessing-editing-clone-and-merge%})
