title: Form Source
description: Learn how to add content, SVG images or barcodes into a PDF document using RadPdfProcessing.
page_title: Form Source
slug: radpdfprocessing-model-formsource-overview
tags: formsource, pdfprocessing, document, processing, pdf
published: True
position: 0
---

# FormSource

With **FormSource** you can add content to a [Form]({%slug radpdfprocessing-model-form%}) object, which will be inserted in the PDF document. This article explains the following topics:

* [Creating a FormSource](#creating-a-formsource)
* [FormSource Properties](#properties)
* [Adding Content to a FormSource Object](#adding-content-to-a-formsource-object)
* [Inserting a FormSource into a Document](#inserting-a-formsource-into-a-document)
      
>note The [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) content can also be an [SVG]({%slug radpdfprocessing-model-formsource-svg%}) image or a [Barcode]({%slug radpdfprocessing-model-formsource-barcode%}). 

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

## See Also

 * [SVG]({%slug radpdfprocessing-model-formsource-svg%})
 * [Barcode]({%slug radpdfprocessing-model-formsource-barcode%})