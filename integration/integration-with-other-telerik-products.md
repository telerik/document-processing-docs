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

Many Telerik products utilize internally the [Document Processing Libraries]({%slug introduction%}) (DPL) for their UI components, like Pdf viewers, or for their export functionalities to take most of the DPL capabilities. 

As of **Q2 2025** end-users are able to use product specific components, built with older DPL version, along with a newer DPL version.

The following table lists the main use-cases together with the necessary updates that are required by the developer according to the .NET version:

||.NET Framework|.NET Standard|
|----|----|----|
|Using Binaries (.DLL)|Need to use the app.config/web.config file with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/deployment/configuring-assembly-binding-redirection): <br> &lt;bindingRedirect oldVersion="*" newVersion="*" /&gt;|Just replace the binaries|
|Using NuGet Packages|Migrate to PackageReferences: [Migrating from packages.config to PackageReference formats](https://learn.microsoft.com/en-us/nuget/consume-packages/migrate-packages-config-to-package-reference)|Just update the NuGet packages|


>important **Before Q2 2025** there was a DPL **version dependency** which does not allow the use of a newer DPL assembly version along with the Product Dependent binaries build with older DPL version. <br> For example: If a client uses the WinForms's PdfViewer component with version *2024.4.1113*, since the control is optimized to work together with the [RadPdfProcessing](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview) library model, it internally uses the **Telerik.Windows.Documents.Core** and **Telerik.Windows.Documents.Fixed** assemblies with version *2024.4.1106*. If he wants to upgrade **only** the DPL version to *2025.1.120*, it is necessary to wait for a Product version of the WinForms product specifically built against DPL with version 2025.1.120.


## See Also

- [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%}) 
- [Installing Telerik Document Processing on Your Computer]({%slug installation-deploying-telerik-document-processing%})
- [Integration with UI for WinForms](https://docs.telerik.com/devtools/winforms/integration-with-other-telerik-products/document-processing-libraries)
- [Integration with UI for Blazor](https://www.telerik.com/blazor-ui/documentation/integrations/document-processing-libraries)