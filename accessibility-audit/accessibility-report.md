# Repository Accessibility Scoring Report

**Status: Complete source-only baseline** — all eligible articles were scored; no article was unscorable. Human review is required for the image and animated-media cases listed below. This is not a WCAG conformance assessment.

## Average Scores

- **Articles scored:** 658
- **Articles excluded:** 30
- **Overall documentation accessibility score:** 4.9 / 5.0

| Dimension | Weight | Average score |
|---|---:|---:|
| Heading Structure | 20% | 5.0 / 5.0 |
| Alternative Text | 20% | 5.0 / 5.0 |
| Link Text Clarity | 15% | 5.0 / 5.0 |
| Plain Language | 15% | 4.6 / 5.0 |
| Table Accessibility | 10% | 5.0 / 5.0 |
| Formatting Independence | 10% | 5.0 / 5.0 |
| Callout Structure | 5% | 5.0 / 5.0 |
| Code Block Accessibility | 5% | 5.0 / 5.0 |

## Scope and Exclusions

The audit inventoried 688 Markdown files (`.md` and `.markdown`), including generated audit output, and scored 658 eligible documentation articles. It excluded 30 files by repository scope; files in the audit output folder are not documentation articles and are excluded from scoring.

| Exclusion reason | Files |
|---|---:|
| .github configuration and agent content | 25 |
| audit output folder | 1 |
| frontmatter marks article unpublished | 1 |
| generated API reference content excluded by site configuration | 1 |
| site-builder excluded-files configuration | 2 |

Excluded categories included `.git`, `.github`, `node_modules`, `_site`, `bin`, `obj`, generated API reference content, configured site-builder exclusions, unpublished frontmatter, and audit output folders. No files outside the listed source scope were evaluated.

## Summary

The repository-wide mean is **4.9 / 5.0**. Strongest dimensions: Heading Structure and Callout Structure (5.0 each). The weakest dimension is Plain Language (4.6); the other seven dimension averages round to 5.0.

0 articles contain Critical findings and 0 articles contain High findings (0 distinct articles with either severity).

Recurring Medium and Low patterns detected by source checks:
- **Medium — Plain Language:** Long prose sentences (71 articles; 71 detected instances).
- **Medium — Table Accessibility:** Empty table cells (12 articles; 12 detected instances).
- **Medium — Code Block Accessibility:** Code block lacks prose introduction (3 articles; 3 detected instances).
- **Low — Plain Language:** Long prose sentences (127 articles; 127 detected instances).
- **Low — Link Text Clarity:** Bare URL in prose (5 articles; 9 detected instances).

This source-only audit cannot confirm that alt text fully matches image content, that a table is understandable in the rendered experience, that links behave as intended, or that prose is clear to every audience. It does not inspect rendered pages, image pixels, product behavior, code correctness, or claim WCAG conformance. Language, visual-formatting intent, table purpose, and some image purpose require human judgment.

## Critical and High Issues

No Critical or High issues were detected by the source checks.


## Human Review Required

The source does not establish whether these images are decorative or informative, whether short alt text is equivalent, or whether animated content has an adequate text alternative. These cases are recorded for follow-up and are not assigned a severity.

| Article | Line | Review case |
|---|---:|---|
| `ai-tools/ai-coding-assistant/mcp-server.md` | 98 | Animated image `images/setup-and-use-dpl-mcp-server-in-vs-code-full.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `getting-started/first-steps.md` | 49 | Animated image `images/VisualStudio_NewProject_Console3.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/apostrophe-character-replaced-copyright-symbol-acroform.md` | 34 | Animated image `images/apostrophe-character-replaced-copyright-symbol-acroform.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/auto-font-size-form-fields-pdfprocessing.md` | 29 | Animated image `images/textboxfield-calculculate-font-size.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/convert-pdf-grayscale-aspnet-core.md` | 23 | Animated image `images/colored-to-grayscale.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/convert-pdf-to-multipage-tiff-radpdfprocessing.md` | 22 | Animated image `images/pdf-to-multiple-page-tiff.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/download-script-key.md` | 34 | Animated image `images/view-products.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/multiply-form-field-with-javascript-action-radpdfprocessing.md` | 58 | Animated image `images/js-action-multiply-form-field.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/preventing-cell-formatting-extension-spreadprocessing.md` | 24 | Animated image `images/excel-extend-data-range-formatting.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/radpdfprocessing-customize-textboxfield-colors.md` | 22 | Animated image `images/highlight-textbox-field.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/remove-mergefields-retain-values-radwordsprocessing.md` | 80 | Animated image `images/mergeFields.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `knowledge-base/retrieve-cell-color-radspreadprocessing.md` | 30 | Animated image `images/worksheet-changing-theme-color.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radpdfprocessing/model/actions/js-actions/action-collections.md` | 92 | Animated image `images/js-action-page.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radpdfprocessing/model/actions/js-actions/javascript-actions.md` | 43 | Animated image `images/js-action-sum-form-field.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radpdfprocessing/model/actions/named-actions.md` | 80 | Animated image `images/print-named-action.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radpdfprocessing/model/annotations/text-markup.md` | 42 | Animated image `images/pdf-processing-create-highlight-annotation-with-appearance.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radpdfprocessing/model/annotations/text.md` | 49 | Animated image `images/pdf-processing-create-textannotation-with-appearance.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radwordsprocessing/formats-and-conversion/markdown/markdownformatprovider.md` | 50 | Image `src` has generic or very short alt text (`alt`); verify its purpose from surrounding source context and revise the text if needed. |
| `libraries/radwordsprocessing/formats-and-conversion/markdown/markdownformatprovider.md` | 51 | Image `src` has generic or very short alt text (`alt`); verify its purpose from surrounding source context and revise the text if needed. |
| `libraries/radwordsprocessing/model/content-controls/content-controls.md` | 83 | Animated image `images/insert-checkboxes.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |
| `libraries/radziplibrary/overview.md` | 20 | Animated image `images/ziplibrary-overview.gif`: verify that essential motion information also appears as text and that an accessible static alternative is available where needed. |

## Method and Validation

Each article was analyzed from its Markdown source after removing YAML frontmatter and excluding fenced code from prose checks. The eight dimensions use the requested weights; a detected concern maps to 4 (Low), 3 (Medium), 2 (High), or 1 (Critical), while no detected concern or an absent content type maps to 5. The article score is the weighted mean of dimension scores, rounded to one decimal place; the repository score is the arithmetic mean of the per-article rounded scores, also rounded to one decimal place.

Checks cover Markdown/HTML headings, image alt attributes, link labels and bare URLs, prose sentence length, Markdown/HTML table headers and empty cells, explicit color-only language, supported callout syntax, and fenced-code language tags and introductions. These checks are consistent and reproducible but cannot fully automate semantic judgments such as meaningful alt-text equivalence, readability, table use, or warning severity.

Validation: 658 scored records were written to `accessibility-audit/scores.jsonl`; scored count equals included count (658). All 658 records have all eight dimensions and a recomputable weighted score. No article was unscorable; therefore the scores file is complete. Input inventory: 688 Markdown files = 658 included + 30 excluded.
