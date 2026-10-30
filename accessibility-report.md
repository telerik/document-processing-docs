# Repository Accessibility Assessment

**Status: Baseline complete** — all eligible Markdown articles were scored; source-only analysis did not inspect rendered pages, image pixels, product behavior, code correctness, or WCAG conformance.

## Average Scores

- Eligible articles scored: **658**
- Articles excluded: **29**
- Repository-wide accessibility score: **4.8 / 5.0** (mean of per-article weighted scores)

| Dimension | Average score | Weight |
|---|---:|---:|
| Heading Structure | 4.9 / 5.0 | 20% |
| Alternative Text | 5.0 / 5.0 | 20% |
| Link Text Clarity | 5.0 / 5.0 | 15% |
| Plain Language | 3.9 / 5.0 | 15% |
| Table Accessibility | 4.9 / 5.0 | 10% |
| Formatting Independence | 5.0 / 5.0 | 10% |
| Callout Structure | 5.0 / 5.0 | 5% |
| Code Block Accessibility | 5.0 / 5.0 | 5% |

### Scope and Exclusions

- Markdown files discovered: **687** (before repository, configuration, and publication exclusions).
- Files eligible for scoring: **658**.
- Excluded files: **29**.
  - Excluded by site/repository configuration: **2**.
  - Generated API reference content: **1**.
  - Repository configuration and automation content: **25**.
  - Unpublished frontmatter: **1**.

The scope excludes `.git/`, `.github/`, `node_modules/`, `_site/`, `bin/`, `obj/`, generated API reference content under `_assetsApi/`, repository/site-config exclusions, and articles with `publish: false` or `published: false` frontmatter. The report and score file are audit outputs and are not source articles.

## Summary

The source-only baseline score is **4.8 / 5.0**. The highest average dimensions are Alternative Text (5.0), Callout Structure (5.0), Code Block Accessibility (5.0); the lowest are Plain Language (3.9), Heading Structure (4.9), Table Accessibility (4.9).

- Articles with one or more Critical findings: **0** (0 findings).
- Articles with one or more High findings: **11** (16 findings).
- Images with missing, empty, or generic alt text requiring purpose review: **0**.
- Animated media requiring equivalent-text review: **19** across **19** articles.

Recurring Medium and Low patterns found by source indicators:

| Severity | Recurring source pattern | Articles |
|---|---|---:|
| Medium | Articles with frequent long sentences | 303 |
| Medium | Articles with vague headings | 50 |
| Medium | Articles with code blocks lacking a prose introduction | 27 |
| Medium | Articles with empty table cells | 15 |
| Medium | Articles with bold-only warnings or requirements | 10 |
| Medium | Articles with dense prose lines | 8 |
| Medium | Articles with an isolated vague or bare link | 8 |

### Method and Limitations

The analyzer reads Markdown source and frontmatter, excludes fenced code from prose checks, and recognizes Markdown/HTML images, links, tables, repository callout prefixes, and fenced code blocks. It applies integer article scores on the requested 1–5 scale and the requested weights; absent content types receive 5. Sentence length and source structure are measurable indicators, not a substitute for editorial review. The output does not assess rendered behavior, image pixels, alt-text equivalence, every jargon/acronym, code correctness, layout-table intent, or WCAG conformance. Image-purpose and animated-media questions are queued for human review rather than severity-assigned when source is insufficient.

Validation: 658 eligible articles scored out of 658 eligible articles; 658 JSONL records; each weighted score and repository mean was computed from the listed dimension scores. No eligible article was skipped.

## Critical and High Issues

Findings are grouped by repository-relative article path. Critical findings precede High findings; article scores are not included.

### `knowledge-base/add-html-to-pdf-document.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-html-to-pdf-document.md` | 14 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `knowledge-base/troubleshooting-windowsbase-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-windowsbase-error.md` | 14 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `knowledge-base/zip-unzip-multiple-files-password.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/zip-unzip-multiple-files-password.md` | 14 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radpdfprocessing/changes-and-backward-compatibility/changes.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radpdfprocessing/changes-and-backward-compatibility/changes.md` | 18 | Link Text Clarity | 4 link(s) have vague text or are bare URLs. | Use descriptive link text that identifies the destination when read out of context. |

### `libraries/radpdfprocessing/model/path.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radpdfprocessing/model/path.md` | 28 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |
| High | `libraries/radpdfprocessing/model/path.md` | 29 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radpdfprocessing/model/textfragment.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radpdfprocessing/model/textfragment.md` | 28 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |
| High | `libraries/radpdfprocessing/model/textfragment.md` | 33 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |
| High | `libraries/radpdfprocessing/model/textfragment.md` | 34 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radspreadprocessing/features/format-codes.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radspreadprocessing/features/format-codes.md` | 67 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |
| High | `libraries/radspreadprocessing/features/format-codes.md` | 196 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radspreadprocessing/features/formulas/errors.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radspreadprocessing/features/formulas/errors.md` | 21 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radspreadprocessing/features/formulas/operators.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radspreadprocessing/features/formulas/operators.md` | 107 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radwordsprocessing/formats-and-conversion/html/supported-elements.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radwordsprocessing/formats-and-conversion/html/supported-elements.md` | 110 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |
| High | `libraries/radwordsprocessing/formats-and-conversion/html/supported-elements.md` | 287 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

### `libraries/radwordsprocessing/formats-and-conversion/pdf/features.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `libraries/radwordsprocessing/formats-and-conversion/pdf/features.md` | 16 | Table Accessibility | A data table does not expose a header row in the Markdown/HTML source. | Mark column or row headings with Markdown header syntax or HTML `<th>` elements. |

## Human Review Required

**0 image instances** have missing, empty, or generic alt text that needs a human decision about whether each image is informative or decorative. **19 animated media instances across 19 articles** need review for equivalent written information. These cases are not assigned severity when Markdown source alone cannot establish the visual purpose or whether motion is essential. Per-article lines and source references are included in `scores.jsonl`.
