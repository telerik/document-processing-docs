---
title: Replace existing text with Inline element
description: Replace existing text with Inline element
type: how-to
page_title: Replace existing text with Inline element
slug: replace-text-with-inline-element
position: 0
tags: text, inline, element, line, break, replace
res_type: kb
---

<table>
<thead>
	<tr>
		<th>Product Version</th>
		<th>Product</th>
		<th>Author</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>2020.1.310</td>
		<td>RadWordsProcessing</td>
		<td>[Martin Velikov](https://www.telerik.com/blogs/author/martin-velikov)</td>
	</tr>
</tbody>
</table>

## Description
Introducing a way to replace text with other document elements.

## Solution

To achieve this we will iterate the document elements of type [Run](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/run) and will compare their text with the desired string. If there is a match we will store the Run index and we will insert the desired element (in our example: [Break](https://docs.telerik.com/devtools/document-processing/libraries/radwordsprocessing/model/break)) on this specific index in the **Inlines** collection. Finally we will remove the Run.

```` C#
RadFlowDocumentEditor editor = new RadFlowDocumentEditor(document);
editor.InsertText("First line");
editor.InsertText("NewLine");
editor.InsertText("Second line");

foreach (Run run in document.EnumerateChildrenOfType<Run>().ToList())
{
    if (run.Text == "NewLine")
    {
        Paragraph paragraph = run.Paragraph;
        int childIndex = paragraph.Inlines.IndexOf(run);

        Break br = new Break(document);
        br.BreakType = BreakType.LineBreak;
        paragraph.Inlines.Insert(childIndex, br);
        paragraph.Inlines.Remove(run);
    }
}
````
