---
title: Form
page_title: Form
slug: radpdfprocessing-model-form
tags: form
published: True
position: 6
---

# Form

__Form__ is a content element, which contains a form source and represents a Form XObject. The Form XObjects enables you to describe objects (text, images, vector elements, etc.) within a PDF file and reuse this content among the document.
      

* [Creating and Inserting a Form](#creating-and-inserting-a-form)

* [Form Properties](#form-properties)

## Public API

| **Property**          | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| **FormSource**        | Specifies the content that will be visualized in the Form object. It is of type [**FormSource**]({%slug radpdfprocessing-model-formsource-overview%}). |
| **Clipping**          | Gets or sets the clipping of the form object.                                                  |
| **Width**             | The width of the form.                                                                          |
| **Height**            | The height of the form.                                                                         |
| **AlphaConstant**     | Specifies the constant shape or constant opacity value to be used for nonstroking operations.   |
| **StrokeAlphaConstant** | Specifies the constant shape or constant opacity value to be used for stroking operations.      |
| **Position**          | The [Position]({%slug radpdfprocessing-concepts-position%}) of the form inside the __IContainerElement__. |
| **Parent**            | Allows you to obtain the parent page of the form.                                               |

| **Method**            | **Description**                                                                                 |
|-----------------------|-------------------------------------------------------------------------------------------------|
| **Clone** (_since Q2 2025_) | Creates a deep copy of this document element.                                                  |


### Creating and Inserting a Form

The **Form** class exposes a default public constructor to allow you create instances of it. __Form__ is a content element and you can add such an object to the __Content__ collection of an __IContainerElement__ such as [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).
        

__Example 1__ shows how to initialize a Form object and add it to a previously defined container.
    

#### __[C#] Example 1: Create a form and add it to an IContainerElement__

{{region cs-radpdfprocessing-model-form_0}}
	Form form = new Form();
	container.Content.Add(form);
{{endregion}}


__Example 2__ demonstrates how to use one of the factory methods of the __ContentElementCollection__ to create a new form and insert it into the respective container.
        

#### __[C#] Example 2: Add a form to a container__

{{region cs-radpdfprocessing-model-form_1}}
	Form form = container.Content.AddForm();
	Form formWithSource = container.Content.AddForm(formSource);
{{endregion}}


>tipThere are other methods that allow adding a form to a document by passing it size and source. They could be used through the [FixedContentEditor class]({%slug radpdfprocessing-editing-fixedcontenteditor%}).
          
>You can add content to the form by setting its FormSource property. The API allows you also to directly pass the FormSource to a method which will automatically generate a form in the document content. For more information on this topic, check the [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) article.

 
### Modifying Form Properties

You can modify a __Form__ element using the properties the class exposes. The properties are listed in the [Public API](#public-api) section.  

#### __[C#] Example 3: Modify Form properties__

{{region cs-radpdfprocessing-model-form_2}}
	RadFixedDocument document = new RadFixedDocument();

	RadFixedPage page = document.Pages.AddPage();
	FormSource formSource = new FormSource();
	formSource.Size = new Size(200, 200);
	Form form = page.Content.AddForm(formSource);

	SimplePosition simplePosition = new SimplePosition();
	simplePosition.Translate(20, 20);

	form.Width = 200;
	form.Height = 300;
	form.Position = simplePosition;
	form.AlphaConstant = 0.5;
	form.StrokeAlphaConstant = 0.1;

	PathGeometry pathGeometry = new PathGeometry();
	PathFigure pathFigure = pathGeometry.Figures.AddPathFigure();
	pathFigure.StartPoint = new Point(5, 5);
	LineSegment lineSegment = pathFigure.Segments.AddLineSegment();
	lineSegment.Point = new Point(205, 5);
	BezierSegment bezierSegment = pathFigure.Segments.AddBezierSegment();
	bezierSegment.Point1 = new Point(105, 50);
	bezierSegment.Point2 = new Point(130, 105);
	bezierSegment.Point3 = new Point(100, 200);
	pathFigure.IsClosed = true;

	FixedContentEditor editor = new FixedContentEditor(formSource);
	editor.DrawPath(pathGeometry);
{{endregion}}

![PdfProcessing Modify Form Properties](images/pdf-processing-modify-form-properties.png)

## See Also

 * [Form Source]({%slug radpdfprocessing-model-formsource-overview%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [Position]({%slug radpdfprocessing-concepts-position%})
