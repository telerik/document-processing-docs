---
title: Integration with Other Telerik Products
page_title: Integration with Other Telerik Products
description: Integration with Other Telerik Products
slug: integration-with-other-telerik-products
tags: integration, telerik, products, dependency, version, specific, upgrade
published: True
position: 3
---

<style>
table, th, td {
	border: 1px solid;
}
</style>


# Integration with Other Telerik Products

Many Telerik products utilize internally the [Document Processing Libraries]({%slug introduction%}) (DPL) for their UI components, like Pdf viewers or Spreadsheets, or for their export functionalities to take most of the DPL capabilities. 

As of **Q2 2025** end-users are able to use product specific components, built with older DPL version, along with a newer DPL version.

The following table lists the main use-cases together with the necessary updates that are required by the developer according to the .NET version:

||.NET Framework|.NET Standard|
|----|----|----|
|Using Binaries (.DLL)|Need to use the app.config/web.config file with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/deployment/configuring-assembly-binding-redirection): <br> &lt;bindingRedirect oldVersion="*" newVersion="*" /&gt;|Just replace the binaries|
|Using NuGet Packages|Migrate to PackageReferences: [Migrating from packages.config to PackageReference formats](https://learn.microsoft.com/en-us/nuget/consume-packages/migrate-packages-config-to-package-reference)|Just update the NuGet packages|

## See Also

- [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%}) 
- [Installing Telerik Document Processing on Your Computer]({%slug installation-deploying-telerik-document-processing%})
- [Integration with UI for WinForms](https://docs.telerik.com/devtools/winforms/integration-with-other-telerik-products/document-processing-libraries)
- [Integration with UI for Blazor](https://www.telerik.com/blazor-ui/documentation/integrations/document-processing-libraries)
- [Download Product Files]({%slug download-product-files%})