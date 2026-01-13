---
title: Settings
page_title: Settings
slug: radpdfprocessing-formats-and-conversion-plain-text-settings
tags: using,textformatprovider, settings
published: True
position: 2
---


# Settings

__TextFormatProvider__ allows you export a __RadFixedDocument__ to plain text. Additionally, the export settings provide modification options. This article outlines the available settings.

Through the __TextFormatProviderSettings__ class you could specify the following export settings:

* **LinesSeparator**: Determines the string used to separate the lines in the document. The default value is __Environment.NewLine__.


* **PagesSeparator**: Determines the string, which will be used to separate the pages in the document. The default value is __*"----------- Page{0} ------------"*__.


## Create TextFormatProviderSettings

The constructor of the **TextFormatProviderSettings** class has two overloads:

* **TextFormatProviderSettings()**: Initializes a new instance of the class and sets the default values for its properties.

* **TextFormatProviderSettings(string linesSeparator, string pagesSeparator)**: Initializes a new instance of the class and sets the specified values for its properties.

**Example 1** shows how to create and specify a particular setting.

#### **Example 1: Create TextFormatProviderSettings**
<snippet id='pdf-create-text-provider-settings'/>


## Using TextFormatProviderSettings

The __Export()__ method of **TextFormatProvider** allows you to pass a **TextFormatProviderSettings** instance. **Example 2** illustrates how to apply the settings created in **Example 1**, when exporting a **RadFixedDocument** to string.


#### **Example 2: Apply TextFormatProviderSettings**

<snippet id='pdf-apply-text-provider-settings'/>

## See Also

* [Using TextFormatProvider]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%})
