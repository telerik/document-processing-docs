---
title: Overview 
description: RadPdfProcessing provides support for JavaScript actions and trigger events.
page_title: JavaScript Actions - Overview  
slug: radpdfprocessing-model-javascript-actions 
tags: js, action, pdf,javascript
published: True
position: 0
---

# JavaScript Actions  

|Minimum Version|**Q4 2024**|
|----|----|

RadPdfProcessing provides support for:

*  **JavaScript actions** associated with documents, pages, form fields, etc.
*  **Event triggered actions** - represent actions that can be executed after a certain event in the respective viewer (e.g. RadPdfViewer, Adobe or a web browser) is triggerred.

JavaScript Actions are represented by the **JavaScriptAction** class storing in its public **Script** property the JS content as plain text. 

![PdfProcessing JS Actions Overview](images/js-action-overview.png)   

JS actions can be added by using the public **Actions** property of the following classes: 

|Class|Collection Type|
|----|----|
|Link*|[ActionCollection]({%slug radpdfprocessing-model-action-collections%}#actioncollection)| 
|BookmarkItem*|[ActionCollection]({%slug radpdfprocessing-model-action-collections%}#actioncollection)|
|Widget|[WidgetActionCollection]({%slug radpdfprocessing-model-action-collections%}#widgetactioncollection)| 
|FormField|[FormFieldActionCollection]({%slug radpdfprocessing-model-action-collections%}#formfieldactioncollection)|
|RadFixedDocument|[DocumentActionCollection]({%slug radpdfprocessing-model-action-collections%}#documentactioncollection)| 
|RadFixedPage|[PageActionCollection]({%slug radpdfprocessing-model-action-collections%}#pageactioncollection)|

\* The existing **Action** property is obsolete. 

### Adding a JavaScript Action to a TextBoxField

The following example demonstrates how to create a PDF document with three TextBoxFields where the third field calculates the sum of the values entered in the first two widgets:

![JS Action Sum FormField](images/js-action-sum-form-field.gif)   

<snippet id='pdf-js-action-sum'/>
### Using the MergedJavaScriptNameResolving Event

The event is fired when trying to resolve conflicts between the JavaScript names while merging RadFixedDocument instances.

<snippet id='pdf-merged-js-script-name-resolving'/>

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection class]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%}) 
* [Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing]({%slug multiply-form-field-with-javascript-action-radpdfprocessing%})
