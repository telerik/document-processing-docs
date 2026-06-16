---
title: Create Custom Predefined CMaps Provider
description: Learn how to create a custom implementation of the PredefinedCMapsProviderBase class to use a custom CMap table in PDF documents with RadPdfProcessing.
type: how-to
page_title: Create Custom Predefined CMaps Provider
slug: create-custom-predefined-cmaps-provider
position: 0
tags: radpdfprocessing, pdf, cmap, font, provider, document, processing, encoding
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.1.118</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article shows how to create a custom implementation of the [`PredefinedCMapsProviderBase`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.predefinedcmapsproviderbase) to use a custom CMap table.

## Solution

Create a custom class that inherits [`PredefinedCMapsProviderBase`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.predefinedcmapsproviderbase) and pass it to the [`PredefinedCMapsProvider`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.cmaputils.predefinedcmapsprovider) property of the [`FixedExtensibilityManager`](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.fixedextensibilitymanager) class.


**Example 1: Create a custom class inheriting PredefinedCMapsProviderBase**

```csharp

	internal class CustomPredefinedCMapsProvider : PredefinedCMapsProviderBase
    {
        private readonly PredefinedCMapsProviderBase predefinedCMapsProvider;

        public CustomPredefinedCMapsProvider(PredefinedCMapsProviderBase predefinedCMapsProvider)
        {
            this.predefinedCMapsProvider = predefinedCMapsProvider;
        }

        public override byte[] GetCidCMapData(string name)
        {
            if (name == "90ms-RKSJ-V")
            {
                return File.ReadAllBytes("90ms-RKSJ-V");
            }

            return this.predefinedCMapsProvider.GetCidCMapData(name);
        }

        public override byte[] GetUnicodeCMapData(string name)
        {
            return this.predefinedCMapsProvider.GetUnicodeCMapData(name);
        }
    }
	
```

**Example 2: Set the custom PredefinedCMapsProvider to the FixedExtensibilityManager**

```csharp

	FixedExtensibilityManager.PredefinedCMapsProvider = new CustomPredefinedCMapsProvider(new PredefinedCMapsProvider());
 
```

## See Also

* [PredefinedCMapsProviderBase API Reference](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.predefinedcmapsproviderbase)
* [FixedExtensibilityManager API Reference](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.fixedextensibilitymanager)
