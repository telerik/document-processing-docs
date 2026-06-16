---
title: General Information
description: Learn how to use shapes in RadWordsProcessing to wrap and visually display text in configurable containers within DOCX documents.
page_title: General Information
slug: radwordsprocessing-shapes-shapes
tags: shapes, word, flow, document, docx, model, text, containers, drawing
published: True
position: 12
---

# Shapes

Shapes allow you to wrap text in a container and display it in a specific manner. Different types of shapes exist based on their visual appearance (shape, style, size, and others). Their variety makes them useful for drawing attention to specific text. You can also use shapes to control the text appearance (for example, inline with text or with text wrapping) relative to the rest of the document content.

>important To use shapes in your application, add a reference to `Telerik.Windows.Documents.DrawingML` for .NET Framework projects, or `Telerik.Documents.DrawingML` for projects based on .NET Core.

## Backward Compatibility

You can skip the import and export of shapes and avoid the need to reference the `Telerik.[Windows].Documents.DrawingML` package. To do so, set the `SkipShapes` property of `DocxImportSettings` and `DocxExportSettings`.

## Limitations

Starting with R3 2022, WordsProcessing supports **import and export** of shapes from and to **Office Open XML (DOCX)**.

* When you export to formats other than DOCX, the shapes are lost.
* Text in shapes is not supported.

Future releases plan to add support for text in shapes, shape insertion and editing, and shape preservation when you export to PDF.

## See Also

* [Model]({%slug radwordsprocessing-model%})
* [Paragraph]({%slug radwordsprocessing-model-paragraph%})
* [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
* [Creating Colored Squares in RadFlowDocument]({%slug creating-colored-squares-radflowdocument%})
