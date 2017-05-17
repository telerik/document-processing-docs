---
title: Overview 
page_title: Overview  
description: Overview  
slug: radpdfprocessing-model-interactive-forms-overview 
tags: overview 
published: True
position: 0
---

# Interactive Forms concept

Interactive forms feature (also known as AcroForm) allows you to create PDF files containing textboxes, buttons, listboxes and other interactive controls making available for the PDF file user to interactively fill some data in the PDF document and/or digitally sign the filled document. The responsibilities for preserving this data and interactively modifying it are separated into two base concepts – [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}) and [Widget Annotations]({%slug radpdfprocessing-model-interactive-forms-widgets%}).

## Form Fields

The data in an interactive form is separated into form fields restricting the different data input to different input formats – buttons, text fields or choice fields. Additionally, the interactive form can contain [signature fields]({%slug radpdfprocessing-model-interactive-forms-form-fields-signaturefield%}), which are responsible for preserving a [Digital Signature]({%slug radpdfprocessing-features-digital-signature%}) information when signing the document. Each form field is a container for its specific type of data.


## Widget Annotations

Widget annotations are used in order to visualize the Form Fields data on the PDF pages. Each field can have several widget annotations visualizing its information on the same or on several PDF pages. Each widget can specify its dynamic appearance differently by using different properties for its color, geometry and text representation. 

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})
* [Annotations and Destinations]({%slug radpdfprocessing-model-annotations-and-destinations%})