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

The `MarkdownFormatProvider` exposes `ImportSettings` and `ExportSettings` properties that let you customize how the document is parsed and serialized.

### Export Settings

The `ExportSettings` property returns a `MarkdownExportSettings` instance. This object contains a `StyleSettings` property of type `MarkdownExportStyleSettings` that allows you to override the Markdown delimiters used for specific inline styles, such as the delimiter characters for bold and italic text.

#### Example 1: Configure Export Settings

<snippet id='markdownformatprovider-export-settings'/>

### Import Settings

The `ImportSettings` property returns a `MarkdownImportSettings` instance. This object contains a `StyleSettings` property of type `MarkdownImportStyleSettings` that allows you to customize how Markdown constructs are mapped to document styles when importing.

#### Example 2: Configure Import Settings

<snippet id='markdownformatprovider-import-settings'/>

## See Also

* [Using MarkdownFormatProvider]({%slug radwordsprocessing-formats-markdownformatprovider%})

