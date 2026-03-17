---
title: Create a Table of Contents for Merged PDF Documents
description: Learn how to merge multiple PDF files into a single document and then generate a clickable Table of Contents (TOC) that links to the first page of each merged document.
type: how-to
page_title: How to Create a Table of Contents After Merging PDF Documents with RadPdfProcessing
slug: create-toc-for-merged-pdf-radpdfprocessing
tags: pdf, processing, merge, toc, table, contents, fixedcontenteditor, block, measure, first, page
res_type: kb
ticketid: 1711193
---

## Environment

| Version | Product | Author |
| --- | --- | ---- |
| 2026.1.304 | RadPdfProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

This article describes how to merge multiple PDF documents into a single file and then add a Table of Contents (TOC) page at the beginning of the merged document. Each TOC entry is a clickable link that navigates to the first page of the respective source document.

## Solution

The TOC must be created **after** all source documents have been merged. The key considerations are:

* The [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) requires manual position calculations when placing content elements on a page.
* Use the **Measure** method of the [Block]({%slug radpdfprocessing-editing-block%}) to determine whether the next TOC entry will exceed the page boundary. If so, insert a new TOC page and continue from there.
* Track the start page index of each source document before merging, so you can later build accurate [Link]({%slug radpdfprocessing-model-annotations-links%}) annotations using a [GoToAction]({%slug radpdfprocessing-model-annotations-links%}) pointing to the correct [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).
* When new TOC pages are inserted at the beginning of the [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}), adjust the target page index by the number of TOC pages added.

The following example demonstrates the complete approach:

#### **Merge PDF files and create a TOC**

```csharp
static void Main(string[] args)
{
    string sourceDirectory = @"..\..\..\PDF files";
    string outputFile = @"..\..\..\MergedOutput.pdf";

    MergePdfFiles(sourceDirectory, outputFile);
}

static void MergePdfFiles(string sourceDirectory, string outputFile)
{
    string[] pdfFiles = Directory.GetFiles(sourceDirectory, "*.pdf", SearchOption.TopDirectoryOnly);

    if (pdfFiles.Length == 0)
    {
        return;
    }

    RadFixedDocument mergedDocument = new RadFixedDocument();
    PdfFormatProvider formatProvider = new PdfFormatProvider();

    var documentStartPages = new System.Collections.Generic.List<System.Tuple<string, int>>();

    foreach (string pdfFile in pdfFiles.OrderBy(f => f))
    {
        int startPageIndex = mergedDocument.Pages.Count;
        string fileName = Path.GetFileNameWithoutExtension(pdfFile);

        RadFixedDocument sourceDocument;
        using (FileStream fileStream = File.OpenRead(pdfFile))
        {
            sourceDocument = formatProvider.Import(fileStream);
        }

        mergedDocument.Merge(sourceDocument);

        documentStartPages.Add(System.Tuple.Create(fileName, startPageIndex));
    }

    CreateTOC(mergedDocument, documentStartPages);

    using (FileStream outputStream = File.Create(outputFile))
    {
        formatProvider.Export(mergedDocument, outputStream);
    }
}

static void CreateTOC(RadFixedDocument document, System.Collections.Generic.List<System.Tuple<string, int>> documentStartPages)
{
    RadFixedPage currentTocPage = new RadFixedPage();
    document.Pages.Insert(0, currentTocPage);

    FixedContentEditor editor = new FixedContentEditor(currentTocPage);

    int factor = 20;
    int offsetX = 70;
    int currentY = 20;
    int tocPageIndex = 0;

    foreach (var docInfo in documentStartPages)
    {
        Block block = new Block();
        block.GraphicProperties.FillColor = new RgbColor(255, 5, 99, 193);
        block.InsertText($"{docInfo.Item1} - Page {docInfo.Item2 + 1}");
        Size blockSize = block.Measure();

        if (currentY + blockSize.Height > currentTocPage.Size.Height - 20)
        {
            tocPageIndex++;
            currentTocPage = new RadFixedPage();
            document.Pages.Insert(tocPageIndex, currentTocPage);
            editor = new FixedContentEditor(currentTocPage);
            currentY = 20;
        }

        editor.Position.Translate(offsetX, currentY);
        editor.DrawBlock(block);

        int adjustedPageIndex = docInfo.Item2 + tocPageIndex + 1;
        RadFixedPage targetPage = document.Pages[adjustedPageIndex];

        Location location = new Location
        {
            Left = 0,
            Top = 0,
            Zoom = 0,
            Page = targetPage
        };

        GoToAction goToAction = new GoToAction();
        goToAction.Destination = location;

        Link link = currentTocPage.Annotations.AddLink(goToAction);
        link.Rect = new Rect(offsetX, currentY, blockSize.Width, blockSize.Height);

        currentY += factor;
    }
}
```

## Notes

* The `documentStartPages` list records the zero-based start page index of each source document **before** it is merged. This ensures correct navigation targets even after the TOC pages are prepended.
* The `adjustedPageIndex` calculation (`docInfo.Item2 + tocPageIndex + 1`) compensates for the TOC pages that are inserted before the merged content.
* Each TOC entry is drawn as a [Block]({%slug radpdfprocessing-editing-block%}) and wrapped in a [Link]({%slug radpdfprocessing-model-annotations-links%}) annotation whose rectangle exactly matches the measured block bounds.

## See Also

* [Merge PDF Documents]({%slug merge-pdf-documents%})
* [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
* [Block]({%slug radpdfprocessing-editing-block%})
* [Link Annotations]({%slug radpdfprocessing-model-annotations-links%})
