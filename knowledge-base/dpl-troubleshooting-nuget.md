---
title: Troubleshooting Telerik NuGet
description: Common issues that may occur when you use the Telerik NuGet server to install Document Processing packages
type: troubleshooting
page_title: How to Fix Error 503 from Telerik NuGet Server by Migrating to NuGet v3 API
slug: dpl-troubleshooting-nuget
tags: error, nuget, package, installation
res_type: kb
ticketid: 1671187
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| N/A| Telerik Document Processing Libraries|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
When attempting to access the Telerik NuGet server at `https://nuget.telerik.com/nuget/`, you might encounter an Error 503. This issue arises due to the deprecation of the old NuGet server and can be resolved by switching to the NuGet v3 API.

## Cause
The Error 503 is typically caused by the deprecation of the old NuGet v2 server at `https://nuget.telerik.com/nuget/`. Telerik encourages clients to migrate to the NuGet v3 API for enhanced performance and reliability.

## Solution
To resolve the Error 503 and ensure a more stable package management experience, follow the steps below to migrate your NuGet package source to the v3 API:

1. Update your NuGet package source URL to `https://nuget.telerik.com/v3/index.json`.
2. Configure the Telerik NuGet server as a package source in Visual Studio for improved package searches and restores.

For detailed instructions on configuring the Telerik NuGet server in Visual Studio, refer to the official documentation: [Download from the NuGet server](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages#download-from-the-nuget-server).

By following these steps, you will switch to a faster, lighter, and more secure NuGet server protocol, ensuring a better package management experience.

## See Also

- [Installing NuGet Packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages)
- [NuGet Documentation](https://docs.microsoft.com/en-us/nuget/)

---
