---
title: Section
description: Learn about the Section block container element in RadWordsProcessing and how to configure its layout properties.
page_title: Section
slug: radwordsprocessing-model-section
tags: section, word, docx, document, flow, model, layout, headers, footers
published: True
position: 2
---

# Section

`Section` is a `BlockContainer` element that can contain other block elements. You can customize its layout through its properties.

* [Inserting a Section](#inserting-a-section)
* [Modifying a Section](#modifying-a-section)
* [Operating with a Section](#operating-with-a-section)

## Inserting a Section

You can use the code snippet from **Example 1** to create a `Section` element and add it to a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}).

**Example 1: Create a Section and add it to a RadFlowDocument manually**

<snippet id='codeblock-dr'/>


You can also use the `AddSection()` method of the `Sections` collection of a document. The method creates a new `Section` element, adds it to the document, and returns it.

**Example 2: Create and add a Section with the AddSection helper method**

<snippet id='codeblock-ds'/>


## Modifying a Section

The `Section` exposes several properties that allow you to customize the layout of the elements placed underneath it.

* `PageMargins`: Represents the margin towards the edges of the page.

	**Example 3: Set explicit page margins for a section**
	
	<snippet id='codeblock-dt'/>

* `PageOrientation`: Specifies whether the pages in the section are in `Portrait` or in `Landscape` orientation. This property determines the actual size of the paper to use on the printer and does not reflect the document visualization. To affect the `Section` appearance, change the `PageSize` and `PageMargin` properties, or use the [Rotate method](#rotating-a-section), which changes them according to the desired page orientation.

	**Example 4: Change a section to landscape orientation**
	
	<snippet id='codeblock-du'/>


* `PageSize`: Specifies the size of the pages in the section. The width and height are in device independent pixels (1/96 inch). The `PaperTypeConverter` class and the [PaperTypes](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Model.PaperTypes.html) enumeration provide a convenient API and predefined sizes.
	
	**Example 5: Set the section page size to A4**
	
	<snippet id='codeblock-dv'/>


* **Headers and Footers**: Each `Section` has three Headers and three Footers—**Default** (used all through the section), **First** (used on the first page of the section), and **Even** (used on even pages of the document). The three Headers are contained in the `Headers` class accessible through the `Section.Headers` property. The three Footers are contained in the `Footers` class accessible through the `Section.Footers` property. **Example 6** shows how to create a default Header.

	**Example 6: Create a default header with right-aligned sample text**
	
	<snippet id='codeblock-dw'/>

* `HeaderTopMargin`: Gets or sets the top margin of the header. The value is in device independent pixels (1/96 inch).

* `FooterBottomMargin`: Gets or sets the bottom margin of the footer. The value is in device independent pixels (1/96 inch).

>tip For more information on how to work with the different types of headers and footers, refer to the [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) article.

* `SectionType`: Defines the section types:

    * `NextPage`: Specifies that the section starts on the next page.
    * `EvenPage`: Specifies that the section starts on the next even page.
    * `OddPage`: Specifies that the section starts on the next odd page.
    * `Continuous`: Specifies that the section starts on the same page.
    * `NextColumn`: Specifies that the section starts on the next column on the page.

* `VerticalAlignment`: Defines the vertical alignment:

	* `Top`: Specifies the section layout is top aligned. This is the default value.
	* `Bottom`: Specifies the section layout is bottom aligned.
	* `Center`: Specifies the section layout is center aligned.
	* `Justified`: Specifies the section layout is justified.


* `PageNumberingSettings`: Defines page numbering settings. You can modify the settings through the following properties:

	* `ChapterSeparatorCharacter`: Specifies the chapter separator character that appears between the chapter heading style index and the page number.
	* `ChapterHeadingStyleIndex`: Specifies the index of the chapter heading style. The possible values are from 1 to 9 inclusive (Heading1, Heading2, and so on).
	* `PageNumberFormat`: Specifies the number format for the page numbering in the current section.
	* `StartingPageNumber`: Specifies the starting page number that appears on the first page of the section. The possible values are 0 or greater.

* `Properties`: Gets all section properties as a `SectionProperties` object. For more information on how to use section properties, refer to the [Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.


## Operating with a Section

### Adding Elements to a Section

`Section` derives from [BlockContainerBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html), inheriting the `Blocks` property of `BlockCollection` type. You can add [Paragraph]({%slug radwordsprocessing-model-paragraph%}) and [Table]({%slug radwordsprocessing-model-table%}) objects to that collection.

**Example 7: Add a paragraph and a table to a section block collection**

<snippet id='codeblock-dx'/>


### Rotating a Section

You can rotate the `Section` to visualize its pages in Portrait or Landscape mode.

**Example 8: Rotate a section to landscape with the Rotate method**

<snippet id='codeblock-dy'/>

## See Also

* [Section API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Section.html)
* [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [Table]({%slug radwordsprocessing-model-table%})
* [Device Independent Pixels]({%slug device-independent-pixels%})
