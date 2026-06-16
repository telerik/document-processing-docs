---
title: Unable to find package Telerik.Licensing
description: Learn how to fix Telerik.Licensing package restore and runtime assembly errors after upgrading Telerik Document Processing to Q1 2025 or later.
type: troubleshooting
page_title: Could Not Load File or Assembly Telerik.Licensing.Runtime, Version 1.4.6.0 Runtime Error
slug: dpl-package-update-failure-license
tags: licensing, nuget, telerik, document, processing, upgrade, assembly, error
res_type: kb
ticketid: 1678555
---

## Environment

| Version | Product | Author |
|---|---|---|
| Q1 2025 | Telerik Document Processing | [Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova) |

## Problem

After you upgrade Telerik Document Processing to [Q1 2025]({%slug release-notes-2025-1-205%}) or later, your project can fail during package restore or at runtime if the new licensing dependency is missing or blocked by package source mapping. This article explains why the problem occurs and how to fix it.

You may see one of these errors:

* `The file or assembly cannot be loaded 'Telerik.Licensing.Runtime, Version=1.4.6.0, Culture=neutral, PublicKeyToken=token_here' or one of its dependencies. The system cannot find the specified file.`
* `NU1101: Unable to find package Telerik.Licensing. No packages exist with this id in source(s): Telerik nuget. PackageSourceMapping is enabled, the following source(s) were not considered: Microsoft Visual Studio Offline Packages, nuget.org.`

## Cause

Starting with [Q1 2025]({%slug release-notes-2025-1-205%}), Telerik Document Processing uses the newer Telerik licensing mechanism. That mechanism requires the `Telerik.Licensing` package, which in turn provides the `Telerik.Licensing.Runtime` assembly at build and runtime.

The upgrade usually fails for one of these reasons:

* The project does not reference the `Telerik.Licensing` NuGet package.
* Package source mapping allows Telerik packages only from the Telerik feed and blocks `Telerik.Licensing`, which is distributed through NuGet.org.
* The project upgraded package versions, but the license package restore or runtime copy step did not complete successfully.

## Solution

Use the following steps to resolve the problem:

1. Add the `Telerik.Licensing` NuGet package to every project that uses Telerik Document Processing assemblies.
2. If your solution uses package source mapping, make sure NuGet.org is allowed for `Telerik.Licensing`.
3. Restore packages again and rebuild the solution.
4. Activate your Telerik license key if you have not already configured it.

### Step 1: Add the Telerik.Licensing package

Add the `Telerik.Licensing` package to the affected project. This is the recommended way to bring in the required runtime assembly for the newer licensing mechanism.

If your solution contains multiple executable or library projects that directly use Telerik Document Processing, verify that each affected project restores the package correctly.

### Step 2: Check package source mapping

If you use NuGet package source mapping and map `Telerik.*` only to the Telerik feed, add a mapping that also allows `Telerik.Licensing` to restore from NuGet.org.

>important If `Telerik.Licensing` is blocked by package source mapping, package restore can fail with `NU1101` even though your Telerik feed is configured correctly.

Review your `NuGet.config` and confirm that:

* NuGet.org is enabled as a package source.
* `Telerik.Licensing` is allowed to restore from NuGet.org.
* Your Telerik Document Processing packages continue to restore from the Telerik feed as expected.

### Step 3: Restore and rebuild

After you update the package reference or source mapping rules, restore packages and rebuild the solution. This step ensures that the `Telerik.Licensing.Runtime` assembly is available to the application.

If the runtime error continues after restore, clean the solution output folders and restore again so stale build artifacts do not keep the old dependency state.

### Step 4: Activate the license key

Adding the package resolves the dependency problem, but your project must still use a valid Telerik license key. For activation details, see [Set up the Telerik Document Processing license key]({%slug setting-up-license-key%}).

## How to Verify the Fix

After you apply the steps above, confirm that the issue is resolved:

* Package restore completes without `NU1101` errors.
* The application starts without the `Telerik.Licensing.Runtime` assembly load error.
* The affected Telerik Document Processing features run normally.
* Your license key is configured according to the licensing documentation.

## Additional Guidance

If the problem started immediately after a version upgrade, compare the upgraded project with a working project that already uses the new licensing mechanism. In most cases, the missing piece is either the `Telerik.Licensing` package reference or the NuGet.org package source mapping entry.

## See Also

* [Set up the Telerik Document Processing license key]({%slug setting-up-license-key%})
* [Q1 2025 release notes]({%slug release-notes-2025-1-205%})
* [Telerik.Licensing NuGet package](https://www.nuget.org/packages/Telerik.Licensing)
