---
title: Popup 
page_title: Popup Annotation  
description: Popup annotations display a pop-up window containing comments or notes associated with the document content. 
slug: radpdfprocessing-model-annotations-popup
tags: annotation, overview, pdfprocessing, popup 
published: True
position: 7
---

# Popup Annotation  

A **Popup annotation** displays a pop-up window containing text associated with a parent annotation, such as a [Text]({%slug radpdfprocessing-model-annotations-text%}), [Line]({%slug radpdfprocessing-model-annotations-line%}), [TextMarkup]({%slug radpdfprocessing-model-annotations-text-markup%}) or [Stamp]({%slug radpdfprocessing-model-annotations-stamp%}) annotation. When closed, a popup annotation is invisible. When open, it should appear as a pop-up window at a specified location on the page.

The **PopupAnnotation** class is a derivative of the **Annotation** class and it exposes the following properties:

|Property|Description|
|---|---|
|**ParentAnnotation**|Gets or sets the parent [MarkupAnnotation]({%slug radpdfprocessing-model-annotations-overview%}) that this popup is associated with.|
|**IsOpen**|Gets or sets a value indicating whether the popup is initially open.|

## Creating a PopupAnnotation

Popup annotations are typically created in association with another markup annotation, such as Text, Line, TextMarkup or Stamp. The following example shows how to create a PopupAnnotation  associated with a TextAnnotation:

```csharp
            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage();

            TextAnnotation annotation = page.Annotations.AddText(new Rect(100, 100, 200, 200));
            annotation.Contents = "Test text";

            PopupAnnotation popupAnnot = page.Annotations.AddPopup(annotation);
            popupAnnot.IsOpen = true;
```
The popup annotation will display the contents of the text annotation in a pop-up window.

## Creating a PopupAnnotation with FixedContentEditor

You can create a popup annotation by using the FixedContentEditor's **DrawPopupAnnotation** method. The constructor expects two parameters - the size of the popup and the markup annotation to be associated with the popup:

```csharp
            RadFixedDocument fixedDocument = new RadFixedDocument();
            RadFixedPage page = fixedDocument.Pages.AddPage();
            FixedContentEditor editor = new FixedContentEditor(page);
            
            // Create a parent annotation first
            TextAnnotation textAnnotation = page.Annotations.AddText(new Rect(100, 100, 50, 50));
            textAnnotation.Contents = "Parent annotation text";
            
            // Create an associated popup annotation
            editor.Position.Translate(100, 100);
            editor.DrawPopupAnnotation(new Size(200, 100), textAnnotation);
```

When creating a TextAnnotation with the [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})'s **DrawTextAnnotation** method, you can also associate a popup annotation by setting the `addPopup` parameter to **true**:

```csharp
            RadFixedDocument fixedDocument = new RadFixedDocument();
            FixedContentEditor editor = new FixedContentEditor(fixedDocument.Pages.AddPage());
            
            editor.Position.Translate(100, 100);
            Size annotationSize = new Size(50, 50);
            Size popupSize = new Size(250, 100);
            string text = "This is a TextAnnotation";
            bool addPopup = true;
            
            editor.DrawTextAnnotation(annotationSize, popupSize, text, addPopup);
            
            // Access the created popup annotation if needed
            PopupAnnotation popupAnnotation = fixedDocument.Pages[0].Annotations[1] as PopupAnnotation;
```

This code creates a [TextAnnotation]({%slug radpdfprocessing-model-annotations-text%}) with an associated **PopupAnnotation**. The popup will display the text provided in the method call.

## See Also

* [Annotations Overview]({%slug radpdfprocessing-model-annotations-overview%})
* [Text Annotation]({%slug radpdfprocessing-model-annotations-text%})
* [Line Annotation]({%slug radpdfprocessing-model-annotations-line%})
* [TextMarkup Annotation]({%slug radpdfprocessing-model-annotations-text-markup%})
* [Stamp Annotation]({%slug radpdfprocessing-model-annotations-stamp%})
* [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%})
