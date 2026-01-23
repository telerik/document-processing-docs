---
title: Merging two pages from different documents into a single page
description: This article shows how to merge two pages from different documents into a single page
type: how-to
page_title: Invert the Colors within a PDF Document
slug: pdfprocessing-merge-two-pdf-pages-into-a-single-page
position: 0
tags: merge, single, page, A4, A5
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2021.2.615</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article shows how to merge two pages from different documents into a single page.

## Solution

The provided code snippet demonstrates how to import two **PDF** documents using the [PdfFileSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdffilesource%}), get their first pages using the [PdfPageSource]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfpagesource%}), and merge them on a single page using the [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-pdfstreamwriter%}).

#### __Merge two pages from different documents into a single page__

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
