---
title: Add Html to a PDF document 
description: Learn how to add HTML content to a RadFlowDocument and convert it to a PDF document using RadWordsProcessing and RadPdfProcessing.
type: how-to
page_title: Add Html to a PDF document 
slug: add-html-to-pdf-document
position: 
tags: radwordsprocessing, radpdfprocessing, html, pdf, conversion, document, import, export
ticketid: 1545269
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>2021.3.1109</td>
			<td>Author</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>RadPdfProcessing</td>
			<td><a href="https://www.telerik.com/blogs/author/dimitar-karamfilov">Dimitar Karamfilov</a></td>
		</tr>
	</tbody>
</table>


## Description

You have HTML content that you need to convert to PDF or add to an existing document. 

## Solution

Use the WordsProcessing library to convert the content to a `RadFlowDocument` and then insert it into the existing document along with other content.

```csharp
HtmlFormatProvider provider = new HtmlFormatProvider();
var htmlConteont = provider.Import(File.ReadAllText(@"..\..\HtmlPage1.html"));

RadFlowDocument document = new RadFlowDocument();
RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);

editor.InsertText("Sample Content");
editor.InsertParagraph();

var options = new InsertDocumentOptions();
options.ConflictingStylesResolutionMode = ConflictingStylesResolutionMode.UseTargetStyle;
editor.InsertDocument(htmlConteont, options);
 
editor.InsertText("Content After");

var pdfFProvider = new PdfFormatProvider();
var pdfBytes = pdfFProvider.Export(document);
File.WriteAllBytes("result.pdf", pdfBytes); 
```

## See Also

* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
* [Using HtmlFormatProvider]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
* [Using PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) 

