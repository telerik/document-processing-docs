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

|Version|**Q4 2024** (or newer)|
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

```csharp

   RadFixedDocument document = new RadFixedDocument();
   document.Pages.AddPage();

   TextBoxField field1 = new TextBoxField("Field1");
   VariableContentWidget widget1 = field1.Widgets.AddWidget();
   widget1.Rect = new Rect(new Size(150, 30));

   TextBoxField field2 = new TextBoxField("Field2");
   VariableContentWidget widget2 = field2.Widgets.AddWidget();
   widget2.Rect = new Rect(new Point(0, 50), new Size(150, 30));

   TextBoxField totalField = new TextBoxField("Total");
   totalField.IsReadOnly = true;
   totalField.Actions.Calculate = new Telerik.Windows.Documents.Fixed.Model.Actions.JavaScriptAction
       ("AFSimple_Calculate(\"SUM\", new Array (\"Field1\", \"Field2\"));");
   VariableContentWidget totalWidget = totalField.Widgets.AddWidget();
   totalWidget.Rect = new Rect(new Point(0, 100), new Size(150, 30));

   document.AcroForm.FormFields.Add(field1);
   document.AcroForm.FormFields.Add(field2);
   document.AcroForm.FormFields.Add(totalField);
   document.Pages[0].Annotations.Add(widget1);
   document.Pages[0].Annotations.Add(widget2);
   document.Pages[0].Annotations.Add(totalWidget);
	 
```
### Using the MergedJavaScriptNameResolving Event

The event is fired when trying to resolve conflicts between the JavaScript names while merging RadFixedDocument instances.

```csharp
document.MergedJavaScriptNameResolving += (sender, e) =>
{
    if (e.UsedNames.Contains(e.Name))
    {
        e.NewName = e.Name + "1";
    }
};
```

## See Also

* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [FormFieldCollection class]({%slug radpdfprocessing-model-interactive-forms-formfieldcollection%})
* [Widgets]({%slug radpdfprocessing-model-annotations-widgets%}) 
* [Multiplying TextBoxField Values with JavaScript Actions and RadPdfProcessing]({%slug multiply-form-field-with-javascript-action-radpdfprocessing%})
