---
title: Form Source
page_title: Form Source
slug: radpdfprocessing-model-formsource
tags: formsource
published: True
position: 7
---

# FormSource

With __FormSource__ you can add content to a [Form]({%slug radpdfprocessing-model-form%}) object, which will be inserted in the PDF document. This article explains the following topics:

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

## Properties

The properties exposed by the **FormSource** class are as follows:

* **Size**: Allows you get or set the size of the form.
* **Content**: Gets the contents of the form.


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

* **FormSource.FromSvg(string xml)** - Creates a FormSource object from an SVG file provided as a xml.

* **FormSource.FromSvg(byte[] svgData)** - Creates a FormSource object from an SVG file provided as a byte[].

* **FormSource.FromSvg(Stream stream)** - Creates a FormSource object from an SVG file provided as a stream.

The following example shows how to insert a SVG image into a FormSource object using FixedContentEditor:

```csharp
string svgFilePath = "svg file path"; 
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

 * [Form]({%slug radpdfprocessing-model-form%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
