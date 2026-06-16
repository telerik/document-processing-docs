---
title: How to Generate a PDF Document from Images with RadFixedDocumentEditor
description: This article explains how to create a PDF document from a collection of images using the RadPdfProcessing library.
type: how-to
page_title: How to Generate a PDF Document from Images with RadFixedDocumentEditor
slug: pdf-from-images-with-radfixeddocumenteditor
tags: radpdfprocessing, pdf, image, fixeddocumenteditor, document, processing, fixed, creation
res_type: kb
---
## Environment
| Version | Product | Author | 
| --- | --- | ---- | 
| 2024.1.124 | RadPdfProcessing|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This article demonstrates how to generate a PDF document from a collection of images in a local folder.

![Folder with images](images/images-folder.png) 

## Solution

To create the PDF document, use the [`RadFixedDocumentEditor`]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) class. This class generates content in a flow-like manner and automatically distributes it across pages.
 
```csharp
         private static void GeneratePdfFromImagesWithRadFixedDocumentEditor(string imageFolderPath)
        {
            Padding pageMarginsValue = new Padding(
                Unit.MmToDip(20),//left
                 Unit.MmToDip(0),//top
                  Unit.MmToDip(0),//right
                   Unit.MmToDip(0));//bottom
            Size pageSize = new Size(Unit.MmToDip(210), Unit.MmToDip(297));
            RadFixedDocument fixedDocument = new RadFixedDocument();
            RadFixedDocumentEditor documentEditor = new RadFixedDocumentEditor(fixedDocument);
            documentEditor.SectionProperties.PageSize = pageSize;
            documentEditor.SectionProperties.PageMargins = pageMarginsValue;
            string[] imageFiles = Directory.GetFiles(imageFolderPath);

            foreach (string imageFilePath in imageFiles)
            {
                FileStream fileStream = new FileStream(imageFilePath, FileMode.Open);
                Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource _imageSource = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(fileStream);
                documentEditor.InsertImageInline(_imageSource);
                documentEditor.InsertLineBreak();
            }
            documentEditor.Dispose();

            PdfFormatProvider provider = new PdfFormatProvider();
            string outputFilePath = @"..\..\sample.pdf";
            File.Delete(outputFilePath);
            using (Stream output = File.OpenWrite(outputFilePath))
            {
                provider.Export(fixedDocument, output);
            }
            Process.Start(outputFilePath);
        }        
```
The following screenshot shows the produced document:

![PDF with images](images/pdf-document-with-images.png) 

## See Also

* [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%})
* [PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
* [RadPdfProcessing]({%slug radpdfprocessing-overview%})
* [Converting Colored PDF Documents to Grayscale]({%slug convert-color-pdf-to-black-and-white-telerik-document-processing%})
