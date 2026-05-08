---
title: Using MarkdownFormatProvider
description: Learn how to import and export RadFlowDocument instances to and from the Markdown (.md) format using the MarkdownFormatProvider in RadWordsProcessing.
page_title: Using MarkdownFormatProvider
slug: radwordsprocessing-formats-markdownformatprovider
tags: wordsprocessing, markdown, format, provider, import, export, md
published: True
position: 1
---

# Using MarkdownFormatProvider

The `MarkdownFormatProvider` allows you to import and export `RadFlowDocument` instances to and from the Markdown (`.md`) format. **RadWordsProcessing** includes a built-in Markdown parser and writer that supports the most common Markdown elements used in documentation and content authoring workflows.

The `MarkdownFormatProvider` is part of the **Telerik.Documents.Flow** assembly and is available from the `Telerik.Windows.Documents.Flow.FormatProviders.Md` namespace.

>note To use the `MarkdownFormatProvider`, reference the `Telerik.Documents.Flow` NuGet package (or `Telerik.Windows.Documents.Flow` for WPF).

## Supported Document Elements

The `MarkdownFormatProvider` supports the following document elements during import and export:

| Element | Import | Export |
|---|---|---|
| Headings (H1–H6) | Yes | Yes |
| Paragraphs | Yes | Yes |
| Bold and italic emphasis | Yes | Yes |
| Inline code | Yes | Yes |
| Strikethrough | Yes | Yes |
| Ordered and unordered lists | Yes | Yes |
| Blockquotes | Yes | Yes |
| Fenced code blocks | Yes | Yes |
| Tables | Yes | Yes |
| Hyperlinks | Yes | Yes |
| Images | Yes | Yes |
| Horizontal rules | Yes | Yes |

>important Markdown is a plain-text format. Document elements with no Markdown equivalent — such as fonts, colors, page size, margins, and headers and footers — are not preserved during export.

## Import

To import a Markdown file, create a `Telerik.Windows.Documents.Flow.FormatProviders.Md.MarkdownFormatProvider` instance and call its `Import` method with a `Stream` to the `.md` file.

#### Example 1: Import from a File

<snippet id='markdownformatprovider-import'/>

The provider parses the Markdown content and builds a `RadFlowDocument` with the corresponding paragraphs, headings, tables, and inline formatting. Inline elements such as bold, italic, code, and strikethrough are mapped to the equivalent character properties in the document model.

## Export

To export a `RadFlowDocument` to Markdown, create a `MarkdownFormatProvider` instance and call `Export`, passing the document and an output stream.

#### Example 2: Export to a File

<snippet id='markdownformatprovider-export'/>

The exporter traverses the document structure and writes the equivalent Markdown constructs. Heading styles are mapped to ATX-style heading markers (`#`–`######`), tables are rendered as GitHub-Flavored Markdown pipe tables, and lists are written with the appropriate indentation.

## See Also

* [Settings]({%slug radwordsprocessing-markdownformatprovider-settings%})

