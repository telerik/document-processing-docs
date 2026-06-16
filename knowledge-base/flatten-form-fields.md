---
title: Flatten Form Fields
description: Learn how to flatten interactive form fields in PDF documents by iterating annotations and converting widget appearances using RadPdfProcessing.
type: how-to
page_title: Flatten Form Fields
slug: flatten-form-fields
position: 0
tags: radpdfprocessing, pdf, form, fields, flatten, acroform, document, processing
res_type: kb
---

## Environment

| Product Version | Product | Author |
| ---- | ---- | ---- |
| 2020.1.316 | RadPdfProcessing | [Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov) |

## Description

This article demonstrates how to flatten [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields%}).

## Solution

> Starting with R2 2021, you can achieve this with a single method of the `AcroForm`. Check the [Flatten Form Fields]({%slug radpdfprocessing-flatten-form-fields%}) topic for more details.

To flatten form fields, iterate the [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%}) [Annotations]({%slug radpdfprocessing-model-annotations-overview%}) and check whether the annotation type is [Widget]({%slug radpdfprocessing-model-annotations-widgets%}). If it is, flatten its appearance.

```csharp

	public static void FlattenFormFields(RadFixedDocument document)
	{
		if (document.AcroForm.FormFields.Count == 0)
		{
			return;
		}
		
		foreach (RadFixedPage page in document.Pages)
		{
			List<Widget> widgetsToRemove = new List<Widget>();
			FixedContentEditor pageEditor = new FixedContentEditor(page);

			foreach (Annotation annotation in page.Annotations)
			{
				if (annotation.Type == AnnotationType.Widget)
				{
					Widget widget = (Widget)annotation;
					FlattenWidgetAppearance(pageEditor, widget);
					widgetsToRemove.Add(widget);
				}
			}

			foreach (Widget widget in widgetsToRemove)
			{
				page.Annotations.Remove(widget);
			}
		}

		foreach (FormField field in document.AcroForm.FormFields.ToArray())
		{
			document.AcroForm.FormFields.Remove(field);
		}
	}

	private static void FlattenWidgetAppearance(FixedContentEditor pageEditor, Widget widget)
	{
		FormSource widgetAppearance = GetWidgetNormalAppearance(widget);
		pageEditor.Position.Translate(widget.Rect.Left, widget.Rect.Top);
		pageEditor.DrawForm(widgetAppearance, widget.Rect.Width, widget.Rect.Height);
	}

	private static FormSource GetWidgetNormalAppearance(Widget widget)
	{
		FormSource widgetAppearance;
		switch (widget.WidgetContentType)
		{
			case WidgetContentType.PushButtonContent:
				widgetAppearance = ((PushButtonWidget)widget).Content.NormalContentSource;
				break;
			case WidgetContentType.SignatureContent:
				widgetAppearance = ((SignatureWidget)widget).Content.NormalContentSource;
				break;
			case WidgetContentType.VariableContent:
				widgetAppearance = ((VariableContentWidget)widget).Content.NormalContentSource;
				break;
			case WidgetContentType.TwoStatesContent:
				TwoStatesButtonWidget twoStatesWidget = (TwoStatesButtonWidget)widget;
				widgetAppearance = GetTwoStatesWidgetNormalAppearance(twoStatesWidget);
				break;
			default:
				throw new NotSupportedException(string.Format("Not supported widget content type {0}", widget.WidgetContentType));
		}

		return widgetAppearance;
	}

	private static FormSource GetTwoStatesWidgetNormalAppearance(TwoStatesButtonWidget twoStatesWidget)
	{
		FormField field = twoStatesWidget.Field;
		bool isOnState;

		switch (field.FieldType)
		{
			case FormFieldType.CheckBox:
				CheckBoxField checkBox = (CheckBoxField)field;
				isOnState = checkBox.IsChecked;
				break;
			case FormFieldType.RadioButton:
				RadioButtonField radio = (RadioButtonField)field;
				RadioButtonWidget radioWidget = (RadioButtonWidget)twoStatesWidget;

				if (radio.ShouldUpdateRadiosInUnison)
				{
					isOnState = radio.Value != null && radio.Value.Value.Equals(radioWidget.Option.Value);
				}
				else
				{
					isOnState = radio.Value == radioWidget.Option;
				}
				break;
			default:
				throw new NotSupportedException(string.Format("Not supported field type {0} for TwoStateButtonWidget", field.FieldType));
		}

		FormSource widgetAppearance = (isOnState ? twoStatesWidget.OnStateContent : twoStatesWidget.OffStateContent).NormalContentSource;

		return widgetAppearance;
	}

```

## See Also

* [Flatten Form Fields]({%slug radpdfprocessing-flatten-form-fields%})
* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
