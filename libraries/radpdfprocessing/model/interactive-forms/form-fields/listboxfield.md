---
title: ListBoxField 
description: Learn about the ListBoxField class in RadPdfProcessing for creating list box form fields with selectable choices in interactive PDF forms.
page_title: ListBoxField 
slug: radpdfprocessing-model-interactive-forms-form-fields-listboxfield
tags: listboxfield, pdf, formfields, radpdfprocessing, acroform, interactive, listbox, model
published: True
---

# ListBoxField

The `ListBoxField` class corresponds to the `FormFieldType.ListBox` enum value and represents a list with choices that can be selected. It represents a form field that displays a scrollable list of options. Users can select one or more choices from the list.

## Properties

The `ListBoxField` class provides the following properties:

| Property | Description |
|---|---|
| `Value` | Gets or sets an array of selected choices. Each choice is a `ChoiceOption` with `Value` and `UserInterfaceValue` properties. `UserInterfaceValue` is optional. When `null`, `Value` is used to display the choice in the UI. |
| `DefaultValue` | Gets or sets the default selected choices used when the [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %}) is reset to its default values. |
| `Widgets` | A collection of Widget annotations representing the field on the PDF pages. Widgets are created using `AddWidget()` and can be removed using `Remove()`. Implements `IEnumerable`. |
| `Options` | A `ChoiceOptionCollection` containing all available choices for this field. Modify through the indexer, `Add()`, `RemoveAt()`, and `Clear()`. Each `ChoiceOption` instance can be added only once. |
| `ShouldCommitOnSelectionChange` | Indicates whether to commit the selected value on selection change. |
| `TopIndex` | Gets or sets the index of the choice that is displayed at the top of the list box viewport rectangle. |

**Create a ListBoxField and Add It to a Page**

<snippet id='pdf-listboxfield'/>

## See Also

* [Form Field]({%slug radpdfprocessing-model-interactive-forms-form-fields %})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets %})
* [Create Interactive Forms SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/CreateInteractiveForms) 
* [Modifying Forms SDK Example](https://github.com/telerik/document-processing-sdk/tree/master/PdfProcessing/ModifyForms) 
