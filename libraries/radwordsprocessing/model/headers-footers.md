---
title: Headers and Footers
description: Learn how headers and footers work in RadWordsProcessing sections, how to create them, and how to control first, even, and default page behavior.
page_title: Headers and Footers in RadWordsProcessing
slug: radwordsprocessing-model-headers-footers
tags: headers, footers, word, docx, document, flow, model, sections, pages
published: True
position: 10
---

# Headers and Footers

`Header` and `Footer` elements are block containers in the RadWordsProcessing document model, so they can contain paragraphs and tables. Each [Section]({%slug radwordsprocessing-model-section%}) exposes three header slots and three footer slots that let you define different content for the first page, even pages, and the default page flow.

Use this article to understand the available header and footer types, how section settings affect them, and how to create, retrieve, and reuse them in a flow document.

## Available Types

Headers and footers are properties of a `Section`. Each section can define these header and footer types:

| Type | Description |
|---|---|
| `Default` | Used for the section pages unless a more specific first-page or even-page header or footer applies. |
| `First` | Used only on the first page of the section. |
| `Even` | Used on even-numbered pages of the section when even and odd headers or footers are enabled. |

## Which Settings Control Header and Footer Output

The header or footer that appears on a page depends on both the content you assign and the section-level settings that enable specific variants:

* `RadFlowDocument.HasDifferentEvenOddPageHeadersFooters` controls whether the `Even` header and footer are used for even-numbered document pages.
* `Section.HasDifferentFirstPageHeaderFooter` controls whether the `First` header and footer are used on the first page of the section.
* `Section.HeaderTopMargin` sets the top margin for the header area in device-independent pixels, where `96` pixels equal `1` inch.
* `Section.FooterBottomMargin` sets the bottom margin for the footer area in device-independent pixels.

If the even and odd setting is `false`, the section ignores the `Even` header and footer. If the first-page setting is `false`, the section ignores the `First` header and footer.

## Inserting Header/Footer

Create headers and footers through the section properties for the required `HeaderFooterType`.

Use the following example to create a header:

### Example: Create a header

<snippet id='libraries-flow-model-headers-footers-1'/>

Use the following example to create a footer:

### Example: Create a footer

<snippet id='libraries-flow-model-headers-footers-2'/>

>note The `Parent` property of `Header` and `Footer` contains a reference to the `Section` from which the object is obtained.

## Operating with Headers and Footers

You can access the headers and footers of a section through the `Default`, `Even`, and `First` properties of the section `Headers` and `Footers` collections.

The following example gets the default header of a section:

### Example: Get the default header of a section

<snippet id='libraries-flow-model-headers-footers-3'/>

The following example gets the default footer of a section:

### Example: Get the default footer of a section

<snippet id='libraries-flow-model-headers-footers-4'/>

>note If a header or footer of a given type is not added, the corresponding property value is `null`.

The following example adds different headers for odd and even pages:

### Example: Add headers for even and odd pages

<snippet id='libraries-flow-model-headers-footers-5'/>

### Linking Headers/Footers to Previous Section Headers/Footers

When a section omits a header or footer of a given type, applications that visualize the flow document can inherit that header or footer from the previous section. This behavior is commonly described as linked to previous. If the document has no previous section, a blank header or footer is used instead.

For example, if a document has two sections and only the first section defines the `Default`, `Even`, and `First` headers or footers, the second section can render with the same content. If you want the second section to display blank headers or footers, assign explicit blank header or footer content for that section.

### Adding Watermarks to Header

`Header` elements expose a `Watermarks` collection. Use its `Add()` method to add a `Watermark` to a specific header instance.

For more information about supported watermark types and usage patterns, see [Watermark]({%slug radwordsprocessing-concepts-watermark%}).

## Adding Fields to Header/Footer

You can add `PAGE`, `DATE`, and other fields to headers and footers so the content updates automatically as the document changes. For implementation details, see [Fields]({%slug radwordsprocessing-concepts-fields%}).

## See Also

* [HeaderFooterBase API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.HeaderFooterBase.html)
* [Document model]({%slug radwordsprocessing-model%})
* [Section]({%slug radwordsprocessing-model-section%})
* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [Watermark]({%slug radwordsprocessing-concepts-watermark%})
* [Draw Header/Footer in RadFixedDocument](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/DrawHeaderFooter)
* [Create headers with left, center, and right text or images in exported PDF documents]({%slug customize-headers-pdf-radwordsprocessing%})
