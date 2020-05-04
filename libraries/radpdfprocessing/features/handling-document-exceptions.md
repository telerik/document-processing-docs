---
title: Handling Exceptions
page_title: Handling Exceptions
description: Handling Exceptions
slug: radpdfprocessing-handling-exceptions
tags: bookmarks, outlines
position: 4
---
# Handling Exceptions

Since R2 2020 RadPdfProcessing has and exception handling mechanism. It allows to intercept and handle exceptions when the document is imported or loaded. This functionality introduces two events.

* __PdfImportSettings.DocumentUnhandledException:__ The event is fired the document is imported and an exception occurs. If the __ReadingMode__ is set to **AllAtOnce** the entire document will be loaded and there is no need to use the other event.
* __RadFixedDocument.DocumentUnhandledException:__ The event is fired when the  __ReadingMode__ is set to __OnDemand__ and an exception occurs when a particular page is loaded. 

When both events are raised, the  __DocumentUnhandledExceptionEventArgs__ argument is passed. This argument contains two properties:
* __Exception:__ Gets the document exception.
* __Handled:__ Gets or sets if the exception should be handled. The default value is *false*. 

>note The exception handling mechanism handles exceptions at the very beginning of the import as well. In such a case, the event will be raised and an empty document instance is returned. The exception handling mechanism does not handle exceptions while parsing fonts glyph data or parsing images during document rendering in the UI viewers.


### Using ImportSettings.DocumentUnhandledException

To use this functionality you should handle the __PdfImportSettings.DocumentUnhandledException__ event. The __Handled__ property in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 

#### __C# Example 1: Using the OnException event while loading the entire document__ 

{{region radpdfprocessing-handling-exceptions_0}}

    public RadFixedDocument ImportDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.AllAtOnce;
        provider.ImportSettings.DocumentUnhandledException += ImportSettings_DocumentUnhandledException;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        return document;
    }

    private void ImportSettings_DocumentUnhandledException(object sender, DocumentUnhandledExceptionEventArgs e)
    {
        MessageBox.Show("The document is corupted and cannot be loaded: " + e.Exception.Message);
        e.Handled = true;
    }

{{endregion}}


### Using RadFixedDocument.DocumentUnhandledException

When using the OnDemand reading mode you should handle the __RadFixedDocument.DocumentUnhandledException__ event. The __Handled__ option in the event arguments indicates if the exception is handled by the code in the event handler or the exception should be thrown. 

#### __C# Example 2: Using the OnException event while loading on demand__

{{region radpdfprocessing-handling-exceptions_1}}

    public void LoadDocument()
    {
        PdfFormatProvider provider = new PdfFormatProvider();
        provider.ImportSettings.ReadingMode = ReadingMode.OnDemand;
        var document = provider.Import(File.ReadAllBytes("SampleDoc.pdf"));
        document.DocumentUnhandledException += Document_DocumentUnhandledException;

    }

    private void Document_DocumentUnhandledException(object sender, DocumentUnhandledExceptionEventArgs e)
    {
        MessageBox.Show("The document is corupted and some pages cannot be loaded: " + e.Exception.Message);
        e.Handled = true;
    }

{{endregion}}




