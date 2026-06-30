---
title: Settings
description: Configure the TextFormatProvider export settings in RadPdfProcessing, such as line and page separators for plain text output.
page_title: Settings
slug: radpdfprocessing-formats-and-conversion-plain-text-settings
tags: textformatprovider, settings, pdf, plaintext, radpdfprocessing, export, separators, configuration
published: True
position: 2
---


# Settings

`TextFormatProvider` exports a `RadFixedDocument` to plain text. The export settings provide options to customize the output.

Through the `TextFormatProviderSettings` class you can specify the following export settings:

| Property | Description |
|---|---|
| `LinesSeparator` | Determines the string used to separate the lines in the document. The default value is `Environment.NewLine`. |
| `PagesSeparator` | Determines the string used to separate the pages in the document. The default value is `"----------- Page{0} ------------"`. |


## Create TextFormatProviderSettings

The constructor of the `TextFormatProviderSettings` class has two overloads:

| Constructor | Description |
|---|---|
| `TextFormatProviderSettings()` | Initializes a new instance of the class and sets the default values for its properties. |
| `TextFormatProviderSettings(string linesSeparator, string pagesSeparator)` | Initializes a new instance of the class and sets the specified values for its properties. |

**Example 1** shows how to create and specify a particular setting.

#### **Example 1: Create TextFormatProviderSettings**
<snippet id='libraries-pdf-formats-and-conversion-plain-text-settings-create-text-provider-settings'/>


## Using TextFormatProviderSettings

The `Export()` method of `TextFormatProvider` accepts a `TextFormatProviderSettings` instance. **Example 2** shows how to apply the settings created in **Example 1** when exporting a `RadFixedDocument` to a string.


#### **Example 2: Apply TextFormatProviderSettings**

<snippet id='libraries-pdf-formats-and-conversion-plain-text-settings-apply-text-provider-settings'/>

## See Also

* [Using TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%})
