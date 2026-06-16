---
title: RadFlowDocument
description: Learn about the RadFlowDocument class in RadWordsProcessing, the root element that hosts all flow document content.
page_title: RadFlowDocument
slug: radwordsprocessing-model-radflowdocument
tags: word, flow, docx, document, root, sections, model, container
published: True
position: 1
---

# RadFlowDocument

`RadFlowDocument` hosts flow document content and is the root element in the document elements tree. It holds a collection of [Section]({%slug radwordsprocessing-model-section%}) elements.

## Inserting and Modifying a RadFlowDocument

The code from **Example 1** shows how you can create a new `RadFlowDocument`.

**Example 1: Create RadFlowDocument**

<snippet id='codeblock-dh'/>

`RadFlowDocument` exposes the following properties to customize the way content is presented:

| Property | Description |
|---|---|
| `DocumentInfo` | Enables you to set and obtain metadata for the document file. Of type `DocumentInfo`, it allows you to get and set `Author`, `Title`, `Subject`, `Keywords`, and `Description`. |
| `ViewType` | An enumeration that specifies how the document should be laid out when displayed. Whether this property is respected depends on the application used to open the document. |
| `Theme` | Specifies the theme applied to the document. The document theme enables you to specify colors, fonts, and graphic effects that affect the look of the whole document. More information is available in the [Document Themes]({%slug radwordsprocessing-concepts-document-themes%}) article. |
| `StyleRepository` | Represents the document's `StyleRepository`. The repository allows you to add, remove, or enumerate the styles of the document. |
| `DefaultStyle` | The default styles used for `Paragraph` and `Run` elements. More information on default styles is available in the [Styles]({%slug radwordsprocessing-concepts-styles%}) article. |
| `HasDifferentEvenOddPageHeadersFooters` | Gets or sets whether pages in this document have different headers and footers for even and odd pages. |
| `ListCollection` | Represents the collection of [Lists]({%slug radwordsprocessing-concepts-lists%}) in the document. |
| `CommentCollection` | Represents the collection of [Comments]({%slug radwordsprocessing-model-comment%}) in the document. |
| `ProtectionSettings` | Corresponds to the settings used when the document is protected. More information is available in the [PermissionRange]({%slug radwordsprocessing-model-permissionrange%}) article. |
| `DefaultTabStopWidth` | The distance between automatic [TabStops]({%slug radwordsprocessing-concepts-tabstop%}). |

## Operating with a RadFlowDocument

You can execute different actions with the help of the `RadFlowDocument` element.

### Adding Sections

You can create a `RadFlowDocument` from scratch and add Sections to it as follows:

**Example 2: Add a Section to a RadFlowDocument**

<snippet id='codeblock-di'/>

The `Sections` property of the document is of type `SectionCollection` and allows you to add sections to the document.

Alternatively, you can create a section by passing to its constructor the document it is associated with.

**Example 3: Create a section**

<snippet id='codeblock-dj'/>

### Merge with Another Document

You can merge a `RadFlowDocument` within another document by using the `Merge()` method and passing the source document as a parameter:

**Example 4: Merge documents**

<snippet id='codeblock-dk'/>

You can also specify the `MergeOptions` that control the merge operation:

* `ConflictingStylesResolutionMode`: An enumeration specifying the mode used for resolving conflicts between styles with the same IDs. The possible values for `ConflictingStylesResolutionMode` are:

    * `UseTargetStyle`: If a conflict between styles with the same IDs appears, the style of the **target** document is used.
    * `RenameSourceStyle`: If a conflict between styles with the same IDs appears, the style of the **source** document is renamed and used.

**Example 5: Merge documents using MergeOptions**

<snippet id='codeblock-dl'/>

### Update Fields

`RadFlowDocument` exposes an `UpdateFields()` method that allows you to update all fields in the document. More information about fields is available in the [Fields]({%slug radwordsprocessing-concepts-fields%}) article.

The snippet from **Example 6** shows how to update all fields in a document simultaneously.

**Example 6: Update all fields in a document**

<snippet id='codeblock-dm'/>

## See Also

* [RadFlowDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html)
* [Document Model]({%slug radwordsprocessing-model%})
* [Section]({%slug radwordsprocessing-model-section%})
* [Styles]({%slug radwordsprocessing-concepts-styles%})
