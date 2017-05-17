---
title: Form
page_title: Form
description: Form
slug: radpdfprocessing-model-form
tags: form
published: True
position: 6
---

# Form

__Form__ is a content element, which contains a form source and represents a Form XObject. The Form XObjects enables you to describe objects (text, images, vector elements, etc.) within a PDF file and reuse this content among the document.
      

* [Creating and Inserting a Form](#creating-and-inserting-a-form)

* [Form Properties](#form-properties)


## Creating and Inserting a Form

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
          
>You can add content to the form by setting its FormSource property. The API allows you also to directly pass the FormSource to a method which will automatically generate a form in the document content. For more information on this topic, check the [FormSource]({%slug radpdfprocessing-model-formsource%}) article.

 
## Form Properties

You can modify a __Form__ element using the properties the class exposes. The properties are listed below.
        

* __FormSource__: Specifies the content that will be visualized in the Form object. It is of type [**FormSource**]({%slug radpdfprocessing-model-formsource%}).

* __Clipping__: Gets or sets the clipping of the form object.

* __Width__: The width of the form.

* __Height__: The height of the form.

* __Position__: The [Position]({%slug radpdfprocessing-concepts-position%}) of the form inside the __IContainerElement__.

* __Parent__: Allows you to obtain the parent page of the form.

## See Also

 * [Form Source]({%slug radpdfprocessing-model-formsource%})
 * [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
 * [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
 * [Position]({%slug radpdfprocessing-concepts-position%})
