---
title: Version 2024.1.305 (2024 Q1)
page_title: What is new in 2024.1.305 (2024 Q1) for the Document Processing Libraries
description: Explore new features, bug fixes, and improvements in the 2024.1.305 (2024 Q1) release of Telerik Document Processing Libraries.
slug: release-notes-2024-1-305 
tags: release, notes, 2024, Q1, radpdfprocessing, telerik, document, changelog
published: True
position: 99
---


# 2024.1.305 (2024 Q1)


## PdfProcessing


![new](../images/new.png)

* Adds support for fonts that use simulated bold and italic forms.

![fixed](../images/fixed.png)

* Wrong glyph measurement results in overlapping text.
* A strange symbol appears as a name when embedding a file with an empty string as its name argument.
* A `NullReferenceException` is thrown when importing a document with embedded files.
* A `NullReferenceException` is thrown when importing a document with a signature and parsing the linejoin operator.
* A `NullReferenceException` is thrown when importing and then exporting a document containing `Type1Font` with a missing `FontInfo` table.
* Merging two documents having embedded files with same names repeats adding number 2.
* Unicode characters from Supplementary Multilingual Plane are skipped during the PDF export.

## RichTextBox


![fixed](../images/fixed.png)

* Custom fields inside the header/footer are auto-updated on import.
* Spell check does not refresh correctly when there are annotation markers around the current word.
* A `NullReferenceException` is thrown while typing with IME inside a checkbox content control with a disabled edition or protected document.
* A `NullReferenceException` is thrown when adding shapes and using the `AddShapeTextBoxCommand`.
* Reverse selection starting from the last position in a paragraph before a table will select the first row.

![changed](../images/changed.png)

* Adds the `CaretWidthScaleFactor` property that controls the size of the UI caret. `CaretWidthScaleFactor` is a new member of the `IDocumentEditorPresenterContainer` interface.

## WordsProcessing


![fixed](../images/fixed.png)

* A `StackOverflowException` is thrown when importing an RTF document with a style based on itself.
* `HtmlFormatProvider`: `margin-left`, `margin-right`, `margin-top`, `margin-bottom` CSS property is not respected when it is defined as unitless.

## ZipLibrary


![new](../images/new.png)

* Adds support for creation of AES-encrypted archives.

![fixed](../images/fixed.png)

* An `IOException`: Cannot access file after `ZipFile.CreateFromDirectory`.
* A `NullReferenceException` is thrown when updating a zip with a password.
