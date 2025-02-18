---
title: Telerik.Licensing NuGet package is not available on the Telerik NuGet feed
description: Learn how to configure NuGet feeds to efficiently manage Telerik Document Processing libraries and the Telerik.Licensing package.
type: how-to
page_title: Telerik.Licensing NuGet package is not available on the Telerik NuGet feed
slug: dpl-telerik-licensing-nuget-feed
tags: telerik, document, processing, nuget, licensing, nuget, config
res_type: kb
ticketid: 1679127
---

##Environment 

| Version | Product | Author | 
| ---- | ---- | ---- | 
| Q1 2025| Telerik Document Processing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Starting with [2025.1.205 (2025 Q1)]({%slug release-notes-2025-1-205%}), all users of the Telerik and Kendo UI components and tools, will need to apply a valid license key file to both, new and existing projects. For details, see our [Licensing Documentation]({%slug license-key%}).

When working with Telerik Document Processing libraries, managing NuGet package sources efficiently becomes crucial, especially with the introduction of the **Telerik.Licensing** package. The Telerik NuGet Packages can be downloaded from the [Telerik NuGet Server]({%slug installation-nuget-packages%}#manually-download-nuget-packages). However, the **Telerik.Licensing** NuGet package is not available for downloading from the same feed.

This knowledge base article demonstrates how to configure NuGet package sources to facilitate smooth package restoration for both, Telerik Document Processing libraries and the Telerik.Licensing package. 

This knowledge base article also answers the following questions:
- How do I manage Telerik packages using the NuGet.config file?
- What is the best way to configure NuGet package sources for Telerik Document Processing libraries?
- How can I ensure the Telerik.Licensing package is restored correctly in my projects?

## Solution

The [Telerik.Licensing NuGet package](https://www.nuget.org/packages/Telerik.Licensing) can be obtained through the `nuget.org` feed with **Package source**: *"https://api.nuget.org/v3/index.json"*. Indeed, it is not available for downloading from the Telerik NuGet feed.

However, there are advantages and disadvantages to uploading the Telerik.Licensing package to the Telerik NuGet Feed:

* **Pros**: indeed, it provides convenience for the clients, allowing them to download the NuGet package from the same source as the rest of the Telerik NuGet packages.

* **Cons**: With Q1 2025, all Telerik and Kendo UI products require the Telerik.Licensing NuGet package. As a result, the package will need to be uploaded separately for each product in the Download system, leading to duplication. Additionally, releasing a new version of Telerik.Licensing would require a corresponding new product release.

That is why it is a technical decision to have the **Telerik.Licensing** NuGet package **only** on nuget.org.

To ensure the Telerik.Licensing package and the Telerik Document Processing libraries are restored correctly, follow the steps below to configure your NuGet.config file:

1. **Modify the NuGet.config file** to include both the `nuget.org` and the [Telerik NuGet feed]({%slug installation-nuget-packages%}#manually-download-nuget-packages). This setup allows the restoration of the Telerik Document Processing libraries from the Telerik NuGet feed and the Telerik.Licensing package from `nuget.org`.

```xml
  <packageSources>
    <clear/>
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
    <add key="Telerik_v3_Feed" value="https://nuget.telerik.com/v3/index.json" protocolVersion="3"/>
  </packageSources>
```

2. **Ensure that your Telerik account** has the appropriate licenses and that you are authenticated correctly in the Telerik NuGet feed to avoid issues with accessing the Telerik Document Processing libraries.

3. **For Continuous Integration (CI) environments**, ensure the Telerik.Licensing package is accessible via `nuget.org` and that the CI environment has access to the internet to restore the package. Alternatively, consider [manually downloading the NuGet packages]({%slug installation-nuget-packages%}#manually-download-nuget-packages) and hosting them in a local feed or directory accessible by your CI environment.

By following these steps, you can efficiently manage the NuGet package sources for your projects that use Telerik Document Processing libraries and ensure the Telerik.Licensing package is restored correctly.

## See Also

- [Setting Up Your Telerik Document Processing Libraries License Key]({%slug license-key%}) 
- [Download Telerik NuGet Packages]({%slug installation-nuget-packages%}#manually-download-nuget-packages)
- [Introducing New Subscription Packages for Telerik and Kendo UI Libraries in 2025](https://www.telerik.com/blogs/introducing-new-subscription-packages-telerik-kendo-ui-libraries-2025)

---
