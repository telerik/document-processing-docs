---
title: Removing Hyperlinks from Text with RadFlowDocument
description: Learn how to remove hyperlinks from text in an HTML document using RadFlowDocument in Telerik Document Processing.
type: how-to
page_title: How to Remove Hyperlinks from Text with RadFlowDocument
slug: remove-hyperlinks-radflowdocument
tags: telerik-document-processing, hyperlinks, text, RadFlowDocument
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Telerik Document Processing |

## Description

I need to remove hyperlinks from text in an HTML document using the RadFlowDocument component from Telerik Document Processing. Is there an example that demonstrates how to do this?

## Solution

To remove hyperlinks from text in an HTML document using RadFlowDocument, follow these steps:

1. Load the HTML document into RadFlowDocument using the `HtmlFormatProvider`.

```csharp
using (Stream input = File.OpenRead(@"..\..\sample.html"))
{
    Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider provider = new Telerik.Windows.Documents.Flow.FormatProviders.Html.HtmlFormatProvider();
    RadFlowDocument document = provider.Import(input);
    RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
```

2. Enumerate the `FieldCharacter` elements in the document and delete the content of the hyperlink fields.

```csharp
var hyperlinkElements = document.EnumerateChildrenOfType<FieldCharacter>().Where(x => x.FieldCharacterType == FieldCharacterType.Start).ToList();
foreach (FieldCharacter hyperlink in hyperlinkElements)
{
    editor.DeleteContent(hyperlink.FieldInfo.End, hyperlink.FieldInfo.End);
    editor.DeleteContent(hyperlink.FieldInfo.Start, hyperlink.FieldInfo.Separator);
}
```

3. Enumerate the `Run` elements in the document with the custom "Hyperlink" style and change their style to "Normal".

```csharp
var hyperlinkRuns = document.EnumerateChildrenOfType<Run>().Where(x => x.StyleId.Contains("Hyperlink")).ToList();
foreach (Run r in hyperlinkRuns)
{
    r.StyleId = "Normal";
}
```

4. Export the modified RadFlowDocument to RTF or any other desired format using the `RtfFormatProvider` or other format provider.

```csharp
var output = provider.Export(document);
```

By following these steps, you can remove hyperlinks from text in an HTML document using RadFlowDocument in Telerik Document Processing.
