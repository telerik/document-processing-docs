---
title: Clone PDF Template Pages with Form Fields to Accommodate Dynamic Content
description: Learn how to duplicate PDF template pages containing form fields and annotations when adding dynamic content that exceeds the available space.
type: how-to
page_title: How to Clone PDF Template Pages with Form Fields and Annotations for Dynamic Content
slug: clone-pdf-template-pages-with-form-fields-dynamic-content
tags: pdfprocessing, pdf, template, clone, form, fields, annotations, pdfstreamwriter, block, radfixeddocument, dynamic, content, measure, remaining, space
res_type: kb
ticketid: 1709987
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
|2026.1.210| RadPdfProcessing |[Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov)| 

## Description

When working with PDF templates that contain form fields and annotations, you may need to dynamically populate them with content that exceeds the available space on a single page. In such cases, you need to clone the template page multiple times to accommodate all the content while preserving the form fields and annotations on each duplicated page.

This article demonstrates how to import a PDF template, calculate the required number of pages based on the content length, clone the template page using [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}), add dynamic text content, and populate form fields.

## Solution

To clone PDF template pages with form fields and add dynamic content, use the **Measure** method of the [Block]({%slug radpdfprocessing-editing-block%}) class to measure content, [PdfStreamWriter]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%}) to duplicate pages, and [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) to position text blocks. The form fields are automatically duplicated with each page clone.

The following code demonstrates the complete implementation:

```csharp
static void Main(string[] args)
{
    RadFixedDocument document;
    PdfFormatProvider pdfFormatProvider = new PdfFormatProvider();

    using (Stream input = File.OpenRead("input.pdf"))
    {
        document = pdfFormatProvider.Import(input, null);
    }

    RadFixedPage templatePage = document.Pages[0];

    int rectangleX = 59;
    int rectangleY = 91;
    double rectangleWidth = 648;
    double rectangleHeight = 840;

    // Create blocks of dummy text content
    string[] dummyTextBlocks = new string[]
    {
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
        "Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.",
        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.",
        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.",
        "Quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa.",
        "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.",
        "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio.",
        "Cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est.",
        "Omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet.",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
        "Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores.",
        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.",
        "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.",
        "Quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa.",
        "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates.",
        "Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio.",
    };

    // Calculate how many pages are needed
    int pagesNeeded = CalculatePagesNeeded(dummyTextBlocks, rectangleWidth, rectangleHeight, rectangleY);

    // Clone the first page to create the required number of pages using PdfStreamWriter
    document = ClonePagesUsingStreamWriter(document, pagesNeeded);

    // Now add the text blocks to the cloned pages
    AddTextBlocksToPages(document, dummyTextBlocks, rectangleX, rectangleY, rectangleWidth, rectangleHeight);

    // Fill form fields with dummy values
    foreach (RadFixedPage page in document.Pages)
    {
        foreach (FormField formField in document.AcroForm.FormFields)
        {
            if (formField is TextBoxField textBoxField)
            {
                if (textBoxField.Name == "report_num")
                {
                    textBoxField.Value = "1";
                }
                else if (textBoxField.Name == "gi_case_number")
                {
                    textBoxField.Value = "2";
                }
                else if (textBoxField.Name == "diagram_by")
                {
                    textBoxField.Value = "3";
                }
                else if (textBoxField.Name == "measurements_by")
                {
                    textBoxField.Value = "4";
                }
                else if (textBoxField.Name == "FOOT_report_num")
                {
                    textBoxField.Value = "5";
                }
                else if (textBoxField.Name == "FOOT_sheet_num")
                {
                    textBoxField.Value = "6";
                }
                else if (textBoxField.Name == "FOOT_diagram_by")
                {
                    textBoxField.Value = "7";
                }
                else if (textBoxField.Name == "FOOT_num_sheets")
                {
                    textBoxField.Value = "8";
                }
                else if (textBoxField.Name == "FOOT_case_number")
                {
                    textBoxField.Value = "9";
                }
            }
        }
    }

    string pdfOutputPath = "output.pdf";

    File.Delete(pdfOutputPath);
    using (Stream output = File.OpenWrite(pdfOutputPath))
    {
        pdfFormatProvider.Export(document, output, TimeSpan.FromSeconds(10));
    }

    var psi = new ProcessStartInfo()
    {
        FileName = pdfOutputPath,
        UseShellExecute = true
    };
    Process.Start(psi);
}

private static int CalculatePagesNeeded(string[] textBlocks, double rectangleWidth, double rectangleHeight, double rectangleY)
{
    int pageCount = 1;
    double currentY = rectangleY;

    foreach (string textBlock in textBlocks)
    {
        Telerik.Windows.Documents.Fixed.Model.Editing.Block block = new Telerik.Windows.Documents.Fixed.Model.Editing.Block();
        block.InsertText(textBlock);
        block.SpacingAfter = 10;

        Size blockSize = block.Measure(new Size(rectangleWidth, double.PositiveInfinity));

        // Check if block fits in current page within the rectangle bounds
        if (currentY + blockSize.Height > rectangleY + rectangleHeight)
        {
            // Need a new page
            pageCount++;
            currentY = rectangleY;
        }

        currentY += blockSize.Height + block.SpacingAfter;
    }

    return pageCount;
}

private static RadFixedDocument ClonePagesUsingStreamWriter(RadFixedDocument sourceDocument, int totalPagesNeeded)
{
    RadFixedDocument newDocument = new RadFixedDocument();
    PdfFormatProvider provider = new PdfFormatProvider();

    byte[] originalPdfBytes = provider.Export(sourceDocument, TimeSpan.FromSeconds(20));

    using (MemoryStream inputStream = new MemoryStream(originalPdfBytes))
    {
        using (PdfFileSource originalFile = new PdfFileSource(inputStream))
        {
            MemoryStream outputStream = new MemoryStream();

            using (PdfStreamWriter streamWriter = new PdfStreamWriter(outputStream, true))
            {
                for (int i = 0; i < totalPagesNeeded; i++)
                {
                    streamWriter.WritePage(originalFile.Pages.First());
                }
            }

            outputStream.Position = 0;
            newDocument = provider.Import(outputStream);
            outputStream.Dispose();
        }
    }

    return newDocument;
}

private static void AddTextBlocksToPages(RadFixedDocument document, string[] textBlocks, int rectangleX, int rectangleY, double rectangleWidth, double rectangleHeight)
{
    int currentPageIndex = 0;
    double currentY = rectangleY;

    RadFixedPage currentPage = document.Pages[currentPageIndex];
    FixedContentEditor editor = new FixedContentEditor(currentPage);

    foreach (string textBlock in textBlocks)
    {
        Telerik.Windows.Documents.Fixed.Model.Editing.Block block = new Telerik.Windows.Documents.Fixed.Model.Editing.Block();
        block.InsertText(textBlock);
        block.SpacingAfter = 10;

        Size blockSize = block.Measure(new Size(rectangleWidth, double.PositiveInfinity));

        // Check if block fits in current page within the rectangle bounds
        if (currentY + blockSize.Height > rectangleY + rectangleHeight)
        {
            // Move to the next page
            currentPageIndex++;

            if (currentPageIndex < document.Pages.Count)
            {
                currentPage = document.Pages[currentPageIndex];
                editor = new FixedContentEditor(currentPage);
                currentY = rectangleY;
            }
            else
            {
                // Should not happen if calculation is correct, but handle it
                break;
            }
        }

        // Draw the block at the current position
        editor.Position.Translate(rectangleX, currentY);
        editor.DrawBlock(block, new Size(rectangleWidth, rectangleHeight - (currentY - rectangleY)));

        currentY += blockSize.Height + block.SpacingAfter;
    }
}
```

## See Also
- [Block]({%slug radpdfprocessing-editing-block%})
- [PdfStreamWriter Overview]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfstreamwriter-overview%})
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
- [FormFields]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
- [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
