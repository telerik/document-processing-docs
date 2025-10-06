---
title: CMap Tables
page_title: CMap Tables
slug: radpdfprocessing-concepts-cmap-tables
tags: cmap
published: True
position: 4
---

# What is a CMap

A CMap specifies the mapping from character codes to character selectors and serves the role of a font encoding. 

The CMaps are usually fully embedded into the PDF document and obtained from it during the reading of the content. A CMap can be also defined by a PDF name object, where the name identifies a well-known predefined CMap. The list of predefined cmaps can be found at [https://github.com/adobe-type-tools/cmap-resources](https://github.com/adobe-type-tools/cmap-resources).

# Working with Documents Containing Predefined CMap Tables

PdfProcessing enables you to use a default implementation for the known predefined CMap tables and you can also create a custom one if you encounter specific scenario in which the resources are not available for the default class.

## Default Implementation

The **Telerik[.Windows].Documents.CMapUtils.dll** assembly provides a default implementation for obtaining the data of a predefined CMap table by a given name. The class that contains implementations for all the CMap tables defined by the PDF Format Specification is called **PredefinedCMapsProvider**. In order to register an instance of the default implementation, the **FixedExtensibilityManager** class should be used.

>To use this functionality, you must add a reference to the **Telerik[.Windows].Documents.CMapUtils.dll**.

#### [C#] Example 1: Register default CMapsProvider
<snippet id='pdf-cmaps'/>

After registering the **PredefinedCMapsProvider** class, you will be able to import any document containing a predefined CMap table. 

## Creating a Custom Implementation

The deafult implementation covers the majority of the scenarios but in some pretty rare cases, users might need to provide a custom CMap. The API enables you also create a custom implementation for a CMap provider so you can provide the data for the custom CMap table. To achieve that, you will need to inherit the **PredefinedCMapsProviderBase** abstract class and implement the following members:

 * **byte[] GetCidCMapData(string name)**: Used to retrieve the *character code to CID mapping* of a predefined CMap. It should return the the CMap resource data depending on the specified name.

* **byte[] GetUnicodeCMapData(string name)**: Used to retrieve the *character code to Unicode mapping* of a predefined CMap. It should return the the CMap resource data depending on the specified name.

## See Also
 * [FontsRepository](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html)
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})

