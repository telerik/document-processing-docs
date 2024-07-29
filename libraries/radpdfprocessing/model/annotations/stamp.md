---
title: Stamp 
page_title: Stamp Annotation  
description: Stamp annotations display text or graphics intended to look as if they were stamped on the page with a rubber stamp.
slug: radpdfprocessing-model-annotations-stamp 
tags: annotation, overview, pdfprocessing, stamp 
published: True
position: 6
---

# Stamp Annotation  

A **Stamp annotation** displays text or graphics intended to look as if they were stamped on the page with a rubber stamp. When opened, it displays a pop-up window containing the text of the associated note.

The **StampAnnotation** class is a derivative of the **MarkupAnnotation** (descendent of **ContentAnnotation**) and it exposes the following properties:

|Property|Description|
|---|---|
|**Name**|Gets or sets the name of the stamp. The name can be chosen from the predefined names in the __StampAnnotationPredefinedNames__ class or it can be a custom string. In the case of a custom string an appearance should be provided via the __ContentAnnotation.Content__ property.|
|**Opacity**|Gets or sets the opacity of the annotation.|
|**Contents**|Gets or sets the text that shall be displayed for the annotation.|
|**Color**|Gets or sets the color of the annotation.|
|**Content**|Gets the source defining the visual content of the annotation. This content is with bigger priority compared to the annotation appearance characteristics and text properties and it is visualized by default when opening the exported document in some PDF viewer.|

### Creating a StampAnnotation

```csharp
            RadFixedDocument document = new RadFixedDocument();
            RadFixedPage page = document.Pages.AddPage();

            RadFixedPage page = fixedDocument.Pages.AddPage();

            StampAnnotation annotation1 = page.Annotations.AddStamp(new Rect(50, 50, 300, 50));
            annotation1.Name = StampAnnotationPredefinedNames.SBApproved;

            StampAnnotation annotation3 = page.Annotations.AddStamp(new Rect(50, 100, 300, 50));
            annotation3.Name = StampAnnotationPredefinedNames.SBCompleted;

            StampAnnotation annotation4 = page.Annotations.AddStamp(new Rect(50, 150, 300, 50));
            annotation4.Name = StampAnnotationPredefinedNames.SBConfidential;

            StampAnnotation annotation5 = page.Annotations.AddStamp(new Rect(50, 200, 300, 50));
            annotation5.Name = StampAnnotationPredefinedNames.SBDraft;

            StampAnnotation annotation6 = page.Annotations.AddStamp(new Rect(50, 250, 300, 50));
            annotation6.Name = StampAnnotationPredefinedNames.SBFinal;

            StampAnnotation annotation7 = page.Annotations.AddStamp(new Rect(50, 300, 300, 50));
            annotation7.Name = StampAnnotationPredefinedNames.SBForComment;

            StampAnnotation annotation8 = page.Annotations.AddStamp(new Rect(50, 350, 300, 50));
            annotation8.Name = StampAnnotationPredefinedNames.SBForPublicRelease;

            StampAnnotation annotation9 = page.Annotations.AddStamp(new Rect(50, 400, 300, 50));
            annotation9.Name = StampAnnotationPredefinedNames.SBInformationOnly;

            StampAnnotation annotation10 = page.Annotations.AddStamp(new Rect(50, 450, 300, 50));
            annotation10.Name = StampAnnotationPredefinedNames.SBNotApproved;

            StampAnnotation annotation11 = page.Annotations.AddStamp(new Rect(50, 500, 300, 50));
            annotation11.Name = StampAnnotationPredefinedNames.SBNotForPublicRelease;

            StampAnnotation annotation13 = page.Annotations.AddStamp(new Rect(50, 550, 300, 50));
            annotation13.Name = StampAnnotationPredefinedNames.SBPreliminaryResults;

            StampAnnotation annotation15 = page.Annotations.AddStamp(new Rect(50, 600, 300, 50));
            annotation15.Name = StampAnnotationPredefinedNames.SBRejected;

            StampAnnotation annotation16 = page.Annotations.AddStamp(new Rect(50, 650, 300, 50));
            annotation16.Name = StampAnnotationPredefinedNames.SBVoid;
```

![Create StampAnnotation](images/pdf-processing-create-stampannotation.png)  

### Creating a StampAnnotation with FixedContentEditor

The [FixedContentEditor]({%slug radpdfprocessing-editing-fixedcontenteditor%}) offers the public **DrawStampAnnotation** method which creates a new __StampAnnotation__ and draws it with a specified annotation size and name.

```csharp
            RadFixedDocument fixedDocument = new RadFixedDocument();
            FixedContentEditor editor = new FixedContentEditor(fixedDocument.Pages.AddPage());

            editor.Position.Translate(100, 100);
            editor.DrawStampAnnotation(new Size(250, 250), StampAnnotationPredefinedNames.SBFinal);
            editor.Position.Translate(400, 100);
            editor.DrawStampAnnotation(new Size(250, 250), StampAnnotationPredefinedNames.SBConfidential);
```

![Create StampAnnotation with FixedContentEditor](images/pdf-processing-create-stampannotation-with-fixedcontenteditor.png)   

### Creating a StampAnnotation with Appearance

The **AnnotationContentSource** class, accessed by the **Content** property of the annotation object, represents the [FormSource]({%slug radpdfprocessing-model-formsource%}) instances used for displaying the widget content. The following example shows how to create a custom Stamp annotation and change its visual appearance:

>important When creating a custom stamp name (not from the predefined names), it is important to start the name with "#". Otherwise, if the stamp is moved in adobe, its appearance will be rewritten.

>important When creating appearance for an annotation, it is important to create it with the same size as the rect of the annotation otherwise unexpected behavior may occur when the annotation is moved in Adobe.

```csharp 
        private RadFixedDocument CreateTextAnnotation()
        {
            RadFixedDocument fixedDocument = new RadFixedDocument();
            RadFixedPage page = fixedDocument.Pages.AddPage();

            StampAnnotation annotation = page.Annotations.AddStamp(new Rect(100, 100, 300, 100));
            annotation.Name = "#Sold";

            FormSource simpleForm = new FormSource();
            CreateContentFormWithText(simpleForm, "Sold");

            AnnotationContentSource content = new AnnotationContentSource();
            annotation.Content.NormalContentSource = simpleForm;
            return fixedDocument;
        }

        private static void CreateContentFormWithText(FormSource normalForm, string text)
        {
            normalForm.Size = new Size(300, 100);

            FixedContentEditor formEditor = new FixedContentEditor(normalForm);

            using (formEditor.SaveProperties())
            {
                formEditor.GraphicProperties.IsFilled = true;
                formEditor.GraphicProperties.IsStroked = true;
                formEditor.GraphicProperties.StrokeThickness = 2;
                formEditor.GraphicProperties.StrokeColor = new RgbColor(92, 229, 0);
                formEditor.GraphicProperties.FillColor = new RgbColor(213, 222, 226);
                formEditor.GraphicProperties.StrokeDashArray = new double[] { 17, 4 };
                formEditor.DrawRectangle(new Rect(formEditor.Position.Matrix.OffsetX, formEditor.Position.Matrix.OffsetY, 300,100));
            }

            formEditor.TextProperties.FontSize = 20;
            formEditor.Position.Translate(10, 10);
            formEditor.DrawText(text);
        }
```

![Create StampAnnotation with Appearance](images/pdf-processing-create-stampannotation-with-appearance.png)  

## See Also

* [AcroForm]({%slug radpdfprocessing-model-interactive-forms-acroform %})
* [FormField]({%slug radpdfprocessing-model-interactive-forms-form-fields%})
* [Annotations Overview]({%slug radpdfprocessing-model-annotations-overview%})
* [FormSource]({%slug radpdfprocessing-model-formsource%})