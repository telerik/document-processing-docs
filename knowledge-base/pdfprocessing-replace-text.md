---
title:  How to replace text in PDF
description: Shows how you can search a PDF document and replace the matches inside using PdfProcessing.
type: how-to
page_title: How to find and replace text
slug: pdfprocessing-replace-text
position: 0
tags: pdf, replace, find, text, content
ticketid: 1525237
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.2.615|RadPdfProcessing|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|


## Description

With PdfProcessing, you can import a PDF document and traverse the text inside to replace specific matches. This is done by iterating the [TextFragment]({%slug radpdfprocessing-model-textfragment%}) objects and modifying their **Text** property when needed.

## Solution

The following code iterates the TextFragments on each RadFixedPage and replaces the *"<%textfield,1234%>"* string with *"replaced text"*.

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

And here is the implementation of the Replace method:

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

We have also logged requests to improve the API and provide you with an easy way for searching and replacing text. You can vote for their implementation and subscribe to the requests if you would like to receive updates about status changes on them using the related public items:

- [PdfProcessing: Introduce Find API](https://feedback.telerik.com/document-processing/1356164-pdfprocessing-introduce-find-api)
- [PdfProcessing: Introduce Replace API](https://feedback.telerik.com/document-processing/1454044-pdfprocessing-introduce-replace-api)