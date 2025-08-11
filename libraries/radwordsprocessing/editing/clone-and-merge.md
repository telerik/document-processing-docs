---
title: Clone and Merge
page_title: Clone and Merge
slug: radwordsprocessing-editing-clone-and-merge
tags: clone,and,merge
published: True
position: 0
---

# Clone and Merge



* [Merging Documents](#merging-documents)

* [Cloning RadFlowDocument](#cloning-radflowdocument)

* [Cloning Document Elements](#cloning-document-elements)

* [Cloning Other Objects](#cloning-other-objects)

## Merging Documents

__RadWordsProcessing__ allows you to merge two __RadFlowDocument__ instance using the __Merge()__ method overloads. The document to which you wish to add content is called *target* and the document from which you wish to take the content is called *source*.
        

#### __[C#] Example 1: Merge two instances of RadFlowDocument__

{{region cs-radwordsprocessing-editing-clone-and-merge_0}}            
	RadFlowDocument targetDocument;
	RadFlowDocument sourceDocument;
          
	DocxFormatProvider docxFormatProvider = new DocxFormatProvider();

	byte[] targetByteArray = File.ReadAllBytes("targetDocument.docx");
	byte[] sourceByteArray = File.ReadAllBytes("sourceDocument.docx");

	targetDocument = docxFormatProvider.Import(targetByteArray, TimeSpan.FromSeconds(10));
	sourceDocument = docxFormatProvider.Import(sourceByteArray, TimeSpan.FromSeconds(10));

	// targetDocument will contain merged content and styles. 
	targetDocument.Merge(sourceDocument);
{{endregion}}



The Merge method performs two distinct operations:
        

* Adds all sections from the source document into the target document. The sections from the source document are inserted at the end of the target document.

* Adds all styles from the source StyleRepository to the target StyleRepository.
            

The __MergeOptions__ parameter can be passed as an argument to the __Merge()__ method to better control the merge process. It provides the following customization options:

* __ConflictingStylesResolutionMode__: This option controls how conflicts between styles in target and source style repositories are resolved. Styles are in conflict when they have the same ID (__Style.Id__). Possible values are:

    * __UseTargetStyle__: In case of conflict, the style from the target document stays in the target repository and the style from the source document is not added to the target repository.

    * __RenameSourceStyle__: In case of conflict, the style from the target document stays in the target repository and the style from the source document is added to the target repository with changed ID (with "_1" suffix).
                

__Example 2__ shows how to merge documents by specifying the __MergeOptions__ parameter.
        

#### __[C#] Example 2: Merge documents with MergeOptions__

{{region cs-radwordsprocessing-editing-clone-and-merge_1}}
	            
	RadFlowDocument targetDocument;
	RadFlowDocument sourceDocument;
	//...
	MergeOptions mergeOptions = new MergeOptions()
	{
	    ConflictingStylesResolutionMode = ConflictingStylesResolutionMode.RenameSourceStyle
	};
	targetDocument.Merge(sourceDocument, mergeOptions);
{{endregion}}


>tip You could insert one document into another at a specified position using the InsertDocument() method of **RadFlowDocumentEditor**. More information is available [here]({%slug radwordsprocessing-editing-insert-documents%}).

## Cloning RadFlowDocument

__RadFlowDocument__ provides a __Clone()__ method, which creates a deep copy of the whole document structure, including all document elements and styles:
        

#### __[C#] Example 3: Clone a RadFlowDocument__

{{region cs-radwordsprocessing-editing-clone-and-merge_2}}
	        
	RadFlowDocument clonedDocument = document.Clone();
{{endregion}}



## Cloning Document Elements

You can create a deep copy of most of the document elements using the __Clone()__ method overloads. Below is a list of document elements that provide such methods:
        

* __RadFlowDocument__
* __Section__
* __Paragraph__
* __Run__
* __Table__
* __TableRow__
* __TableCell__
* __ImageInline__
* __FloatingImage__

The __Clone()__ method has two overloads:

* __Clone()__: Creates a deep copy of the document element and associates it with the same document.
            
* __Clone(RadFlowDocument)__: Creates a deep copy of the element and associates it with the provided __RadFlowDocument__. This allows cloned elements to be added to the element tree of the provided RadFlowDocument at a later time and is convenient if you want to "move" an element from one document to another.
            

#### __[C#] Example 4: Clone a section__

{{region cs-radwordsprocessing-editing-clone-and-merge_3}}
	Section clonedSection = section.Clone(radFlowDocument);
{{endregion}}

>tip With the **DocumentElementImporter** class you can import a document element from one document (source) and insert it into another (target). For more details, check [this article]({%slug radwordsprocessing-editing-import-document-element%}).


## Cloning Other Objects

The following styling objects also implement the __Clone()__ method, which can be used to create deep copies of them:


* __Style__
* __List__
* __ListLevel__
* __Watermark__


## See Also

 * [Document model]({%slug radwordsprocessing-model%})
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
