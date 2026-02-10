---
title: Headers and Footers
page_title: Headers and Footers
slug: radwordsprocessing-model-headers-footers
tags: headers,and,footers
published: True
position: 10
---

# Headers and Footers

__Header__ and __Footer__ elements are block-container elements, i.e. they can contain Tables and Paragraphs. Each [Section]({%slug radwordsprocessing-model-section%}) contains three Header and three Footer instances.

* [Inserting Header Footer](#inserting-header/footer)

* [Operating with Headers and Footers ](#operating-with-headers-and-footers)

## Inserting Header/Footer

Headers and Footers are properties of the __Section__ element and each Section can have the following types of Headers and Footers:
        

* __Default__: Default header/footer for the __Section__ pages.
* __First__: Used on the first page of the __Section__.
* __Even__: Used on even numbered pages of the __Section__.
            

>Visualization of headers and footers is additionally affected by the following properties:
>
> * __RadFlowDocument.HasDifferentEvenOddPageHeadersFooters__: If set to true, __Even__ header/footer is used for even document pages. If set to false (which is the default), __Even__ header/footer is not respected.
>
> * __Section.HasDifferentFirstPageHeaderFooter__: If set to true, __First__ header/footer is used for the first page of the section. If set to false (which is the default), __First__ header/footer is not respected.
>
> * __Section.HeaderTopMargin__: Gets or sets the top margin of the header. The value is in device independent pixels (1/96 inch).
>
> * __Section.FooterBottomMargin__: Gets or sets the bottom margin of the footer. The value is in device independent pixels (1/96 inch).
              

Headers of all __HeaderFooterType__ types can be created using the code snippet in __Example 1__:
        

#### __Example 1: Create a header__

<snippet id='codeblock-clcl'/>



Footers can be created using the code snippet from __Example 2__:
        

#### __Example 2: Create a footer__

<snippet id='codeblock-cmcm'/>



>The __Parent__ property of __Header__ and __Footer__ contains reference to the __Section__ from which it is obtained.
          

## Operating with Headers and Footers

You can obtain the Headers and Footers in a Section through the __Default__, __Even__ and __First__ properties of its __Headers__ or __Footers__ property. For example, if you want to get the default Header element of a Section element, you can use the following line of code:
        

#### __Example 3: Get the default header of a section__

<snippet id='codeblock-cncn'/>



Similarly to the Header, the Footer element can be obtained as follows:
        

#### __Example 4: Get the default footer of a section__

<snippet id='codeblock-coco'/>



>If header or footer of particular type is not added, the value of the corresponding property is __Null__.
          

__Example 5__ demonstrates how to add different headers for odd and even pages:
        

#### __Example 5: Add headers for even and odd pages__

<snippet id='codeblock-cpcp'/>



### Linking Headers/Footers to Previous Section Headers/Footers

When visualizing flow documents, applications may apply additional rules for evaluating the header/footer, which should be presented on a particular page. If header/footer of given type is omitted for a __Section__, it is inherited from the previous section (also known as "linked to previous"), or – if this is the first section – blank header/footer is used.
            

For example, if a document with two sections is created and __Default__, __Even__ and __Odd__ properties are set to headers (footers) only for the first section, the second section is visualized with the same set of headers (footers). If you want to explicitly set blank headers (footers) for a given section, you should explicitly set them to blank headers (footers).
            

### Adding Watermarks to Header

Elements of type __Header__ have a property corresponding to a collection of watermarks - __Watermarks__. The property provides the ability to add a __Watermark__ to the specific header with the __Add()__ method.

Information on the types of watermarks and their use is available in the [Watermark]({%slug radwordsprocessing-concepts-watermark%}) help article.


### Adding Fields to Header/Footer

You can add PAGE, DATE or other fields to the headers and footers of a document. For more information on how to do that, check the [Fields]({%slug radwordsprocessing-concepts-fields%}) help topic.


## See Also

 * [HeaderFooterBase API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.HeaderFooterBase.html)
 * [Document model]({%slug radwordsprocessing-model%})
 * [Section]({%slug radwordsprocessing-model-section%})
 * [Watermark]({%slug radwordsprocessing-concepts-watermark%})
 * [Draw Header/Footer in RadFixedDocument](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/DrawHeaderFooter)
 * [Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing]({%slug customize-headers-pdf-radwordsprocessing%})
