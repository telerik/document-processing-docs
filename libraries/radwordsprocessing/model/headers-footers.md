---
title: Headers and Footers
description: Learn how to insert and configure headers and footers in sections of RadWordsProcessing flow documents.
page_title: Headers and Footers
slug: radwordsprocessing-model-headers-footers
tags: headers, footers, word, docx, document, flow, model, sections, pages
published: True
position: 10
---

# Headers and Footers

`Header` and `Footer` elements are block-container elements. They can contain tables and paragraphs. Each [Section]({%slug radwordsprocessing-model-section%}) contains three `Header` and three `Footer` instances.

* [Inserting Header/Footer](#inserting-headerfooter)
* [Operating with Headers and Footers](#operating-with-headers-and-footers)

## Inserting Header/Footer

Headers and footers are properties of the `Section` element and each section can have the following types of headers and footers:

| Type | Description |
|---|---|
| `Default` | Default header/footer for the section pages. |
| `First` | Used on the first page of the section. |
| `Even` | Used on even-numbered pages of the section. |

>Visualization of headers and footers is additionally affected by the following properties:
>
> * `RadFlowDocument.HasDifferentEvenOddPageHeadersFooters`: If set to `true`, the **Even** header/footer is used for even document pages. If set to `false` (which is the default), the **Even** header/footer is not respected.
>
> * `Section.HasDifferentFirstPageHeaderFooter`: If set to `true`, the **First** header/footer is used for the first page of the section. If set to `false` (which is the default), the **First** header/footer is not respected.
>
> * `Section.HeaderTopMargin`: Gets or sets the top margin of the header. The value is in device independent pixels (1/96 inch).
>
> * `Section.FooterBottomMargin`: Gets or sets the bottom margin of the footer. The value is in device independent pixels (1/96 inch).

You can create headers of all `HeaderFooterType` types using the code snippet in **Example 1**:

**Example 1: Create a Header**

<snippet id='codeblock-clcl'/>

You can create footers using the code snippet from **Example 2**:

**Example 2: Create a Footer**

<snippet id='codeblock-cmcm'/>

>The `Parent` property of `Header` and `Footer` contains a reference to the `Section` from which it is obtained.

## Operating with Headers and Footers

You can obtain the headers and footers in a section through the `Default`, `Even`, and `First` properties of its `Headers` or `Footers` property. For example, if you want to get the default `Header` element of a `Section` element, you can use the following line of code:

**Example 3: Get the Default Header of a Section**

<snippet id='codeblock-cncn'/>

Similarly to the `Header`, you can obtain the `Footer` element as follows:

**Example 4: Get the Default Footer of a Section**

<snippet id='codeblock-coco'/>

>If a header or footer of a particular type is not added, the value of the corresponding property is `null`.

**Example 5** demonstrates how to add different headers for odd and even pages:

**Example 5: Add Headers for Even and Odd Pages**

<snippet id='codeblock-cpcp'/>

### Linking Headers/Footers to Previous Section Headers/Footers

When visualizing flow documents, applications may apply additional rules for evaluating the header/footer that appears on a particular page. If a header/footer of a given type is omitted for a section, the previous section provides it (also known as "linked to previous"). If this is the first section, a blank header/footer is used.

For example, if a document with two sections is created and the `Default`, `Even`, and `Odd` properties are set to headers (footers) only for the first section, the second section is visualized with the same set of headers (footers). If you want to set blank headers (footers) for a given section, set them to blank headers (footers) explicitly.

### Adding Watermarks to Header

Elements of type `Header` have a property corresponding to a collection of watermarks—`Watermarks`. The property allows you to add a `Watermark` to the specific header with the `Add()` method.

Information on the types of watermarks and their use is available in the [Watermark]({%slug radwordsprocessing-concepts-watermark%}) help article.

### Adding Fields to Header/Footer

You can add PAGE, DATE, or other fields to the headers and footers of a document. For more information, refer to the [Fields]({%slug radwordsprocessing-concepts-fields%}) help topic.

## See Also

* [HeaderFooterBase API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.HeaderFooterBase.html)
* [Document Model]({%slug radwordsprocessing-model%})
* [Section]({%slug radwordsprocessing-model-section%})
* [Watermark]({%slug radwordsprocessing-concepts-watermark%})
* [Draw Header/Footer in RadFixedDocument](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/DrawHeaderFooter)
* [Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing]({%slug customize-headers-pdf-radwordsprocessing%})
