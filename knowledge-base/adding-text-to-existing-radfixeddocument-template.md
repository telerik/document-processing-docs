---
title: Adding Text to an Existing RadFixedDocument Template
description: Learn how to add text to an imported RadFixedDocument template and dynamically add pages to accommodate long text.
type: how-to
page_title: Adding Text to Imported PDF Templates in RadFixedDocument
meta_title: Adding Text to Imported PDF Templates in RadFixedDocument
slug: adding-text-to-existing-radfixeddocument-template
tags: pdfprocessing,telerik document processing,radfixeddocument,text,import,pdfstreamwriter,block,formfields
res_type: kb
ticketid: 1709987
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Telerik Document Processing PdfProcessing</td>
</tr>
<tr>
<td>Version</td>
<td>Current</td>
</tr>
</tbody>
</table>

## Description

I want to add text to an existing RadFixedDocument template imported using `PdfFormatProvider.Import`. The text should fit within a specific area of the template, and when the text spans multiple pages, additional pages should be created based on the same template. I also need to populate form fields in the template with specific values.

This knowledge base article also answers the following questions:
- How to add text dynamically in RadFixedDocument templates.
- How to handle multi-page text additions in Telerik PdfProcessing.
- How to populate form fields in RadFixedDocument templates.

## Solution

To add text to an imported RadFixedDocument template and handle multi-page content, follow these steps:

### Step 1: Define the empty area dimensions of the document template
Manually determine the dimensions of the area where text will be added, including coordinates and size.

### Step 2: Calculate the number of pages required
Use the `Measure` method of the [Block](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block) to calculate the space each text block will need and determine the total number of template pages required.

```csharp
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

        if (currentY + blockSize.Height > rectangleY + rectangleHeight)
        {
            pageCount++;
            currentY = rectangleY;
        }

        currentY += blockSize.Height + block.SpacingAfter;
    }

    return pageCount;
}
```

### Step 3: Clone pages using PdfStreamWriter
Clone the template page multiple times to create the required number of pages using [PdfStreamWriter](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/pdfstreamwriter).

```csharp
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
```

### Step 4: Add text blocks to the document pages
Add the text blocks to the cloned pages using the `FixedContentEditor`.

```csharp
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

        if (currentY + blockSize.Height > rectangleY + rectangleHeight)
        {
            currentPageIndex++;

            if (currentPageIndex < document.Pages.Count)
            {
                currentPage = document.Pages[currentPageIndex];
                editor = new FixedContentEditor(currentPage);
                currentY = rectangleY;
            }
            else
            {
                break;
            }
        }

        editor.Position.Translate(rectangleX, currentY);
        editor.DrawBlock(block, new Size(rectangleWidth, rectangleHeight - (currentY - rectangleY)));

        currentY += blockSize.Height + block.SpacingAfter;
    }
}
```

### Step 5: Populate form fields
Iterate through the form fields in the document, filter by type and name, and set their values.

```csharp
foreach (RadFixedPage page in document.Pages)
{
    foreach (FormField formField in document.AcroForm.FormFields)
    {
        if (formField is TextBoxField textBoxField)
        {
            switch (textBoxField.Name)
            {
                case "report_num":
                    textBoxField.Value = "1";
                    break;
                case "gi_case_number":
                    textBoxField.Value = "2";
                    break;
                case "diagram_by":
                    textBoxField.Value = "3";
                    break;
                // Add other cases as needed
            }
        }
    }
}
```

### Step 6: Export the updated document
Export the modified document to a file.

```csharp
string pdfOutputPath = "output.pdf";
File.Delete(pdfOutputPath);
using (Stream output = File.OpenWrite(pdfOutputPath))
{
    new PdfFormatProvider().Export(document, output, TimeSpan.FromSeconds(10));
}
```

## See Also
- [RadPdfProcessing Block](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block)
- [PdfStreamWriter](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfstreamwriter/pdfstreamwriter)
- [Form Fields](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/model/interactive-forms/form-fields/formfields)
- [RadPdfProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/overview)
- [Telerik Document Processing Documentation](https://docs.telerik.com/devtools/document-processing)
