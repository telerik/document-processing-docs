---
title: Preventing Table Row Splitting Across Pages When Converting HTML to PDF
description: Learn how to prevent table rows from splitting across pages when converting HTML content to PDF using Telerik Document Processing.
type: how-to
page_title: Avoiding Table Row Splitting in HTML to PDF Conversion
meta_title: Avoiding Table Row Splitting in HTML to PDF Conversion
slug: wordsprocessing-preventing-table-row-splitting-html-pdf
tags: wordsprocessing,telerik document processing,html-to-pdf,table-row-splitting
res_type: kb
ticketid: 1700721
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td>
WordsProcessing for Telerik Document Processing
</td>
</tr>
<tr>
<td> Version </td>
<td> Current </td>
</tr>
</tbody>
</table>

## Description

I want to convert HTML with tables containing uneven row heights to a PDF using Telerik Document Processing. My issue arises when some rows split across pages, even though I need them to stay intact. In my previous implementation using another library, `page-break-inside: avoid` handled this behavior correctly. However, this style does not seem to work with Telerik's methods. 

This knowledge base article also answers the following questions:
- How can I prevent table rows from splitting across pages during HTML to PDF conversion?
- How do I handle uneven row heights in tables when exporting to PDF?
- How can I ensure HTML table rows are preserved on a single page in Telerik Document Processing?

## Solution

To prevent table rows from splitting across pages, manually recreate the PDF table from scratch by copying the HTML table content to a new PDF table. Use the `Measure` method to check whether the table exceeds the page boundary. If it does, create a new page and continue building the table.

### Steps to Implement

1. **Set up the HTML import settings:** Use the `HtmlFormatProvider` and implement the `LoadImageFromUri` event for resolving images in the HTML content.

2. **Load the HTML document:** Import the HTML content into a `RadFlowDocument` object.

3. **Extract rows from the HTML table:** Enumerate the rows from the HTML table.

4. **Create a new PDF table:** For each page, create a new table and add rows while ensuring they fit within the page boundaries.

5. **Check row measurements:** After adding each row, use the `Measure` method to verify whether the table exceeds the page height. If it does, move the remaining rows to a new page.

6. **Export the PDF:** Use the `PdfFormatProvider` to save the final PDF document.

### Code Example

```csharp
const string InputHtmlPath = "..\\..\\..\\input.html";
const string OutputPdfPath = "..\\..\\..\\output.pdf";

static void Main(string[] args)
{
    // Load HTML document
    HtmlFormatProvider htmlFormatProvider = new HtmlFormatProvider();
    HtmlImportSettings importSettings = new HtmlImportSettings();

    importSettings.LoadImageFromUri += (s, e) =>
    {
        var data = new System.Net.WebClient().DownloadData(e.Uri);
        e.SetImageInfo(data, Path.GetExtension(e.Uri).Substring(1));
    };

    htmlFormatProvider.ImportSettings = importSettings;

    RadFlowDocument htmlDocument;
    using (var input = File.OpenRead(InputHtmlPath))
        htmlDocument = htmlFormatProvider.Import(input, null);

    var htmlRows = htmlDocument.EnumerateChildrenOfType<Telerik.Windows.Documents.Flow.Model.Table>()
                              .FirstOrDefault().Rows.ToList();

    var mainPdfDocument = new RadFixedDocument();
    int currentRowIndex = 0;

    while (currentRowIndex < htmlRows.Count)
    {
        var pdfPage = mainPdfDocument.Pages.AddPage();
        var pdfTable = CreateNewTable();
        int rowsAdded = 0;

        while (currentRowIndex < htmlRows.Count)
        {
            var testTable = CreateNewTable();

            for (int i = currentRowIndex - rowsAdded; i < currentRowIndex; i++)
                if (i >= 0) AddRowToTable(testTable, htmlRows[i], pdfPage);

            AddRowToTable(testTable, htmlRows[currentRowIndex], pdfPage);

            if (testTable.Measure().Height > pdfPage.Size.Height - 40 && rowsAdded > 0)
                break;

            AddRowToTable(pdfTable, htmlRows[currentRowIndex], pdfPage);
            rowsAdded++;
            currentRowIndex++;
        }

        new FixedContentEditor(pdfPage).DrawTable(pdfTable);
    }

    File.Delete(OutputPdfPath);
    using (var output = File.OpenWrite(OutputPdfPath))
        new PdfFormatProvider().Export(mainPdfDocument, output, null);

    Process.Start(new ProcessStartInfo(OutputPdfPath) { UseShellExecute = true });
}

private static Telerik.Windows.Documents.Fixed.Model.Editing.Tables.Table CreateNewTable()
{
    var border = new Telerik.Windows.Documents.Fixed.Model.Editing.Border(2, new RgbColor(0, 0, 0));
    return new Telerik.Windows.Documents.Fixed.Model.Editing.Tables.Table
    {
        DefaultCellProperties = { Borders = new Telerik.Windows.Documents.Fixed.Model.Editing.Tables.TableCellBorders(border, border, border, border) },
        Margin = new System.Windows.Thickness(10)
    };
}

private static void AddRowToTable(Telerik.Windows.Documents.Fixed.Model.Editing.Tables.Table pdfTable, Telerik.Windows.Documents.Flow.Model.TableRow htmlRow, RadFixedPage pdfPage)
{
    var pdfRow = pdfTable.Rows.AddTableRow();

    for (int i = 0; i < htmlRow.Cells.Count; i++)
    {
        var pdfCell = pdfRow.Cells.AddTableCell();
        pdfCell.PreferredWidth = pdfPage.Size.Width * (i == 0 ? 0.10 : 0.80);

        foreach (var htmlBlock in htmlRow.Cells[i].Blocks.OfType<Telerik.Windows.Documents.Flow.Model.Paragraph>())
        {
            var pdfBlock = pdfCell.Blocks.AddBlock();

            foreach (var htmlInline in htmlBlock.Inlines)
            {
                if (htmlInline is ImageInline htmlImageInline)
                {
                    using (var stream = new MemoryStream(htmlImageInline.Image.ImageSource.Data))
                        pdfBlock.InsertImage(new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(stream));
                }
                else if (htmlInline is Telerik.Windows.Documents.Flow.Model.Run run)
                {
                    pdfBlock.InsertText(run.Text);
                }
                else if (htmlInline is Break)
                {
                    pdfBlock.InsertLineBreak();
                }
            }
        }
    }
}
```

## See Also
- [HtmlFormatProvider Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/html/html-overview)
- [RadFixedDocument API Reference](https://docs.telerik.com/devtools/document-processing/api/telerik.windows.documents.fixed.model.radfixeddocument)
- [PdfFormatProvider Overview](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdf-overview)
---
