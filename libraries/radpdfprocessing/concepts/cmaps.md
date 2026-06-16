---
title: CMap Tables
description: Learn about CMap tables in RadPdfProcessing, how they map character codes to character selectors, and how to work with predefined CMap tables.
page_title: CMap Tables
slug: radpdfprocessing-concepts-cmap-tables
tags: cmap, font, encoding, characters, pdf, radpdfprocessing, unicode, predefined
published: True
position: 4
---

# CMap Tables

A CMap specifies the mapping from character codes to character selectors and serves the role of a font encoding. 

CMaps are usually fully embedded into the PDF document and obtained from it during reading. A CMap can also be defined by a PDF name object, where the name identifies a well-known predefined CMap. The list of predefined CMaps is available at [https://github.com/adobe-type-tools/cmap-resources](https://github.com/adobe-type-tools/cmap-resources).

## Working with Documents Containing Predefined CMap Tables

RadPdfProcessing enables you to use a default implementation for the known predefined CMap tables. You can also create a custom one if you encounter a specific scenario in which the resources are not available for the default class.

## Default Implementation

The **Telerik[.Windows].Documents.CMapUtils** package provides a default implementation for obtaining the data of a predefined CMap table by a given name. The class that contains implementations for all the CMap tables defined by the PDF Format Specification is called `PredefinedCMapsProvider`. To register an instance of the default implementation, use the `FixedExtensibilityManager` class.

>To use this feature, you must add a reference to the **Telerik[.Windows].Documents.CMapUtils package**.

#### Example 1: Register Default CMapsProvider
<snippet id='pdf-cmaps'/>

After you register the `PredefinedCMapsProvider` class, you can import any document containing a predefined CMap table. 

## Creating a Custom Implementation

The default implementation covers the majority of the scenarios but in some rare cases, you might need to provide a custom CMap. The API enables you to create a custom implementation for a CMap provider so you can provide the data for the custom CMap table. To achieve that, inherit the `PredefinedCMapsProviderBase` abstract class and implement the following members:

| Member | Description |
|---|---|
| `byte[] GetCidCMapData(string name)` | Retrieves the *character code to CID mapping* of a predefined CMap. Returns the CMap resource data for the specified name. |
| `byte[] GetUnicodeCMapData(string name)` | Retrieves the *character code to Unicode mapping* of a predefined CMap. Returns the CMap resource data for the specified name. |

## See Also
 * [FontsRepository API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Fonts.FontsRepository.html)
 * [TextFragment]({%slug radpdfprocessing-model-textfragment%})

