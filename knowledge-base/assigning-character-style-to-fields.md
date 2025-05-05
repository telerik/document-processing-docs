---
title: Assigning Character Style to Fields in RadWordsProcessing
description: Learn how to apply a custom character style to fields in RadWordsProcessing for Document Processing and export the document to PDF.
type: how-to
page_title: Applying Custom Character Style to Fields in RadWordsProcessing
slug: assigning-character-style-to-fields
tags: radwordsprocessing, document-processing, fields, character-style, pdf-export
res_type: kb
ticketid: 1686361
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 2025.1.205| RadWordsProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

I want to apply a custom character style to fields, such as page number and total pages, in RadWordsProcessing for Document Processing. I need the document to reflect the applied styles and be exported to PDF format.

This knowledge base article also answers the following questions:
- How to set a character style for a field in RadWordsProcessing?
- How to format fields like PAGE and NUMPAGES with custom styles?
- How to export styled fields to PDF using RadWordsProcessing?

## Solution

To assign a custom character style to fields in RadWordsProcessing and export the document to PDF, follow the steps below:

1. Create and define the custom character styles.
2. Add the styles to the document's `StyleRepository`.
3. Specify the desired style for the `Run` objects in the field or the paragraph containing the field.
4. Export the document to PDF format.

Here is a complete code example:

```csharp
RadFlowDocument document = new RadFlowDocument();
Section section = document.Sections.AddSection();
Footer footer = section.Footers.Add();

// Add a paragraph to the footer
Paragraph paragraph = footer.Blocks.AddParagraph();
paragraph.TextAlignment = Alignment.Right;

// Create a document editor
RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
editor.MoveToParagraphStart(paragraph);

// Define custom character styles
Style characterStyle = new Style("Character Style", StyleType.Character);
characterStyle.Name = "Character Style";
characterStyle.CharacterProperties.FontSize.LocalValue = 12;
characterStyle.CharacterProperties.FontWeight.LocalValue = FontWeights.Normal;
characterStyle.CharacterProperties.ForegroundColor.LocalValue = new ThemableColor(Colors.Red);
document.StyleRepository.Add(characterStyle);

Style footerCharacterStyle = new Style("Footer Character Style", StyleType.Character);
footerCharacterStyle.Name = "Footer Character Style";
footerCharacterStyle.CharacterProperties.FontSize.LocalValue = 12;
footerCharacterStyle.CharacterProperties.FontWeight.LocalValue = FontWeights.Normal;
footerCharacterStyle.CharacterProperties.ForegroundColor.LocalValue = new ThemableColor(Colors.Aqua);
document.StyleRepository.Add(footerCharacterStyle);

// Insert text and apply styles
Run runFooterPage = editor.InsertText("Page ");
runFooterPage.StyleId = characterStyle.Id;

Telerik.Windows.Documents.Flow.Model.Fields.FieldInfo fieldInfo = editor.InsertField("PAGE", "");
fieldInfo.Start.Paragraph.StyleId = footerCharacterStyle.Id;

Run runFooterOf = editor.InsertText(" of ");
runFooterOf.StyleId = characterStyle.Id;

editor.InsertField("NUMPAGES", "");

// Update fields in the document
document.UpdateFields();

// Export the document to PDF
string outputFilePath = "sample.pdf";
File.Delete(outputFilePath);
Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Pdf.PdfFormatProvider();
using (Stream output = File.OpenWrite(outputFilePath))
{
    provider.Export(document, output, TimeSpan.FromSeconds(10));
}
Process.Start(new ProcessStartInfo() { FileName = outputFilePath, UseShellExecute = true });
```

### Key Points:
- The `StyleId` property of `Run` objects allows you to associate a custom style.
- Fields consist of `Start` and `End` characters; you can apply styles to these elements or to the containing paragraph.
- Use the `UpdateFields` method to update the field content before export.

## See Also

- [RadWordsProcessing Overview](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/overview)
- [RadWordsProcessing Fields Documentation](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/features/fields)
- [RadWordsProcessing PDF Export](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/formats-and-conversion/pdf)
