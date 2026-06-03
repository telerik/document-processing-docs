---
title: Backward Compatibility 
description: Breaking changes and migration guidance for upgrading RadPdfProcessing between versions.
page_title: Backward Compatibility 
slug: radpdfprocessing-backward-compatibility
tags: migration, compatibility, radpdfprocessing, pdf, breaking, skiasharp, imagesharp, fontembedding
published: True
position: 1
---

# Backward Compatibility

The following sections list the breaking changes and how to address them when upgrading from a specific version of the controls to another.

## What Is Different in 2024 R2

### Changed

The `PdfExportSettings`.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property uses the `FontEmbeddingType` enum.

### What to Do Now

Instead of setting the `PdfExportSettings`.[ShouldEmbedFont]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}) property to a Boolean value, use the `None`, `Full`, or `Subset` enum options.

## What Is Different in 2023 R2

### Changed

The default implementation of the ImageUtils assembly now uses SkiaSharp instead of ImageSharp.

Before 2023 R2, the default implementation of ImageUtils required the ImageSharp library with the minimum required version of **v.2.0.0**.

## What Is Different in 2016 R3

### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to Do Now

Use the assemblies with a version number ending with .40 suffix. The library does not contain code specific to .NET Framework 4.5, so an additional version is not needed.

### Changed

`Telerik.Windows.Documents.Fixed.Model.RadFixedDocument::Merge()` does not remove the content from the source document after appending it to the targeted one.

## What Is Different in 2015 Q1

### Changed

`Telerik.Windows.Documents.Fixed.Model.Editing.RadFixedDocumentEditor::TableProperties` is removed.

### What to Do Now

You can now set `TableLayoutType` directly in the `Table` class by using the `LayoutType` property.

## What Is Different in 2014 Q3

### Changed

`Telerik.Windows.Documents.Fixed.Model.Editing.TextProperties::TextBlockHeight` and `Telerik.Windows.Documents.Fixed.Model.Editing.TextProperties::TextBlockWidth` are removed.

### What to Do Now

You can specify the block size when [measuring or drawing the block]({%slug radpdfprocessing-editing-block%}).

### Changed

`Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::BeginText()` and `Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::EndText()` are removed.

### What to Do Now

Use the [Block]({%slug radpdfprocessing-editing-block%}) class to create blocks of text and other flowing content.

### Changed

`Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::DrawImage(Stream, ImageFormat)` is removed.

### What to Do Now

Use `Telerik.Windows.Documents.Fixed.Model.Editing.FixedContentEditor::DrawImage(Stream)`.

### Changed

`Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource::.ctor(System.IO.Stream,Telerik.Windows.Documents.Fixed.Model.Data.ImageFormat)` is removed.

### What to Do Now

Use `Telerik.Windows.Documents.Fixed.Model.Resources.ImageSource::.ctor(System.IO.Stream)`.

### Changed

The `StartColor` and `EndColor` properties from the `Gradient` class are removed.

### What to Do Now

Use the `GradientStops` property to add appropriate gradient stops for the start and end colors.

### Changed

`Telerik.Windows.Documents.Fixed.Model.Editing.HorizontalTextAlignment` and `Telerik.Windows.Documents.Fixed.Model.Editing.VerticalTextAlignment` are renamed.

### What to Do Now

Use `Telerik.Windows.Documents.Fixed.Model.Editing.Flow.HorizontalAlignment` and `Telerik.Windows.Documents.Fixed.Model.Editing.Flow.VerticalAlignment` instead.

### Changed

`Telerik.Windows.Documents.Fixed.Model.Text.TextDecorations` is renamed.

### What to Do Now

Use `Telerik.Windows.Documents.Fixed.Model.Editing.Flow.UnderlinePattern`.

