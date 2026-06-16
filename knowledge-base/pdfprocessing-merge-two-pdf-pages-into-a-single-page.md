---
title: Merging two pages from different documents into a single page
description: Learn how to merge two pages from different PDF documents into a single page using PdfStreamWriter and PdfFileSource in RadPdfProcessing.
type: how-to
page_title: Invert the Colors within a PDF Document
slug: pdfprocessing-merge-two-pdf-pages-into-a-single-page
position: 0
tags: radpdfprocessing, pdf, merge, pages, document, processing, fixed, layout
res_type: kb
---

## Environment

| Product Version | Product | Author |
| --- | --- | --- |
| 2021.2.615 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article shows how to merge two pages from different documents into a single page.

## Solution

The provided code snippet demonstrates how to import two PDF documents using the [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%}), get their first pages using the [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%}), and merge them on a single page using the [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).

**Example 1: Merge Two Pages from Different Documents into a Single Page**

```csharp

	string firstDocument = "SampleDocument1.pdf";
	string secondDocument = "SampleDocument2.pdf";
	string mergedPdf = "Merged.pdf";

	using (FileStream fileStream = File.OpenWrite(mergedPdf))
	{
		using (PdfStreamWriter fileWriter = new PdfStreamWriter(fileStream))
		{
			using (PdfFileSource firstDocumentToMerge = new PdfFileSource(File.OpenRead(firstDocument)))
			using (PdfFileSource secondDocumentToMerge = new PdfFileSource(File.OpenRead(secondDocument)))
			{
				PdfPageSource firstDocumentPageToMerge = firstDocumentToMerge.Pages[0];
				PdfPageSource secondDocumentPageToMerge = secondDocumentToMerge.Pages[0];

				double largestPageHeight = Math.Max(firstDocumentPageToMerge.Size.Height, secondDocumentPageToMerge.Size.Height);
				Size size = new Size(firstDocumentPageToMerge.Size.Width + secondDocumentPageToMerge.Size.Width, largestPageHeight);

				using (PdfPageStreamWriter newPage = fileWriter.BeginPage(size))
				{
					newPage.WriteContent(firstDocumentPageToMerge);

					double offsetX = newPage.PageSize.Width / 2;
					newPage.ContentPosition.Translate(offsetX, 0);
					newPage.WriteContent(secondDocumentPageToMerge);
				}
			}
		}
	}
```

## See Also

* [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%})
* [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%})
* [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%})
