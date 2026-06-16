---
title: Migrating from the Telerik NuGet v2 Server to v3
description: Learn how to migrate from the deprecated Telerik NuGet v2 server to the new v3 API endpoint for Document Processing Libraries.
type: how-to
page_title: Migrating from the Telerik NuGet v2 Server to v3
slug: nuget-v2-server-deprecation
tags: nuget, telerik, server, migration, v3, document, processing, feed
res_type: kb
---

## Environment

| Version | Product | Author |
| --- | --- | --- |
| All versions | Document Processing Libraries |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description

Starting with **November 2024**, the old **NuGet v2** server at `https://nuget.telerik.com/nuget` is decommissioned. You must migrate to the new **NuGet v3** API (`https://nuget.telerik.com/v3/index.json`) endpoint. For more details, see the [Sunsetting the NuGet v2 Server](https://www.telerik.com/blogs/sunsetting-nuget-v2-server) blog post.

### Why Migrate to NuGet v3

The new v3 API offers several advantages:

* Faster package searches and restores
* Reduced number of requests from NuGet clients
* Improved security
* More reliable infrastructure
* Lighter resource consumption

### How to Redirect Your Feed

1. Open your NuGet configuration (Visual Studio NuGet Package Manager, `nuget.config` file, or CI/CD pipeline configuration).
2. Change your Telerik NuGet package source URL from `https://nuget.telerik.com/nuget` to `https://nuget.telerik.com/v3/index.json`.

No other changes are required. Your authentication credentials continue to work with the new endpoint.

## See Also

* [Install Using NuGet Packages]({%slug installation-nuget-packages%})
* [Available NuGet Packages]({%slug available-nuget-packages%})
* [Troubleshooting Telerik NuGet]({%slug dpl-troubleshooting-nuget%})
* [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
