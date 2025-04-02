---
title: Widgets 
page_title: Widgets  
description: Interactive forms use widget annotations to represent the appearance of fields and to manage user interactions.
slug: radpdfprocessing-model-annotations-widgets 
tags: annotations,overview,pdfprocessing,widgets,widget 
published: True
position: 2
---

# Widgets

This topic describes what the widgets represent and what are the different types of widgets.

* [Overview](#overview)
* [Defining Widget Content](#defining-widget-content)
* [Widget Class](#widget-class)
* [Widget Properties](#widget-properties)
* [Widget Types](#widget-types)
	* [VariableContentWidget](#variablecontentwidget-class)
	* [SignatureWidget](#signaturewidget-class)
	* [PushButtonWidget](#pushbuttonwidget-class)
	* [TwoStatesButtonWidget](#twostatesbuttonwidget-class)
	* [RadioButtonWidget](#radiobuttonwidget-class)

## Overview

Widget annotations are used for visual representation of some [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) value on a PDF page. There are different widget annotations depending on the type of content that they should visualize. All Widget annotations are created from the FormField class inheritor Widgets property through the **AddWidget()** method in the corresponding Widgets collection.

## Defining Widget Content

All widgets have two type of content properties:

* **AnnotationContentSource properties**: Properties of this type provide three [FormSource]({%slug radpdfprocessing-sample-test%}) instances for the three mouse interactions with the widget – normal (no mouse interaction) source, mouse over source and mouse down source. The AnnotationContentSource is usually taken with higher priority when visualizing the widget in a PDF viewer. 

	There are two exceptional cases when these properties are ignored in favor of the Dynamic appearance properties. 
	* The first exceptional case is when the widget is visualizing some variable content which is dynamically modified by the user interaction. 
	* The second exceptional case is when the AcroForm class has ViewersShouldRecalculateWidgetAppearances property set to *true* which forces the viewer to ignore the provided AnnotationContentSource.

* **Dynamic appearance properties**: These properties are used to dynamically construct the widget appearance depending on the field value. They are separated in two classes:
	* **VariableTextProperties**: Defining the text specific properties 
	* **DynamicAppearanceCharacteristics**: Defining the geometry properties of the annotation content.
	
	>For more information on these classes, check the [Dynamic Appearance Properties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}) topic.


## Widget Class

The Widget class is inheritor of [Annotation]({%slug radpdfprocessing-model-annotations-overview%}) and is the base class for all widgets. It provides common properties for all widgets and has WidgetContentType property, which helps you to recognize the concrete widget type and cast the base class instance to get the concrete widget inheritor. 

All widgets are created using the Widgets collection of the [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) class inheritors. Using the **AddWidget()** and **Remove()** methods, you can respectively add or remove a widget from the collection. As the widget collection implements the **IEnumerable** interface, you can iterate all the available in the FormField instance widgets.



#### **[C#] Example 1: Creating a widget**

{{region radpdfprocessing-model-annotations-widgets_0}}
	VariableContentWidget widget = textBoxField.Widgets.AddWidget();
	widget.Rect = new Rect(100, 100, 20, 20);
{{endregion}}

>Don't forget to specify the size of the widget. Otherwise, it won't be visualized in the PDF document.

**Example 2** demonstrates how to iterate the Widgets collection of a [TexBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}) instance. Additionally, the code shows you how to add a widget to the Annotations collection of a RadFixedPage. Note, that you must add each widget to this collection so it can be visualized on the PDF page. Otherwise, the element will not be shown on the page.

#### **[C#] Example 2: Iterating the widgets in the FormField's collection**

{{region radpdfprocessing-model-annotations-widgets_1}}
	foreach (var widget in textBoxField.Widgets)
	{
	    document.Pages[0].Annotations.Add(widget);
	}
{{endregion}}


>The Widget class inherits from [Annotation]({%slug radpdfprocessing-model-annotations-overview%}). It is important to add each annotation to the Annotations collection of RadFixedPage.


## Widget Properties

The Widget class provides the following common widget properties and methods:

* **WidgetContentType**: Provides the widget content type of the specifying widget instance. This property can be used to easily recognize the type of the concrete widget and cast the instance to the concrete Widget class inheritor.

* **Field**: Provides reference to the [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) object, which this widget should visualize.

* **TextProperties**: Provides a [VariableTextProperties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#variabletextproperties-class) instance specifying how to dynamically construct the text in the widget appearance. 

* **HighlightingMode**: The highlighting effect that should be used by the PDF viewer when the mouse is over the widget.

* **RecalculateContent()**: This method is used to recalculate the AnnotationContentSource properties, so that their content corresponds to the [Dynamic appearance properties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}) of the widget. 
 
	>If you modify the [VariableTextProperties]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#variabletextproperties-class) and the [DynamicAppearanceCharacteristics]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#dynamicappearancecharacteristics-class) properties and do not call the **RecalculateContent()** method, the changes will not be visually displayed when viewing the file as the AnnotationContentSource properties are with higher priority.

The inherited from the Annotation class property **IsPrintable** is set to *true* for the widgets by default. If you want to exclude a widget from the document when printing, you can set its **IsPrintable** property to *false*. 

## Widget Types

There are several Widget class inheritors, which represent different types of content.


### VariableContentWidget Class

This class corresponds to the WidgetContentType.VariableContent enum value and represents a widget, whose content is dynamically changed when the user interacts with the field value. This widget type is used by [TextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-textboxfield%}), [CombTextBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield%}), [ListBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-listboxfield%}) and [ComboBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-comboboxfield%}) classes. 

VariableContentWidget provides the following properties:

* **Content**: Provides the AnnotationContentSource, used for the initial visualization of the field value in the PDF viewer. As the content of this widget type is dynamically modified during the user interaction, the Content property is used only for **initial visualization** before the user has interacted with the field value.

* **AppearanceCharacteristics**: A [DynamicAppearanceCharacteristics class]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties %}#dynamicappearancecharacteristics-class) instance, providing information on how to dynamically recalculate the widget appearance.


### SignatureWidget Class

This class corresponds to WidgetContentType.SignatureContent enum value and represents a widget, which visualizes a digital signature. This widget type is used by the [SignatureField]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}) class and provides the following properties:

* **Content**: Provides the AnnotationContentSource, used to visualize the digital signature in the PDF viewer. This property is with higher priority compared to AppearanceCharacteristics property.

* **AppearanceCharacteristics**: A [DynamicAppearanceCharacteristics class]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#dynamicappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. This property is used only when the [AcroForm class]({%slug radpdfprocessing-model-interactive-forms-acroform %}) has ViewersShouldRecalculateWidgetAppearances property set to *true*, which forces the PDF viewer to ignore the provided AnnotationContentSource.


### PushButtonWidget Class

This class corresponds to WidgetContentType.PushButtonContent enum value and represents a widget, which visualizes a push button. This widget type is used by the [PushButtonField class]({%slug radpdfprocessing-model-interactive-forms-form-fields-pushbuttonfield%}) and provides the following properties:

* **Content**: Provides the AnnotationContentSource, used to visualize the button in the PDF viewer. This property is with higher priority compared to AppearanceCharacteristics property.

* **AppearanceCharacteristics**: А [PushButtonAppearanceCharacteristics class]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#pushbuttonappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. This property is used only when the [AcroForm class]({%slug radpdfprocessing-model-interactive-forms-acroform %}) has ViewersShouldRecalculateWidgetAppearances property set to *true*, which forces the PDF viewer to ignore the provided AnnotationContentSource. In order to apply these properties, you should call **RecalculateContent()** method, which will modify the Content property value so that it corresponds to the appearance characteristics.

### TwoStatesButtonWidget Class

This class corresponds to WidgetContentType.TwoStatesContent enum value and represents a widget, which visualizes a button that has ON and OFF states. This widget type is used by the [CheckBoxField]({%slug radpdfprocessing-model-interactive-forms-form-fields-checkboxfield%}) and provides the following properties:

* **OnStateContent**: Provides the AnnotationContentSource, which is used to visualize the selected state of the corresponding field in the PDF viewer. This property is with higher priority compared to AppearanceCharacteristics property.

* **OffStateContent**: Provides the AnnotationContentSource, which is used to visualize the deselected state of the corresponding field in the PDF viewer. This property is with higher priority compared to AppearanceCharacteristics property.

* **AppearanceCharacteristics**: A [ButtonAppearanceCharacteristics class]({%slug radpdfprocessing-model-interactive-forms-dynamic-appearance-properties%}#buttonappearancecharacteristics-class) instance providing information on how to dynamically recalculate the widget appearance. This property is used only when the [AcroForm class]({%slug radpdfprocessing-model-interactive-forms-acroform %}) has ViewersShouldRecalculateWidgetAppearances property set to *true*, which forces the PDF viewer to ignore the provided AnnotationContentSource. In order to apply these properties, you can call the **RecalculateContent()** method, which will modify the OnStateContent and OffStateContent property values so that they correspond to the appearance characteristics.

### RadioButtonWidget Class

This class inherits the [TwoStatesButtonWidget](#twostatesbuttonwidget-class) class and represents a widget, which visualizes a radio button option. It is used by the [RadioButtonField class]({%slug radpdfprocessing-model-interactive-forms-form-fields-radiobuttonfield%}) and adds the following property to TwoStatesButtonWidget implementation:

* **Option**: The concrete RadioOption which this widget represents.


## See Also

* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Annotations Overview]({%slug radpdfprocessing-model-annotations-overview%})
* [FormSource]({%slug radpdfprocessing-sample-test%})
