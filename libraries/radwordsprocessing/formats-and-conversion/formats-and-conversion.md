---
title: Formats and Conversion Overview
page_title: Formats and Conversion
description: You can use RadWordsProcessing to convert among variety of formats.
slug: radwordsprocessing-formats-and-conversion
tags: formats, word, flow, docx, html, rtf, pdf, import, export, conversion
published: True
position: 0
components: [wordsprocessing]
---

# Formats and Conversion

RadWordsProcessing does not need any external dependencies to convert documents from/to the supported formats. The document model is independent from UI and can be used on the server side and on the client.

You can use RadWordsProcessing to convert among variety of formats.

>note Starting with **Q4 2024** RadWordsProcessing offers a timeout mechanism for import and export of documents. The new `Import` and `Export` methods for all FormatProviders have a mandatory timeout parameter. The old `Import` and `Export` methods are obsolete now.

Below you can see a feature / format matrix that describes supported features by file format. The currently supported formats are:

* [Docx]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%})
* [Doc]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%}) & Dot (import only)
* [Rtf]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%})
* [Html]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%})
* [Pdf]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) (export only)
* [Plain text]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%}) — plain text is excluded from the comparison.

<style>
    table td {
        text-align: center;
    }
      td.not-applicable {
        text-align: center;
    }
    td.partially-supported {
        text-align: center;
    }
</style>


A check mark (✔) indicates support; numbered notes describe limitations. “Not specified” means this matrix does not state the support status. It does not mean the feature is unsupported. Section headings span all columns and do not represent support statuses.

<table><thead><tr><th>Feature</th>
<th>Docx Import</th>
<th>Docx Export</th>
<th>Doc Import</th>
<th>Rtf Import</th>
<th>Rtf Export</th>
<th>Html Import</th>
<th>Html Export</th>
<th>PDF Export</th></tr></thead>
<tbody>
<tr><th colspan="9">Text Formatting</th></tr><tr><td>
Font Properties</td><td>
✔</td><td>
✔</td><td class="partially-supported">
✔<sup>1</sup></td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Text Style</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Baseline Alignment</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><th colspan="9">Paragraph Options</th></tr><tr><td>
Text Alignment</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Text Spacing</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Text Indent</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Shading</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td>
<td>Not specified</td></tr><tr><td>
Borders</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td>
<td>Not specified</td></tr><tr><th colspan="9">Page/Section options</th></tr><tr><td>
Page Size and Position</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><td>
Page Orientation</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><td>
Page Breaks</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>Not specified</td><td>
✔</td></tr><tr><td>
Section Breaks</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><td>
Columns</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr><tr><td>
Watermark</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><td>
Headers/Footers</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>Not specified</td><td>
✔</td></tr><tr><td>
Section Vertical Alignment</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>Not specified</td></tr><tr><td>
Page Numbering Settings</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><th colspan="9">Tables</th></tr><tr><td>
Table Support</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr>
<tr><td>
Nested Tables</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Merged Cells</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Floating Tables</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr><tr><th colspan="9">Images</th></tr><tr><td>
Inline Images</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Floating Images</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>
✔</td><td>
✔</td><td class="partially-supported">
✔<sup>2</sup></td><td class="partially-supported">
✔<sup>2</sup></td><td>
✔</td></tr><tr><th colspan="9">Styles</th></tr><tr><td>
Styles Support</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Built-in Styles</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Themes</td><td>
✔</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>Not specified</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Conditional Table Styles</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr><tr><th colspan="9">Lists</th></tr><tr><td>
Lists Support</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
List Styles</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><th colspan="9">Fields</th></tr><tr><td>
Hyperlinks</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Expression Fields</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Date and Time Fields</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>3</sup></td><td class="partially-supported">
✔<sup>3</sup></td></tr><tr><td>
Merge fields</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>3</sup></td><td class="partially-supported">
✔<sup>3</sup></td></tr><tr><td>
Document Variables</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>3</sup></td><td class="partially-supported">
✔<sup>3</sup></td></tr><tr><td>
Other fields</td><td class="partially-supported">
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td><td>Not specified</td><td class="partially-supported">
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>3</sup></td><td class="partially-supported">
✔<sup>3</sup></td></tr><tr><th colspan="9">Review</th></tr><tr><td>
Comments</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr><tr><td>
Protection</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td class="not-applicable">n/a</td></tr><tr><td>
Track Changes</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr><tr><th colspan="9">Other Elements</th></tr><tr><td>
Bookmarks</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>Not specified</td><td>Not specified</td><td>Not specified</td></tr></tbody></table>

>1. Double Strikethrough is currently not supported.
>2. Floating images are treated as inline images when importing/exporting HTML.
>3. The result of the fields is exported as text.
>4. All fields are supported through custom code fields. See [custom code fields]({%slug radwordsprocessing-concepts-customcodefield%}) for more information.
