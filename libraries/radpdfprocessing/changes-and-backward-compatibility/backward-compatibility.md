---
title: Backward Compatibility 
page_title: Backward Compatibility 
slug: radpdfprocessing-backward-compatibility
tags: backward,compatibility
published: True
position: 1
---

# Backward Compatibility

This article lists the breaking changes and how they can be fixed when upgrading from a specific version of the controls to another.

## What's Different in 2024 R2 

### Changed

The PdfExportSettings.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property uses the **FontEmbeddingType** enum

## What to do now

Instead of setting the PdfExportSettings.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property to a boolean value, use the None, Full, Subset enum options.

## What's Different in 2023 R2  


### Changed

The default implementation of ImageUtils assembly is now using SkiaSharp instead of ImageSharp.

Before 2023 R2 the default implementation of ImageUtils required the ImageSharp library with the minimum required version of **v.2.0.0**.

## What's Different in 2016 R3  


### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to do now

Use the assemblies with a version number ending with .40 suffix. The library doesn't contain code specific for .NET Framework 4.5, thus an additional version is not needed.


### Changed

Telerik.Windows.Documents.Fixed.Model.RadFixedDocument::Merge() doesn't remove the content from the source document after appending it to the targeted one.


## What's Different in 2015 Q1      


### Changed

Telerik.Windows.Documents.Fixed.Model.Editing.RadFixedDocumentEditor::TableProperties is removed.

### What to do now

__TableLayoutType__ can now be set directly in the __Table__ class using the __LayoutType__ property.


## What's Different in 2014 Q3


### Changed


Telerik.Windows.Documents.Fixed.Model.Editing.TextProperties::TextBlockHeight and
Telerik.Windows.Documents.Fixed.Model.Editing.TextProperties::TextBlockWidth are removed.
            

### What to do now


You can specify the block size when [Measuring or Drawing the block]({%slug radpdfprocessing-editing-block%}).


### Changed

Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::BeginText() and Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::EndText() are removed.
            

### What to do now

Use [Block]({%slug radpdfprocessing-editing-block%}) class to create blocks of text and other flowing content.
            

### Changed

Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::DrawImage(Stream, ImageFormat) is removed.
            

### What to do now

Use Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::DrawImage(Stream).
            

### Changed

Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource::.ctor(System.IO.Stream,Telerik.Windows.Documents.Fixed.Model.Data.ImageFormat) is removed.
            

### What to do now

Use Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource::.ctor(System.IO.Stream).
            

### Changed

StartColor and EndColor properties from the Gradient class are removed.
            

### What to do now

Use GradientStops property to add appropriate gradient stops for the start and the end colors.
            

### Changed

Telerik.Windows.Documents.Fixed.Model.Editing.HorizontalTextAlignment and Telerik.Windows.Documents.Fixed.Model.Editing.VerticalTextAlignment are renamed.
            

### What to do now

Use Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment and Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment instead.
            

### Changed

Telerik.Windows.Documents.Fixed.Model.Text.TextDecorations is renamed.
            

### What to do now

Use Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern.
            
