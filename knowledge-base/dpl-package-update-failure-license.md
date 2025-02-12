---
title: Unable to find package Telerik.Licensing 
description: Learn how to handle Telerik.Licensing error after upgrade.
type: troubleshooting
page_title: Could Not Load File Or Assembly Telerik.Licensing.Runtime, Version 1.4.6.0 Runtime Error
slug: dpl-package-update-failure-license
tags: dpl, license, upgrade, fail, nuget, update, load, assembly
res_type: kb
ticketid: 1678555
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025| Telerik Document Processing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Problem

After upgrading the Telerik Document Processing libraries to version [Q1 2025]({%slug release-notes-2025-1-205%}), the following error messages may occur:

* "The file or assembly cannot be loaded 'Telerik.Licensing.Runtime, Version=1.4.6.0, Culture=neutral, PublicKeyToken=token_here' or one of its dependencies. The system cannot find the specified file."

* "NU1101: Unable to find package Telerik.Licensing. No packages exist with this id in source(s): Telerik nuget. PackageSourceMapping is enabled, the following source(s) were not considered: Microsoft Visual Studio Offline Packages, nuget.org. "

## Solution

This may happen if you upgrade to 2025 Q1 from an older version. With [Q1 2025]({%slug release-notes-2025-1-205%}), a new licensing mechanism was introduced, which requires a reference the Telerik.Licensing.Runtime dll.

The recommended way is to ensure that you have added the `Telerik.Licensing` package to your project. This package is necessary for the newer licensing mechanism introduced with the 2025 version.

Refer to the [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key#license-activation-errors-and-warnings) documentation for details on activating your RadPdfProcessing license key.

Following these steps should resolve the update failure and allow for the successful update of the `Telerik.Documents.Fixed` package to the latest version, while ensuring compliance with the new licensing requirements.

## See Also

- [Licensing Documentation]({%slug license-key%})
- [Telerik.Licensing NuGet Package](https://www.nuget.org/packages/Telerik.Licensing)
