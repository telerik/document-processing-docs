---
title: Redistributing Telerik Document Processing
description: Technical guidelines for protecting and redistributing Telerik Document Processing binaries with your integrated product across supported Telerik UI suites.
page_title: Redistributing Telerik Document Processing
slug: installation-deploying-telerik-document-processing
tags: redistribution, telerik, document, processing, binaries, licensing, distribution, guidelines
published: True
position: 1
---

# Redistributing Telerik Document Processing

Telerik Document Processing is part of several Telerik bundles and is licensed under the conditions with which you have obtained the product. This topic contains technical guidelines for protecting the Telerik Document Processing binaries when redistributing them with your integrated product.

| UI Components suite | Guidelines |
|--------------------|---------------------------|
| UI for ASP.NET AJAX | [Protecting the Telerik ASP.NET AJAX Assemblies](https://docs.telerik.com/devtools/aspnet-ajax/deployment/protecting-the-telerik-asp.net-ajax-assembly#protecting-the-document-processing-libraries)|
| UI for WPF | [Protecting the Telerik UI for WPF Assemblies](https://docs.telerik.com/devtools/wpf/licensing/protecting-telerik-assembly#protect-the-telerik-documents-assemblies-by-editing-the-source-code) |
| UI for WinForms | [Protecting the Telerik UI for WinForms Assemblies](https://docs.telerik.com/devtools/winforms/deployment-and-distribution/redistributing-telerik-ui-for-winforms#usingthe-telerik-document-processing-libraries-in-your-solutions) |
| UI for ASP.NET MVC | [ ASP.NET MVC Document Processing Overview](https://docs.telerik.com/aspnet-mvc/document-processing) |  
| UI for ASP.NET Core | [ ASP.NET Core Document Processing Overview](https://docs.telerik.com/aspnet-core/document-processing#telerik-document-processing) |
| UI for Blazor | [ Blazor Document Processing Overview](https://docs.telerik.com/blazor-ui/integrations/document-processing-libraries) |
| UI for WinUI | [ WinUI Document Processing Overview](https://docs.telerik.com/devtools/winui/controls/document-processing/overview) |
| UI for .NET MAUI ||

>important Protecting the Telerik dlls is required only with versions prior to **2025 Q2 (2025.2.520)**. With the introduction of the new [licensing mechanism](https://www.telerik.com/blogs/license-key-files-telerik-kendo-ui-products-2025-update), Telerik UI suites have simplified deployment requirements. **Starting with 2025 Q2, users are no longer required to protect the Telerik assemblies**. Instead, the respective Telerik product now requires [installing a license key]({%slug setting-up-license-key%}). Applications without a valid license will continue to function normally, but will contain a watermark.

## Using the Telerik Document Processing Libraries in Your Solutions

To include the Telerik Document Processing libraries in your application, build the source code as described below. The source code of the Document Processing libraries is distributed together with the above-listed products' source code and is available for download from your account.

For the purpose of this example, the source distribution ZIP file is extracted in `C:\DPL`.         		         
 		 
 **Instructions**

1\. Open `C:\DPL\Documents\Licensing\AssemblyProtection.cs` in a text editor (notepad, Visual Studio, etc.). In versions of the suite prior to R2 2016, the path is `C:\DPL\Documents\Core\Core\Licensing\AssemblyProtection.cs`.   
            
2\. Uncomment the following line:

**Original `IsValid()` implementation before enabling passphrase validation**

```csharp
	public static bool IsValid()
    {
        // Uncomment the following line
        // return ValidatePassPhrase();
        return true;
    }
```

**Updated `IsValid()` implementation with passphrase validation enabled**

```csharp
	public static bool IsValid()
    {
        // Uncomment the following line
        return ValidatePassPhrase();
    }
```

3\. Change the `ApplicationName` constant to match the name of your application:

**Original `ApplicationName` constant value**

```csharp
	internal const string ApplicationName = "MyApp";
```

**Updated `ApplicationName` constant with your application name**

```csharp
	internal const string ApplicationName = "Sample Application Name v2.0 (tm)";
```


4\. Save `AssemblyProtection.cs` and rebuild.           

5\. In your application replace the existing references to the Telerik assemblies with the ones built from the source code.

6\. If you run the application now you will get an exception with the message "This version of *Product* is licensed only for use by Sample Application Name v2.0 (tm)". The "Sample Application Name v2.0 (tm)" text is replaced with the value of the `ApplicationName` constant.
