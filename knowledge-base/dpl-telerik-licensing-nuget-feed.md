---
title: Telerik.Licensing NuGet package is not available on the Telerik NuGet feed
description: Learn why Telerik.Licensing is not on the Telerik NuGet feed and how to configure NuGet sources so Telerik Document Processing packages restore correctly.
type: how-to
page_title: Fix Telerik.Licensing NuGet Feed Configuration
slug: dpl-telerik-licensing-nuget-feed
tags: telerik, nuget, licensing, feed, document, processing, configuration, packages
res_type: kb
ticketid: 1679127
---

## Environment

| Version | Product | Author |
|---|---|---|
| Q1 2025 | Telerik Document Processing | [Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova) |

## Problem

Starting with [Q1 2025]({%slug release-notes-2025-1-205%}), Telerik Document Processing projects need both the Telerik product packages and the `Telerik.Licensing` package. This article explains why `Telerik.Licensing` is not available from the Telerik NuGet feed and how to configure package sources so restore works reliably in local and CI environments.

You may expect all Telerik-related packages to restore from the Telerik NuGet feed. However, the `Telerik.Licensing` package is distributed through `nuget.org`, not through the Telerik feed.

If your `NuGet.config` points Telerik packages only to the Telerik feed, package restore can fail or your build can miss the licensing dependency.

## Solution

Configure your package sources so the project can restore Telerik Document Processing packages from the Telerik feed and `Telerik.Licensing` from `nuget.org`.

### Step 1: Add both required package sources

Update `NuGet.config` to include both `nuget.org` and the [Telerik NuGet feed]({%slug installation-nuget-packages%}).

```xml
<packageSources>
  <clear />
  <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
  <add key="Telerik_v3_Feed" value="https://nuget.telerik.com/v3/index.json" protocolVersion="3" />
</packageSources>
```

This setup allows:

* Telerik Document Processing packages to restore from the Telerik feed.
* `Telerik.Licensing` to restore from `nuget.org`.

### Step 2: Check package source mapping if you use it

If your solution uses package source mapping, make sure the mapping does not force `Telerik.Licensing` to the Telerik feed. Allow `Telerik.Licensing` to restore from `nuget.org`.

This is a common cause of restore errors when a rule such as `Telerik.*` points only to Telerik sources.

### Step 3: Verify Telerik feed authentication

Make sure the Telerik feed is configured with valid credentials and that the Telerik account has access to the Document Processing packages you need.

If Telerik packages fail to restore while `Telerik.Licensing` succeeds, the issue is usually Telerik feed authentication rather than the licensing package itself.

### Step 4: Configure CI environments

For CI environments, make sure the agent can reach both package sources:

* The Telerik feed for Telerik Document Processing packages.
* `nuget.org` for `Telerik.Licensing`.

If the CI environment cannot access external feeds directly, consider [manually downloading the NuGet packages]({%slug installation-nuget-packages%}#manually-download-nuget-packages) and hosting them in an internal or local feed that the build agent can reach.

## How to Verify the Configuration

After you update the package sources, confirm that:

* `Telerik.Licensing` restores successfully from `nuget.org`.
* Telerik Document Processing packages restore successfully from the Telerik feed.
* The build completes without package source or missing assembly errors.
* The project license setup is complete according to the [license key documentation]({%slug setting-up-license-key%}).

## Additional Guidance

This configuration is expected behavior, not a packaging defect. The important requirement is to keep both feeds available or provide an equivalent internal feed strategy that supplies both the Telerik product packages and the `Telerik.Licensing` package.

## See Also

* [Set up the Telerik Document Processing license key]({%slug setting-up-license-key%})
* [Download Telerik NuGet packages]({%slug installation-nuget-packages%}#manually-download-nuget-packages)
* [Q1 2025 release notes]({%slug release-notes-2025-1-205%})
* [Telerik.Licensing NuGet package](https://www.nuget.org/packages/Telerik.Licensing)
