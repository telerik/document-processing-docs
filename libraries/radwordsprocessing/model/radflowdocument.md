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



__RadFlowDocument__ hosts flow document content and is the root element in the document elements tree. It holds a collection of [Section]({%slug radwordsprocessing-model-section%}) elements.
      

## Inserting and  Modifying a RadFlowDocument

The code from __Example 1__ shows how you can create a new __RadFlowDocument__.
        

#### __Example 1: Create RadFlowDocument__

<snippet id='codeblock-dh'/>



**RadFlowDocument** exposes the following properties to customize the way content is presented:

| Property | Description |
|---|---|
| `DocumentInfo` | Enables you to set and obtain metadata for the document file. Of type `DocumentInfo`, it allows you to get and set `Author`, `Title`, `Subject`, `Keywords`, and `Description`. |
| `ViewType` | An enumeration that specifies how the document should be laid out when displayed. Whether this property is respected depends on the application used to open the document. |
| `Theme` | Specifies the theme applied to the document. The document theme enables you to specify colors, fonts, and graphic effects that affect the look of the whole document. More information is available [here]({%slug radwordsprocessing-concepts-document-themes%}). |
| `StyleRepository` | Represents the document's `StyleRepository`. The repository allows you to add, remove, or enumerate the styles of the document. |
| `DefaultStyle` | The default styles used for `Paragraph` and `Run` elements. More information on default styles is available [here]({%slug radwordsprocessing-concepts-styles%}). |
| `HasDifferentEvenOddPageHeadersFooters` | Gets or sets whether pages in this document should have different headers and footers for even and odd pages. |
| `ListCollection` | Represents the collection of [Lists]({%slug radwordsprocessing-concepts-lists%}) in the document. |
| `CommentCollection` | Represents the collection of [Comments]({%slug radwordsprocessing-model-comment%}) in the document. |
| `ProtectionSettings` | Corresponds to the settings used when the document is protected. More information is available [here]({%slug radwordsprocessing-model-permissionrange%}). |
| `DefaultTabStopWidth` | The distance between automatic [TabStops]({%slug radwordsprocessing-concepts-tabstop%}). |

            

## Operating with a RadFlowDocument

There are different actions which you can execute with the help of the __RadFlowDocument__ element.
        

### Adding Sections

You can create a __RadFlowDocument__ from scratch and add Sections to it as follows:
            

#### __Example 2: Add a Section to a RadFlowDocument__

<snippet id='codeblock-di'/>



The Sections property of the document is of type __SectionCollection__ and allows you to add sections to the document.
            

Alternatively, you could create a section by passing to its constructor the document it should be associated with.
            

#### __Example 3: Create a section__

<snippet id='codeblock-dj'/>



### Merge with Another Document

You can merge a __RadFlowDocument__ within another document by using the __Merge()__ method and pass the source document as a parameter to it:
            

#### __Example 4: Merge documents__

<snippet id='codeblock-dk'/>



Additionally, you have the opportunity to specify the __MergeOptions__ which control the merge operation:
            

* __ConflictingStylesResolutionMode__: An enumeration specifying the mode used for resolving conflicts between styles with same IDs. The possible values for ConflictingStylesResolutionMode are:
                
    * __UseTargetStyle__: If a conflict between styles with the same IDs appears, the style of the __target__ document is used.
    * __RenameSourceStyle__: If a conflict between styles with the same IDs appears, the style of the __source__ document is renamed and used.
                    

#### __Example 5: Merge documents using MergeOptions__

<snippet id='codeblock-dl'/>



### Update Fields

__RadFlowDocument__ exposes an __UpdateFields()__ method which allows you to update all fields in the document. More information about fields is available [here]({%slug radwordsprocessing-concepts-fields%}).
            

The snippet from __Example 6__ shows how all fields in a document can be updated simultaneously.
            

#### __Example 6: Update all fields in a document__

<snippet id='codeblock-dm'/>



## See Also

 * [RadFlowDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Styles]({%slug radwordsprocessing-concepts-styles%})
