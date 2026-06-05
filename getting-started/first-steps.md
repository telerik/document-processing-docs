---
title: First Steps
description: A step-by-step guide to creating your first application with Telerik Document Processing libraries - create a DOCX document and export it as a PDF file.
page_title: First Steps
slug: getting-started-first-steps
tags: document, processing, installation, nuget, docx, pdf, radwordsprocessing, application
published: True
position: 1
---

# First Steps

In this getting started guide, you create a simple application that uses the Telerik Document Processing libraries to create a DOCX document and then export it as a PDF file.

The Telerik Document Processing libraries used in this guide are UI-independent and cover all .NET technologies, from desktop and web to mobile. They can also be deployed in client, server-side, and cloud apps.

## Step 1: Installing on Your Computer

>important Install **&lt;PackageReference Include="Telerik.Licensing" Version="1.*" /&gt;**.

The Telerik Document Processing libraries are distributed as an addition to several Telerik UI component bundles. The libraries may already be installed on your system. In this case, all you need is to locate them. The following table provides links to the installation instructions for each of the Telerik UI component suites that give you access to the Telerik Document Processing libraries. If the standard installation of your Telerik UI component suite includes the Document Processing packages, the table also shows their default location.

>tip Regardless of the Telerik UI components suite that you use, you can always get the Document Processing packages as NuGet packages from the [Telerik NuGet server]({%slug installation-nuget-packages%}).

| UI Components suite | Installation instructions | Default location of the Document Processing packages |
|--------------------|---------------------------|------------------------------------------------|
| UI for ASP.NET AJAX | [Installing Telerik UI for ASP.NET AJAX](https://docs.telerik.com/devtools/aspnet-ajax/installation/which-file-do-i-need-to-install) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX [version]\AdditionalLibraries\Bin40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX [version]\AdditionalLibraries\Bin45`</li></ul> |
| UI for ASP.NET MVC | [Installing Telerik UI for ASP.NET MVC](https://docs.telerik.com/kendo-ui/aspnet-mvc/introduction#installation) |  <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET MVC [version]\dpl\net40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET MVC [version]\dpl\netstandard`</li></ul> |
| UI for ASP.NET Core | [Installing Telerik UI for ASP.NET Core](https://docs.telerik.com/aspnet-core/getting-started/installation/document-processing) | The Telerik Document Processing libraries are available as NuGet packages on the Telerik NuGet server: https://nuget.telerik.com/v3/index.json. |
| UI for Blazor | [Installing Telerik UI for Blazor](https://docs.telerik.com/blazor-ui/common-features/document-processing) | The Telerik Document Processing libraries are available as NuGet packages on the Telerik NuGet server: https://nuget.telerik.com/v3/index.json. |
| UI for WPF | [Installing Telerik UI for WPF](https://docs.telerik.com/devtools/wpf/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries.NoXaml`</li></ul> |
| UI for Silverlight | [Installing Telerik UI for Silverlight](https://docs.telerik.com/devtools/silverlight/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries\Silverlight`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries.NoXaml\Silverlight`</li></ul> |
| UI for WinForms | [Installing Telerik UI for WinForms](https://docs.telerik.com/devtools/winforms/installation-deployment-and-distribution/installing-on-your-computer) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\Bin40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\Bin50`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\BinNetCore`</li></ul> |
| UI for WinUI | [Installing Telerik UI for WinUI](https://docs.telerik.com/devtools/winui/installation-and-deployment/installationsteps) | `C:\Program Files (x86)\Progress\Telerik UI for WinUI [version]\DPL`|
| UI for .NET MAUI | [Installing Telerik UI for .NET MAUI](https://docs.telerik.com/devtools/maui/installation/download-product-files) | `[installation_path]/Binaries/Shared`|


## Step 2: Creating an Application with Visual Studio

This guide uses a console project to create a UI-independent example:

* Open Microsoft Visual Studio and create a new console project. It can be a .NET Framework, .NET Standard, or {{site.dotnetversions}} project.

#### **Figure 1: Go to File > New > Project > Console App (.NET Framework) > Next > Create**
![Create Console Project](images/VisualStudio_NewProject_Console3.gif "Create new Console Project")

## Step 3: Add a Telerik Document Processing Library to a Project

This sample application uses [RadWordsProcessing]({%slug radwordsprocessing-overview%}). In this step, you must add the required packages.

1. Reference the packages that provide the `RadWordsProcessing` functionality:

	For .NET Framework project:
	  * `Telerik.Windows.Documents.Core`
	  * `Telerik.Windows.Documents.Flow`

	For .NET Standard ({{site.dotnetversions}}) project:
	  * `Telerik.Documents.Core`
	  * `Telerik.Documents.Flow`

	>note Starting with **Q2 2025**, the Zip Library is no longer used as an internal dependency in the rest of the Document Processing libraries (PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing). It is replaced by `System.IO.Compression`. The Telerik Zip Library continues to ship as a standalone library so you can still use it separately.

1. Reference the package that allows you to export the content as a PDF file:

	For .NET Framework project:
	  * `Telerik.Windows.Documents.Flow.FormatProviders.Pdf`

	For .NET Standard ({{site.dotnetversions}}) project:
	  * `Telerik.Documents.Flow.FormatProviders.Pdf`

You can find all Document Processing Libraries packages in the [Available NuGet Packages]({%slug available-nuget-packages%}) article.

## Step 4: Create a Document

#### **Example 1: Create a RadFlowDocument**

<snippet id='first-steps-create-document'/>

## Step 4-A: Import an Existing Document

#### **Example 1-A: Import a DOCX File**

<snippet id='first-steps-import-docx'/>

## Step 5: Export the Generated Document

### Export the RadFlowDocument to DOCX

To export the document as a DOCX file, use the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). The following code creates a provider instance and saves a document with it. The document is exported to the bin folder of your current project.
        

#### **Example 2: Export RadFlowDocument to DOCX**

<snippet id='first-steps-export-docx'/>

### Export the RadFlowDocument to PDF

To export the document as a PDF file, use the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}). **Example 3** shows how to export the `RadFlowDocument` created in Example 1 to a file.
        
#### **Example 3: Export RadFlowDocument to PDF**

<snippet id='first-steps-export-pdf'/>

Run the project and you should see something like this:

#### **Figure 2: The Final Result**

![Exported files](images/FinalResult.png "Exported files")

## Next Steps

Now that you have run your first project example with the Telerik Document Processing libraries, you may want to explore additional features like **clone**, **edit**, **merge**, and **insert** documents. The following resources provide guidance on getting started with such tasks:

* [Explore Features]({%slug getting-started-explore-features%})
* [Further Information]({%slug getting-started-next-steps%})

## See Also

* [System Requirements]({%slug installation-system-requirements%})
* [Installing on your computer]({%slug installation-installing-on-your-computer%})
* [Document Processing SDK Examples](https://github.com/telerik/document-processing-sdk)
* [How to Obtain Telerik Document Processing Libraries for .NET Framework, .NET Standard, {{site.dotnetversions}}]({%slug distribute-telerik-document-processing-libraries-net-versions%})
