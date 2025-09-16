---
title: Inserting Formatted HTML content in another RadFlowDocument
description: Learn how to insert formatted HTML text in specific locations within a RadFlowDocument and preserve the styling using Telerik WordsProcessing.
type: how-to
page_title: How to Insert HTML and Preserve the Styles in RadWordsProcessing Document
meta_title: How to Insert HTML and Apply Preserve the in RadWordsProcessing Document
slug: inserting-html-and-styling-radwordsprocessing
tags: word, processing,telerik,document,html,styling,insert, docx, flow
res_type: kb
ticketid: 1698628
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.3.806| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I need to insert HTML content into specific locations within a RadFlowDocument created using Telerik WordsProcessing. Additionally, I want to apply specific styles to the inserted content, such as font family, size, and weight.

This knowledge base article also answers the following questions:
- How to merge HTML content into a specific paragraph in Telerik WordsProcessing?
- How to style a RadFlowDocument content programmatically?
- How to use RadWordsProcessing to insert documents into specific table cells?

## Solution

To insert HTML content into specific locations in a RadFlowDocument and apply styles, follow these steps:

### Inserting HTML Content into a Specific Location

Use the `HtmlFormatProvider` to import HTML content into a `RadFlowDocument`. Then, use the `RadFlowDocumentEditor` to insert the imported document into a specific location in your target document.

Example:

```csharp
RadFlowDocument originalDocument = new RadFlowDocument();
DocxFormatProvider docxProvider = new DocxFormatProvider();
originalDocument = docxProvider.Import(File.ReadAllBytes("original.docx"), TimeSpan.FromSeconds(10));

HtmlFormatProvider htmlProvider = new HtmlFormatProvider();
RadFlowDocument htmlDocument = htmlProvider.Import(File.ReadAllText("content.html"), TimeSpan.FromSeconds(10));

RadFlowDocumentEditor editor = new RadFlowDocumentEditor(originalDocument);
var tableCells = originalDocument.EnumerateChildrenOfType<TableCell>().ToList();
TableCell cell = tableCells[3] as TableCell;

// Move editor to the start of the target paragraph
editor.MoveToParagraphStart(cell.Blocks.First() as Paragraph);

// Insert the HTML document
editor.InsertDocument(htmlDocument);

string outputFilePath = "output.docx";
File.Delete(outputFilePath);
using (Stream output = File.OpenWrite(outputFilePath))
{
    docxProvider.Export(originalDocument, output, TimeSpan.FromSeconds(10));
}
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

### Applying Styles to Imported Content

Apply styles to the entire imported document before merging it into the target document. Use the `ThemableFontFamily`, `FontSize`, and `FontWeight` properties.

Example:

```csharp
htmlDocument.FontFamily = new ThemableFontFamily("Arial Narrow");
htmlDocument.FontSize = UnitHelper.PointToDip(10);
htmlDocument.FontWeight = FontWeights.Bold;
```

### Additional Notes

- To target specific locations in the document, use the `RadFlowDocumentEditor` to navigate to the desired position.
- Ensure the original document and imported HTML content are compatible in terms of styles and formatting.

## See Also

- [Insert Documents](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/insert-documents)
- [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [HtmlFormatProvider API Reference](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats/html)
- [RadFlowDocumentEditor API Reference](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/editing/document-editor)
---
