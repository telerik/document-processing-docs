---
title: RadFlowDocument
page_title: RadFlowDocument
slug: radwordsprocessing-model-radflowdocument
tags: radflowdocument
published: True
position: 1
---

# RadFlowDocument



__RadFlowDocument__ hosts flow document content and is the root element in the document elements tree. It holds a collection of [Section]({%slug radwordsprocessing-model-section%}) elements.
      

## Inserting and  Modifying a RadFlowDocument

The code from __Example 1__ shows how you can create a new __RadFlowDocument__.
        

#### __[C#] Example 1: Create RadFlowDocument__

{{region cs-radwordsprocessing-model-radflowdocument_0}}
	RadFlowDocument document = new RadFlowDocument();
{{endregion}}



__RadFlowDocument__ exposes properties which allow you to customize the way content is presented. The following properties are available for change:
        
* **DocumentInfo**: This property enables you to set and obtain metadata information for the document file. It is of type **DocumentInfo** and allows you get and set the **Author**, **Title**, **Subject**, **Keywords** and **Description**.        

* __ViewType__: An enumeration which specifies how the document should be laid out when displayed. It depends on the application with which the document is opened after it has been created whether this property is respected. 
            

* __Theme__: Specifies the theme which is applied to the document. The document theme enables you to specify colors, fonts and a variety of graphic effects which affect the look of the whole document. More information is available [here]({%slug radwordsprocessing-concepts-document-themes%}).
            

* __StyleRepository__: Represents the document' StyleRepository. The repository allows to add, remove or enumerate the styles of the document.
            

* __DefaultStyle__: The default styles that are used for __Paragraph__ and __Run__ elements. More information on default styles is available [here]({%slug radwordsprocessing-concepts-styles%}).
            

* __HasDifferentEvenOddPageHeadersFooters__: Gets or sets whether pages in this document should have different headers and footers for even and odd pages.
            

* __ListCollection__: Represents the collection of [Lists]({%slug radwordsprocessing-concepts-lists%}) in the document.
            

* __CommentCollection__: Represents the collection of [Comments]({%slug radwordsprocessing-model-comment%}) in the document.


* __ProtectionSettings:__ Corresponds to the settings that are used when the document is protected. More information is available [here]({%slug radwordsprocessing-model-permissionrange%}). 

* __DefaultTabStopWidth__: The distance between automatic [TabStops]({%slug radwordsprocessing-concepts-tabstop%}).

            

## Operating with a RadFlowDocument

There are different actions which you can execute with the help of the __RadFlowDocument__ element.
        

### Adding Sections

You can create a __RadFlowDocument__ from scratch and add Sections to it as follows:
            

#### __[C#] Example 2: Add a Section to a RadFlowDocument__

{{region cs-radwordsprocessing-model-radflowdocument_1}}
	RadFlowDocument document = new RadFlowDocument();
	document.Sections.AddSection();
{{endregion}}



The Sections property of the document is of type __SectionCollection__ and allows you to add sections to the document.
            

Alternatively, you could create a section by passing to its constructor the document it should be associated with.
            

#### __[C#] Example 3: Create a section__

{{region cs-radwordsprocessing-model-radflowdocument_2}}
	Section section = new Section(document);
{{endregion}}



### Merge with Another Document

You can merge a __RadFlowDocument__ within another document by using the __Merge()__ method and pass the source document as a parameter to it:
            

#### __[C#] Example 4: Merge documents__

{{region cs-radwordsprocessing-model-radflowdocument_3}}
	document.Merge(sourceDocument);
{{endregion}}



Additionally, you have the opportunity to specify the __MergeOptions__ which control the merge operation:
            

* __ConflictingStylesResolutionMode__: An enumeration specifying the mode used for resolving conflicts between styles with same IDs. The possible values for ConflictingStylesResolutionMode are:
                
    * __UseTargetStyle__: If a conflict between styles with the same IDs appears, the style of the __target__ document is used.
    * __RenameSourceStyle__: If a conflict between styles with the same IDs appears, the style of the __source__ document is renamed and used.
                    

#### __[C#] Example 5: Merge documents using MergeOptions__

{{region cs-radwordsprocessing-model-radflowdocument_4}}
	MergeOptions mergeOptions = new MergeOptions();
	mergeOptions.ConflictingStylesResolutionMode = ConflictingStylesResolutionMode.RenameSourceStyle;
	
	document.Merge(sourceDocument, mergeOptions);
{{endregion}}



### Update Fields

__RadFlowDocument__ exposes an __UpdateFields()__ method which allows you to update all fields in the document. More information about fields is available [here]({%slug radwordsprocessing-concepts-fields%}).
            

The snippet from __Example 6__ shows how all fields in a document can be updated simultaneously.
            

#### __[C#] Example 6: Update all fields in a document__

{{region cs-radwordsprocessing-model-radflowdocument_5}}
	document.UpdateFields();
{{endregion}}



## See Also

 * [RadFlowDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Styles]({%slug radwordsprocessing-concepts-styles%})
