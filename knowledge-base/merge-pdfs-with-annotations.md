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
 
This article describes how to merge PDF documents without loss of supported annotations with the help of the [PdfStreamWriter](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/pdfstreamwriter?_gl=1*13soitb*_ga*MTMwNDAxMDM0LjE2NjkwMTIyMDM.*_ga_9JSNBCSF54*MTY4OTg0MjQ3Ny4yNDcuMS4xNjg5ODQ1NTU1LjQ0LjAuMA..#overview) and [PdfFileSource](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/pdffilesource?_gl=1*18e46d3*_ga*MTMwNDAxMDM0LjE2NjkwMTIyMDM.*_ga_9JSNBCSF54*MTY4OTg0MjQ3Ny4yNDcuMS4xNjg5ODQ1NTk3LjIuMC4w). 

## Solution

The following approach takes a collection of paths, creates a new RadFixedDocument instance, appends the documents from those paths to the newly created RadFixedDocument and returns it as a result.

#### __[C#] Merge PDF files

{{region kb-merge-pdf-files-while-preserving-their-annotations_0}}

    public static RadFixedDocument MergeDocuments(string[] pathsCollection)
    {
        RadFixedDocument result = new RadFixedDocument();

        PdfFormatProvider provider = new PdfFormatProvider();

        using (MemoryStream stream = new MemoryStream())
        {
            using (PdfStreamWriter fileWriter = new PdfStreamWriter(stream, true))
            {
                foreach (var path in pathsCollection)
                {
                    using (PdfFileSource fileSource = new PdfFileSource(new MemoryStream(File.ReadAllBytes(path))))
                    {
                        PdfPageStreamWriter resultPage = null;
                        for (int i = 0; i < fileSource.Pages.Length; i++)
                        {
                            // set page size
                            resultPage = fileWriter.BeginPage(new Size(
                            fileSource.Pages.First().Size.Width,
                            fileSource.Pages.First().Size.Height),
                            Rotation.Rotate0);
                            
                            // set content                     
                            PdfPageSource sourcePage = fileSource.Pages[i];
                            resultPage.WriteContent(sourcePage);
                            resultPage.Dispose();
                        }
                    }
                }
            }
        }

        return result;
    }

{{endregion}}
