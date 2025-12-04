---
title: Fixing Framework Mismatch and Licensing Errors in Telerik Document Processing
description: Troubleshoot the "Invalid License" watermark in PDFs generated using Telerik Document Processing and resolve related build errors.
type: troubleshooting
page_title: Fixing Framework Mismatch and Licensing Errors in Telerik Document Processing
meta_title: Fixing Framework Mismatch and Licensing Errors in Telerik Document Processing
slug: fix-invalid-license-watermark-and-framework-mismatch-telerik-document-processing
tags: pdfprocessing, telerik document processing, licensing, framework, error
res_type: kb
ticketid: 1704877
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I see an "Invalid License" watermark in PDFs generated using [Telerik Document Processing PdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) due to licensing issues. Additionally, build errors occur related to the `Telerik.Licensing.Runtime.dll` assembly, such as:

- `Type 'Telerik.Licensing.EvidenceAttribute' is not defined.`
- `warning MSB3274: The primary reference "Telerik.Licensing.Runtime, Version=1.6.5.0, Culture=neutral, PublicKeyToken=98bb5b04e55c09ef, processorArchitecture=MSIL" could not be resolved because it was built against the ".NETFramework,Version=v4.6.2" framework. This is a higher version than the currently targeted framework ".NETFramework,Version=v4.6".`

## Cause

The "Invalid License" watermark is caused by missing or improperly configured license activation in the Telerik Document Processing libraries. Build errors indicate a mismatch between the project's target framework and the `Telerik.Licensing.Runtime.dll` reference.

## Solution

### Step 1: Add Telerik.Licensing.Runtime.dll Assembly Reference

1. Locate the `Telerik.Licensing.Runtime.dll` file in the installation folder of the Telerik product you're using. For example:  
   `C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q4\Bin`
2. Add a reference to this assembly in your project.

For detailed instructions, refer to [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key/setting-up-license-key#adding-a-license-key-to-projects-without-nuget-references).

### Step 2: Update Target Framework

1. Open your project in Visual Studio.
2. Right-click your project → Select `Properties`.
3. Navigate to the `Application` tab.
4. Change the `Target Framework` to `.NET Framework 4.6.2` or higher.
5. Save changes and rebuild your solution.

### Step 3: Verify Licensing Integration

1. Ensure the license key is correctly integrated into your project as per the [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key/setting-up-license-key) documentation.
2. Place `TelerikLicense.vb` in the startup project and confirm that the namespace `Telerik.Licensing` is recognized.

### Step 4: Rebuild Solution

1. Rebuild your project after ensuring the above steps have been completed.
2. Check if the errors and watermark are resolved.

## See Also

- [System Requirements for Telerik Document Processing](https://docs.telerik.com/devtools/document-processing/getting-started/installation/system-requirements)
- [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key/setting-up-license-key)
- [Diagnostic Options for Telerik Licensing](https://docs.telerik.com/devtools/document-processing/knowledge-base/telerik-trial-version-message)
