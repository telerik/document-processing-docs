---
title: Fit Multiline Text Inside a Custom Stamp Annotation in PDFs with RadPdfProcessing
description: Learn how to measure and fit multiline text inside the fixed rectangle of a custom StampAnnotation by calculating the optimal font size.
type: how-to
page_title: Fit Multiline Text Inside a Custom Stamp Annotation in PDFs with RadPdfProcessing
meta_title: Fit Multiline Text Inside a Custom Stamp Annotation in PDFs with RadPdfProcessing
slug: fit-multiline-text-stamp-annotation-radpdfprocessing
tags: pdf, stamp, annotation, font, size, multiline, measure, text, appearance, autosize, fit, aouto, fixed, editor, auto
res_type: kb
---

## Environment

| Version | Product | Author |
| ---- | ---- | ---- |
| 2025.3.806 | RadPdfProcessing | [Yoan Karamanov](https://www.telerik.com/blogs/author/yoan-karamanov) |

## Description

This article shows how to render multiple lines of text so they fit inside the fixed rectangle of a custom [StampAnnotation]({%slug radpdfprocessing-model-annotations-stamp%}) by dynamically determining the maximum usable font size. Unlike predefined stamp names, a custom stamp appearance requires supplying a visual form (a **FormSource**) that draws both background styling and text content.

>important When using a custom name (not one of the predefined **StampAnnotationPredefinedNames**), it is recommended to prefix the name with **#** (e.g., **#CustomStamp**) so external PDF viewers (like Adobe Acrobat) don't overwrite the custom appearance if the stamp is moved.

## Solution

To fit multiline text inside a stamp rectangle:

1. Create a **StampAnnotation** with a fixed **Rect** on a page.
2. Build a custom **FormSource** that will serve as the annotation's appearance (**Content.NormalContentSource**).
3. Measure each line by incrementally increasing the font size in a **Block** until the rendered dimensions exceed the available width/height and keep the maximum size that fits.
4. Use the minimum of all line-specific maximum sizes so every line fits within the rectangle.
5. Draw a decorative background (border, fill, dash pattern) and then render each line vertically stacked.
6. Export the document to PDF.

![Stamp With Auto-Fitted Multiline Text](images/stamp-auto-fitted-multiline-text.png) 

Below is a complete example demonstrating these steps.

#### Measure and Fit Multiline Text in a StampAnnotation

```csharp
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using Telerik.Documents.Primitives;
using Telerik.Windows.Documents.Fixed.FormatProviders.Pdf;
using Telerik.Windows.Documents.Fixed.Model;
using Telerik.Windows.Documents.Fixed.Model.Annotations;
using Telerik.Windows.Documents.Fixed.Model.ColorSpaces;
using Telerik.Windows.Documents.Fixed.Model.Editing;
using Telerik.Windows.Documents.Fixed.Model.Resources;

List<string> lines = new List<string>() { "1st line", "second line", "3rd line",};
RadFixedDocument document = CreateTextAnnotation(lines);

string exportFileName = "StampAnnotation.pdf";
File.Delete(exportFileName);
using (Stream output = File.OpenWrite(exportFileName))
{
    PdfFormatProvider provider = new PdfFormatProvider();
    provider.Export(document, output, TimeSpan.FromSeconds(20));
}

Process.Start(new ProcessStartInfo
{
    FileName = exportFileName,
    UseShellExecute = true
});

RadFixedDocument CreateTextAnnotation(List<string> lines)
{
    RadFixedDocument radFixedDocument = new RadFixedDocument();
    RadFixedPage page = radFixedDocument.Pages.AddPage();

    StampAnnotation stampAnnotation = page.Annotations.AddStamp(new Rect(100, 100, 100, 100));
    stampAnnotation.Name = "#Test";

    FormSource annotationForm = CreateContentFormWithText(stampAnnotation.Rect, lines);
    stampAnnotation.Content.NormalContentSource = annotationForm;

    return radFixedDocument;
}

static FormSource CreateContentFormWithText(Rect stampRectangle, List<string> lines)
{
    FormSource textForm = new FormSource();
    textForm.Size = new Size(stampRectangle.Width, stampRectangle.Height);

    FixedContentEditor textFormEditor = new FixedContentEditor(textForm);

    using (textFormEditor.SaveProperties())
    {
        textFormEditor.GraphicProperties.IsFilled = true;
        textFormEditor.GraphicProperties.IsStroked = true;
        textFormEditor.GraphicProperties.StrokeThickness = 2;
        textFormEditor.GraphicProperties.StrokeColor = new RgbColor(92, 229, 0);
        textFormEditor.GraphicProperties.FillColor = new RgbColor(213, 222, 226);
        textFormEditor.GraphicProperties.StrokeDashArray = new double[] { 17, 4 };
        textFormEditor.DrawRectangle(new Rect(textFormEditor.Position.Matrix.OffsetX, textFormEditor.Position.Matrix.OffsetY, stampRectangle.Width, stampRectangle.Height));
    }

    double calculatedFontSize = MeasureFontSize(textForm, textFormEditor, lines);
    textFormEditor.TextProperties.FontSize = calculatedFontSize;

    double offset = 0;
    foreach (string line in lines)
    {
        textFormEditor.Position.Translate(0, offset);
        textFormEditor.DrawText(line);
        offset += calculatedFontSize;
    }

    return textForm;
}

static double MeasureFontSize(FormSource textForm, FixedContentEditor formEditor, List<string> lines)
{
    List<double> fontSizes = new List<double>();

    foreach (string line in lines)
    {
        double fontSize = 0;
        Size textSize = Size.Empty;
        Block block = new Block();
        block.TextProperties.Font = formEditor.TextProperties.Font;
        while (textSize.Width < textForm.Size.Width && textSize.Height < textForm.Size.Height)
        {
            block.TextProperties.FontSize = ++fontSize;
            block.InsertText(line);
            textSize = block.Measure();
            block.Clear();
        }

        fontSizes.Add(fontSize);
    }

    return fontSizes.Min();
}
```

## See Also

- [Stamp Annotation]({%slug radpdfprocessing-model-annotations-stamp%})
- [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
- [FormSource Overview]({%slug radpdfprocessing-model-formsource-overview%})
- [PdfProcessing Overview]({%slug radpdfprocessing-overview%})
