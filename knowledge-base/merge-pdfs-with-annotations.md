---
title: Merge PDF files while preserving their annotations
description:  Merge several PDF documents while preserving their annotations in the result document using PdfStreamWriter and PdfFileSource.
type: how-to 
page_title:  Merge PDF files while preserving their annotations
slug: merge-pdf-files-while-preserving-their-annotations
position: 0
tags: merge, pdf, annotations, PdfProcessing,  
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2023.2.713|PdfProcessing|[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)|

## Description
 
This article describes how to merge PDF documents without loss of supported annotations with the help of the [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}) and [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%}). 

## Solution

The following approach takes a collection of paths, creates a new [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) instance, appends the documents from those paths to the newly created [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) and returns it as a result.

#### __[C#] Merge PDF files

{{region kb-merge-pdf-files-while-preserving-their-annotations_0}}

    public static RadFixedDocument MergeDocuments(string[] pathsCollection)
	{
	RadFixedDocument resultFile;
	Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider pdfFormatProvider = new Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.PdfFormatProvider();
 
	using (MemoryStream stream = new MemoryStream())
	{
		using (PdfStreamWriter fileWriter = new PdfStreamWriter(stream, leaveStreamOpen: true))
		{
			foreach (string path in pathsCollection)
			{
				using (PdfFileSource fileSource = new PdfFileSource(new MemoryStream(File.ReadAllBytes(path))))
				{
					for (int i = 0; i < fileSource.Pages.Length; i++)
					{
						PdfPageSource sourcePage = fileSource.Pages[i];
						using (PdfPageStreamWriter resultPage = fileWriter.BeginPage(sourcePage.Size))
						{
							// set content                     
							resultPage.WriteContent(sourcePage);
						}
					}
				}
			}
		}
  		resultFile = pdfFormatProvider.Import(stream);
	}

	return resultFile;
	}

{{endregion}}
