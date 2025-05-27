---
title: Telerik NuGet v2 Server Deprecation
description: Learn how to migrate from Telerik's deprecated NuGet v2 server to the new v3 API endpoint
type: how-to
page_title: Telerik NuGet v2 Server Deprecation
slug: nuget-v2-server-deprecation
tags: telerik, nuget, server, v2, v3, api, deprecation, migration, document, processing
res_type: kb
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| All versions | Document Processing Libraries |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

Since **November 2024**, the old **NuGet v2** server at `https://nuget.telerik.com/nuget` is decommissioned. To reflect this change you need to migrate to the new **NuGet v3** API (https://nuget.telerik.com/v3/index.json) endpoint. For more details, head to the [Sunsetting the NuGet v2 Server](https://www.telerik.com/blogs/sunsetting-nuget-v2-server) blog.

### Why migrate to NuGet v3?

The new v3 API offers several advantages:
- Faster package searches and restores
- Reduced number of requests from NuGet clients
- Improved security
- More reliable infrastructure
- Lighter resource consumption

### How to redirect your feed?

1. Open your NuGet configuration (Visual Studio NuGet Package Manager, nuget.config file, or CI/CD pipeline configuration).
2. Change your Telerik NuGet package source URL from https://nuget.telerik.com/nuget to https://nuget.telerik.com/v3/index.json.
   
No other changes are required. Your authentication credentials will continue to work with the new endpoint.

## See Also

- [Install using NuGet Packages]({%slug installation-nuget-packages%})
- [Available NuGet Packages]({%slug available-nuget-packages%})
- [Troubleshooting Telerik NuGet]({%slug dpl-troubleshooting-nuget%})
- [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
