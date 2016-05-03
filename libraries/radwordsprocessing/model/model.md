---
title: Model Overview
page_title: Model
description: Model
slug: radwordsprocessing-model
tags: model
published: True
position: 0
---

# Model



[RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) describes flow document (document designed to dynamically adjust its layout according to the available size). This article explains in details the structure of __RadFlowDocument__'s document model.
      

## Document Elements

__RadFlowDocument__ can contain various types of document elements, all of them inheriting the [DocumentElementBase ](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Flow_Model_DocumentElementBase.htm) abstract class. The hierarchy is presented in the following diagram, where abstract classes are denoted in blue:      
  
![Rad Words Processing Model 04](images/RadWordsProcessing_Model_04.png)

Every document element is associated with an instance of __RadFlowDocument__ since its creation. This link is permanent and attempts to move document elements from one document to another result in exception; [cloning]({%slug radwordsprocessing-editing-clone-and-merge%}) can be used instead to create deep copy of an element associated to another instance of RadFlowDocument. Current associated document is stored in the [Document](http://docs.telerik.com/devtools/document-processing/api/html/P_Telerik_Windows_Documents_Flow_Model_DocumentElementBase_Document.htm) property.
        

## Composition of Document Elements

__RadFlowDocument__ represents a tree of document elements containing each other through a set of properties and collections. Possible containments are described in the following diagram, where document elements are denoted in black, collections in orange, and properties in green:
![Rad Words Processing Model 05](images/RadWordsProcessing_Model_05.png)

* RadFlowDocument contains collection of [Sections](http://docs.telerik.com/devtools/document-processing/api/html/P_Telerik_Windows_Documents_Flow_Model_RadFlowDocument_Sections.htm).
            

* [Section]({%slug radwordsprocessing-model-section%}) contains collection of [Blocks](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Flow_Model_BlockBase.htm) (Paragraphs and Tables), as well as three Headers and three Footers – one default, one for even pages and one for first section page.
            

* [Paragraph]({%slug radwordsprocessing-model-paragraph%}) contains collection of [Inlines](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Flow_Model_InlineBase.htm) – [Runs]({%slug radwordsprocessing-model-run%}), [ImageInlines]({%slug radwordsprocessing-model-imageinline%}), [FloatingImages]({%slug radwordsprocessing-model-floatingimage%}) and [FieldCharacters]({%slug radwordsprocessing-model-fieldcharacter%}).
            

* [Table]({%slug radwordsprocessing-model-table%}) contains collection of TableRows.
            

* [TableRow]({%slug radwordsprocessing-model-tablerow%})  contains collection of TableCells.
            

* [TableCell]({%slug radwordsprocessing-model-tablecell%}) contains collection of Blocks.
            

* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) contain collection of Blocks.
            

### Common ways for traversing the links between document elements

Relationships between document elements can be additionally traversed using:
            

* [Parent](http://docs.telerik.com/devtools/document-processing/api/html/P_Telerik_Windows_Documents_Flow_Model_DocumentElementBase_Parent.htm) property. This property contains reference to document's parent and is automatically set when element is added/removed as a child of another element.
                

* [EnumerateChildrenOfType<T>](http://docs.telerik.com/devtools/document-processing/api/html/M_Telerik_Windows_Documents_Flow_Model_DocumentElementBase_EnumerateChildrenOfType__1.htm) method. This method can be used to recursively traverse document tree and return all children of given type __T__.
                

# See Also

 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [RadFlowDocument API Reference](http://docs.telerik.com/devtools/document-processing/api/html/T_Telerik_Windows_Documents_Flow_Model_RadFlowDocument.htm)
 * [Clone and Merge]({%slug radwordsprocessing-editing-clone-and-merge%})
