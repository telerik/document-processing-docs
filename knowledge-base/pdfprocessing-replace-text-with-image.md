---
title: Replace Text Content With Image | Telerik Document Processing
description: This article shows how to locate a specific text in a PDF document and replace it with an image.
type: how-to
page_title: Replace Text Content With Image
slug: pdfprocessing-replace-text-with-image
position: 0
tags: image, text, PdfProcessing, Telerik Document Processing, Telerik, pdf, replace, modify
res_type: kb
---

|Product Version|Product|Author|
|----|----|----|
|2021.1.118|RadPdfProcessing|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|

## Description
A common scenario is to replace a temporary page content (a placeholder text) with an image. This allows already created PDF documents to be modified by adding an image on a position defined by the existing content of the document.

## Solution
The following example demonstrates the approach of iterating the page content and finding TextFragment elements matching the *$ImagePlaceholder* text. For each match, an Image instance is created and the TextFragment is replaced with it. The *Position* property is used to correctly position the image on the page.

#### __C#__

{{region kb-pdfprocessing-replace-text-with-image}}

    foreach (RadFixedPage page in pdfDocument.Pages)
    {
        List<TextFragment> contentToRemove = new List<TextFragment>();
    
        foreach (ContentElementBase contentElement in page.Content.ToList())
        {
            // Find a TextFragment exactly matching the $ImagePlaceholder text 
            TextFragment textFragment = contentElement as TextFragment;
            if (textFragment != null && textFragment.Text == "$ImagePlaceholder")
            {
                // Create and add an image
                Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource source = new Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource(File.OpenRead("sample.png"));
                Telerik.Windows.Documents.Fixed.Model.Objects.Image image = page.Content.AddImage(source);
                
                // Set the desired size to the image
                image.Width = 10;
                image.Height = 10;
    
                // Position the image
                image.Position = textFragment.Position;
                image.Position.Translate(0, -textFragment.FontSize);
    
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
