---
title: FieldCharacter
description: Learn about the FieldCharacter inline element in RadWordsProcessing that delimits field starts, ends, and separates field codes from results.
page_title: FieldCharacter
slug: radwordsprocessing-model-fieldcharacter
tags: field, character, word, docx, document, flow, model, fields, inline, delimiter
published: True
position: 11
---

# FieldCharacter

`FieldCharacter` is an inline element. It is a special character that delimits the start and end of a field or separates its field codes from its current field result.

## Inserting a FieldCharacter

The `InsertField(string code, string result)` method of [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%}) creates a `FieldCharacter` element.

These are the possible `FieldCharacterTypes`:

* `Start`: Specifies that the character is a start character, which defines the start of a complex field.
* `End`: Specifies that the character is an end character, which defines the end of a complex field.
* `Separator`: Specifies that the character is a separator character, which defines the end of the field codes and the start of the field result for a complex field.

`FieldCharacter` has a `FieldInfo` property, which points to its associated [FieldInfo]({%slug radwordsprocessing-concepts-fields%}) object.

## See Also

* [FieldCharacter API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Flow.Model.Fields.FieldCharacter.html)
* [Fields]({%slug radwordsprocessing-concepts-fields%})
* [RadFlowDocumentEditor]({%slug radwordsprocessing-editing-radflowdocumenteditor%})
