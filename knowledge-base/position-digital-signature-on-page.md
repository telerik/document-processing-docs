---
title: Add Digital Signatures on an existing page | Telerik Document Processing
description: Position Digital Signature widget and replace an existing page content
type: how-to
page_title: Position Digital Signature widget and replace an existing page content
slug: position-digital-signature-on-page
position: 0
tags: digital, signature, PdfProcessing, Telerik Document Processing, Telerik, pdf, Reporting, sign, replace, modify
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.1.118|RadPdfProcessing|[Georgi Georgiev](https://www.telerik.com/blogs/author/georgi-georgiev-2)|

## Description
A common scenario is to replace a temporary page content (a templated text) with a Digital Signature widget. This allows already created PDF documents, e.g. using the *Telerik Report Designer*, to be modified by adding a Digital Signature on a position defined by the existing content of the document.

## Solution
The following example demonstrates the approach of iterating the page content and finding TextFragment elements matching the *$CollectSignature* text. For each found match, a Signature Field is created and the TextFragment is replaced with a Signature widget. The *Rect* property is used to position and outline the Signature widget on the page.

#### __C#__

{{region kb-position-digital-signature-on-page}}

	foreach (RadFixedPage page in document.Pages)
	{
		List<TextFragment> contentToRemove = new List<TextFragment>();

		foreach (ContentElementBase contentElement in page.Content)
		{
			// Find a TextFragment excactly mathcing the $CollectSignature text
			if (contentElement is TextFragment textFragment && textFragment.Text == "$CollectSignature")
			{
				// Create and add Signature Field and Signature Widget
				SignatureField signatureField = document.AcroForm.FormFields.AddSignature("SignatureFieldUniqueName");
				SignatureWidget widget = signatureField.Widgets.AddWidget();

				Point location = new Point(textFragment.Position.Matrix.OffsetX, textFragment.Position.Matrix.OffsetY - textFragment.FontSize);
				widget.Rect = new Rect(location, new Size(DesiredWidth, DesiredHeight));

				page.Annotations.Add(widget);

				// Indicate the TextFragment to be removed
				contentToRemove.Add(textFragment);
			}
		}

		foreach (TextFragment contentElement in contentToRemove)
		{
			page.Content.Remove(contentElement);
		}
	}

{{endregion}}
