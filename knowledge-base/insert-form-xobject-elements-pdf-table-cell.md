---
title: Creating a PDF Table with Form Fields Inside the Cells
description: Learn how to insert interactive form fields such as radio buttons and textboxes into table cells in a PDF document using RadPdfProcessing.
type: how-to
page_title: How to Add Interactive Form Fields to Table Cells in PDF Documents with RadPdfProcessing
slug: insert-form-xobject-elements-pdf-table-cell
tags: pdfprocessing, document, processing, pdf, table, interactive, forms, radio, button, textbox, cell, acroform
res_type: kb
ticketid: 1663177
---

## Environment

| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.3.806| RadPdfProcessing |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

Learn how to insert interactive [form fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) such as [radio buttons]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) and [textboxes]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) into [table cells]({%slug radpdfprocessing-editing-tablecell%}) in a PDF document using RadPdfProcessing.

![Pdf Table with Form Fields](images/pdf-table-with-form-fields.png) 

## Solution

To insert interactive form fields like radio buttons and textboxes into table cells in a PDF document, follow the steps below:

1. Create a new [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}) and add a page to it.
2. Initialize a [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) on the page for drawing content.
3. Define a [Table]({%slug radpdfprocessing-editing-table%}) object and configure its properties, including borders and cell padding.
4. For each row in the table:
   - Add a text cell with the caption using [InsertText](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/editing/block#inserting-text).
   - Create a [RadioButtonField]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) , configure its options, and draw it in a table cell.
   - Create a [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}), set its value, and draw it in another table cell.
5. [Export](https://docs.telerik.com/devtools/document-processing/libraries/radpdfprocessing/formats-and-conversion/pdf/pdfformatprovider/pdfformatprovider#export) the `RadFixedDocument` to a PDF file.

Below is a simplified code snippet demonstrating these steps:

```csharp
        private readonly string[] _questions = new string[] { "Question 1", "Question 2", "Question 3" };

        public static void Main(string[] args)
        {
            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage();
            FixedContentEditor editor = new FixedContentEditor(page);
            double top = 5;
            double left = 5;
            string[] questions = new string[] { "Question 1", "Question 2", "Question 3" };
            Table questionnaireTable = new Table();
            RgbColor bordersColor = new RgbColor(255, 0, 0);
            int thickness = 1;
            Border border = new Border(thickness, Telerik.Windows.Documents.Fixed.Model.Editing.BorderStyle.Single, bordersColor);
            TableCellBorders tableCellsBorder = new TableCellBorders(border, border, border, border, null, null);
            questionnaireTable.Borders = new TableBorders(border);
            questionnaireTable.DefaultCellProperties.Borders = tableCellsBorder;
            questionnaireTable.DefaultCellProperties.Padding = new Thickness(thickness);
            for (int i = 0; i < questions.Length; i++)
            {
                string question = questions[i];
                TableRow questionRow = questionnaireTable.Rows.AddTableRow();

                // 1. Caption text
                TableCell captionCell = questionRow.Cells.AddTableCell();
                captionCell.PreferredWidth = 100;
                captionCell.Blocks.AddBlock().InsertText(question);
                captionCell.Blocks.AddBlock().InsertText(string.Empty);
                captionCell.Blocks.AddBlock().InsertText(string.Empty);
                captionCell.Borders = tableCellsBorder;
                int rowHeight = 0;
                foreach (Block b in captionCell.Blocks)
                {
                    rowHeight += (int)b.Measure().Height;
                }
                // 2. Radio button field
                TableCell radioButtonCell = questionRow.Cells.AddTableCell();
                radioButtonCell.PreferredWidth = 200;
                RadioButtonField answerRadioButtonField = new RadioButtonField("RadioButton_" + question);
                answerRadioButtonField.Options.Add(new RadioOption("Yes"));
                answerRadioButtonField.Options.Add(new RadioOption("No"));
                answerRadioButtonField.Value = answerRadioButtonField.Options[1];

                document.AcroForm.FormFields.Add(answerRadioButtonField);
                editor.Position.Translate((int)captionCell.PreferredWidth + 10, rowHeight * i + rowHeight / 2);
                foreach (RadioOption option in answerRadioButtonField.Options)
                {
                    DrawNextWidgetWithDescription(editor, option.Value, (e) => e.DrawWidget(answerRadioButtonField, option, new Size(20, 20)));
                }

                // 3. Textbox field
                TableCell commentCell = questionRow.Cells.AddTableCell();
                commentCell.PreferredWidth = 200;
                TextBoxField textBox = new TextBoxField("textBox_" + question);
                document.AcroForm.FormFields.Add(textBox);
                textBox.Value = "Sample comment...";
                editor.Position.Translate((int)captionCell.PreferredWidth + (int)radioButtonCell.PreferredWidth + 10, editor.Position.Matrix.OffsetY);
                DrawNextWidgetWithDescription(editor, string.Empty, (e) => e.DrawWidget(textBox, new Size((int)commentCell.PreferredWidth, rowHeight / 2)));
            }

            editor.Position.Translate(top, left);
            questionnaireTable.Draw(editor, new Rect(left, top, page.Size.Width, page.Size.Height));

            string fileName = $"{Guid.NewGuid()}.pdf";
            File.Delete(fileName);
            PdfFormatProvider provider = new PdfFormatProvider();
            using Stream stream = File.OpenWrite(fileName);
            provider.Export(document, stream);

            Process.Start(new ProcessStartInfo() { UseShellExecute = true, FileName = fileName });
        }

        private static void DrawNextWidgetWithDescription(FixedContentEditor editor, string description, Action<FixedContentEditor> drawWidgetWithEditor)
        {
            double padding = 10;
            drawWidgetWithEditor(editor);
            Size annotationSize = editor.Root.Annotations[editor.Root.Annotations.Count - 1].Rect.Size;
            double x = editor.Position.Matrix.OffsetX;
            double y = editor.Position.Matrix.OffsetY;

            Block block = new Block();
            block.TextProperties.FontSize = 18;
            block.VerticalAlignment = Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment.Center;
            block.InsertText(description);
            editor.Position.Translate(x + annotationSize.Width, y);
            editor.DrawBlock(block, new Size(editor.Root.Size.Width, annotationSize.Height));

            editor.Position.Translate(x + block.Measure().Width + annotationSize.Width + padding * 2, y);
        }
```

## See Also

- [Create Interactive Forms SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms)
- [Modify Form Values SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms)

---
