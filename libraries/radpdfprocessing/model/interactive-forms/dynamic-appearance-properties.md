---
title: Dynamic Appearance Properties 
page_title: Dynamic Appearance Properties   
slug: radpdfprocessing-model-interactive-forms-dynamic-appearance-properties 
tags: dynamic appearance properties 
published: True
position: 5
---

# Dynamic Appearance Properties

Some Widgets are visualizing variable content, which should be dynamically reconstructed after each field value change. In order to define the way this content is evaluated, all widgets provide two type of properties – VariableTextProperties defining the text specific properties and DynamicAppearanceCharacteristics defining the geometry specific properties. This article describes these two types.

* [VariableTextProperties Class](#variabletextproperties-class)

* [DynamicAppearanceCharacteristics Class](#dynamicappearancecharacteristics-class)

## VariableTextProperties Class

This class is used by **Widget annotations** to specify the properties needed for the dynamic construction widget text. An instance of this class may also be found in the [FormField class]({%slug radpdfprocessing-model-interactive-forms-form-fields%}), proving easy way to ensure that all widgets created from this field will use similar text properties. 

These properties are as follows:

* **HorizontalAlignment**: Gets or sets the text horizontal alignment.

* **CharacterSpacing**: Gets or sets the character spacing.

* **WordSpacing**: Gets or sets the word spacing.

* **HorizontalScaling**: Gets or sets the text horizontal scaling.

* **Font**: Gets or sets the font.

* **FontSize**: Gets or sets the font size. If the font size is zero, then the size of the text will be automatically calculated to fit the available space in the widget annotation rectangle.

* **TextRise**: Gets or sets the text rise.

* **RenderingMode**: Gets or sets the text rendering mode.

* **Fill**: Gets or sets the text fill color.

* **Stroke**: Gets or sets the text stroke color.

* **StrokeThickness**: Gets or sets the text stroke thickness.

* **StrokeLineCap**: Gets or sets the text stroke line cap.

* **StrokeLineJoin**: Gets or sets the text stroke line join.

* **StrokeDashArray**: Gets or sets the text stroke dash array.

* **StrokeDashOffset**: Gets or sets the text stroke dash offset.

* **MilterLimit**: Gets or sets the text milter limit.

>important In **.NET Standard/.NET (Target OS: None)** environments, fonts beyond the [14 standard ones]({%slug radpdfprocessing-concepts-fonts%}#standard-fonts) require a [FontsProvider implementation]({%slug pdfprocessing-implement-fontsprovider%}) to be resolved correctly.

## DynamicAppearanceCharacteristics Class

This class is used by [VariableContentWidget]({%slug radpdfprocessing-model-annotations-widgets %}#variablecontentwidget-class) and [SignatureWidget]({%slug radpdfprocessing-model-annotations-widgets  %}#signaturewidget-class) classes in order to specify the dynamic construction of widget geometry representation. It provides the following properties:

* **Rotation**: Gets or sets the rotation of the widget content.

* **BorderColor**: Gets or sets the color of the Widget rectangle border. If null then no border is drawn. Takes effect only if an [AnnotationBorder](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.Model.Annotations.AnnotationBorder.html) instance is set to the Border property of the widget.

* **Background**: Gets or sets the color of the Widget rectangle background. If null then no background is drawn.


### ButtonAppearanceCharacteristics Class

This class inherits DynamicAppearanceChanacteristics and is used by [TwoStateButtonWidget]({%slug radpdfprocessing-model-annotations-widgets  %}#twostatebuttonwidget-class) and [RadioButtonWidget]({%slug radpdfprocessing-model-annotations-widgets  %}#radiobuttonwidget-class) for dynamically constructing button appearances. It adds the following property to its parent class implementation:

* **NormalCaption**: The text drawn when the mouse is not interacting with the button.


### PushButtonAppearanceCharacteristics Class

This class inherits ButtonAppearanceCharacteristics and is used by [PushButtonWidget]({%slug radpdfprocessing-model-annotations-widgets %}#pushbuttonwidget-class) for dynamically constructing button appearances. It adds the following properties to its parent class implementation:

* **MouseOverCaption**: The text drawn when the mouse is over the button.

* **MouseDownCaption**: The text drawn when the mouse is pressed on the button.

* **NormalIconSource**: [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) that is used for drawing a button icon when the mouse is not interacting with widget.

* **MouseOverIcon**: [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) that is used for drawing a button icon when the mouse is over the widget.

* **MouseDownIcon**: [FormSource]({%slug radpdfprocessing-model-formsource-overview%}) that is used for drawing a button icon when the mouse is pressed on the widget.

* **IconAndCaptionPosition**: Property specifying how to position the button icon relatively to the button caption.

* **IconFitOptions**: Provides options specifying how to position and whether and how to scale the icon within the available space in the annotation rectangle.


## See Also

* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [FormSource]({%slug radpdfprocessing-model-formsource-overview%})