---
title: Introduction
page_title: Welcome to Telerik Document Processing Libraries
description: Telerik Document Processing is a bundle of UI-independent, cross-platform libraries that let you create, import, modify, and export flow, fixed, and spreadsheet document formats without external dependencies.
slug: introduction
tags: document, processing, pdf, docx, xlsx, telerik, libraries, dotnet
published: True
position: 0
---

<style>
table th:first-of-type {
	width: 25%;
} 

img[alt$="><"] {
  display: block;
  max-width: 100%;
  height: auto;
  margin: auto;
  float: none!important;
}
</style>

# Welcome to Telerik Document Processing Libraries

**Telerik Document Processing** is a bundle of **UI-independent**, *cross-platform* libraries that let you process common flow, fixed, and spreadsheet document formats in desktop, web, mobile, and cloud applications. The libraries let you create, import, modify, and export documents without requiring Adobe Acrobat or Microsoft Office.

{% if site.has_cta_panels == true %}
{% include cta-panel-introduction.html %}
{% endif %}

## Libraries

Telerik Document Processing includes the following libraries and AI tooling:

<article-card-container>
  <article-card
        href="slug://radpdfprocessing-overview"
        src="./images/pdfprocessing-banner.png"
        darkSrc="./images/pdfprocessing-banner.png"
        title="RadPdfProcessing"
        subTitle="Document Processing"
        description="Enables the creation, editing, and export of PDF files in your .NET applications. The library supports interactive forms, form filling, and digital signatures.">
  </article-card>
  <article-card
        href="slug://radspreadprocessing-overview"
        src="./images/spreadprocessing-banner.jpg"
        darkSrc="./images/spreadprocessing-banner.jpg"
        title="RadSpreadProcessing"
        subTitle="Document Processing"
        description="Enables you to work with spreadsheet documents, create them from scratch, modify existing documents, or convert between the most common spreadsheet formats.">
  </article-card>
  <article-card
        href="slug://radspreadstreamprocessing-overview"
        src="./images/spreadstreamprocessing-banner.png"
        darkSrc="./images/spreadstreamprocessing-banner.png"
        title="RadSpreadStreamProcessing"
        subTitle="Document Processing"
        description="Generates big spreadsheet documents with great performance and minimal memory footprint in your .NET applications. ">
  </article-card>
  <article-card
        href="slug://radwordsprocessing-overview"
        src="./images/wordsprocessing-banner.png"
        darkSrc="./images/wordsprocessing-banner.png"
        title="RadWordsProcessing"
        subTitle="Document Processing"
        description="Enables Word-like document processing in .NET applications and lets end users create, modify, and export documents to various formats.">
  </article-card>
  <article-card
        href="slug://radziplibrary-overview"
        src="./images/ziplibrary-banner.png"
        darkSrc="./images/ziplibrary-banner.png"
        title="RadZipLibrary"
        subTitle="Document Processing"
        description="Lets you compress data such as images, DOCX, PDF, and other file types for fast, secure transfer and storage.">
  </article-card>
    <article-card
        href="slug://agent-tools-overview"
        src="./images/agent-tools-banner.png"
        darkSrc="./images/agent-tools-banner.png"
        title="AI Tools"
        subTitle="Agent Tools"
        description="Provides document processing capabilities designed to be exposed to AI agents.">
  </article-card>
</article-card-container>


![DPL Ninja ><](images/dpl-ninja-banner.png) 

## Key Features

|Feature|Description|
|----|----|
|**UI-Independent**|The libraries are UI-independent and support .NET applications across desktop, web, mobile, client-side, server-side, and cloud environments.|
|**No Third-Party Software or Server Deployment Fees**|Process documents in your application without third-party software such as Microsoft Office or Adobe Acrobat Reader.|
|**Convenient API**|Add document processing capabilities to your applications quickly by using the convenient APIs. Create, edit, and convert documents with a few lines of code.|
|**Performance and Speed**|The libraries are decoupled from UI and deliver strong performance, especially when you work with large Excel files.|
|**Any Document. Any Business.**|Telerik Document Processing is suitable for various business cases and scenarios where document creation or manipulation is required.|
|**Support for a Variety of File Formats**|Telerik Document Processing includes libraries for working with <a href="https://en.wikipedia.org/wiki/Office_Open_XML" target="_blank" rel="noopener noreferrer" title="https://en.wikipedia.org/wiki/Office_Open_XML">Office Open XML document formats</a>, PDF documents, and ZIP archives in your application.|
|**Timeout Mechanism**|The [document import and export timeout mechanism]({%slug timeout-mechanism-in-dpl%}) applies to importing and exporting documents. The **Import** and **Export** methods of all FormatProviders have a mandatory `TimeSpan?` timeout parameter after which the operation is cancelled.|
|**GenAI-powered Document Insights**|Extract insights from PDF documents by using Large Language Models (LLMs). This feature lets you summarize document content and ask questions about it, with the AI providing relevant answers based on the document content. [Explore GenAI-powered PDF document insights]({%slug radpdfprocessing-features-gen-ai-powered-document-insights-overview%}).|
|**AI Coding Assistant**|Provides specialized context to AI models so they can generate higher-quality code samples. [Learn about the Document Processing AI Coding Assistant]({%slug ai-coding-assistant%}).|
|**Automatic Output Stream Clearing on Export**|Automatically clears the output stream before writing new content. [Review automatic output stream clearing during export]({%slug common-export-output-stream-clearing%}).|

For more details about the benefits of using Telerik Document Processing, see the [Telerik Document Processing product overview page](https://www.telerik.com/document-processing-libraries).

## Supported Formats

Telerik Document Processing supports the following file formats:

![Ninja Looking ><](images/ninja_looking.png)  

|Format|Library|Provider|
|----|----|----|
|**DOCX (Word Document)**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})|
|**DOC (Word 97-2003 Document)**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[DocFormatProvider]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%}) <sup>Import only</sup>|
|**DOT (Word 97-2003 Template)**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[DocFormatProvider]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%}) <sup>Import only</sup>|
|**HTML**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})|
|**PDF**|[RadWordsProcessing]({%slug radwordsprocessing-overview%}) <br> [RadPdfProcessing]({%slug radpdfprocessing-overview%}) <br> [RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[PdfFormatProvider in RadWordsProcessing]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) <sup>Export only</sup> <br> [PdfFormatProvider in RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%}) <br> [PdfFormatProvider in RadSpreadProcessing]({%slug radspreadprocessing-formats-and-conversion-pdf-pdfformatprovider%}) <sup>Export only</sup>|
|**RTF**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[RtfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})|
|**TXT**|[RadWordsProcessing]({%slug radwordsprocessing-overview%}) <br> [RadPdfProcessing]({%slug radpdfprocessing-overview%}) <br> [RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[TxtFormatProvider in RadWordsProcessing]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%}) <br> [TextFormatProvider in RadPdfProcessing]({%slug radpdfprocessing-formats-and-conversion-plain-text-textformatprovider%}) <sup>Export only</sup> <br> [TxtFormatProvider in RadSpreadProcessing]({%slug radspreadprocessing-formats-and-conversion-txt-txtformatprovider%})|
|**MD (Markdown)**|[RadWordsProcessing]({%slug radwordsprocessing-overview%})|[MarkdownFormatProvider]({%slug radwordsprocessing-formats-markdownformatprovider%})|
|**XLSX (Excel Workbook)**|[RadSpreadProcessing]({%slug radspreadprocessing-overview%}) <br> [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%})|[XlsxFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsx-xlsxformatprovider%})|
|**XLS (Excel 97-2003 Workbook)**|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[XlsFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xls-xlsformatprovider%})|
|**XLSM (macro-enabled spreadsheet created by Microsoft Excel)** <sup>Macros are only preserved during import and export. They cannot be executed or changed in the code.</sup>|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[XlsmFormatProvider]({%slug radspreadprocessing-formats-and-conversion-xlsm-xlsmformatprovider%})|
|**CSV**|[RadSpreadProcessing]({%slug radspreadprocessing-overview%}) <br> [RadSpreadStreamProcessing]({%slug radspreadstreamprocessing-overview%})|[CsvFormatProvider]({%slug radspreadprocessing-formats-and-conversion-csv-csvformatprovider%})|
|**JSON**|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[JsonFormatProvider]({%slug radspreadprocessing-formats-and-conversion-json-jsonformatprovider%}) <sup>Export only</sup>|
|**DataTable**|[RadSpreadProcessing]({%slug radspreadprocessing-overview%})|[DataTableFormatProvider]({%slug radspreadprocessing-formats-and-conversion-using-data-table-format-provider%})|
|**ZIP**|[RadZipLibrary]({%slug radziplibrary-overview%})|[ZipArchive]({%slug radziplibrary-gettingstarted%})|
|**Image**|[RadPdfProcessing]({%slug radpdfprocessing-overview%})|[SkiaImageFormatProvider]({%slug radpdfprocessing-formats-and-conversion-image-using-skiaimageformatprovider%}) <sup>Export only</sup> <br> [OcrFormatProvider]({%slug radpdfprocessing-formats-and-conversion-ocr-ocrformatprovider%}) <sup>Import only</sup> |

![DPL Ninja](images/dpl-formats.png) 

## Distribution

Telerik Document Processing is available for **.NET Framework**, **{{site.dotnetversions}}** (or newer) for Windows, and **.NET Standard 2.0** compatible applications. You can get the libraries through the following products:

|.NET Framework Products|{{site.dotnetversions}} *for Windows*|.NET Standard|
|----|----|----|
|[UI for ASP.NET MVC](https://www.telerik.com/aspnet-mvc)||[UI for .NET MAUI](https://www.telerik.com/maui-ui)|
|[UI for ASP.NET AJAX](https://www.telerik.com/products/aspnet-ajax.aspx)||[UI for ASP.NET Core](https://www.telerik.com/aspnet-core-ui)|
|[UI for WPF](https://www.telerik.com/products/wpf/overview.aspx)|[UI for WPF](https://www.telerik.com/products/wpf/overview.aspx)|[UI for Blazor](https://www.telerik.com/blazor-ui)|
|[UI for WinForms](https://www.telerik.com/products/winforms.aspx)|[UI for WinForms](https://www.telerik.com/products/winforms.aspx)|[UI for WinUI](https://www.telerik.com/winui)|

You can find all packages in the [available NuGet packages reference]({%slug available-nuget-packages%}).

## Getting Started

To start using the libraries right away, follow the [Document Processing first steps tutorial]({%slug getting-started-first-steps%}) to create a sample application that uses the libraries.

## Trial Version and Commercial License

Telerik Document Processing is a commercial library. You can explore its full functionality and get technical support when you register for a free 30-day trial. To use it commercially, you need to <a href="https://www.telerik.com/purchase.aspx" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/purchase.aspx">purchase a Telerik license</a>. Review the Telerik <a href="https://www.telerik.com/purchase/license-agreement/devcraft-complete-dlw-s" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/purchase/license-agreement/devcraft-complete-dlw-s">commercial license agreement</a> to learn the full terms of use.

>note Telerik Document Processing is available as part of **DevCraft**, **UI for ASP.NET Core**, **UI for ASP.NET MVC**, **UI for ASP.NET AJAX**, **UI for Blazor**, **UI for .NET MAUI**, **UI for WPF**, and **UI for WinForms**. The libraries are subject to the license under which you obtained the packages.

## Support Options

If you encounter issues while you work with Telerik Document Processing, use one of the following support channels:

* License holders and active trialists can take advantage of our outstanding customer support delivered by the developers building the library. To submit a support ticket, use the <a href="https://www.telerik.com/account/support-tickets?pid=1886&supcId=daf62541-57e0-b84c-8b5e-da9851c61873&fbp=false" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/account/support-tickets?pid=1886&supcId=daf62541-57e0-b84c-8b5e-da9851c61873&fbp=false">Telerik Document Processing support ticket system</a>. Learn [how to get the most out of Document Processing support]({%slug submit-support-tickets%}).
* Our <a href="https://www.telerik.com/forums/telerik-document-processing" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/forums/telerik-document-processing">Telerik Document Processing forums</a> are part of the free support you can get from the community and from the team on all kinds of general issues.
* Our <a href="https://feedback.telerik.com/document-processing" target="_blank" rel="noopener noreferrer" title="https://feedback.telerik.com/document-processing">Document Processing feedback portal</a> provides information on the features/bugs in discussion and also the planned ones for release.
* You may still need a tailor-made solution for your project. In such cases, go straight to <a href="https://www.progress.com/services" target="_blank" rel="noopener noreferrer" title="https://www.progress.com/services">Progress professional services</a>.

## Learning Resources

* <a href="https://demos.telerik.com/document-processing" target="_blank" rel="noopener noreferrer" title="https://demos.telerik.com/document-processing">Document Processing online demos</a>
* <a href="https://docs.telerik.com/devtools/document-processing/knowledge-base" target="_blank" rel="noopener noreferrer" title="https://docs.telerik.com/devtools/document-processing/knowledge-base">Document Processing Knowledge Base</a>
* <a href="https://www.telerik.com/account/support/virtual-classroom" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/account/support/virtual-classroom">Telerik Document Processing virtual classroom</a>

## Help Us Improve the Telerik Document Processing Documentation

Documentation is strongest when product teams and users improve it together. You can help in the following ways:

* **Submit a New Issue at GitHub**

If you find an issue with our docs that needs to be addressed, the best way to let us know is by creating an issue in the <a href="https://github.com/telerik/document-processing-docs/issues" target="_blank" rel="noopener noreferrer" title="https://github.com/telerik/document-processing-docs/issues">Telerik Document Processing documentation issue tracker</a>. When creating an issue, provide a descriptive title, be as specific as possible, and link to the documentation in question. If you can provide a link to the closest anchor to the issue, that is even better.

* **Update the Documentation at GitHub**

Creating an issue is great, but what we really love are pull requests. This is the most direct method. So, if you find an issue in the docs, or even feel like creating new content, we are happy to have your contributions! The basic steps are that you fork our documentation and submit a pull request. That way you may contribute to exactly where you found the error. After that, our technical writing team just needs to approve your change request. Use only standard markdown. For more detailed instructions, follow the <a href="https://github.com/telerik/document-processing-docs/blob/master/README.md" target="_blank" rel="noopener noreferrer" title="https://github.com/telerik/document-processing-docs/blob/master/README.md">GitHub documentation contribution instructions</a>.

* **Forums**

You can visit the <a href="https://www.telerik.com/forums/telerik-document-processing" target="_blank" rel="noopener noreferrer" title="https://www.telerik.com/forums/telerik-document-processing">Telerik Document Processing community forum</a> and leave feedback. This method takes a bit longer to reach the documentation team. However, if you need a fast reply from the support team, leaving feedback in the forum guarantees a support number for your suggestions, and that we will follow up on it.

Thank you for your contribution to the Telerik Document Processing documentation!

## Next Steps

* [Document Processing Libraries Overview]({%slug getting-started%})
* [First Steps in using Telerik Document Processing]({%slug getting-started-first-steps%})
* [What Versions of Document Processing Libraries are Distributed with the Telerik Products]({%slug distribute-telerik-document-processing-libraries-net-versions%})
* [How to Get the Most Out of the Telerik Document Processing Support]({%slug submit-support-tickets%})
