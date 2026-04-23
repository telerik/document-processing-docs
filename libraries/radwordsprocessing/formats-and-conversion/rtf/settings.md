---
title: Settings
description: Learn about the import and export settings available for the RtfFormatProvider in RadWordsProcessing.
page_title: Settings
tags: format, provider, settings, rtf, word, flow, docx, import, export, configuration, document
published: True
position: 3
---

# Settings



__RtfFormatProvider__ allows for import of RTF documents and respectively export of RadFlowDocument to RTF. Additionally, the import/export settings provide modification options. The current article outlines the available settings.
      

## Export Settings

The export settings which you can specify are as follows:

### ExportImagesInCompatibilityMode 

Specifies if the images should be exported in compatibility mode. This option is convenient when the exported document is going to be consumed by older RTF readers.
              

The default value for this setting is __false__.
              

The code from __Example 1__ demonstrates how you can create and specify particular export settings to RtfFormatProvider.
        

#### __Example 1: Create a RtfExportSettings__

<snippet id='codeblock-co'/>


