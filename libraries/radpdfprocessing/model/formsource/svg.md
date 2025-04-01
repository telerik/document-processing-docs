title: SVG
description: Learn how to add SVG images into a PDF document using RadPdfProcessing.
page_title: SVG FormSource
slug: radpdfprocessing-model-formsource-svg
tags: formsource, pdfprocessing, document, processing, pdf, svg
published: True
position: 1
---

# SVG FormSource

As of **Q3 2024** RadPdfProcessing provides support for SVG (vector graphics image format). The static FormSource.**FromSvg** method allows the possibility to insert a vector image in the PDF document. The following overloads are publicly available:

|Method|Description|
|----|----|
|**FormSource.FromSvg(string xml)**|Creates a FormSource object from an SVG file provided as a xml.|
|**FormSource.FromSvg(byte[] svgData)**|Creates a FormSource object from an SVG file provided as a byte[].|
|**FormSource.FromSvg(Stream stream)**|Creates a FormSource object from an SVG file provided as a stream.|

The following example shows how to insert an SVG image into a FormSource object using FixedContentEditor:

```csharp
string svgFilePath = "image.svg"; 
RadFixedDocument fixedDocument = new RadFixedDocument();
FixedContentEditor documentPageEditor = new FixedContentEditor(fixedDocument.Pages.AddPage());
int offset = 10;
documentPageEditor.Position.Translate(offset, offset);

FormSource svgHostForm = FormSource.FromSvg(File.ReadAllBytes(svgFilePath));
documentPageEditor.DrawForm(svgHostForm); 
//draw the SVG with its original size

double aspectRatio = svgHostForm.Size.Width / svgHostForm.Size.Height;
//get the aspect ratio from the original SVG size
double desiredSVGWidth = 100;
double calculatedSVGHeight = desiredSVGWidth / aspectRatio;
documentPageEditor.Position.Translate(offset, svgHostForm.Size.Height + offset);          
documentPageEditor.DrawForm(svgHostForm, new Size(desiredSVGWidth, calculatedSVGHeight));
//draw the SVG with desired width preserving the aspect ratio
```
![PdfProcessing Insert SVG](images/pdf-processing-insert-svg.png)

## See Also

 * [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
 * [Barcode]({%slug radpdfprocessing-model-formsource-barcode%})