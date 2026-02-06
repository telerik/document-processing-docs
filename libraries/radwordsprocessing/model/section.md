---
title: Section
page_title: Section
slug: radwordsprocessing-model-section
tags: section
published: True
position: 2
---

# Section

__Section__ is a BlockContainer element which can contain other block elements. You can customize its layout through its properties.  

* [Inserting a Section](#inserting-a-section)

* [Modifying a Section](#modifying-a-section)

* [Operating with a Section](#operating-with-a-section)

## Inserting a Section

You can use the code snippet from __Example 1__ to create a __Section__ element and add it to a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}).
    

#### __Example 1: Create a section and add it to a RadFlowDocument__

<snippet id='codeblock-dr'/>


You can also use the __AddSection()__ method of the __Sections__ collection of a document. The method creates a new __Section__ element, adds it to the document and returns it.
        
#### __Example 2: Create a section and add it to a RadFlowDocument__

<snippet id='codeblock-ds'/>


## Modifying a Section

The __Section__ exposes several properties that allow you to customize the layout of the elements placed underneath it.
        
* __PageMargins__: Represents the margin towards the edges of the page.
            

	#### __Example 3: Change margins of a section__
	
	<snippet id='codeblock-dt'/>

* __PageOrientation__: Specifies whether the pages in the section should be in *Portrait* or in *Landscape* orientation. This property is used to determine the actual size of the paper to use on the printer and does not reflect document's visualization. In order to affect __Section__'s appearance you should change PageSize and PageMargin properties, or use the [Rotate method](#rotating-a-section), which will change them according to the desired page orientation.
            
	#### __Example 4: Change orienation of a section__
	
	<snippet id='codeblock-du'/>


* __PageSize__: Specifies the size of the pages in the section. The width and height are in device independent pixels (1/96 inch). The __PaperTypeConverter__ class and the [PaperTypes](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Model.PaperTypes.html) enumeration provide convenient API and predefined sizes out of the box.         
	
	#### __Example 5: Change page size of a section__
	
	<snippet id='codeblock-dv'/>


* __Headers and Footers__: Each __Section__ has three Headers and three Footers - __Default__ (used all through the section), __First__ (used on the first page of the section) and __Even__ (used on even pages of the document). The three Headers are contained in the Headers class accessible through the __Section.Headers__ property. The three Footers are contained in the Footers class accessible through the __Section.Footers__ property. __Example 6__ shows how you can create default Header.
            
	#### __Example 6: Create a header of a section__
	
	<snippet id='codeblock-dw'/>

* __HeaderTopMargin__: Gets or sets the top margin of the header. *The value is in device independent pixels (1/96 inch)*.

* __FooterBottomMargin__: Gets or sets the bottom margin of the footer. *The value is in device independent pixels (1/96 inch)*.

>tipMore information on how to work with the different types of headers and footer can be found in the [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%}) article.
              

* __SectionType__: Defines the section types:

    * __NextPage__: Specifies that the section starts on the next page.
    * __EvenPage__: Specifies that the section starts on the next even page.    
    * __OddPage__: Specifies that the section starts on the next odd page.    
    * __Continuous__: Specifies that the section starts on the same page.    
    * __NextColumn__: Specifies that the section starts on the next column on the page.
                
* __VerticalAlignment__: Defines the vertical alignment:

	* __Top__: Specifies the section layout is top aligned. This is the default value.	
	* __Bottom__: Specifies the section layout is bottom aligned.	
	* __Center__: Specifies the section layout is center aligned.	
	* __Justified__: Specifies the section layout is justified.


* __PageNumberingSettings__: Defines page numbering settings. You can modify the settings through the following properties:

	* __ChapterSeparatorCharacter__: Specifies the chapter separator character that shall appear between the chapter heading style index and the page number.	
	* __ChapterHeadingStyleIndex__: Specifies the index of the chapter heading style. The possible values are from 1 to 9 inclusive (Heading1, Heading2…).
	* __PageNumberFormat__: Specifies the number format for the page numbering in the current section.
	* __StartingPageNumber__: Specifies the starting page number which shall appear on the first page of the section. The possible values are 0 or greater.

* __Properties__: Gets all section properties as __SectionProperties__ object. More info on how to use section properties can be found in [ Style Properties]({%slug radwordsprocessing-concepts-style-properties%}) article.
            

## Operating with a Section

### Adding Elements to a Section

__Section__ derives [BlockContainerBase](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.BlockContainerBase.html), inheriting Blocks property of BlockCollection type. You can add [Paragraph]({%slug radwordsprocessing-model-paragraph%}) and [Table]({%slug radwordsprocessing-model-table%}) objects to that collection.
        

#### __Example 7: Add elements to a section__

<snippet id='codeblock-dx'/>


### Rotating a Section

The __Section__ can be rotated in order to visualize its pages in Portrait or Landscape mode.

#### __Example 8: Rotate a section__
<snippet id='codeblock-dy'/>

## See Also

 * [Section API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Section.html)
 * [Headers and Footers]({%slug radwordsprocessing-model-headers-footers%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [Table]({%slug radwordsprocessing-model-table%})
 * [Device Independent Pixels]({%slug device-independent-pixels%})
