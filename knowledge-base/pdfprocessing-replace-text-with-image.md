---
title: Replace Text Content with Image
description: Learn how to locate specific text in a PDF document and replace it with an image by using RadPdfProcessing.
type: how-to
page_title: Replace Text Content with Image
slug: pdfprocessing-replace-text-with-image
position: 0
tags: radpdfprocessing, pdf, text, image, replace, document, processing, fixed
res_type: kb
---

## Environment

|Product Version|Product|Author|
|----|----|----|
|2021.1.118|RadPdfProcessing|[Tanya Dimitrova](https://www.telerik.com/blogs/author/tanya-dimitrova)|

## Description

A common scenario is to replace temporary page content (a placeholder text) with an image. This approach allows you to modify existing PDF documents by adding an image at a position defined by the existing content of the document.

## Solution

The following example iterates the page content and finds `TextFragment` elements that match the `$ImagePlaceholder` text. For each match, an `Image` instance is created and the `TextFragment` is replaced with it. The `Position` property positions the image correctly on the page.

**Example 1: Replace Text with Image**

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

## See Also

* [RadPdfProcessing Overview]({%slug radpdfprocessing-overview%})
* [RadFixedPage]({%slug radpdfprocessing-model-radfixedpage%})
