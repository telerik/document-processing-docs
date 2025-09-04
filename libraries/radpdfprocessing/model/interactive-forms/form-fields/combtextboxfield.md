---
title: CombTextBoxField 
page_title: CombTextBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-combtextboxfield
tags: combtextboxfield
published: True
---

# CombTextBoxField class

This article describes the following topics:

* [CombTextBoxField Class Overview](#overview)

* [CombTextBoxField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.CombTextBox enum value and represents a text input data container which restricts its text to some specific length and the characters are equally distributed through the field appearance length. 

## Properties

CombTextBoxField provides the following properties:

* **Value**: Gets or sets the current text value of the field.

* **DefaultValue**: Gets or sets the default value used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values.

* **Widgets**: The collection of Widget annotations which represent the field on the PDF pages. The widgets are created by using the collection's **AddWidget()** method and can be removed by using the **Remove()** method. As the widget collection implements the **IEnumerable** interface, the available widget instances can be iterated.

* **MaxLengthOfInputCharacters**: Integer value specifying the number of characters that can be inputted.

#### **[C#] Example 1: Create a CombTextBoxField and add it to a page**
<snippet id='codeblock_157'/>


## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [Create Interactive Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
