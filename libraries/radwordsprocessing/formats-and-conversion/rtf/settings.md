---
title: Settings
description: Learn about the import and export settings available for the RtfFormatProvider in RadWordsProcessing.
page_title: Settings
slug: radwordsprocessing-formats-and-conversion-rtf-settings
tags: format, provider, settings, rtf, word, flow, docx, import, export, configuration, document
published: True
position: 3
---

# Settings

`RtfFormatProvider` allows you to import RTF documents and export a `RadFlowDocument` to RTF. The import/export settings provide modification options. This article outlines the available settings.

## Export Settings

You can specify the following export settings:

### ExportImagesInCompatibilityMode

Specifies whether the provider exports images in compatibility mode. This option is useful when earlier RTF readers open the exported document.

The default value for this setting is `false`.

The following code demonstrates how to create and specify particular export settings for `RtfFormatProvider`.

**Example 1: Create RtfExportSettings and enable image export in compatibility mode**

<snippet id='codeblock-co'/>

