---
title: Creating Headers with Left, Center, and Right Text/Image in Exported PDF Documents Using RadWordsProcessing
description: Learn how to customize headers in PDF documents to have left, center, and right-aligned text using RadWordsProcessing library.
type: how-to
page_title: How to Customize Headers in PDF Documents with RadWordsProcessing
slug: customize-headers-pdf-radwordsprocessing
tags: radwordsprocessing, pdf, header, alignment, docx, document, processing, export
res_type: kb
ticketid: 1665701
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2026.1.402| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description
This article shows how to generate a [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}), divide a header into three sections, and customize the font settings for each section using the [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library.

![Left, Center, Right Headers](images/left-center-right-header.png)    

## Solution

To achieve a header with left, center, and right aligned sections in a PDF document, use the [RadWordsProcessing]({%slug radwordsprocessing-overview%}) library to create a header and then insert a [Table]({%slug radwordsprocessing-model-table%}) with three [cells]({%slug radwordsprocessing-model-tablecell%}) into the header. Each cell represents one section of the header (left, center, right) and can contain text or an image. The following steps and code snippet show this process:

1. Create a new [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%}) and add a section to it.
2. Define the page size and margins for the section.
3. Add a paragraph with some text to the document as content.
4. Add a header to the first section of the document.
5. Inside the header, add a table with a single row and three cells.
6. Set the preferred width for each cell to one-third of the page width.
7. Add text or an image to each cell with the desired alignment (left, center, right).
8. Use the [PdfFormatProvider]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) to export the document to a PDF file.

```csharp
            //Required for .NET Standard when exporting images to PDF format
            //Requires installing Telerik.Documents.ImageUtils NuGet package
            //Telerik.Documents.ImageUtils.ImagePropertiesResolver defaultImagePropertiesResolver = new Telerik.Documents.ImageUtils.ImagePropertiesResolver();
            //Telerik.Windows.Documents.Extensibility.FixedExtensibilityManager.ImagePropertiesResolver = defaultImagePropertiesResolver;

            //.NET Standard
            //Telerik.Documents.Core.Fonts.FontWeight regularFontWeight = Telerik.Documents.Core.Fonts.FontWeights.Normal;
            //Telerik.Documents.Core.Fonts.FontWeight boldFontWeight = Telerik.Documents.Core.Fonts.FontWeights.Bold;
            //Telerik.Documents.Primitives.Size size = Telerik.Windows.Documents.Model.PaperTypeConverter.ToSize(Telerik.Windows.Documents.Model.PaperTypes.A4);
            //Telerik.Windows.Documents.Primitives.Padding pageMargins = new Telerik.Windows.Documents.Primitives.Padding(40, 40, 40, 40);
            //Telerik.Documents.Core.Fonts.FontStyle italicFontStyle = Telerik.Documents.Core.Fonts.FontStyles.Italic;

            //.NET (Target OS: Windows)
            System.Windows.FontWeight regularFontWeight = System.Windows.FontWeights.Normal;
            System.Windows.FontWeight boldFontWeight = System.Windows.FontWeights.Bold;
            System.Windows.Size size = Telerik.Windows.Documents.Model.PaperTypeConverter.ToSize(Telerik.Windows.Documents.Model.PaperTypes.A4);
            Telerik.Windows.Documents.Primitives.Padding pageMargins = new Telerik.Windows.Documents.Primitives.Padding(40, 40, 40, 40);
            System.Windows.FontStyle italicFontStyle = System.Windows.FontStyles.Italic;

            RadFlowDocument document = new RadFlowDocument();
            Telerik.Windows.Documents.Flow.Model.Section contentSection = document.Sections.AddSection();
            contentSection.PageMargins = pageMargins;
            contentSection.PageSize =  size;
            contentSection.Blocks.AddParagraph().Inlines.AddRun("Hello RadWordsProcessing!");

            Header header = document.Sections.First().Headers.Add();

            Table table = header.Blocks.AddTable();
            TableRow row = table.Rows.AddTableRow();

            TableCell cell = new TableCell(document);

            Run leftHeader = new Run(document);
            leftHeader.Text = "Left";
            leftHeader.FontWeight = boldFontWeight;
            leftHeader.FontSize = 16;
            cell.Blocks.AddParagraph().Inlines.Add(leftHeader);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            cell = new TableCell(document);
            Paragraph p = cell.Blocks.AddParagraph();

            Run centerHeader = new Run(document);
            centerHeader.Text = "Center";
            centerHeader.FontWeight = regularFontWeight;
            centerHeader.FontStyle = italicFontStyle;
            centerHeader.FontSize = 18;
            p.Inlines.Add(centerHeader);

            p = cell.Blocks.AddParagraph();
            ImageInline imageInline = new ImageInline(document);
            imageInline.Image.Width = 50;
            imageInline.Image.Height = 50;
            byte[] data = File.ReadAllBytes("ProgressNinjas.png");
            imageInline.Image.ImageSource = new Telerik.Windows.Documents.Media.ImageSource(data, "png");
            p.Inlines.Add(imageInline);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            cell = new TableCell(document);
            Run rightHeader = new Run(document);
            rightHeader.Text = "Right";
            rightHeader.FontWeight = boldFontWeight;
            rightHeader.FontStyle = italicFontStyle;
            rightHeader.FontSize = 20;
            cell.Blocks.AddParagraph().Inlines.Add(rightHeader);
            cell.PreferredWidth = new TableWidthUnit(size.Width / 3);
            row.Cells.Add(cell);

            Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider provider = new PdfFormatProvider();

            string outputFilePath = "output.pdf";
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(document, output, TimeSpan.FromSeconds(10));
            }

            Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

This approach provides flexible customization of headers in PDF documents. You can add left, center, and right aligned text within the same header.

>note A complete SDK example is available in the [WordsProcessing CreateHeaderWithLeftCenterRightContent sample](https://github.com/telerik/document-processing-sdk/tree/master/WordsProcessing/CreateHeaderWithLeftCenterRightContent).

### Required NuGet Packages

Depending on the target framework, install the following NuGet packages:

| .NET Standard / .NET (Target OS: None) | .NET Framework / .NET (Target OS: Windows) |
| --- | --- |
| Telerik.Documents.Flow | Telerik.Windows.Documents.Flow |
| Telerik.Documents.Flow.FormatProviders.Pdf | Telerik.Windows.Documents.Flow.FormatProviders.Pdf |
| Telerik.Documents.ImageUtils | - |

## See Also

* [RadWordsProcessing]({%slug radwordsprocessing-overview%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Working with Tables in RadWordsProcessing]({%slug radwordsprocessing-model-table%})
