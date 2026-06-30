---
title: Using NumberingFieldsProvider
description: Learn how to use the NumberingFieldsProvider in RadWordsProcessing to calculate field values such as total page numbers during document layout.
page_title: Using NumberingFieldsProvider
slug: radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider
tags: numbering, word, flow, docx, fields, pages, layout, provider, document, calculation
published: True
position: 20
---

# Using NumberingFieldsProvider

The `NumberingFieldsProvider` calculates the layout of the document. This is necessary when updating field values, for example, to calculate the total number of pages.

## Requirements

To use the default implementation of the `NumberingFieldsProvider`, reference the `Telerik.Documents.Flow.FormatProviders.Pdf` package.

## Setting the Default Implementation

Set the default provider with the following code:

**Example 1: Register the default NumberingFieldsProvider**

<snippet id='libraries-flow-concepts-fields-numbering-fields-provider-1'/>

## Using the RegisterNumberingStyleConverter

The `RegisterNumberingStyleConverter` method allows you to register a custom numbering style converter.

**Example 2: Register a custom NumberingStyleConverter**

<snippet id='libraries-flow-concepts-fields-numbering-fields-provider-2'/>

The `NumberingStyleConverter` must implement the `INumberingStyleConverter` interface. This interface has one method that takes a number and converts it to a string.

## See Also

* [Updating TOC Page Numberings in Word Documents Before Exporting to DOCX Format]({%slug update-toc-radwordsprocessing-before-docx-export%})

