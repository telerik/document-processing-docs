---
title: Integration with Other Telerik Products
page_title: Integration with Other Telerik Products
description: Learn how to integrate the Telerik Document Processing Libraries with other Telerik products and manage version compatibility across .NET platforms.
slug: integration-with-other-telerik-products
tags: integration, telerik, products, dependency, version, upgrade, compatibility, libraries
published: True
position: 3
---

<style>
table, th, td {
	border: 1px solid;
}
</style>


# Integration with Other Telerik Products

Many Telerik products use the [Document Processing Libraries]({%slug introduction%}) (DPL) internally for their UI components, such as PDF viewers or spreadsheets, and for their export features. 

Starting with **Q2 2025**, end users can use product-specific components built with an earlier DPL version along with a later DPL version.

The following table lists the main use cases and the required updates according to the .NET version:

||.NET Framework|.NET Core/.NET Standard|
|----|----|----|
|Using Binaries (.DLL)|Use the app.config/web.config file with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/deployment/configuring-assembly-binding-redirection): <br> &lt;bindingRedirect oldVersion="*" newVersion="*" /&gt;|Replace the binaries|
|Using NuGet Packages|Migrate to PackageReferences: [Migrating from packages.config to PackageReference formats](https://learn.microsoft.com/en-us/nuget/consume-packages/migrate-packages-config-to-package-reference)|Update the NuGet packages|

## See Also

* [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%}) 
* [Installing Telerik Document Processing on Your Computer]({%slug installation-deploying-telerik-document-processing%})
* [Integration with UI for WinForms](https://docs.telerik.com/devtools/winforms/integration-with-other-telerik-products/document-processing-libraries)
* [Integration with UI for Blazor](https://www.telerik.com/blazor-ui/documentation/integrations/document-processing-libraries)
* [Download Product Files]({%slug download-product-files%})
