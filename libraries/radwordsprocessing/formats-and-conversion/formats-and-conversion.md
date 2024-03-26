---
title: Formats and Conversion Overview
page_title: Formats and Conversion
description: You can use RadWordsProcessing to convert among variety of formats.
slug: radwordsprocessing-formats-and-conversion
tags: doc,dot,docx,html,rtf,pdf,txt,formats,import,export,conversion,features
published: True
position: 0
---

# Formats and Conversion


RadWordsProcessing does not need any external dependencies in order to convert documents from/to the supported formats. The document model is independent from UI and can be used on the server side as well as on the client.
      

You can use RadWordsProcessing to convert among variety of formats. Below you can see a feature / format matrix that describes supported features by file format. The currently supported format are [Docx]({%slug radwordsprocessing-formats-and-conversion-docx-docxformatprovider%}), [Doc]({%slug radwordsprocessing-formats-and-conversion-doc-docformatprovider%}) & Dot (import only), [Rtf]({%slug radwordsprocessing-formats-and-conversion-rtf-rtfformatprovider%}), [Html]({%slug radwordsprocessing-formats-and-conversion-html-htmlformatprovider%}), [Pdf]({%slug radwordsprocessing-formats-and-conversion-pdf-pdfformatprovider%}) (export only), and [plain text]({%slug radwordsprocessing-formats-and-conversion-txt-txtformatprovider%}), as plain text is excluded from the comparison.

<style>
    table td {
        color:#5ce500;
        text-align: center;
    }
    table td:nth-child(1) {
        color:black;
    }
    td.not-applicable {
        color:black;
        text-align: center;
    }
    td.partially-supported {
        color:orange;
        text-align: center;
    }
</style>

<div>
<table><tr><th>Feature</th>
<th>Docx Import</th>
<th>Docx Export</th>
<th>Doc Import</th>
<th>Rtf Import</th>
<th>Rtf Export</th>
<th>Html Import</th>
<th>Html Export</th>
<th>PDF Export</th></tr>
<tr><td><b>Text Formatting</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td></tr><tr><td>
<b>Paragraph Options</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
Text Alignment</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="partially-supported">
✔<sup>2</sup></td></tr><tr><td>
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
<td></td></tr><tr><td>
Borders</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td>
<td></td></tr><tr><td>
<b>Page/Section options</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td><td></td><td></td><td>
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
Columns</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td><td></td><td></td><td>
✔</td></tr><tr><td>
Section Vertical Alignment</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td></td></tr><tr><td>
Page Numbering Settings</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="not-applicable">
n/a</td><td>
✔</td></tr><tr><td>
<b>Tables</b></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td><td>
</td><td>
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
Floating Tables</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
<b>Images</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td><td>
</td><td>
✔</td><td>
✔</td><td class="partially-supported">
✔<sup>3</sup></td><td class="partially-supported">
✔<sup>3</sup></td><td>
✔</td></tr><tr><td>
<b>Styles</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td><td>
</td><td>
</td><td>
✔</td><td>
✔</td><td>
✔</td></tr><tr><td>
Conditional Table Styles</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
<b>Lists</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔</td></tr><tr><td>
<b>Fields</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
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
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td></tr><tr><td>
Merge fields</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td></tr><tr><td>
Document Variables</td><td>
✔</td><td>
✔</td><td>
</td><td>
✔</td><td>
✔</td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td></tr><tr><td>
Other fields</td><td class="partially-supported">
✔<sup>5</sup></td><td class="partially-supported">
✔<sup>5</sup></td><td>
</td><td class="partially-supported">
✔<sup>5</sup></td><td class="partially-supported">
✔<sup>5</sup></td><td class="not-applicable">
n/a</td><td class="partially-supported">
✔<sup>4</sup></td><td class="partially-supported">
✔<sup>4</sup></td></tr><tr><td>
<b>Review</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
Comments</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td></td><td></td><td></td></tr><tr><td>
Protection</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td class="not-applicable">n/a</td></tr><tr><td>
Track Changes</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
<b>Other Elements</b></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr><tr><td>
Bookmarks</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td>
✔</td><td></td><td></td><td></td></tr></table>
</div>

>1. Double Strikethrough is currently not supported.

>2. Justify alignment is currently not supported when exporting to PDF format, thus the content is exported with Left alignment.

>3. Floating images are treated as inline images when importing/exporting HTML.

>4. The result of the fields is exported as text.

>5. All fields are supported through custom code fields. More information is available [here]({%slug radwordsprocessing-concepts-customcodefield%}).
