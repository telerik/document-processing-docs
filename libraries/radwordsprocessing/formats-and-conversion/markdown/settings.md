---
title: Settings
description: Configure the MarkdownFormatProvider import and export settings in RadWordsProcessing, including style mappings for bold, italic, and other inline Markdown delimiters.
page_title: Using MarkdownFormatProvider
slug: radwordsprocessing-markdownformatprovider-settings
tags: wordsprocessing, markdown, format, provider, import, export, md
published: True
position: 2
---

# Settings

The `MarkdownFormatProvider` exposes `ImportSettings` and `ExportSettings` properties that let you customize how the document is parsed and serialized into the document model.

## Import Settings

The `ImportSettings` property returns a `MarkdownImportSettings` instance. This object contains a `StyleSettings` property of type `MarkdownImportStyleSettings` that allows you to customize how Markdown constructs are mapped to document styles when importing. All properties are listed in the following table:

| Property  | Description |
|---|---|
| `Encoding` | Gets or sets the encoding used when reading the Markdown stream. Defaults to UTF-8. Throws `ArgumentNullException` if set to `null`. |
| `MaxDocumentSizeBytes` | Gets or sets the maximum number of bytes that may be read from the input stream. Documents exceeding this limit throw an `InvalidOperationException` during import. Default is **52,428,800 (50 MB)**. Set to `0` to disable the check. |
| `MaxDataUriImageTotalBytes` | Gets or sets the maximum cumulative decoded bytes that may be embedded from data URI images across the entire document. Subsequent data URI images are skipped and a warning is added to `Warnings` once the limit is exceeded. Default is **0 (no limit)**. |
| `AllowLocalFileSystemImages` | Gets or sets whether images referenced by `file://` URLs are read from the local file system and embedded during import. Default is **`false`** (local file images are skipped and a warning is added). Only enable for trusted sources - can expose arbitrary local files (CWE-22). |
| `StyleSettings` | Gets the style customization settings applied during import. Use to override styles for Markdown elements or customize visual properties of auto-created styles. |
| `Warnings` | Gets the list of non-fatal warnings generated during the last import. Cleared and repopulated on each import. Typical entries describe images that could not be loaded. Do not modify while an import is in progress. |

**Example 1: Configure Import Settings**

<snippet id='libraries-flow-formats-and-conversion-markdown-settings-markdownformatprovider-import-settings'/>

## Export Settings

The `ExportSettings` property returns a `MarkdownExportSettings` instance. This object contains a `StyleSettings` property of type `MarkdownExportStyleSettings` that allows you to override the Markdown delimiters used for specific inline styles, such as the delimiter characters for bold and italic text. All properties are listed in the following table:

| Property | Description |
|---|---|
| `HeadingStyle` | Gets or sets the heading syntax style. Default is `HeadingExportStyle.Atx`. |
| `CodeFenceStyle` | Gets or sets the code fence character. Default is `CodeFenceExportStyle.Backtick`. |
| `TableExport` | Gets or sets how tables are exported. Default is `TableExportMode.GfmPipe`. |
| `ImageExport` | Gets or sets how images are exported. Default is `ImageExportMode.Inline`. |
| `Encoding` | Gets or sets the encoding used when writing the Markdown stream. Defaults to UTF-8 without BOM. Throws `ArgumentNullException` when set to `null`. |
| `StyleSettings` | Gets the style settings that control which style IDs are recognised as Markdown elements during export. Configure these to match `MarkdownImportSettings.StyleSettings` for correct round-trip behaviour. |
| `Warnings` | Gets the list of non-fatal warnings generated during the last export operation. Cleared and repopulated on each export. |
| `MonospaceFontNames` | Gets the set of font family names treated as monospace (code) fonts during export. Runs using one of these fonts are exported as inline code spans. Pre-seeded with common monospace fonts; case-insensitive. |

**Example 2: Configure Export Settings**

<snippet id='libraries-flow-formats-and-conversion-markdown-settings-markdownformatprovider-export-settings'/>

## See Also

* [Using MarkdownFormatProvider]({%slug radwordsprocessing-formats-markdownformatprovider%})

