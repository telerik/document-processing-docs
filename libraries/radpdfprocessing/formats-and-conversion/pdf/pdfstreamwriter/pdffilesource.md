---
title: PdfFileSource
page_title: PdfFileSource
slug: radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource
tags: pdf,stream,file,source
published: True
position: 4
---

# Overview

The **PdfFileSource** class represents the content of an existing PDF file.

## Using PdfFileSource

### Create an Instance

To create an instance of PdfFileSource, you should pass a **FileStream** object, containing the PDF document, to the constructor of the class.

#### **[C#] Example 1: Create a PdfFileSource**
<snippet id='codeblock_87'/>

PdfFileSource exposes also an additional overload, which allows you to keep the stream you are working with open after disposing the PdfFileSource instance by passing **true** as a value for the second constructor parameter (*leaveStreamOpen*).

An additional option you can use is the overload that accepts a parameter of type [**PdfImportSettings**]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#import-settings). This overload enables you to handle  password encrypted documents.

#### **[C#] Example 2: Open encrypted document**
<snippet id='codeblock_88'/>

>PdfFileSource inherits from [IDisposable](https://msdn.microsoft.com/en-us/library/system.idisposable(v=vs.110).aspx). Make sure the object is disposed when you are done with it. The best way to ensure this is handled properly is to wrap it in a using statement. 

### Members

PdfFileSource exposes the **Pages** property, which is of type [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%})[] and allows you access the pages of the imported document.

#### **[C#] Example 3: Iterate the pages of a document**
<snippet id='codeblock_89'/>
 
>You can use the indexer of the Pages property to obtain a specific page of the document and split it. Then, you can save the separated page using [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).

## See Also

* [Pdf Stream Writer Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
