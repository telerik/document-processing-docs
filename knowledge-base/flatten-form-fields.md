---
title: Flatten Form Fields
description: Flatten Form Fields
type: how-to
page_title: Flatten Form Fields
slug: flatten-form-fields
position: 0
tags: pdf, page, flatten, form, field
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2020.1.316</td>
		<td>RadPdfProcessing</td>
		<td>[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)</td>
	</tr>
</tbody>
</table>

## Description

How to flatten [Form Fields]({%slug radpdfprocessing-model-interactive-forms-form-fields %}).

## Solution

This could be achieved by iterating the [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})`s [Annotations]({%slug radpdfprocessing-model-annotations-and-destinations%}) and if the type of the annotation is [Widget]({%slug radpdfprocessing-model-interactive-forms-widgets %}) to flatten its appearance.

```` C#
public static void FlattenFormFields(RadFixedDocument document)
{
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
````
