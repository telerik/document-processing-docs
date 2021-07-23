---
title: Create Table of Contents (TOC)
description: This knowledge base article describes how import PDF documents, merge them, and create a Table of Contents linking to the merged document pages
type: how-to
page_title: Create Table of Contents (TOC)
slug: pdfprocessing-create-table-of-contents-page
position: 0
tags: pdf, processing, create, table, contents, toc
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
		<td>2021.2.614</td>
		<td>RadPdfProcessing</td>
		<td><a href="https://www.telerik.com/blogs/author/martin-velikov">Martin Velikov</a></td>
	</tr>
</tbody>
</table>

## Description

This article describes how to import PDF documents, merge them, and create a Table of Contents linking to the merged document pages.

## Solution

The following code snippets shows how to:
	1. Import two PDF documents into [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) instances using the [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%});
	2. Merge them into a single RadFixedDocument using the RadFixedDocument`s _Merge()_ method;
	3. Create a Table of Contents (TOC) using [Link]({%slug radpdfprocessing-model-annotations-and-destinations%}#link) annotations linking to the merged document pages;
	4. Export the merged document to a single PDF file.

#### __[C#] Example__

{{region pdfprocessing-create-table-of-contents-page1}}

	PdfFormatProvider provider = new PdfFormatProvider();

	RadFixedDocument document1, document2;
	ImportDocuments(provider, out document1, out document2);

	document1.Merge(document2);

	CreateTOC(document1);

	ExportToPdf(provider, document1);
{{endregion}}

#### __[C#] Import PDF files__

{{region pdfprocessing-create-table-of-contents-page1}}

	private static void ImportDocuments(PdfFormatProvider provider, out RadFixedDocument document1, out RadFixedDocument document2)
	{
		using (Stream stream = File.OpenRead("SampleDocument1.pdf"))
		{
			document1 = provider.Import(stream);
		}

		using (Stream stream = File.OpenRead("SampleDocument2.pdf"))
		{
			document2 = provider.Import(stream);
		}
	}
{{endregion}}

#### __[C#] Create the Table of Contents__

{{region pdfprocessing-create-table-of-contents-page1}}

	private static void CreateTOC(RadFixedDocument document1)
	{
		RadFixedPage toc = new RadFixedPage();
		document1.Pages.Insert(0, toc);

		FixedContentEditor editor = new FixedContentEditor(toc);

		foreach (RadFixedPage page in document1.Pages)
		{
			int pageNumber = document1.Pages.IndexOf(page);

			if (pageNumber > 0)
			{
				int factor = 20;

				int offsetX = 70;
				int offsetY = 20 + factor * pageNumber;
				editor.Position.Translate(offsetX, offsetY);

				Block block = new Block();
				block.GraphicProperties.FillColor = new RgbColor(255, 5, 99, 193);
				block.InsertText($"Page {pageNumber}");
				Size blockSize = block.Measure();
				editor.DrawBlock(block);

				Location location = new Location
				{
					Left = 0,
					Top = 0,
					Zoom = 0,
					Page = page
				};

				GoToAction goToAction = new GoToAction();
				goToAction.Destination = location;

				Link uriLink = toc.Annotations.AddLink(goToAction);
				uriLink.Rect = new Rect(offsetX, offsetY, blockSize.Width, blockSize.Height);
			}
		}
	}
{{endregion}}

#### __[C#] Export to PDF file__

{{region pdfprocessing-create-table-of-contents-page1}}

	private static void ExportToPdf(PdfFormatProvider provider, RadFixedDocument document1)
	{
		string exportedPdf = "Exported.pdf";
		if (File.Exists(exportedPdf))
		{
			File.Delete(exportedPdf);
		}

		using (Stream output = File.OpenWrite(exportedPdf))
		{
			provider.Export(document1, output);
		}
	}
{{endregion}}
