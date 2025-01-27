---
title: Introduction
page_title: Welcome to Telerik Document Processing Libraries
description: Telerik Document Processing is a bundle of UI-independent, cross-platform APIs enabling you to process the most commonly used flow, fixed and spreadsheet document formats. 
slug: introduction
tags: introduction, dpl, document, processing, pdf, word, excel
published: True
position: 0
---

<style>
table th:first-of-type {
	width: 25%;
} 
</style>

# Welcome to Telerik Document Processing Libraries

**Telerik Document Processing** is a bundle of **UI-independent** *cross-platform* libraries that enable you to process the most commonly used flow, fixed and spreadsheet document formats for web and desktop. The Document Processing library allows you to create, import, modify and export documents without relying on external dependencies like Adobe Acrobat or Microsoft Office.

![DPL Ninja](images/dpl-ninja.png) 

{% if site.has_cta_panels == true %}
{% include cta-panel-introduction.html %}
{% endif %}

## Libraries

Telerik Document Processing features the following components:

|Library|Description||
|----|----|----|
| [RadPdfProcessing]({%slug radpdfprocessing-overview%})|A processing library that allows you to create, import, and export PDF documents from your code. You can use it in any web or desktop .NET application without relying on third-party software like Adobe Acrobat.|![Pdf](images/dpl-pdf.png)|
|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|A powerful library that enables you to create applications with native support for spreadsheet documents. With RadSpreadProcessing, you can create spreadsheets from scratch, modify existing documents or convert between the most common spreadsheet formats. You can save the generated workbook to a local file, stream, or stream it to the client browser.|![Spread](images/dpl-spread.png)| 
|[RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%})|Spread streaming is a document processing paradigm that allows you to create or read big spreadsheet documents with great performance and minimal memory footprint. The key for the memory efficiency is that the spread streaming library writes the spreadsheet content directly to a stream without creating and preserving the spreadsheet document model in memory.|![SpreadStream](images/dpl-spread.png)| 
|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|A processing library that allows you to create, modify and export documents to a variety of formats. Through the API, you can access each element in the document and modify, remove it or add a new one. The generated content you can save as a stream, as a file, or sent it to the client browser.|![Words](images/dpl-words.png)|  
|[RadZipLibrary]({%slug radziplibrary-overview%})| It allows you to compress and combine files in ZIP archives, browse and extract files from existing ZIP archives and compress streams for easy file shipping and reduced storage space.|![Zip](images/dpl-zip.png)|  

## Key Features

|Feature|Description|
|----|----|
|**UI-Independent**|The libraries are UI-Independent and cover all .NET technologies, from desktop and web to mobile, and can be deployed in client, server-side and cloud apps.|
|**No need for 3rd party software - No Server Deployment Fees**|Enable document manipulation within your application without relying on 3rd party software such as Microsoft Office or Adobe Acrobat Reader.|
|**Convenient API**|Add document processing capabilities to your applications in no time by utilizing the convenient APIs. Enable creating, editing and converting documents with just a few lines of code.|
|**Performance and Speed**|The libraries are decoupled from UI and can provide a great performance in different cases, especially when dealing with huge excel files.|
|**Any document. Any Business.**|The Telerik Document Processing is suitable for various business cases and scenarios, where document creation or manipulation is required|
|**Support for Variety of File Formats**|The Telerik Document Processing includes 5 libraries for manipulating [Office Open XML](https://en.wikipedia.org/wiki/Office_Open_XML) file formats and PDF documents in your application.|
|**Timeout Mechanism**|[Timeout Mechanism]({%slug timeout-mechanism-in-dpl%}) for importing and exporting documents. The **Import** and **Export** methods of all FormatProviders have a mandatory *TimeSpan?* timeout parameter after which the operation will be cancelled.|

For more details about the benefits of using Telerik Document Processing, see the [Telerik Document Processing product overview page](https://www.telerik.com/document-processing-libraries).

## Supported Formats


The Telerik Document Processing libraries support the following file formats:

* DOCX (Word Document)
* DOC (Word 97-2003 Document)
* DOT (Word 97-2003 Template)
* HTML
* PDF
* RTF
* TXT
* XLSX (Excel Workbook)
* XLS (Excel 97-2003 Workbook)
* XLSM (macro-enabled spreadsheet created by Microsoft Excel) *Macros are only preserved during import and export. They cannot be executed or changed in the code.
* CSV
* ZIP

![DPL Ninja](images/dpl-formats.png) 

## Available Assemblies

>The Telerik Document Processing libraries are available in **.NET Framework**, **.NET Core/.NET 6/.NET 8/.NET 9** (or newer) for Windows and **.NET Standard** compatible versions. You can download the assemblies of these libraries from the following products:
>

|.NET Framework Products|.NET Core/.NET 6/.NET 8/.NET 9 *for Windows*|.NET Standard|
|----|----|----|
|[UI for ASP.NET MVC](https://www.telerik.com/aspnet-mvc)||[UI for Xamarin](https://www.telerik.com/xamarin-ui)|
|[UI for ASP.NET AJAX](https://www.telerik.com/products/aspnet-ajax.aspx)||[UI for ASP.NET Core](https://www.telerik.com/aspnet-core-ui)|
|[UI for WPF](https://www.telerik.com/products/wpf/overview.aspx)|[UI for WPF](https://www.telerik.com/products/wpf/overview.aspx)|[UI for Blazor](https://www.telerik.com/blazor-ui)|
|[UI for WinForms](https://www.telerik.com/products/winforms.aspx)|[UI for WinForms](https://www.telerik.com/products/winforms.aspx)|[UI for WinUI](https://www.telerik.com/winui)|
|[UI for Silverlight (discontinued)](https://www.telerik.com/products/silverlight/overview.aspx)||[UI for .NET MAUI](https://www.telerik.com/maui-ui)|

All versions are available as [NuGet packages]({%slug installation-nuget-packages%}). The assemblies/packages for .NET Standard do not contain the word *Windows* in their name. Learn [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})

## Getting Started

To start using the libraries right away, see the [First Steps]({%slug getting-started-first-steps%}) topic that demonstrates how to create a sample application that uses the Document Processing libraries.

## Trial Version and Commercial License

Telerik Document Processing is a commercial library. You are welcome to explore its full functionality and get technical support from the team when you register for a free 30-day trial. To use it commercially, you need to [purchase a license](https://www.telerik.com/purchase.aspx). Feel free to review the Telerik [License Agreement](https://www.telerik.com/purchase/license-agreement/devcraft-complete-dlw-s) to get acquainted with the full terms of use.	

>Telerik Document Processing is available as part of **DevCraft**, **UI for ASP.NET Core**, **UI for ASP.NET MVC**, **UI for ASP.NET AJAX**, **UI for Blazor**, **UI for .NET MAUI**, **UI for Xamarin**, **UI for WPF**, **UI for WinForms**, **UI for Silverlight***. The libraries are subject to the license under which you've obtained the assemblies. ( * [Learn about Telerik UI for Silverlight discontinuation, end user options and alternatives.](https://www.telerik.com/products/silverlight/overview.aspx)).

## Support Options

For any issues you might encounter while working with Telerik Document Processing, use any of the available support channels:

* License holders and active trialists can take advantage of our outstanding customer support delivered by the developers building the library. To submit a support ticket, use the [dedicated support system](https://www.telerik.com/account/support-tickets?pid=1886&supcId=daf62541-57e0-b84c-8b5e-da9851c61873&fbp=false). Learn [How to Get the Most Out of the Telerik Document Processing Support]({%slug submit-support-tickets%}).
* Our [forums](https://www.telerik.com/forums/telerik-document-processing) are part of the free support you can get from the community and from the team on all kinds of general issues.
* Our [feedback portal](https://feedback.telerik.com/document-processing) provides information on the features/bugs in discussion and also the planned ones for release.
* You may still need a tailor-made solution for your project. In such cases, go straight to [Progress Services](https://www.progress.com/services).

## Learning Resources

* [Online Demo application](https://demos.telerik.com/document-processing)
* [Knowledge Base](https://docs.telerik.com/devtools/document-processing/knowledge-base)
* [Virtual Classroom](https://www.telerik.com/account/support/virtual-classroom)

## Help us Improve the Telerik Document Processing Libraries' Documentation

We believe that the documentation for a product is at its best when the content is a collaboration between the builders and consumers of that product. Everybody can play a role in making our documentation better and we encourage you to help us with that task in the way that you choose:

* **Submit a New Issue at GitHub**

If you find an issue with our docs that needs to be addressed, the best way to let us know is by creating an issue in our [Github repository](https://github.com/telerik/document-processing-docs/issues). When creating an issue, please provide a descriptive title, be as specific as possible, and link to the documentation in question. If you can provide a link to the closest anchor to the issue, that is even better.

* **Update the Documentation at GitHub**

Creating an issue is great, but what we really love are pull requests. This is the most direct method. So, if you find an issue in the docs, or even feel like creating new content, we’d be happy to have your contributions! The basic steps are that you fork our documentation and submit a pull request. That way you may contribute to exactly where you found the error. After that, our technical writing team just needs to approve your change request. Please use only standard markdown. For more detailed instructions, please follow [the contribution instructions] (https://github.com/telerik/document-processing-docs/blob/master/README.md) published on GitHub.

* **Forums**

You can visit the [Telerik Document Processing forum](https://www.telerik.com/forums/telerik-document-processing) and leave us feedback. Please notice that this method will take a bit longer to reach our documentation team. However, if you need a fast reply from our support team, leaving feedback in the forum guarantees a support number for your suggestions, and that we will follow up on it.

Thank you for your contribution to the Telerik Document Processing Libraries' Documentation!

## Next Steps

- [Document Processing Libraries Overview]({%slug getting-started%})
- [First Steps in using Telerik Document Processing]({%slug getting-started-first-steps%})
- [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})
- [How to Get the Most Out of the Telerik Document Processing Support]({%slug submit-support-tickets%})
