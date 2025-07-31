---
title: StructureTree
description: The StructureTree class represents the root of the structure elements tree of the document in RadPdfProcessing offered by Telerik Document Processing libraries.
page_title: StructureTree
slug: radpdfprocessing-model-structure-tree
tags: fixeddocument, pdf, accessibility, structure, document, tree, fixed
published: True
position: 7
---

# StructureTree

|Version|**Q3 2025** (or newer)|
|----|----|

The **StructureTree** class represents the root of the structure elements tree of the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}). It offers a public **ChildElements** collection property allowing to add different StructureElements. 

## StructureElement

Represents a structure element in the document.

|Property|Description|
|----|----|
|**ID**|Gets or sets the unique identifier for the entity.|
|**ActualText**|Gets or sets the actual text of the structure element.|
|**AlternateDescription**|Gets or sets the alternate description of the structure element.|
|**Language**|Gets or sets the language of the structure element.|
|**StandardStructureType**|Gets the type of the structure element.|
|**CustomStructureType**|Gets the custom type of the structure element.|
|||


## Structure Tag Types

A set of standard structure types define the meaning of structure elements, such as paragraphs, headings, articles, and tables. The available options are:

|StructureTagType|Description|
|----|----|
|**None**|No specific structure tag type.|
|**Document**|A complete document. This is the root element of any structure tree containing multiple parts or multiple articles.|
|**Part**|A large-scale division of a document. This type of element is appropriate for grouping articles or sections.|
|**Article**|A relatively self-contained body of text constituting a single narrative or exposition. Articles should be disjoint; that is, they should not contain other articles as constituent elements.|
|**Section**| A container for grouping related content elements. For example, a section might contain a heading, several introductory paragraphs, and two or more other sections nested within it as subsections.|
|**Division**|A generic block-level element or group of elements.|
|**BlockQuote**|A portion of text consisting of one or more paragraphs attributed to someone other than the author of the surrounding text.|
|**Caption**|A brief portion of text describing a table or figure.|
|**TableOfContent**|An individual member of a table of contents.|
|**Index**|A sequence of entries containing identifying text accompanied by reference elements that point out occurrences of the specified text in the main body of a document.|
|**NonStruct**|A grouping element having no inherent structural significance; it serves solely for grouping purposes. This type of element differs from a division in that it is not interpreted or exported to other document formats; however, its descendants are to be processed normally.|
|**Private**|A grouping element containing private content belonging to the application producing it. The structural significance of this type of element is unspecified and is determined entirely by the producer application. Neither the Private element nor any of its descendants are to be interpreted or exported to other document formats.|
|**Paragraph**|Represents a paragraph element.|
|**Heading**|Represents a heading element.|
|**HeadingLevel1**|Represents a level 1 heading.|
|**HeadingLevel2**|Represents a level 2 heading.|
|**HeadingLevel3**|Represents a level 3 heading.|
|**HeadingLevel4**|Represents a level 4 heading.|
|**HeadingLevel5**|Represents a level 5 heading.|
|**HeadingLevel6**|Represents a level 6 heading.|
| **List**                 | Represents a list element.|
| **ListItem**             | Represents a list item element.|
| **ListLabel**            | Represents a list label element.|
| **ListBody**             | Represents a list body element.|
| **Table**                | Represents a table element.|
| **TableRow**             | Represents a table row element.|
| **TableHeader**          | Represents a table header element.|
| **TableData**            | Represents a table data element.|
| **TableHead**            | Represents a table head element.|
| **TableBody**            | Represents a table body element.|
| **TableFooter**          | Represents a table footer element.|
| **Span**                 | Represents a span element.|
| **Quotation**            | Represents a quotation element.|
| **Note**                 | Represents a note element.|
| **Reference**            | Represents a reference element.|
| **BibEntry**             | Represents a bibliographic entry element.|
| **Code**                 | Represents a code element.|
| **Link**                 | Represents a link element.|
| **Annotation**           | Represents an annotation element.|
| **Ruby**                 | Represents a ruby element.|
| **RubyBaseText**         | Represents the base text of a ruby element.|
| **RubyAnnotationText**   | Represents the annotation text of a ruby element.|
| **RubyPunctuation**      | Represents the punctuation of a ruby element.|
| **Warichu**              | Represents a warichu element.|
| **WarichuText**          | Represents the text of a warichu element.|
| **WarichuPunctuation**   | Represents the punctuation of a warichu element.|
| **Figure**               | Represents a figure element.|
| **Formula**              | Represents a formula element.|
| **Form**                 | Represents a form element.|


## See Also

* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) 
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [Marked Content]({%slug radpdfprocessing-model-marked-content%})