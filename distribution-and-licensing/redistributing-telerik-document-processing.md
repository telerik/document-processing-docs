---
title: Redistributing Telerik Document Processing
page_title: Redistributing Telerik Document Processing
slug: installation-deploying-telerik-document-processing
tags: distributing,instructions,document,processing
published: True
position: 1
---

# Redistributing Telerik Document Processing

Telerik Document Processing is part of several Telerik bundles and is licensed under the conditions with which you've obtained the product. This topic contains technical guidelines for protecting the Telerik Document Processing binaries when redistributing them with your integrated product. 

| UI Components suite | Guidelines |
|--------------------|---------------------------|
| UI for ASP.NET AJAX | [Protecting the Telerik ASP.NET AJAX Assemblies](https://docs.telerik.com/devtools/aspnet-ajax/deployment/protecting-the-telerik-asp.net-ajax-assembly#protecting-the-document-processing-libraries)|
| UI for WPF | [Protecting the Telerik UI for WPF Assemblies](https://docs.telerik.com/devtools/wpf/licensing/protecting-telerik-assembly#protect-the-telerik-documents-assemblies-by-editing-the-source-code) |
| UI for WinForms | [Protecting the Telerik UI for WinForms Assemblies](https://docs.telerik.com/devtools/winforms/deployment-and-distribution/redistributing-telerik-ui-for-winforms#usingthe-telerik-document-processing-libraries-in-your-solutions) |
| UI for ASP.NET MVC | [ ASP.NET MVC Document Processing Overview](https://docs.telerik.com/aspnet-mvc/document-processing) |  
| UI for ASP.NET Core | [ ASP.NET Core Document Processing Overview](https://docs.telerik.com/aspnet-core/document-processing#telerik-document-processing) |
| UI for Blazor | [ Blazor Document Processing Overview](https://docs.telerik.com/blazor-ui/integrations/document-processing-libraries) |
| UI for WinUI | [ WinUI Document Processing Overview](https://docs.telerik.com/devtools/winui/controls/document-processing/overview) |
| UI for Silverlight ([Discontinued](https://www.telerik.com/products/silverlight/overview.aspx)) | [Protecting the Telerik UI for Silverlight Assemblies](https://docs.telerik.com/devtools/silverlight/licensing/protecting-telerik-assembly#protect-the-telerik-documents-assemblies-by-editing-the-source-code) |
| UI for .NET MAUI ||
| UI for Xamarin ||

>important Protecting the Telerik dlls is required only with versions prior to **2025 Q2 (2025.2.520)**. With the introduction of our new [licensing mechanism](https://www.telerik.com/blogs/license-key-files-telerik-kendo-ui-products-2025-update), Telerik UI suites have simplified deployment requirements. __Starting with 2025 Q2, users are no longer required to protect the Telerik assemblies__. Instead, the respective Telerik product now requires [installing a license key]({%slug setting-up-license-key%}). Applications without a valid license will continue to function normally, but will contain a watermark.

## Using the Telerik Document Processing Libraries in Your Solutions

In order to include the Telerik Document Processing libraries in your application, you should build the source code as described below. The source code of the Document Processing libraries is distributed together with the above-listed products' source code and is available for download from the client's account. 

For the sake of the example it is assumed that the source distribution ZIP file is extracted in C:\DPL.         		         
 		 
 __Instructions__

1\. Open `C:\DPL\Documents\Licensing\AssemblyProtection.cs` in a text editor (notepad, Visual Studio, etc.). In versions of the suite prior to R2 2016, the path is `C:\DPL\Documents\Core\Core\Licensing\AssemblyProtection.cs`.   
            
2\. Uncomment the following line:

#### __[C#] Before

{{region cs-documentprocessing-protect-source_0}}
	public static bool IsValid()
    {
        // Uncomment the following line
        // return ValidatePassPhrase();
        return true;
    }
{{endregion}}

#### __[C#] After

{{region cs-documentprocessing-protect-source_1}}
	public static bool IsValid()
    {
        // Uncomment the following line
        return ValidatePassPhrase();
    }
{{endregion}}

3\. Change the ApplicationName constant to match the name of your application:

#### __[C#] Before

{{region cs-documentprocessing-protect-source_2}}
	internal const string ApplicationName = "MyApp";
{{endregion}}

#### __[C#] After

{{region cs-documentprocessing-protect-source_3}}
	internal const string ApplicationName = "Sample Application Name v2.0 (tm)";
{{endregion}}


4\. Save __AssemblyProtection.cs__ and rebuild.           

5\. In your application replace the existing references to the Telerik assemblies with the ones built from the source code.

6\. If you run the application now you should get an exception with message “This version of *Product* is licensed only for use by Sample Application Name v2.0 (tm)”. Note that “Sample Application Name v2.0 (tm)” will be replaced with the value of the ApplicationName constant.
