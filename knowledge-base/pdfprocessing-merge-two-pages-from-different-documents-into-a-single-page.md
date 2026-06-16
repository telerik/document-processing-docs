---
title: Merge two document pages into a new single page
description: This knowledge base article describes how to import two PDF documents and merge their first pages into a new single page.
type: how-to
page_title: Merge two document pages into a new single page
slug: pdfprocessing-merge-two-pages-from-different-documents-into-a-single-page
position: 0
tags: radpdfprocessing, pdf, merge, pages, documents, document, processing, fixed
res_type: kb
---

## Environment

| Product Version | Product | Author |
| --- | --- | --- |
| 2021.2.614 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article describes how to import two PDF documents and merge their first pages into a new single page.

## Solution

The following example demonstrates how to use the [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}) to import and merge the first pages of two different documents into a new single page.

**Example 1: Merge the First Pages of Two Documents into a Single Page**

```csharp

	string firstDocument = "SampleDocument1.pdf";
	string secondDocument = "SampleDocument2.pdf";

	string exportedPdf = "Merged.pdf";
	if (File.Exists(exportedPdf))
	{
		File.Delete(exportedPdf);
	}

	using (FileStream fileStream = File.OpenWrite(exportedPdf))
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

* [PdfPageStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagestreamwriter%})
* [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%})
* [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%})
