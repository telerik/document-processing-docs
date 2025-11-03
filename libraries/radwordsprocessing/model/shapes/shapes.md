---
title: General Information
page_title: General Information
slug: radwordsprocessing-shapes-shapes
tags: shape, rectangle, docx
published: True
position: 12
---

# Shapes

**Shapes** enable users to wrap text in a container and visualize it in a specific manner. There are different types of shapes determined by their visual appearance (shape, style, size, etc.). Their variation makes them very useful for drawing attention to specific text. They could also be helpful to manipulate the text appearance (e.g. inline with text or with text wrapping) according to the rest of the document content.

>important To use shapes in your application, you should add a reference to Telerik.Windows.Documents.DrawingML for .NET Framework projects, or Telerik.Documents.DrawingML for projects based on .NET Core.

## Backward Compatibility

If you would like to, you can skip the import and export of shapes and avoid the need to refer the Telerik.[Windows].Documents.DrawingML package. To do so, you should set the SkipShapes property of DocxImportSettings and DocxExportSettings.

## Limitations

With the first release of the functionality in WordsProcessing (R3 2022), **import and export** of shapes from and to **Office Open XML (DOCX)** is supported.

* When exporting to formats other than DOCX, the shapes will be lost. 
* Text in shapes is not supported

In next releases, the feature will be enhanced with support for text in shapes, inserting and editing shapes, as well as preserving them when exporting to PDF.


## See Also

 * [Model]({%slug radwordsprocessing-model%})
 * [Paragraph]({%slug radwordsprocessing-model-paragraph%})
 * [RadFlowDocument]({%slug radwordsprocessing-model-radflowdocument%})
 * [Creating Colored Squares in RadFlowDocument]({%slug creating-colored-squares-radflowdocument%})
