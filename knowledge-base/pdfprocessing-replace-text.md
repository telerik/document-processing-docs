---
title:  How to replace text in PDF
description: Learn how to search a PDF document and replace text matches by iterating TextFragment objects with the RadPdfProcessing library.
type: how-to
page_title: How to find and replace text
slug: pdfprocessing-replace-text
position: 0
tags: radpdfprocessing, pdf, text, replace, find, document, processing, content
ticketid: 1525237
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.2.615|RadPdfProcessing|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|

## Description

With RadPdfProcessing, you can import a PDF document and traverse the text inside to replace specific matches. Iterate the [TextFragment]({%slug radpdfprocessing-model-textfragment%}) objects and modify their `Text` property when needed.

## Solution

The following code iterates the `TextFragment` instances on each `RadFixedPage` and replaces the *"<%textfield,1234%>"* string with *"replaced text"*:

```csharp
foreach (RadFixedPage page in document.Pages)
{
    foreach (ContentElementBase contentElement in page.Content)
    {
        if (contentElement is TextFragment)
        {
            TextFragment textFragment = (TextFragment)contentElement;

            string replacedText = "replaced text";

            Replace(textFragment, "<%textfield,1234%>", replacedText);
        }
    }
}
```

The following snippet shows the implementation of the `Replace` method:

```csharp
private static void Replace(TextFragment textFragment, string oldValue, string newValue)
{
    if (textFragment.Text.Contains(oldValue))
    {
        textFragment.Text = newValue;
    }
}
```

## Notes

The team has logged requests to improve the API and provide a more straightforward way to search and replace text. You can vote for their implementation and subscribe to receive updates about status changes through the related public items:

* [PdfProcessing: Introduce Find API](https://feedback.telerik.com/document-processing/1356164-pdfprocessing-introduce-find-api)
* [PdfProcessing: Introduce Replace API](https://feedback.telerik.com/document-processing/1454044-pdfprocessing-introduce-replace-api)