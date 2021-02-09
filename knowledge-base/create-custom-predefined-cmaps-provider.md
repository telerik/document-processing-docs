---
title: Create Custom Predefined CMaps Provider
description: Create Custom Predefined CMaps Provider
type: how-to
page_title: Create Custom Predefined CMaps Provider
slug: create-custom-predefined-cmaps-provider
position: 0
tags: pdf, cmap, cff, font
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

How to create a custom implementation of the [PredefinedCMapsProviderBase](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.predefinedcmapsproviderbase) in order to use a custom CMAP table.

## Solution

This functionality could be achieved by creating a custom class inheriting the [PredefinedCMapsProviderBase](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.predefinedcmapsproviderbase) and passing it to [PredefinedCMapsProvider](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.cmaputils.predefinedcmapsprovider) property of the [FixedExtensibilityManager](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.extensibility.fixedextensibilitymanager) class.


#### __[C#] Creating a custom class inheriting PredefinedCMapsProviderBase__

{{region kb-create-custom-predefined-cmaps-provider1}}

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
	
{{endregion}}

#### __[C#] Set the custom PredefinedCMapsProvider the FixedExtensibilityManager.PredefinedCMapsProvider__

{{region kb-create-custom-predefined-cmaps-provider2}}

	FixedExtensibilityManager.PredefinedCMapsProvider = new CustomPredefinedCMapsProvider(new PredefinedCMapsProvider());
 
{{endregion}}
