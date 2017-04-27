---
title: SignatureField 
page_title: SignatureField 
description: SignatureField 
slug: radpdfprocessing-model-interactive-forms-form-fields-signaturefield
tags: signaturefield
published: True
---


# SignatureField class

This article describes the following topics:

* [SignatureField Class Overview](#overview)

* [SignatureField Class Properties](#properties)


## Overview

This class corresponds to FormFieldType.Signature enum value and represents a placeholder where some digital signature information is preserved. 


## Properties

SignitureField provides the following properties:

* **Signature**: Gets or sets the Signature value. 
	* Setting this property will sign the document during export. At this point, signing with multiple signatures is not supported.
	* To validate a signature, you can use the Validate() and TryValidate() methods. Note, that the validation requires that the stream, from which the document is imported, to be opened. The validation is performed for the current field, and against the state of the document in the moment of importing.

* **Widgets**: The collection of Widget annotations which represent the field on the PDF pages. The widgets are created by using the collection AddWidget method and may be removed by using the collection Remove method. As the widget collection implements IEnumerable interface the available widget instances may be iterated.





## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Widgets]({%slug radpdfprocessing-model-interactive-forms-widgets%})