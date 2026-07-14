---
title: Model Overview
description: Overview of the RadFlowDocument document model structure in RadWordsProcessing, including sections, paragraphs, runs, tables, and other flow elements.
page_title: Model
slug: radwordsprocessing-model
tags: model, word, flow, docx, document, sections, paragraphs, overview, structure
published: True
position: 0
---

# Model

[RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) describes a flow document (a document designed to dynamically adjust its layout according to the available size). This article explains in detail the structure of the `RadFlowDocument` document model.

## Document Elements

`RadFlowDocument` can contain various types of document elements, all of them inheriting the [DocumentElementBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.DocumentElementBase.html) abstract class. The hierarchy is presented in the following diagram, where abstract classes are denoted in blue:

![Inheritance diagram for the RadWordsProcessing document model showing DocumentElementBase as the root, with BlockContainerBase, BlockBase, and InlineBase leading to sections, paragraphs, tables, runs, image elements, field characters, bookmarks, comments, and permission range markers](images/RadWordsProcessing_Model_04.png)

Every document element is associated with an instance of `RadFlowDocument` since its creation. This link is permanent, and attempts to move document elements from one document to another result in an exception. Use [cloning]({%slug radwordsprocessing-editing-clone-and-merge%}) to create a deep copy of an element associated to another instance of `RadFlowDocument`. The current associated document is stored in the [Document](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.DocumentElementBase.html#collapsible-Telerik_Windows_Documents_Flow_Model_DocumentElementBase_Document) property.

## Composition of Document Elements

`RadFlowDocument` represents a tree of document elements containing each other through a set of properties and collections. Possible containments are described in the following diagram, where document elements are denoted in black, collections in orange, and properties in green:
![Containment diagram for the RadWordsProcessing document model showing RadFlowDocument containing sections, sections containing blocks and header or footer collections, paragraphs containing inline elements and annotation ranges, and tables containing rows and cells](images/RadWordsProcessing_Model_05.png)

* `RadFlowDocument` contains a collection of [Sections](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html#collapsible-Telerik_Windows_Documents_Flow_Model_RadFlowDocument_Sections).

* [Section]({%slug radwordsprocessing-model-section%}) contains a collection of [Blocks](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockBase.html) (Paragraphs and Tables), as well as three Headers and three Footers—one default, one for even pages, and one for the first section page.

* [Paragraph]({%slug radwordsprocessing-model-paragraph%}) contains a collection of [Inlines](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.InlineBase.html)—[Runs]({%slug radwordsprocessing-model-run%}), [ImageInlines]({%slug radwordsprocessing-model-imageinline%}), [FloatingImages]({%slug radwordsprocessing-model-floatingimage%}), and [FieldCharacters]({%slug radwordsprocessing-model-fieldcharacter%}).

* [Table]({%slug radwordsprocessing-model-table%}) contains a collection of `TableRow` elements.

* [TableRow]({%slug radwordsprocessing-model-tablerow%}) contains a collection of `TableCell` elements.

* [TableCell]({%slug radwordsprocessing-model-tablecell%}) contains a collection of Blocks.

* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) contain a collection of Blocks.

### Common Ways to Traverse the Links Between Document Elements

You can also traverse relationships between document elements using:

* [Parent](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.DocumentElementBase.html#collapsible-Telerik_Windows_Documents_Flow_Model_DocumentElementBase_Parent) property—This property contains a reference to the element's parent and is automatically set when an element is added or removed as a child of another element.

* [EnumerateChildrenOfType&lt;T&gt;](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.DocumentElementBase.html#collapsible-Telerik_Windows_Documents_Flow_Model_DocumentElementBase_EnumerateChildrenOfType__1) method—This method recursively traverses the document tree and returns all children of the given type `T`.

## See Also

* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [RadFlowDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.RadFlowDocument.html)
* [Clone and Merge]({%slug radwordsprocessing-editing-clone-and-merge%})
