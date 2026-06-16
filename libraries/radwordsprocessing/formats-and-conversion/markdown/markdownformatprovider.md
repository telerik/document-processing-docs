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

The `MarkdownFormatProvider` allows you to import and export [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) instances to and from the Markdown (`.md` and `.markdown`) format. **RadWordsProcessing** includes a built-in Markdown parser and writer that supports the most common Markdown elements used in documentation and content authoring workflows.

>note To use the `MarkdownFormatProvider`, install the `Telerik.Documents.Flow` NuGet package for .NET Standard and .NET (Target OS: None) or `Telerik.Windows.Documents.Flow` for .NET Framework and .NET (Target OS: Windows).

## Supported Document Elements

The `MarkdownFormatProvider` supports the following document elements during import and export:

### Block-level Elements

| Element | Notes |
|---|---|
| Headings (H1–H6) | ATX (`# Heading`) and Setext (`===` / `---`) styles configurable via `ExportSettings.HeadingStyle` |
| Paragraphs | Standard CommonMark paragraphs |
| Thematic break / horizontal rule | `---`, `***`, `___` |
| Fenced code blocks | With optional language info string; fence char configurable via `ExportSettings.CodeFenceStyle` |
| Indented code blocks | Four-space or tab-indented content |
| Block quotes | Nested block quotes supported up to 21 levels |
| Bullet lists | Tight and loose lists |
| Ordered lists | Both `.` and `)` terminators |
| Task lists (GFM) | `[ ]` unchecked / `[x]` checked |
| GFM pipe tables | With column alignment; configurable via `ExportSettings.TableExport` (`GfmPipe` or `Skip`) |
| Raw HTML blocks | Preserved verbatim on round-trip |
| YAML frontmatter | Delimited by `---` at document start; preserved verbatim |

### Inline Elements

| Element | Notes |
|---|---|
| Plain text |text |
| **Bold** | `**text**` |
| *Italic* | `*text*` |
| ***Bold italic*** | `***text***` |
| ~~Strikethrough~~ (GFM) | `~~text~~` |
| `Inline code span` | Backtick delimited; also applied to Runs using monospace fonts (configurable via `ExportSettings.MonospaceFontNames`) |
| Hyperlinks | `[text](url)` inline links |
| Inline images | `![alt](src)` configurable via `ExportSettings.ImageExport` (`Inline` or `Skip`) |
| Floating images | Exported as inline `![alt](src)` |
| Hard line break | Two trailing spaces or `\` at end of line |

>important Markdown is a plain-text format. Document elements with no Markdown equivalent, such as fonts, colors, page size, margins, and headers and footers, are not preserved during export.

## Import

To import a Markdown file, create a `MarkdownFormatProvider` instance and call its `Import` method with a `Stream` to the `.md` file.

**Example 1: Import from a File**

<snippet id='markdownformatprovider-import'/>

The provider parses the Markdown content and builds a `RadFlowDocument` with the corresponding paragraphs, headings, tables, and inline formatting. The provider maps inline elements such as bold, italic, code, and strikethrough to the equivalent character properties in the document model.

## Export

To export a `RadFlowDocument` to Markdown, create a `MarkdownFormatProvider` instance and call `Export`, passing the document and an output stream.

**Example 2: Export to a File**

<snippet id='markdownformatprovider-export'/>

The exporter traverses the document structure and writes the equivalent Markdown constructs. The exporter maps heading styles to ATX-style heading markers (`#`–`######`), renders tables as GitHub-Flavored Markdown pipe tables, and writes lists with the appropriate indentation.

## See Also

* [Settings]({%slug radwordsprocessing-markdownformatprovider-settings%})

