---
title: First Steps
page_title: First Steps
slug: getting-started-first-steps
tags: get,started,first,steps
published: True
position: 1
---

# First Steps

In this getting started guide, we create a simple application that uses the Telerik Document Processing libraries to create a DOCX document and then export it as a PDF file.

The Telerik Document Processing libraries that we use in this guide are UI-independent and cover all .NET technologies, from desktop and web to mobile. They can also be deployed in client, server-side and cloud apps.

## Step 1: Installing on Your Computer

>important Please install **&lt;PackageReference Include="Telerik.Licensing" Version="1.*" /&gt;**.

Since we distribute Telerik Document Processing libraries as an addition to several Telerik UI component bundles, chances are that the libraries are already installed on your system. In this case, all you need is to locate them. The table below provides links to the installation instructions for each of the Telerik UI component suites that give you access to the Telerik Document Processing libraries. If the standard installation of your Telerik UI component suite includes the Document Processing packages, the table also shows their default location.

>tip Regardless of the Telerik UI components suite that you use, you can always get the Document Processing packages as NuGet packages from the [Telerik NuGet server]({%slug installation-nuget-packages%}).

| UI Components suite | Installation instructions | Default location of the Document Processing packages |
|--------------------|---------------------------|------------------------------------------------|
| UI for ASP.NET AJAX | [Installing Telerik UI for ASP.NET AJAX](http://docs.telerik.com/devtools/aspnet-ajax/installation/which-file-do-i-need-to-install) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX [version]\AdditionalLibraries\Bin40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET AJAX [version]\AdditionalLibraries\Bin45`</li></ul> |
| UI for ASP.NET MVC | [Installing Telerik UI for ASP.NET MVC](http://docs.telerik.com/kendo-ui/aspnet-mvc/introduction#installation) |  <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET MVC [version]\dpl\net40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for ASP.NET MVC [version]\dpl\netstandard`</li></ul> |
| UI for ASP.NET Core | [Installing Telerik UI for ASP.NET Core](https://docs.telerik.com/aspnet-core/getting-started/installation/document-processing) | The Telerik Document Processing libraries are available as NuGet packages on the Telerik NuGet server: https://nuget.telerik.com/v3/index.json. |
| UI for Blazor | [Installing Telerik UI for Blazor](https://docs.telerik.com/blazor-ui/common-features/document-processing) | The Telerik Document Processing libraries are available as NuGet packages on the Telerik NuGet server: https://nuget.telerik.com/v3/index.json. |
| UI for WPF | [Installing Telerik UI for WPF](http://docs.telerik.com/devtools/wpf/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries.NoXaml`</li></ul> |
| UI for Silverlight | [Installing Telerik UI for Silverlight](http://docs.telerik.com/devtools/silverlight/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries\Silverlight`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WPF [version]\Binaries.NoXaml\Silverlight`</li></ul> |
| UI for WinForms | [Installing Telerik UI for WinForms](http://docs.telerik.com/devtools/winforms/installation-deployment-and-distribution/installing-on-your-computer) | <ul><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\Bin40`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\Bin50`</li><li>`C:\Program Files (x86)\Progress\Telerik UI for WinForms [version]\BinNetCore`</li></ul> |
| UI for Xamarin | [Installing Telerik UI for Xamarin]([https://docs.telerik.com/devtools/xamarin/installation-and-deployment/system-requirements](https://docs.telerik.com/devtools/xamarin/installation-and-deployment/download-product-files)) | `[installation_path]\Binaries\Portable`|
| UI for WinUI | [Installing Telerik UI for WinUI](https://docs.telerik.com/devtools/winui/installation-and-deployment/installationsteps) | `C:\Program Files (x86)\Progress\Telerik UI for WinUI [version]\DPL`|
| UI for .NET MAUI | [Installing Telerik UI for .NET MAUI](https://docs.telerik.com/devtools/maui/installation/download-product-files) | `[installation_path]/Binaries/Shared`|


## Step 2: Creating Application with Visual Studio

As we are going to create a UI-Independent example, we will use a console project for this guide:

* Open Microsoft Visual Studio and create a new console project. It could be a .NET Framework, .NET Standard, {{site.dotnetversions}} project.

#### __Figure 1: Go to File > New > Project > Console App (.Net Framework) > Next > Create__
![Create Console Project](images/VisualStudio_NewProject_Console3.gif "Create new Console Project")

## Step 3: Add a Telerik Document Processing Library to a Project

This sample application will use [RadWordsProcessing]({%slug radwordsprocessing-overview%}). In this step, we must add the required packages.

1. Reference the packages that provide the __RadWordsProcessing__ functionality:

	For .NET Framework project:
	  * __Telerik.Windows.Documents.Core__
	  * __Telerik.Windows.Documents.Flow__

	For .NET Standard ({{site.dotnetversions}}) project:
	  * __Telerik.Documents.Core__
	  * __Telerik.Documents.Flow__

	>note As of **Q2 2025** the Zip Library will no longer be used as an internal dependency in the rest of the Document Processing Libraries - PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing. It will be replaced by the System.IO.Compression. We will continue to ship the Telerik Zip Library as a standalone library so clients can still use it separately.

1. Reference the package that allows you to export the content as a PDF file:

	For .NET Framework project:
	  * __Telerik.Windows.Documents.Flow.FormatProviders.Pdf__

	For .NET Standard ({{site.dotnetversions}}) project:
	  * __Telerik.Documents.Flow.FormatProviders.Pdf__

> The Document Processing packages for {{site.dotnetversions}} don't contain "Windows" in their names.

## Step 4: Create a Document

#### __Example 1: Create RadFlowDocument__

```csharp
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = new Telerik.Windows.Documents.Flow.Model.RadFlowDocument();
	Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor editor = new Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor(document);
	editor.InsertText("Hello world!");
```

#### __Example 1: Create RadFlowDocument__

```csharp
    Dim document As Telerik.Windows.Documents.Flow.Model.RadFlowDocument = New Telerik.Windows.Documents.Flow.Model.RadFlowDocument()
    Dim editor As Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor = New Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor(document)
    editor.InsertText("Hello world!")
```

## Step 5: Export the Generated Document

### Export the RadFlowDocument to DOCX

To export the document as a docx file, use [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Using the below code will create a provider instance and save a document with it. The document will be exported in the bin folder of your current project.
        

#### __Example 2: Export RadFlowDocument to DOCX__

```csharp
	using (Stream output = new FileStream("output.docx", FileMode.OpenOrCreate))
	{
	    Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider docxProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
	    docxProvider.Export(document, output);
	}
```


#### __Example 2: Export RadFlowDocument to DOCX__

```csharp
	Using output As Stream = New FileStream("output.docx", FileMode.OpenOrCreate)
        Dim docxProvider As Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider()
        docxProvider.Export(document, output, TimeSpan.FromSeconds(10))
    End Using
```

### Export the RadFlowDocument to PDF

To export the document as a PDF file, use [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}). __Example 3__ shows how to export the __RadFlowDocument__  created in Examples 1 to a file.
        
#### __Example 3: Export RadFlowDocument to PDF__

```csharp
	using (Stream output = File.OpenWrite("Output.pdf"))
    {
		Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider flowPdfProvider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
        flowPdfProvider.Export(document, output);
	}
```

#### __Example 2: Export RadFlowDocument to PDF__

```csharp
	Using output As Stream = File.OpenWrite("Output.pdf")
        Dim flowPdfProvider As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        flowPdfProvider.Export(document, output, TimeSpan.FromSeconds(10))
    End Using
```


Run the project and you should see something like this:
#### __Figure 2: The final result__

![Exported files](images/FinalResult.png "Exported files")

## Next Steps

Now that you have run your first project example with Telerik Document Processing Libraries, you may want to explore some additional features like __clone, edit, merge, insert__ documents and more. Below you can find guidance on getting started with such tasks:

* [Explore Features]({%slug getting-started-explore-features%})
* [Further Information]({%slug getting-started-next-steps%})

## See Also

* [System Requirements]({%slug installation-system-requirements%})
* [Installing on your computer]({%slug installation-installing-on-your-computer%})
* [Document Processing SDK Examples](https://github.com/telerik/document-processing-sdk)
* [How to Obtain Telerik Document Processing Libraries for .NET Framework, .NET Standard, {{site.dotnetversions}}]({%slug distribute-telerik-document-processing-libraries-net-versions%})
