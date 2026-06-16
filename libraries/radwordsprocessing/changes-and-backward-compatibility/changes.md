---
title: Changes
description: Review the new features and improvements introduced in RadWordsProcessing across releases with links to the relevant documentation articles.
page_title: Get familiar with the new functionality introduced in RadWordsProcessing.
slug: radwordsprocessing-changes
tags: changes, flow, releases, docx, word, document, features, new
published: True
position: 0
---

# Changes

The following sections summarize the new features introduced in the library. Each section includes links to the relevant documentation articles.

## What Is New in 2024 Q4

* Introduced timeout mechanism for import and export of documents. The new `Import` and `Export` methods for all format providers have a mandatory timeout parameter. For more information, see [Formats and Conversion]({%slug radwordsprocessing-formats-and-conversion%}).

## What Is New in 2014 Q3

**What Is New**

* Mail Merge support that you can use to generate documents from a template document (containing merge fields) and a data source. For more information, see [Mail Merge]({%slug radwordsprocessing-editing-mail-merge%}).
* Document Variables that let you define variables in the document and use document variable fields. For more information, see [Document Variables]({%slug radwordsprocessing-concepts-document-variables%}).
* Export of table styles to HTML.
* Import/export HTML preserving white spaces through non-breaking spaces.
* Import and export document theme to DOCX file format.
* Introduced lists export/import to HTML.

**What Is Fixed**

* Table border calculator does not work correctly for tables with empty rows.
* `Style` element is not correctly imported when it is outside the `head` element.
* Incorrect export of nested table elements.
* Converted `Border` class to immutable type.
* Importing empty string causes exception.
* `Class` attribute is exported when `ExportSettings.StylesExportMode` is `None`.
* `NullReferenceException` is thrown when `FieldResult` is empty string or null.
* Properties of paragraphs without `StyleId` are not exported when `StylesExportMode` is `Inline`.
* Importing HTML containing only an image causes exception.
* Line breaks are not exported to HTML.
* Underline is not exported to HTML.
* `HtmlFormatProvider` crashes when html element is present in the body.
* Support for negative indent.
* Table column widths are not respected when importing from HTML and exporting to DOCX.
* Importing from HTML imports table borders as inside borders.
* `StyleProperty.GetActualValue()` throws exception when style is not added to a document.
* `RestartAfterLevel` property in `ListLevel` class has inappropriate default value.
* `RestartAfterLevel` does not work correctly when exported to RTF format.
* Style applied to div is applied over paragraphs after the div.
* Exporting to HTML document containing hyperlink with `StylesExportMode` `Inline` causes exception.
* When importing from HTML, paragraph style is not respected.
* Default font size is not exported correctly to RTF.

## What Is New in 2014 Q2

* [HTML Import/Export]({%slug radwordsprocessing-formats-and-conversion-html%})
* [Lists]({%slug radwordsprocessing-concepts-lists%})
* [Break]({%slug radwordsprocessing-model-break%})
* [Bookmark]({%slug radwordsprocessing-model-bookmark%})
* [Comment]({%slug radwordsprocessing-model-comment%})
