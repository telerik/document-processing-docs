---
title: Form Source
description: Learn how to add content, SVG images or barcodes into a PDF document using RadPdfProcessing.
page_title: Form Source
slug: radpdfprocessing-model-formsource
tags: formsource
published: True
position: 7
---

# FormSource

With **FormSource** you can add content to a [Form]({%slug radpdfprocessing-model-form%}) object, which will be inserted in the PDF document. This article explains the following topics:

* [Creating a FormSource](#creating-a-formsource)
* [FormSource Properties](#properties)
* [Adding Content to a FormSource Object](#adding-content-to-a-formsource-object)
* [Inserting a FormSource into a Document](#inserting-a-formsource-into-a-document)
      

## Creating a FormSource

The FormSource class exposes a default constructor which you can use to create an empty instance.      

#### __[C#] Example 1: Create FormSource__

{{region cs-radpdfprocessing-model-formsource_0}}
	FormSource formSource = new FormSource();
{{endregion}}

The snippet from **Example 1** will create an empty FormSource object. To fill this object with content you can use [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) as described later in this article.

The properties exposed by the **FormSource** class are as follows:
|Property|Description|
|----|----|
|**Size**|Allows getting or setting the size of the form.|
|**Content**|Gets the contents of the form.| 

## Adding Content to a FormSource Object

The FormSource class inherits from the IContentRootElement interface. This inheritance allows you to use the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) class for filling the content of the form.

**Example 2** shows you how you can insert a content into a FormSource object using FixedContentEditor.

#### __[C#] Example 2: Add content to a FormSource__

{{region cs-radpdfprocessing-model-formsource_1}}
	FormSource simpleForm = new FormSource();
	simpleForm.Size = new Size(310, 250);
	
	FixedContentEditor formEditor = new FixedContentEditor(simpleForm);
	formEditor.Position.Translate(50, 60);
	
	using (formEditor.SaveProperties())
	{
	    formEditor.GraphicProperties.IsFilled = true;
	    formEditor.GraphicProperties.IsStroked = true;
	    formEditor.GraphicProperties.StrokeThickness = 2;
	    formEditor.GraphicProperties.StrokeColor = new RgbColor(92, 229, 0);
	    formEditor.GraphicProperties.FillColor = new RgbColor( 213, 222, 226);
	    formEditor.GraphicProperties.StrokeDashArray = new double[] { 17, 4 };
	    formEditor.DrawRectangle(new Rect(new Size(250, 150)));
	}
	
	formEditor.Position.Translate(100, 120);
	formEditor.DrawText("Sample rectangle in a form");
{{endregion}}

## Inserting a FormSource into a Document

After generating the FormSource object and filling it with content, you should insert it in the document. The API provides you with convenient approaches that might be useful to easily insert the form in different scenarios.

>You can reuse a single FormSource object among the document by setting it to different [Form]({%slug radpdfprocessing-model-form%}) instances.

* In addition to the ability to fill a form source, the FixedContentEditor allows you to add this form to a container. 


	#### __[C#] Example 3: Add a FormSource to a document using FixedContentEditor__
	
	{{region cs-radpdfprocessing-model-formsource_2}}
		FixedContentEditor documentPageEditor = new FixedContentEditor(document.Pages.AddPage());
		
		FormSource simpleForm = new FormSource();
		// Fill the FormSource instance with content (you can use the code from Example 2)
		
		documentPageEditor.DrawForm(simpleForm);
	
	{{endregion}}

	There are several overloads of the DrawForm() method that enables you to specify the size of the form.

* A FormSource object can be inserted using the methods of **RadFixedDocumentEditor**. The InsertFormInline() method is described in the [RadFixedDocumentEditor]({%slug radpdfprocessing-editing-radfixeddocumenteditor%}) topic.

* When editing a Block, you can insert a FormSource object directly into it. For more information, check [this topic]({%slug radpdfprocessing-editing-block%}).

## Adding SVG into a Document

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

## Adding Barcode into a Document

As of **Q1 2025** RadPdfProcessing provides support for adding Barcodes (1D and 2D) into a PDF document. This is possible through the static FormSource.**FromBarcode** and FormSource.**From2DBarcode** methods. They utilize the **Symbology1DType** and **Symbology2DType** enums that represent the different types of 1D and 2D barcode symbologies supported by the barcode model. These are the publicly available overloads:

|Method|Description|
|----|----|
|**FormSource.FromBarcode(Symbology1DType symbology, string value)**|Creates a **FormSource** object from a one-dimensional (1D) barcode parameters, with a default **Width** and **Height** of **100**.|
|**FormSource.FromBarcode(Symbology1DType symbology, string value, int width, int height)**|Creates a **FormSource** object from a one-dimensional (1D) barcode parameters with custom **Width** and **Height**.|
|**FormSource.FromBarcode(Symbology1DType symbology, string value, int width, int height, bool showText)**|Creates a **FormSource** object from a one-dimensional (1D) barcode parameters with custom **Width** and **Height** while specifying whether the text should be shown or not (**showText** is **false** by default).|
|**FormSource.FromBarcode(Symbology1DType symbology, string value, bool showText)**|Creates a **FormSource** object from a one-dimensional (1D) barcode parameters while specifying whether the text should be shown or not (**showText** is **false** by default). **Width** and **Height** are **100** by default.|
|**FormSource.From2DBarcode(Symbology2DType symbology, string value)**|Creates a **FormSource** object from a two-dimensional (2D) barcode parameters, with a default **Width** and **Height** of **100**.|
|**FormSource.From2DBarcode(Symbology2DType symbology, string value, int width, int height)**|Creates a **FormSource** object from a two-dimensional (2D) barcode parameters, with custom **Width** and **Height**.|

The following example shows how to create a **Barcode** as a **FormSource** object and insert it in a page using the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}):

<snippet id='libraries-pdf-model-formsource-adding-barcode'/>

![PdfProcessing Insert Barcode](images/pdf-processing-insert-barcode.png)

## See Also

 * [Form]({%slug radpdfprocessing-model-form%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
