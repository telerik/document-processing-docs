---
title: Getting Started
page_title: Getting Started
description: Getting Started
slug: radwordsprocessing-getting-started
tags: getting,started
published: True
position: 1
---

# Getting Started



This tutorial will take you through the creation of a sample application that uses RadWordsProcessing.
      

* [Assembly References](#assembly-references)

* [Creating RadFlowDocument from Code](#creating-radflowdocument-from-code)

* [Exporting RadFlowDocument to Docx](#exporting-radflowdocument-to-docx)

## Assembly References

Here is a list of assemblies that contain the __RadWordsProcessing__ functionality and need to be referenced in your project:
        

* **Telerik.Windows.Documents.Core.dll**
* **Telerik.Windows.Documents.Flow.dll**
* **Telerik.Windows.Zip.dll**

If you need to export documents to PDF format, you will need to refer the following assemblies:

* **Telerik.Windows.Documents.Flow.FormatProviders.Pdf.dll** 
* **Telerik.Windows.Documents.Fixed.dll**
            
To describe different colors, shapes and other properties, **RadWordsProcessing** depends on the listed below .NET assemblies, which you should also refer in your project:

* **WindowsBase.dll**
* **PresentationCore.dll**
* **PresentationFramework.dll**

## Creating RadFlowDocument from Code

Here is how to create a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and insert some text content with the help of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}).
        

#### __[C#] Example 1: Create RadFlowDocument programmatically__

{{region cs-radwordsprocessing-getting-started_0}}
	RadFlowDocument document = new RadFlowDocument();
	RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
	editor.InsertText("Hello world!");
{{endregion}}



You need to add using directive to the following namespaces:
        

* Telerik.Windows.Documents.Flow.Model
* Telerik.Windows.Documents.Flow.Model.Editing
            

## Exporting RadFlowDocument to Docx

Exporting the document to Docx file can be achieved with the [DocxFormatProvider]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}). Here is how to create a provider instance and save a document with it:
        

#### __[C#] Example 2: Export RadFlowDocument to Docx__

{{region cs-radwordsprocessing-getting-started_1}}
	using (Stream output = new FileStream("output.docx", FileMode.OpenOrCreate))
	{
	    DocxFormatProvider provider = new DocxFormatProvider();
	    provider.Export(document, output);
	}
{{endregion}}



More information about the supported formats and features can be found [here]({%slug radwordsprocessing-formats-and-conversion%}).
        

## See Also

* [Model]({%slug radwordsprocessing-model%})
* [Developer Focused Examples]({%slug radwordsprocessing-sdk-examples%})


