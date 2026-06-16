---
title: Overview 
description: Learn how to use JavaScript actions and event-triggered actions in RadPdfProcessing to add interactive behavior to PDF documents and form fields.
page_title: JavaScript Actions - Overview  
slug: radpdfprocessing-model-javascript-actions 
tags: javascript, pdf, actions, js, radpdfprocessing, triggers, events, model, scripting
published: True
position: 0
---

# JavaScript Actions

|Minimum Version|Q4 2024|
|----|----|

RadPdfProcessing supports:

* **JavaScript actions** associated with documents, pages, form fields, and other elements.
* **Event-triggered actions** that execute after a certain event in the respective viewer (for example, RadPdfViewer, Adobe Acrobat, or a web browser) is triggered.

The `JavaScriptAction` class represents JavaScript actions and stores the JS content as plain text in its public `Script` property.

![PdfProcessing JS Actions Overview diagram](images/js-action-overview.png)

You can add JS actions by using the public `Actions` property of the following classes:

|Class|Collection Type|
|----|----|
|`Link`*|[ActionCollection]({%slug radpdfprocessing-model-action-collections%}#actioncollection)|
|`BookmarkItem`*|[ActionCollection]({%slug radpdfprocessing-model-action-collections%}#actioncollection)|
|`Widget`|[WidgetActionCollection]({%slug radpdfprocessing-model-action-collections%}#widgetactioncollection)|
|`FormField`|[FormFieldActionCollection]({%slug radpdfprocessing-model-action-collections%}#formfieldactioncollection)|
|`RadFixedDocument`|[DocumentActionCollection]({%slug radpdfprocessing-model-action-collections%}#documentactioncollection)|
|`RadFixedPage`|[PageActionCollection]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection)|

\* The existing `Action` property is obsolete.

### Adding a JavaScript Action to a TextBoxField

The following example demonstrates how to create a PDF document with three `TextBoxField` instances where the third field calculates the sum of the values entered in the first two widgets:

![JS Action Sum FormField result showing automatic calculation](images/js-action-sum-form-field.gif)

<snippet id='pdf-js-action-sum'/>

### Using the MergedJavaScriptNameResolving Event

The `MergedJavaScriptNameResolving` event fires when resolving conflicts between JavaScript names while merging `RadFixedDocument` instances.

<snippet id='pdf-merged-js-script-name-resolving'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%})
* [Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing]({%slug multiply-form-field-with-javascript-action-radpdfprocessing%})
