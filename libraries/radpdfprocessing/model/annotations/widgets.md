---
title: Widgets 
page_title: Widgets  
description: Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.
slug: radpdfprocessing-model-annotations-widgets 
tags: widgets, pdf, annotations, radpdfprocessing, form, fields, interactive, appearance, model
published: True
position: 2
---

# Widgets

Widget annotations visually represent a [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) value on a PDF page. Different widget annotations exist depending on the type of content they visualize. All widget annotations are created from the `FormField` class inheritor `Widgets` property through the `AddWidget()` method in the corresponding `Widgets` collection.

## Defining Widget Content

All widgets have two types of content properties:

* **AnnotationContentSource properties**: Properties of this type provide three [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) instances for the three mouse interactions with the widget—normal (no mouse interaction) source, mouse over source, and mouse down source. The `AnnotationContentSource` is usually taken with higher priority when visualizing the widget in a PDF viewer.

	There are two exceptional cases when these properties are ignored in favor of the dynamic appearance properties:
	* The first exceptional case is when the widget visualizes variable content that the user interaction dynamically modifies.
	* The second exceptional case is when the `AcroForm` class has the `ViewersShouldRecalculateWidgetAppearances` property set to `true`, which forces the viewer to ignore the provided `AnnotationContentSource`.

* **Dynamic appearance properties**: These properties dynamically construct the widget appearance depending on the field value. They are separated into two classes:
	* `VariableTextProperties`: Defines the text-specific properties.
	* `DynamicAppearanceCharacteristics`: Defines the geometry properties of the annotation content.

	>For more information on these classes, see the [Dynamic Appearance Properties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}) topic.


## Widget Class

The `Widget` class inherits [Annotation]({%slug radpdfprocessing-model-annotations-overview%}) and is the base class for all widgets. It provides common properties for all widgets and has a `WidgetContentType` property, which helps you recognize the concrete widget type and cast the base class instance to get the concrete widget inheritor.

All widgets are created through the `Widgets` collection of the [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) class inheritors. Use the `AddWidget()` and `Remove()` methods to add or remove a widget from the collection. The widget collection implements the `IEnumerable` interface, so you can iterate all the widgets available in the `FormField` instance.

**Creating a widget**

<snippet id='pdf-create-widget'/>

>important Specify the size of the widget. Otherwise, it is not visualized in the PDF document.

**Example 2** demonstrates how to iterate the `Widgets` collection of a [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) instance. Additionally, the code shows you how to add a widget to the `Annotations` collection of a `RadFixedPage`. You must add each widget to this collection so it can be visualized on the PDF page. Otherwise, the element does not appear on the page.

**Iterating the widgets in the FormField collection**

<snippet id='pdf-iterate-widgets'/>

>note The `Widget` class inherits from [Annotation]({%slug radpdfprocessing-model-annotations-overview%}). Add each annotation to the `Annotations` collection of `RadFixedPage`.


## Widget Properties

The `Widget` class provides the following common widget properties and methods:

| Member | Description |
|---|---|
| `WidgetContentType` | Provides the widget content type of this widget instance. Use it to recognize the type and cast to the concrete `Widget` class inheritor. |
| `Field` | Provides a reference to the [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) object that this widget visualizes. |
| `TextProperties` | Provides a [VariableTextProperties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#variabletextproperties-class) instance specifying how to dynamically construct the text in the widget appearance. |
| `HighlightingMode` | The highlighting effect used by the PDF viewer when the mouse is over the widget. |
| `RecalculateContent()` | Recalculates the `AnnotationContentSource` properties so their content corresponds to the [dynamic appearance properties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}) of the widget. Changes to `VariableTextProperties` and `DynamicAppearanceCharacteristics` are not visually displayed until this method is called. |

The `IsPrintable` property inherited from the `Annotation` class is set to `true` for the widgets by default. To exclude a widget from the document when printing, set its `IsPrintable` property to `false`.

## Widget Types

There are several `Widget` class inheritors that represent different types of content.


### VariableContentWidget Class

This class corresponds to the `WidgetContentType.VariableContent` enum value and represents a widget whose content dynamically changes when the user interacts with the field value. This widget type is used by [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}), [CombTextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%}), [ListBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%}), and [ComboBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%}) classes.

`VariableContentWidget` provides the following properties:

| Property | Description |
|---|---|
| `Content` | Provides the `AnnotationContentSource` used for the initial visualization of the field value in the PDF viewer. This is used only for **initial visualization** before the user has interacted with the field value. |
| `AppearanceCharacteristics` | A [DynamicAppearanceCharacteristics]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#dynamicappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. |


### SignatureWidget Class

This class corresponds to the `WidgetContentType.SignatureContent` enum value and represents a widget that visualizes a digital signature. This widget type is used by the [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) class and provides the following properties:

| Property | Description |
|---|---|
| `Content` | Provides the `AnnotationContentSource` used to visualize the digital signature in the PDF viewer. This property takes higher priority over `AppearanceCharacteristics`. |
| `AppearanceCharacteristics` | A [DynamicAppearanceCharacteristics]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#dynamicappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. Used only when `AcroForm.ViewersShouldRecalculateWidgetAppearances` is `true`. |


### PushButtonWidget Class

This class corresponds to the `WidgetContentType.PushButtonContent` enum value and represents a widget that visualizes a push button. This widget type is used by the [PushButtonField class]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%}) and provides the following properties:

| Property | Description |
|---|---|
| `Content` | Provides the `AnnotationContentSource` used to visualize the button in the PDF viewer. This property takes higher priority over `AppearanceCharacteristics`. |
| `AppearanceCharacteristics` | A [PushButtonAppearanceCharacteristics]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#pushbuttonappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. Used only when `AcroForm.ViewersShouldRecalculateWidgetAppearances` is `true`. Call `RecalculateContent()` to apply these properties to `Content`. |

### TwoStatesButtonWidget Class

This class corresponds to the `WidgetContentType.TwoStatesContent` enum value and represents a widget that visualizes a button with ON and OFF states. This widget type is used by the [CheckBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%}) and provides the following properties:

| Property | Description |
|---|---|
| `OnStateContent` | Provides the `AnnotationContentSource` used to visualize the selected state of the field in the PDF viewer. This property takes higher priority over `AppearanceCharacteristics`. |
| `OffStateContent` | Provides the `AnnotationContentSource` used to visualize the deselected state of the field in the PDF viewer. This property takes higher priority over `AppearanceCharacteristics`. |
| `AppearanceCharacteristics` | A [ButtonAppearanceCharacteristics]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#buttonappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. Used only when `AcroForm.ViewersShouldRecalculateWidgetAppearances` is `true`. Call `RecalculateContent()` to apply these properties to `OnStateContent` and `OffStateContent`. |

### RadioButtonWidget Class

This class inherits the [TwoStatesButtonWidget](#twostatesbuttonwidget-class) class and represents a widget that visualizes a radio button option. It is used by the [RadioButtonField class]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) and adds the following property to `TwoStatesButtonWidget`:

| Property | Description |
|---|---|
| `Option` | The concrete `RadioOption` that this widget represents. |


## See Also

* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Annotations Overview]({%slug radpdfprocessing-model-annotations-overview%})
* [FormSource]({%slug radpdfprocessing-model-formsource-overview%})
