---
title: License Key vs. Script Key
description: Learn the difference between the Telerik Document Processing license key and the script key, when to use each, and how to download them from your account.
type: how-to
page_title: What is the difference between the license key and script key
meta_title: What is the difference between the license key and script key
slug: license-key-vs-script-key
tags: telerik, license, key, script, document, processing, licensing, differences
res_type: kb
ticketid: 1709949
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q2 2025 or later| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|  

## Description

This article explains the difference between the Telerik **license key** and **script key** and identifies when to use each one. You can download both files from the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your Telerik account. They are not the same thing, and they apply to different licensing scenarios.

## License Key

Starting with Q2 2025, the Document Processing libraries must be activated with a license key file. The `telerik-license.txt` file used by the Telerik licensing mechanism (Q2 2025 or later) must be located in one of the following paths:

* `%AppData%\Telerik\telerik-license.txt` (preferred)—This makes the license available to all Telerik applications.
* Project root folder (scoped to that project)—This makes the license available to this particular project.

The `Telerik.Licensing` NuGet package must be installed in your project. It automatically locates the license file and uses it to activate the product. You do NOT deploy the file to production. It is personal, and you must never commit it to source control.

Missing or invalid keys cause build warnings and runtime watermarks (See [License Activation Errors and Warnings]({%slug activation-errors-and-warnings%})).

## Script Key

If your project does not use NuGet packages and the Telerik assemblies are referenced manually (DLLs in /bin), [you must activate licensing through a script key]({%slug setting-up-license-key%}#adding-a-license-key-to-projects-without-nuget-references). This approach is typical for .NET Framework projects and requires a reference to `Telerik.Licensing.Runtime.dll`.

A [script key]({%slug download-script-key%}) is a long encoded string inserted into your project with the assembly attribute:

```csharp
[assembly: Telerik.Licensing.EvidenceAttribute("<your-script-key-here>")]
```

Alternatively, you can validate the license by calling the `TelerikLicensing.Register("script key")` method as early as possible in your project before any Telerik-related code executes.

## See Also

* [Setting Up License Key]({%slug setting-up-license-key%})  
* [How to Download a Script Key]({%slug download-script-key%})
