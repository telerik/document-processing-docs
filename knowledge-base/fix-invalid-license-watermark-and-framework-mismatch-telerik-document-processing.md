---
title: Handling 'Telerik.Licensing.EvidenceAttribute is not defined' Error
description: Troubleshoot the "Invalid License" watermark in PDFs generated using Telerik Document Processing and resolve related build errors.
type: troubleshooting
page_title: Handling 'Telerik.Licensing.EvidenceAttribute is not defined' Error
meta_title: Handling 'Telerik.Licensing.EvidenceAttribute is not defined' Error
slug: handle-telerik-licensing-evidence-attribute-not-defined-error
tags: pdfprocessing, telerik document processing, licensing, framework, error,evidence, attribute
res_type: kb
ticketid: 1704877
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.4.1104| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 
|Target Framework|.NET Framework|-|

## Description

It is possible to observe build errors related to the `Telerik.Licensing.Runtime.dll` assembly in a .NET Framework roject, such as:

- `Type 'Telerik.Licensing.EvidenceAttribute' is not defined.`
- `warning MSB3274: The primary reference "Telerik.Licensing.Runtime, Version=1.6.5.0, Culture=neutral, PublicKeyToken=98bb5b04e55c09ef, processorArchitecture=MSIL" could not be resolved because it was built against the ".NETFramework,Version=v4.6.2" framework. This is a higher version than the currently targeted framework ".NETFramework,Version=v4.6".`

## Cause

Build errors indicate a mismatch between the project's target framework and the `Telerik.Licensing.Runtime.dll` reference.

## Solution

### Step 1: Add Telerik.Licensing.Runtime.dll Assembly Reference

1. Locate the `Telerik.Licensing.Runtime.dll` file in the installation folder of the Telerik product you're using. For example:  
   `C:\Program Files (x86)\Progress\Telerik Reporting 2025 Q4\Bin`
2. Add a reference to this assembly in your project.

### Step 2: Update Target Framework

1. Open your project in Visual Studio.
2. Right-click your project → Select `Properties`.
3. Navigate to the `Application` tab.
4. Change the `Target Framework` to `.NET Framework 4.6.2` or higher.
5. Save changes and rebuild your solution.

### Step 3: Verify Licensing Integration

1. Ensure the license key is correctly integrated into your project as per the [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%}) documentation.
2. Place `TelerikLicense.cs` (`TelerikLicense.vb`) in the startup project and confirm that the namespace `Telerik.Licensing` is recognized.

### Step 4: Rebuild Solution

1. Rebuild your project after ensuring the above steps have been completed.
2. Check if the errors and watermark are resolved.

## See Also

- [System Requirements]({%slug installation-system-requirements%})
- [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%})

