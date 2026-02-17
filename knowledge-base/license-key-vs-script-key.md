---
title: License Key vs. Script Key
description: Learn what is the difference between the license key and script key when using Telerik Document Processing libraries.
type: how-to
page_title: What is the difference between the license key and script key
meta_title: What is the difference between the license key and script key
slug: license-key-vs-script-key
tags: telerik, license, licensing, document, processing, dpl, script, key
res_type: kb
ticketid: 1709949
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q2 2025 or newer| Telerik Document Procesing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|  

## Description

This article is purposed to explain the difference between the Telerik **license key** and **script key** and identify the cases for their usage. Both files can be downloaded from the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your Telerik account. They are not the same thing, and they are used in different licensing scenarios.

## License Key

Starting with Q2 2025, the Document Processing libraries must be activated with a license key file. A license key file `telerik-license.txt` used by the Telerik licensing mechanism (Q2 2025 or newer) is expected to be located in one of the following paths:
- %AppData%\Telerik\telerik-license.txt (preferred) - This makes the license available to all Telerik applications.
- Project root folder (scoped to that project) - This makes the license available to this particular project.

The **Telerik.Licensing** NuGet package must be installed in your project. It automatically locates the license file and uses it to activate the product.  Hence, you do NOT deploy the file to production.
It is personal, and you should never commit it to source control.

Missing/invalid keys cause build warnings and runtime watermarks (See [License Activation Errors and Warnings]({%slug activation-errors-and-warnings%})).

## Script Key

If you are not using NuGet packages in your project and the Telerik assemblies are referenced manually (DLLs in /bin), [licensing must be activated via a script key]({%slug setting-up-license-key%}#adding-a-license-key-to-projects-without-nuget-references). This is usually used in .NET Framework projects and it requires adding a reference to the **Telerik.Licensing.Runtime.dll**.

A [script key]({%slug download-script-key%}) is a long encoded string inserted into your project using the assembly attribute:

````C#
[assembly: Telerik.Licensing.EvidenceAttribute("<your-script-key-here>")]
````

Alternatively, you can validate the license by calling the **TelerikLicensing.Register("script key")** method as early as possible in your project before using the Telerik-related code.

## See Also

- [Setting Up License Key]({%slug setting-up-license-key%})  
- [How to Download a Script Key]({%slug download-script-key%})
