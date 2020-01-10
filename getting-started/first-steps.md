---
title: First Steps
page_title: First Steps
description: First Steps
slug: getting-started-first-steps
tags: get,started,first,steps
published: True
position: 1
---

# First Steps

This article explains how to get started with one of the Telerik Document Processing Libraries quickly. As the libraries are UI-Independent and cover all .NET technologies, from desktop and web to mobile, and can also be deployed in client, server-side and cloud apps you need to consider the suite with which you've obtained the product.

Once you have first example up and running, take a look at the [next steps](#next-steps) section to start exploring the rest of the functionality in more details.

For additional resources you can also review the Related Articles section on the right.


## Installing on Your Computer

Telerik Document Processing is part of several Telerik bundles and is installed following the steps for installing the suite with which you've obtained the product.

1. UI for ASP.NET AJAX - [Installing Telerik UI for ASP.NET AJAX](http://docs.telerik.com/devtools/aspnet-ajax/installation/which-file-do-i-need-to-install). 
When the installation completes, the Telerik Document Processing assemblies will be available in the *AdditionalLibraries* sub-folder.

1. UI for ASP.NET MVC - [Installing Telerik UI for ASP.NET MVC](http://docs.telerik.com/kendo-ui/aspnet-mvc/introduction#installation). 
When the installation completes, the Telerik Document Processing assemblies will be available in the *AdditionalLibraries* sub-folder.

1. UI for ASP.NET Core - [Installing Telerik UI for ASP.NET Core](https://docs.telerik.com/aspnet-core/getting-started/installation/document-processing). 
The libraries can be used through the available NuGet packages.

1. UI for Blazor - [Installing Telerik UI for Blazor](https://docs.telerik.com/blazor-ui/common-features/document-processing). 
The libraries can be used through the available NuGet packages.

1. UI for WPF - [Installing Telerik UI for WPF](http://docs.telerik.com/devtools/wpf/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html)

1. UI for Silverlight - [Installing Telerik UI for Silverlight](http://docs.telerik.com/devtools/silverlight/installation-and-deployment/installing-telerik-ui-on-your-computer/installation-installing-which-file-do-i-need.html)

1. UI for WinForms - [Installing Telerik UI for WinForms](http://docs.telerik.com/devtools/winforms/installation-deployment-and-distribution/installing-on-your-computer)

1. UI for Xamarin - [Installing Telerik UI for Xamarin](https://docs.telerik.com/devtools/xamarin/installation-and-deployment/system-requirements)

## Creating Application with Visual Studio

As we are going to review a UI-Independent example we will use a console project.

1. Open Microsoft Visual Studio and create a new console project

#### __Figure 1: Go to File > New > Project > Console App (.Net Framework) > Next > Create__
![Create Console Project](images/VisualStudio_NewProject_Console3.gif "Create new Console Project")

## Add a Teleik Document Processing Library to a Project

For this example we will go through the creation of a sample application that uses [RadWordsProcessing]({%slug radwordsprocessing-overview%}).

### Assembly References

Here is a list of assemblies that contain the __RadWordsProcessing__ functionality and need to be referenced in your project:

* __Telerik.Windows.Documents.Core.dll__
* __Telerik.Windows.Documents.Flow.dll__
* __Telerik.Windows.Zip.dll__

Since we are going to export to a Docx and PDF file later in this example, we will also need to reference the below assemblies:
* __Telerik.Windows.Documents.Flow.FormatProviders.Docx.dll__
* __Telerik.Windows.Documents.Flow.FormatProviders.Pdf.dll__

> Please note that for .NET Core, the references don't contain "Windows" in the assembly names.

#### __[C#] Example 1: Create RadFlowDocument__

{{region cs-radwordsprocessing-getting-started_0}}
	Telerik.Windows.Documents.Flow.Model.RadFlowDocument document = new Telerik.Windows.Documents.Flow.Model.RadFlowDocument();
	Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor editor = new Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor(document);
	editor.InsertText("Hello world!");
{{endregion}}

#### __[VB.NET] Example 1: Create RadFlowDocument__

{{region cs-radwordsprocessing-getting-started_0}}
    Dim document As Telerik.Windows.Documents.Flow.Model.RadFlowDocument = New Telerik.Windows.Documents.Flow.Model.RadFlowDocument()
    Dim editor As Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor = New Telerik.Windows.Documents.Flow.Model.Editing.RadFlowDocumentEditor(document)
    editor.InsertText("Hello world!")
{{endregion}}

### Exporting RadFlowDocument to Docx

Exporting the document to docx file can be achieved with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Using the below code will create a provider instance and save a document with it. The document will be exported in the bin folder of your current project.
        

#### __[C#] Example 2: Export RadFlowDocument to Docx__

{{region cs-radwordsprocessing-getting-started_1}}
	using (Stream output = new FileStream("output.docx", FileMode.OpenOrCreate))
	{
	    Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider();
	    provider.Export(document, output);
	}
{{endregion}}


#### __[VB.NET] Example 2: Export RadFlowDocument to Docx__

{{region cs-radwordsprocessing-getting-started_0}}
	Using output As Stream = New FileStream("output.docx", FileMode.OpenOrCreate)
        Dim provider As Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider()
        provider.Export(document, output)
    End Using
{{endregion}}


### Exporting RadFlowDocument to PDF

If you want to export the same document to a PDF format you will need to use [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}). __Example 3__ shows how to export the __RadFlowDocument__  created in Examples 1 to a file.
        
#### __[C#] Example 3: Export RadFlowDocument to PDF__

{{region cs-radpdfprocessing-getting-started_2}}
	using (Stream output = File.OpenWrite("Output.pdf"))
    {
		Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider providerPDF = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
        providerPDF.Export(document, output);
	}
{{endregion}}

#### __[VB.NET] Example 2: Export RadFlowDocument to Docx__

{{region cs-radwordsprocessing-getting-started_0}}
	Using output As Stream = File.OpenWrite("Output.pdf")
        Dim providerPDF As Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider = New Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider()
        providerPDF.Export(document, output)
    End Using
{{endregion}}


Run the project and you should see something like this:
#### __Figure 2: The final result__

![Exported files](images/FinalResult.png "Exported files")

## Next Steps

Now that you have run your first project example with Telerik Document Processing Libraries, you may want to explore some additional features like __clone, edit, merge, insert__ documents and more. Below you can find guidance on getting started with such tasks:

* [Explore Features]({%slug getting-started-explore-features%})
* [Further Information]({%slug getting-started-next-steps%})
 
## See Also

* [System Requirements]({%slug installation-system-requirements%})
* [Installeing on your computer]({%slug installation-installing-on-your-computer%})
* [Document Processing SDK Examples](https://github.com/telerik/document-processing-sdk)
