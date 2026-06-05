---
title: Unable to Find Package Telerik.Licensing 
description: Learn how to handle the Telerik.Licensing error after upgrading Telerik Document Processing libraries.
type: troubleshooting
page_title: Could Not Load File or Assembly Telerik.Licensing.Runtime, Version 1.4.6.0 Runtime Error
slug: dpl-package-update-failure-license
tags: licensing, nuget, telerik, document, processing, upgrade, assembly, error
res_type: kb
ticketid: 1678555
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Problem

After upgrading the Telerik Document Processing libraries to version [Q1 2025]({%slug release-notes-2025-1-205%}), the following error messages may occur:

* **"The file or assembly cannot be loaded 'Telerik.Licensing.Runtime, Version=1.4.6.0, Culture=neutral, PublicKeyToken=token_here' or one of its dependencies. The system cannot find the specified file."**

* **"NU1101: Unable to find package Telerik.Licensing. No packages exist with this id in source(s): Telerik nuget. PackageSourceMapping is enabled, the following source(s) were not considered: Microsoft Visual Studio Offline Packages, nuget.org."**

## Solution

>note If you have a Source Mapping for "Telerik.\*" that points to your Telerik source, ensure that you also add one for NuGet.org.

This error can occur if you upgrade to [Q1 2025]({%slug release-notes-2025-1-205%}) from an earlier version. Starting with [Q1 2025]({%slug release-notes-2025-1-205%}), a new licensing mechanism was introduced that requires a reference to the `Telerik.Licensing.Runtime` dll.

The recommended approach is to ensure that you have added the `Telerik.Licensing` package to your project. This package is necessary for the newer licensing mechanism.

Refer to the [Setting Up Your Telerik Document Processing Libraries License Key]({%slug setting-up-license-key%}) documentation for details on activating your license key.

These steps resolve the update failure and allow for the successful update of Telerik Document Processing Libraries to the latest version, while ensuring compliance with the new licensing requirements.

## See Also

* [Licensing Documentation]({%slug setting-up-license-key%})
* [Telerik.Licensing NuGet Package](https://www.nuget.org/packages/Telerik.Licensing)
