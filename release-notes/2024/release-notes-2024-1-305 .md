---
title: Version 2024.1.305 (2024 Q1)
page_title: What is new in 2024.1.305 (2024 Q1) for the Document Processing Libraries
description: 2024.1.305 (2024 Q1)
slug: release-notes-2024-1-305 
tags: 2024.1.305,2024,Q1
published: True
position: 99
---


# 2024.1.305 (2024 Q1)


## PdfProcessing


![new](../images/new.png)

* Introduced support for fonts that use simulated bold and italic forms.

![fixed](../images/fixed.png)

* Wrong glyph measurement results in overlapping text.
* A strange symbol is added as a name when embedding a file with an empty string as its name argument.
* A NullReferenceException is thrown when importing a document with embedded files.
* A NullReferenceException is thrown when importing a document with a signature and parsing the linejoin operator.
* А NullReferenceException is thrown when importing and then exporting a document containing Type1Font with a missing FontInfo table.
* Merging two documents having embedded files with same names repeats adding number 2.
* Unicode characters from Supplementary Multilingual Plane are skipped during the PDF export.

## RichTextBox


![fixed](../images/fixed.png)

* Custom fields inside the header/footer are auto-updated on import.
* Spell check does not refresh correctly when there are annotation markers around the current word.
* NullReferenceException is thrown while typing with IME inside a checkbox content control with a disabled edition or protected document.
* Null reference exception when adding shapes and using the AddShapeTextBoxCommand.
* Reverse selection starting from the last position in a paragraph before a table will select the first row.

![changed](../images/changed.png)

* Added CaretWidthScaleFactor property for controlling the size of the UI Caret. CaretWidthScaleFactor is new member of the IDocumentEditorPresenterContainer interface.

## WordsProcessing


![fixed](../images/fixed.png)

* A StackOverflowException is thrown when importing an RTF document with a style based on itself.
* HtmlFormatProvider: margin-left, margin-right, margin-top, margin-bottom CSS property is not respected when it is defined as unitless.

## ZipLibrary


![new](../images/new.png)

* Added support for creation of AES-encrypted archives.

![fixed](../images/fixed.png)

* An IOException: Cannot access file after ZipFile.CreateFromDirectory.
* A NullReferenceException is thrown when updating a zip with a password.
