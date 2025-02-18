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

When working with Telerik Document Processing libraries, managing NuGet package sources efficiently becomes crucial, especially with the introduction of the Telerik.Licensing package. This knowledge base article demonstrates how to configure NuGet package sources to facilitate smooth package restoration for both Telerik Document Processing libraries and the Telerik.Licensing package. 

This knowledge base article also answers the following questions:
- How do I manage Telerik packages using the NuGet.config file?
- What is the best way to configure NuGet package sources for Telerik Document Processing libraries?
- How can I ensure the Telerik.Licensing package is restored correctly in my projects?

## Solution

To ensure the Telerik.Licensing package and the Telerik Document Processing libraries are restored correctly, follow the steps below to configure your NuGet.config file:

1. **Modify the NuGet.config file** to include both the `nuget.org` and the Telerik NuGet feed. This setup allows the restoration of the Telerik Document Processing libraries from the Telerik NuGet feed and the Telerik.Licensing package from `nuget.org`.

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear/>
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />
    <add key="Telerik" value="https://nuget.telerik.com/v3/index.json" protocolVersion="3" />
  </packageSources>
  <packageSourceMapping>
    <packageSource key="nuget.org">
      <package pattern="*" />
      <package pattern="Telerik.Licensing" />
    </packageSource>
    <packageSource key="Telerik">
      <package pattern="Telerik.*" />
      <package pattern="JustMock.*" />
    </packageSource>
  </packageSourceMapping>
</configuration>
```

2. **Ensure that your Telerik account** has the appropriate licenses and that you are authenticated correctly in the Telerik NuGet feed to avoid issues with accessing the Telerik Document Processing libraries.

3. **For Continuous Integration (CI) environments**, ensure the Telerik.Licensing package is accessible via `nuget.org` and that the CI environment has access to the internet to restore the package. Alternatively, consider [manually downloading the NuGet packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages#manually-download-nuget-packages) and hosting them in a local feed or directory accessible by your CI environment.

By following these steps, you can efficiently manage the NuGet package sources for your projects that use Telerik Document Processing libraries and ensure the Telerik.Licensing package is restored correctly.

## See Also

- [Setting Up Your Telerik Document Processing Libraries License Key](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key)
- [Adding the License Key to CI Services](https://docs.telerik.com/devtools/document-processing/distribution-and-licensing/license-key#adding-the-license-key-to-ci-services)
- [Download Telerik NuGet Packages](https://docs.telerik.com/devtools/document-processing/getting-started/installation/install-nuget-packages#download-from-the-nuget-server)

---
