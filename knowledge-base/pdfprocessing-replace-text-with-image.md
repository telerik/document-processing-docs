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

```csharp

    foreach (RadFixedPage page in pdfDocument.Pages)
    {
    	List<TextFragment> contentToRemove = new List<TextFragment>();
    
    	for (int i = 0; i < page.Content.Count; i++)
    	{
    		ContentElementBase contentElement = page.Content[i];
    		if (contentElement is TextFragment textFragment)
    		{
    			int count = contentToRemove.Sum(f => f.Text.Length);
       
                // Find a TextFragment exactly matching or be part of the $ImagePlaceholder text  
    			if (count == 0 && textToRemove.StartsWith(textFragment.Text))
    			{
    				contentToRemove.Add(textFragment);
    			}
    			else if (count > 0)
    			{
    				string oldValueRemainings = textToRemove.Substring(count);
    
    				if (oldValueRemainings.StartsWith(textFragment.Text))
    				{
    					contentToRemove.Add(textFragment);
    				}
    				else
    				{
    					contentToRemove.Clear();
    					return;
    				}
    			}
    
    			count = contentToRemove.Sum(f => f.Text.Length);
    
    			if (count == textToRemove.Length)
    			{
    				// Create and add an image 
    				ImageSource source = new ImageSource(File.OpenRead(imagePath));
    				Image image = page.Content.AddImage(source);
    
    				// Set the desired size to the image 
    				image.Width = 300;
    				image.Height = 50;
    				TextFragment firstFragment = contentToRemove[0];
    
    				// Position the image 
    				image.Position = firstFragment.Position;
    				image.Position.Translate(0, -firstFragment.FontSize);
    
    				// Indicate the TextFragment to be removed  
    				for (int j = 0; j < contentToRemove.Count; j++)
    				{
    					TextFragment fragment = contentToRemove[j];
    					page.Content.Remove(fragment);
    				}
    			}
    		}
    	}
    }
```
