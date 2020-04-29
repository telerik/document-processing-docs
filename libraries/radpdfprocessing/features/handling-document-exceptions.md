---
title: Handling Exceptions
page_title: Handling Exceptions
description: Handling Exceptions
slug: radpdfprocessing-handling-exceptions
tags: bookmarks, outlines
position: 3
---
# Handling Exceptions

Since R2 2020 RadPdfProcessing has and exception handling mechanism. It allows to intercept and handle exceptions when the document is imported. This functionality introduces two events which are used depending on reading mode.

* __PdfImportSettings.OnException:__ The event is fired the the __ReadingMode__ is set to __ReadAtOnce__ and an exception occurs when the entire document is imported. 
* __RadFixedDocument.OnException:__ The event is fired when the  __ReadingMode__ is set to __OnDemand__ and an exception occurs when a particular page is loaded. 

Both events are raised using __OnDocumentExceptionEventArgs__ arguments. The __OnDocumentExceptionEventArgs__ class contains the two properties:
* __DocumentException:__ Gets the document exception.
* __ShouldHandle:__ Gets or sets if the exception should be handled.

## Using the ReadAtOnce reading mode


To use this functionality you should handle the __PdfImportSettings.OnException__ event. The __ShouldHandle__ option in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 

#### __C# Example 1: Using the OnException event while loading the entire document__ 

{{region radpdfprocessing-handling-exceptions_0}}
    public RadFixedDocument ImportDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.AllAtOnce;
        provider.OnImportException += Provider_OnImportException;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        return document;
    }

    private void Provider_OnImportException(object sender, OnDocumentExceptionEventArgs e)
    {
        MessageBox.Show("The document is corupted and cannot be loaded");
        e.ShouldHandle = true;
    }

{{endregion}}

## Using the OnDemand reading mode

When using the OnDemand reading mode you should handle the __RadFixedDocument.OnException__ event. The __ShouldHandle__ option in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 
#### __C# Example 2 Using the OnException event while loading on demand__

{{region radpdfprocessing-handling-exceptions_1}}
    public void LoadDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.OnDemand;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        document.OnException += Document_OnException;    
    }

    private void Document_OnException(object sender, OnDocumentExceptionEventArgs e)
    {
        MessageBox.Show("The document is corupted and cannot be loaded");
        e.ShouldHandle = true;
    }

{{endregion}}




