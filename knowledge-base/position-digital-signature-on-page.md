---
title: Add Digital Signatures on an existing page | Telerik Document Processing
description: Learn how to position a Digital Signature widget and replace existing page content in a PDF document using RadPdfProcessing.
type: how-to
page_title: Position Digital Signature widget and replace an existing page content
slug: position-digital-signature-on-page
position: 0
tags: radpdfprocessing, pdf, signature, digital, page, document, processing, sign
res_type: kb
---

## Environment

| Version | Product | Author |
| ---- | ---- | ---- |
| 2021.1.118 | RadPdfProcessing | [Georgi Georgiev](https://www.telerik.com/blogs/author/georgi-georgiev-2) |

## Description

A common scenario is to replace temporary page content (a templated text) with a Digital Signature widget. This allows previously created PDF documents, for example using **Telerik Report Designer**, to be updated by adding a Digital Signature on a position defined by the existing content of the document.

## Solution

The following example shows the approach of iterating the page content and finding `TextFragment` elements matching the `$CollectSignature` text. For each found match, a Signature Field is created and the `TextFragment` is replaced with a Signature widget. The `Rect` property is used to position and outline the Signature widget on the page.

```csharp

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

```

## See Also

* [Signing a Document with a Digital Signature]({%slug signing-a-document-with-digital-signature%})
* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
