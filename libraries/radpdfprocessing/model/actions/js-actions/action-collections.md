---
title: Action Collections
description: Learn about the action collection types in RadPdfProcessing that store and manage PDF actions associated with document elements.
page_title: Action Collections
slug: radpdfprocessing-model-action-collections
tags: actioncollections, pdf, javascript, radpdfprocessing, actions, triggers, model, events, collection
published: True
position: 1
---

# Action Collections

Depending on the [document element]({%slug radpdfprocessing-model-general-information%}) associated with the actions, different collection types store the actions and provide the appropriate public API.

## ActionCollection

Represents a basic collection of [Action]({%slug radpdfprocessing-model-annotations-links%}#action) objects. The collection allows you to manipulate items through the following public methods:

|Method Name|Description|
|----|----|
|`Add`|Adds the specified `Action` to the end of the collection.|
|`AddRange`|Adds the elements of the specified collection to the end of the current collection.|
|`Insert`|Inserts an `Action` into the collection at the specified index.|
|`Clear`|Removes all elements from the collection.|
|`Remove`|Removes the first occurrence of a specific `Action` from the collection.|
|`RemoveRange`|Removes a range of elements from the collection.|
|`RemoveAt`|Removes the element at the specified index of the collection.|
|`Find`|Finds the first `Action` that matches the conditions defined by the specified predicate.|
|`FindAll`|Finds all `Action` objects that match the conditions defined by the specified predicate.|
|`Reverse`|Reverses the order of the elements in the collection.|
|`GetRange`|Returns a range of elements from the collection.|

## AnnotationActionCollection

An abstract class that represents a collection of `Action` objects. It is the base class for the `WidgetActionCollection` and exposes the following API:

|Property Name|Description|
|----|----|
|`MouseEnter`|Gets the collection of actions triggered when the mouse enters the annotation area.|
|`MouseExit`|Gets the collection of actions triggered when the mouse exits the annotation area.|
|`MouseDown`|Gets the collection of actions triggered when the mouse button is pressed within the annotation area.|
|`MouseUp`|Gets the collection of actions triggered when the mouse button is released within the annotation area.|

## WidgetActionCollection

Represents a collection of `Action` objects for widget annotations.

|Property Name|Description|
|----|----|
|`OnFocus`|Gets or sets the collection of actions triggered when the widget gains the input focus.|
|`OnBlur`|Gets or sets the collection of actions triggered when the widget loses the input focus.|
|`OnPageOpen`|Gets or sets the collection of actions triggered when the page containing the widget is opened.|
|`OnPageClose`|Gets or sets the collection of actions triggered when the page containing the widget is closed.|
|`OnPageVisible`|Gets or sets the collection of actions triggered when the page containing the widget becomes visible.|
|`OnPageInvisible`|Gets or sets the collection of actions triggered when the page containing the widget becomes invisible.|

## FormFieldActionCollection

Represents a collection of `JavaScriptAction` objects associated with a [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}).

|Property Name|Description|
|----|----|
|`Keystroke`|Gets or sets the JavaScript action performed when the user types a keystroke into a text field or combo box or modifies the selection in a scrollable list box.|
|`Format`|Gets or sets the JavaScript action performed before the field is formatted to display its current value.|
|`Validate`|Gets or sets the JavaScript action performed when the field value is changed.|
|`Calculate`|Gets or sets the JavaScript action performed to recalculate the value of this field when another field changes.|

Use this collection when a calculation must run after the user enters values. A sample approach is demonstrated in the [Multiplying TextBoxField Values with JavaScript Actions]({%slug multiply-form-field-with-javascript-action-radpdfprocessing%}) article.

A common case is restricting the user input, for example, when entering a date in a specific format:

<snippet id='pdf-form-field-action-collection'/>

The following image shows the result:

![JS Action Format FormField result showing date format validation](images/js-action-format-form-field.png)

## PageActionCollection

Represents a collection of `Action` objects associated with a [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}).

|Property Name|Description|
|----|----|
|`OnPageOpen`|Gets or sets the collection of actions triggered when the page is opened.|
|`OnPageClose`|Gets or sets the collection of actions triggered when the page is closed.|

The following example shows how to use the JavaScript Actions feature to show an alert when the second page in a document is closed:

<snippet id='pdf-page-action-collection'/>

![JS Action Page result showing an alert on page close](images/js-action-page.gif)

## DocumentActionCollection

Represents a collection of `JavaScriptAction` objects associated with [RadFixedDocument]({%slug radpdfprocessing-model-radfixeddocument%}).

|Property Name|Description|
|----|----|
|`DocumentWillClose`|Gets or sets the JavaScript action triggered before the document is closed.|
|`DocumentWillSave`|Gets or sets the JavaScript action triggered before the document is saved.|
|`DocumentDidSave`|Gets or sets the JavaScript action triggered after the document is saved.|
|`DocumentWillPrint`|Gets or sets the JavaScript action triggered before the document is printed.|
|`DocumentDidPrint`|Gets or sets the JavaScript action triggered after the document is printed.|

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing]({%slug multiply-form-field-with-javascript-action-radpdfprocessing%})
