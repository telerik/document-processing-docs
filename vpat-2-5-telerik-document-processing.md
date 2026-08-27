---
title: Accessibility
description: Accessibility conformance information for Telerik Document Processing Libraries across PDF, DOCX, XLSX, RTF, HTML, and ZIP output.
page_title: Accessibility Conformance Report
slug: accessibility-conformance-report
tags: accessibility, vpat, wcag, section-508, en-301-549, document-processing
published: True
position: 1
---
# Accessibility Conformance Report

## WCAG Edition (Based on VPAT® Version 2.5 Rev)

---

**Name of Product/Version:** Telerik Document Processing Libraries (DPL) — PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing, ZipLibrary

**Report Date:** August 27, 2026

**Product Description:** Non-visual .NET class libraries (.NET Standard 2.0, .NET 8, .NET 10) for programmatic creation, import, export and conversion of PDF, DOCX/DOC/RTF/HTML/TXT/Markdown, XLSX/XLS/CSV and ZIP documents. The libraries have **no user interface**; they are consumed by developers as APIs and embedded in host applications.

**Notes:** DPL exposes no end-user interface, so this report evaluates the libraries as **authoring components**: the documents they produce and the accessibility information they preserve during conversion. Criteria presupposing an interactive user interface are marked *Not Applicable*.

## General Compliance Statements

**Output format scope:** Conformance varies sharply by output format. A single conformance rating for the product would be misleading:

| Output path | Accessibility status |
| --- | --- |
| PdfProcessing, hand-authored structure tree (`RadFixedDocument` API) | Strongest. Full Tagged PDF authoring surface. |
| WordsProcessing → PDF at an accessible compliance level | Partial. Headings, lists and figures are tagged; **tables and links are not**. |
| SpreadProcessing → PDF | **Untagged.** No compliance-level or tagging support at all. |
| WordsProcessing → HTML | **Largely inaccessible.** No semantic headings, no table headers, no `lang`, empty `<title>`. |
| DOCX/XLSX/RTF round-trip | Alt text, screen tips and notes are preserved; document language is not. |

**Evaluation Methods Used:** Source-code inspection of the public API and export pipelines; review of the automated PDF/UA and PDF/A conformance test suite (`Documents\Fixed\Tests.PdfAValidation\`), which validates exported documents with **veraPDF**; and review of the public accessibility demo.

**Automated validation scope:** The PDF/UA and PDF/A test suite validates machine-verifiable requirements with veraPDF. The repository's compliance-validation pipeline invokes the test assembly but does not explicitly provision or verify Java or veraPDF before the tests run. The test harness skips validation when veraPDF is unavailable (`PdfAValidationTestBase.cs:129-133`). veraPDF cannot verify whether alternate text is meaningful, heading levels are correctly nested, or reading order is logical. For example, `ExportToPdf_ImageWithoutAltText_PassesVeraPdfValidation` (`FlowToPdfAccessibleExportTests.cs:319`) passes PDF/UA-1 validation even though the image has no alternate text.

## Special Considerations

1. DPL is a set of non-visual .NET class libraries. The consuming application and document viewer provide the end-user interface and assistive-technology experience.
2. PdfProcessing supports direct authoring of tagged PDF structure. WordsProcessing and SpreadProcessing conversion results depend on the selected output format and export path.
3. Accessibility features depend on how the consuming application authors content. Alternate text, language, heading structure, table semantics, link descriptions, and reading order must be supplied or verified by the developer where the API or conversion path does not provide them.
4. The conformance ratings are based on the default and publicly available API behavior described in this report. Export settings, source-document content, and post-processing may affect the result.

---

## Applicable Standards/Guidelines

This report covers the degree of conformance for the following accessibility standards and guidelines:

| Standard / Guideline | Included in Report |
| --- | --- |
| Web Content Accessibility Guidelines 2.0 (ISO/IEC 40500) | Level A — Yes; Level AA — Yes; Level AAA — No |
| Web Content Accessibility Guidelines 2.1 | Level A — Yes; Level AA — Yes; Level AAA — No |
| Revised Section 508 standards (36 CFR 1194, Appendix A, B, C) | Yes |
| EN 301 549 v3.2.1 (2021-03) | Yes |

## Terms

The terms used in the Conformance Level information are defined as follows:

| Term | Definition |
| --- | --- |
| Supports | At least one method meets the criterion without known defects, or meets it with equivalent facilitation. |
| Partially Supports | Some functionality does not meet the criterion. |
| Does Not Support | The majority of functionality does not meet the criterion. |
| Not Applicable | The criterion is not relevant to the product. |
| Not Evaluated | The product has not been evaluated against the criterion. This status is used only for criteria outside the evaluated scope, including WCAG Level AAA criteria and non-WCAG service areas. |

## WCAG 2.x Report

When reporting conformance with the WCAG 2.x Success Criteria, the criteria are evaluated against the documents produced by DPL and the documented accessibility-supported ways of using the libraries.

### Table 1: Success Criteria, Level A

The remarks below summarize the accessibility behavior of each output path. Code and API names are shown in plain text where necessary to keep the table readable in Markdown renderers.

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| **1.1.1 Non-text Content** | Partially Supports | **PDF:** `StructureElement.AlternateDescription` (`/Alt`) and `ActualText` (`/ActualText`) are public. Decorative content can be marked as an artifact via `FixedContentEditor.InsertMarkedContentStart()` with no structure element; page headers and footers are marked as pagination artifacts automatically at accessible compliance levels (`PdfExporter.cs:2018, 2085`). **Alternate text is not enforced.** Where it is missing the pipeline silently substitutes a fallback — the form field name for widgets and the structure tag type name for annotations (`PageObject.cs:375-390`) — or omits it entirely for figures (`PdfTaggingContext.cs:100-107`, which sets `AlternateDescription` only when the description is non-empty). No exception is raised. **HTML:** the `alt` attribute is emitted only when `Image.Description` is non-null; for a programmatically created image, where `Description` defaults to null, **no `alt` attribute is emitted at all** (`ImageElement.cs:119-131`). The `ImageExporting` event is the only workaround. |
| **1.2.1 / 1.2.2 / 1.2.3 Time-based Media** | Not Applicable | The product does not create or play time-based media. |
| **1.3.1 Info and Relationships** | Partially Supports | **PdfProcessing:** The public structure tree supports headings, lists, figures, and table tags. Table attributes such as scope, summary, row spans, and column spans are internal and cannot be set directly by developers (`StructureElementTableAttributes.cs`). **WordsProcessing → PDF:** `UseExisting` preserves headings, lists, and figures but not table or link semantics; `Build` detects tables heuristically but does not emit headings (`PdfTaggingContext.cs`, `StructureTreeBuilder.cs`, `PdfExporter.cs:565`). **SpreadProcessing → PDF:** output is untagged. **HTML:** heading styles are exported as styled paragraph elements, and table cells are data cells without header cells, table sections, scope, caption, or summary (`HtmlContentManager.cs`, `TableRowElement.cs:67-74`, `TableElement.cs:101-110`). Lists are exported as unordered or ordered lists with list items. |
| **1.3.2 Meaningful Sequence** | Partially Supports | Reading order follows structure-tree order, which the developer controls directly in PdfProcessing. For `PdfUA1`, tab order is set to follow document structure (`PageObject.cs:251`). In the `Build` strategy, order is derived heuristically from element positions and is not author-controlled. |
| **1.3.3 Sensory Characteristics** | Not Applicable | Determined by content authored by the consuming application. |
| **1.4.1 Use of Color** | Not Applicable | Determined by the consuming application. |
| **1.4.2 Audio Control** | Not Applicable | The product produces no audio. |
| **2.1.1 / 2.1.2 / 2.1.4 Keyboard** | Not Applicable | No user interface. Keyboard interaction with generated documents is provided by the viewer. |
| **2.2.1 / 2.2.2 Timing** | Not Applicable | The product imposes no time limits and produces no auto-updating content. |
| **2.3.1 Three Flashes** | Not Applicable | No flashing content is produced. |
| **2.4.1 Bypass Blocks** | Partially Supports | **PDF — Supports.** PdfProcessing-generated PDFs can include outlines/bookmarks and `TableOfContent` structure tags. Repeating headers, footers, page numbers, and other peripheral page elements are excluded from the reading order automatically: they are wrapped as pagination artifacts at accessible compliance levels (`PdfExporter.cs:2018, 2085`; `PdfTaggingContext.TryBeginPaginationArtifact`). **HTML — Does Not Support.** The HTML exporter emits no skip-navigation links, landmark elements, or any other bypass mechanism. **SpreadProcessing → PDF — Does Not Support.** Output is entirely untagged; no bypass structure is produced. **WordsProcessing (DOCX, RTF) — Does Not Support.** No skip-navigation links or landmark equivalents are emitted; these output formats provide no author-specified bypass mechanism. |
| **2.4.2 Page Titled** | Partially Supports | **PDF — Supports.** `RadFixedDocument.DocumentInfo.Title` and `ViewerPreferences.ShouldDisplayDocumentTitle` are enforced at accessible compliance levels (`DocumentCatalog.cs:260, 275`). **HTML — Does Not Support.** A title element is always emitted but is never populated from document metadata; the output title is always empty (`HeadElement.cs:45`, `TitleElement.cs`). |
| **2.4.3 Focus Order** | Partially Supports | **PDF/UA1 — Supports.** For `PdfUA1`, the page tab order is set to follow the logical structure tree (`PageObject.cs:251`). **HTML — Does Not Support.** The HTML exporter does not declare or control tab order; focus sequence is left entirely to the browser with no author-specified structure. **WordsProcessing (DOCX, RTF) — Does Not Support.** No focus-order declaration is produced in these output formats; reading order is determined entirely by the viewer. **SpreadProcessing → PDF — Does Not Support.** Output is untagged; no structure-based tab order is possible. **SpreadProcessing (XLSX, CSV) — Does Not Support.** No focus-order information is emitted in spreadsheet output formats. |
| **2.4.4 Link Purpose (In Context)** | Partially Supports | **PdfProcessing:** link annotations can be tagged `StructureTagType.Link` with an `AlternateDescription`; a fallback description is auto-applied when missing (`LinkObject.cs:63`, `PageObject.cs:387-390`). **WordsProcessing → PDF:** `PdfTaggingContext` emits no `Link` tags under `UseExisting`, so hyperlinks converted from DOCX are not tagged as links. **HTML:** hyperlinks are exported as anchor elements with `Hyperlink.ToolTip` mapped to the title attribute when non-empty (`HyperlinkElement.cs:44, 55-58`). |
| **2.5.1–2.5.4 Pointer / Motion** | Not Applicable | No user interface. |
| **3.1.1 Language of Page** | Partially Supports | **PDF — Supports.** `RadFixedDocument.Language` writes `/Lang` (default `"en"`) and is enforced at accessible compliance levels (`DocumentCatalog.cs:341`). **WordsProcessing — Does Not Support.** `RadFlowDocument` exposes no document-level language property, so a source document's language is neither round-tripped through DOCX nor carried into PDF; it must be set manually on the resulting `RadFixedDocument`. **SpreadProcessing — Does Not Support.** No workbook or worksheet language property. **HTML — Does Not Support.** No `lang` attribute is emitted anywhere. |
| **3.2.1 / 3.2.2 On Focus / On Input** | Not Applicable | No user interface. |
| **3.3.1 Error Identification** | Not Applicable | No user interface. API validation errors surface as .NET exceptions to the developer. |
| **3.3.2 Labels or Instructions** | Partially Supports | **PDF — Supports.** PDF form fields expose `FormField.UserInterfaceName`, exported as the `/TU` entry (`FormFieldNode.cs:52`, `FieldPropertiesExporter.cs:70`), which assistive technology announces as the field label. At accessible compliance levels the exporter auto-populates `/TU` from the field name where it is absent (`FieldPropertiesExporter.cs:65-67`) and propagates it to the structure element's `AlternateDescription` (`PageObject.cs:366, 377`). Note the auto-fallback uses the internal field name, which may not be a meaningful label. **WordsProcessing HTML output — Does Not Support.** No form field labels or accessible name attributes are emitted. **WordsProcessing (DOCX, RTF) — Does Not Support.** No `/TU` or equivalent form label mechanism is produced in these output formats. **SpreadProcessing (XLSX, CSV) — Does Not Support.** No form field label mechanism is provided. |
| **4.1.1 Parsing** | Partially Supports | **PDF — Supports.** PDF output is validated against PDF/A and PDF/UA-1 with veraPDF in the automated suite (subject to the caveats noted in the introduction). **OOXML (DOCX, XLSX) — Supports.** OOXML output is schema-validated in the test suites. **HTML — Partially Supports.** The HTML exporter emits an XHTML 1.0 Transitional DOCTYPE (`HtmlWriter.cs:48-52`) rather than HTML5; validators will report the DOCTYPE as outdated, and the output does not conform to the current HTML living standard. **WordsProcessing RTF — Not Evaluated.** The repository contains RTF import/export integration tests, but no formal RTF schema-validation or accessibility-conformance suite was identified; format conformance has not been verified. |
| **4.1.2 Name, Role, Value** | Partially Supports | Structure tags supply the role, `AlternateDescription`/`ActualText` the accessible name, `/Lang` the language, and `/TU` the form field label. Custom tags can be role-mapped via `CustomStructureType`. **Limitations:** the PDF `/Headers` attribute (explicit data-cell-to-header association) is not implemented; `Scope` is implemented but not publicly settable; and no ARIA or role information is emitted in HTML output. |

---

### Table 2: Success Criteria, Level AA

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| **1.2.4 / 1.2.5 Media** | Not Applicable | No time-based media. |
| **1.3.4 Orientation** | Not Applicable | No user interface. |
| **1.3.5 Identify Input Purpose** | Does Not Support | The PDF form-field API exposes no autocomplete/input-purpose token equivalent to the WCAG input-purpose taxonomy. |
| **1.4.3 Contrast (Minimum)** | Not Applicable | Colour choices are made by the consuming application; the library neither imposes nor validates contrast. |
| **1.4.4 Resize Text** | Not Applicable | Text scaling is a viewer function. |
| **1.4.5 Images of Text** | Supports | All DPL output formats — DOCX, XLSX, RTF, HTML, and PDF — represent text content as actual text characters. The library does not convert text to rasterized images during any export operation. **PDF additionally:** font embedding and `/ToUnicode` maps are enforced at every non-`None` compliance level (`FontDescriptor.cs:520`, `FontObject.cs:285`), ensuring text remains selectable and machine-readable in PDF viewers regardless of the installed fonts. Whether the consuming application deliberately provides pre-rasterized image content in place of text is outside the library's control. |
| **1.4.10 Reflow** | Partially Supports | **PDF — Not Applicable.** PDF is a fixed-layout format; content positions are absolute and the format does not support reflow. **WordsProcessing (DOCX, RTF) — Supports.** These are paragraph-flow formats; word processors reflow content based on available viewport width by design, and DPL does not introduce fixed positioning that would prevent reflow. **WordsProcessing HTML — Supports.** HTML reflows naturally and DPL emits no fixed-width layout constraints that would require horizontal scrolling. **SpreadProcessing (XLSX, CSV) — Not Applicable.** Spreadsheets use a column-and-row grid; reflow is not a meaningful concept for tabular data and is not expected by assistive technology for this format. |
| **1.4.11 Non-text Contrast** | Not Applicable | See 1.4.3. |
| **1.4.12 Text Spacing** | Not Applicable | Text rendering, line height, letter spacing, and word spacing are controlled by the viewer or browser, not by the document format. DPL does not restrict the viewer's ability to override text spacing. |
| **1.4.13 Content on Hover or Focus** | Not Applicable | No user interface. |
| **2.4.5 Multiple Ways** | Partially Supports | **PDF — Supports.** Bookmarks/outlines, `TableOfContent` tags, named destinations and link annotations provide multiple navigation mechanisms in PdfProcessing-generated PDFs. **HTML — Does Not Support.** The HTML exporter provides no equivalent multi-navigation mechanisms (no site map, no table of contents, no landmark elements, no search). **SpreadProcessing → PDF — Does Not Support.** Output is entirely untagged; no navigation structure is produced. **WordsProcessing (DOCX, RTF) — Does Not Support.** No multi-navigation structures such as outlines, named destinations, or equivalent mechanism are emitted in these output formats. **SpreadProcessing (XLSX, CSV) — Does Not Support.** No multi-navigation mechanism is provided in spreadsheet output formats. |
| **2.4.6 Headings and Labels** | Partially Supports | **PdfProcessing direct API — Supports.** `HeadingLevel1`–`HeadingLevel6` plus a generic `Heading` tag. **WordsProcessing → PDF — conditional.** Word heading styles 1–9 are mapped to `HeadingLevel1`–`HeadingLevel6` (`PdfTaggingContext.GetHeadingTagType`) **only** under `TaggingStrategyType.UseExisting`; under `Build` no headings are produced at all. **HTML — Does Not Support.** Heading styles are exported as styled paragraph elements, so no heading semantics reach the output. |
| **2.4.7 Focus Visible** | Not Applicable | Viewer capability. |
| **3.1.2 Language of Parts** | Partially Supports | **PDF — Supports.** `StructureElement.Language` sets `/Lang` on any individual structure element (PDF output only). **All other output formats — Does Not Support.** Neither WordsProcessing (DOCX, HTML, RTF) nor SpreadProcessing (XLSX) expose per-run or per-element language properties; the document-level language gap noted at 3.1.1 extends to parts as well. |
| **3.2.3 / 3.2.4 Consistency** | Not Applicable | No user interface. |
| **3.3.3 / 3.3.4 Error Handling** | Not Applicable | No user interface. |
| **4.1.3 Status Messages** | Not Applicable | No user interface. |

---

### Table 3: Success Criteria, Level AAA

Not evaluated. Level AAA conformance is out of scope for this report.

---

## Revised Section 508 Report

### Chapter 3: Functional Performance Criteria

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| 302.1 Without Vision | Partially Supports | PDFs generated at an accessible compliance level carry a structure tree, document language and title, and are consumable by screen readers. Quality depends on the output path: hand-authored PdfProcessing content can be fully accessible; DOCX→PDF loses table and link semantics; XLSX→PDF and HTML output are not accessible. |
| 302.2 With Limited Vision | Partially Supports | Enforced font embedding and `/ToUnicode` maps support magnification and text-to-speech in the viewer. The library does not control contrast or type size. |
| 302.3 Without Perception of Colour | Not Applicable | Colour usage is determined by the consuming application. |
| 302.4 / 302.5 Hearing | Not Applicable | No audio output. |
| 302.6 Without Speech | Not Applicable | No speech input required. |
| 302.7 / 302.8 Manipulation, Reach and Strength | Not Applicable | No user interface. |
| 302.9 With Limited Language, Cognitive, and Learning Abilities | Partially Supports | **PdfProcessing (PDF with structure tags) — Partially Supports.** Heading levels, list structure, and logical reading order in tagged PDFs provide navigation and comprehension aids in compatible viewers. **WordsProcessing → PDF — Partially Supports.** Heading and list semantics carry through to tagged PDF output (strategy-dependent; see 1.3.1). **WordsProcessing (DOCX, RTF) — Partially Supports.** Heading styles and list structure are preserved in these output formats, enabling reader navigation. No language property is available (`RadFlowDocument` has none), which limits comprehension support for multilingual content. **WordsProcessing HTML — Does Not Support.** No semantic headings or structural landmarks are emitted; the output provides no structural comprehension aids. **SpreadProcessing (all outputs) — Does Not Support.** No structural semantics relevant to cognitive accessibility are produced in any SpreadProcessing output. Content simplicity is the responsibility of the consuming application across all output formats. |

### Chapter 4: Hardware

Not Applicable — software-only product.

### Chapter 5: Software

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| 501.1 Scope — Incorporation of WCAG 2.0 AA | See WCAG tables above | — |
| 502 Interoperability with Assistive Technology | Not Applicable | No user interface and no platform accessibility services. Generated documents interoperate with AT through the viewer. |
| 502.2.1 User Control of Accessibility Features | Not Applicable | See 502. |
| 502.2.2 No Disruption of Accessibility Features | Supports | Runs in-process as a class library; does not modify or disrupt host platform accessibility features. |
| 502.3 / 502.4 Accessibility Services and Platform Features | Not Applicable | See 502. |
| 503 Applications / 503.2 / 503.3 | Not Applicable | See 502. |
| 503.4 Captions and Audio Description Controls | Not Applicable | No time-based media. |
| **504.2 Content Creation or Editing (Authoring Tools)** | **Partially Supports** | **PDF via the PdfProcessing API — Supports.** The full authoring surface required for WCAG 2.0 AA conforming PDF is present: Tagged PDF structure tree, alternate text, actual text, per-element and document language, document title with `/DisplayDocTitle`, six heading levels, list semantics, form field `/TU` labels, artifact marking, structure-based tab order, enforced font embedding and `/ToUnicode` maps, and selectable conformance targets (`PdfA1A`, `PdfA2A`, `PdfA3A`, `PdfUA1`). **Gap:** table header scope, summary and span attributes are `internal` and cannot be set by a developer. **PDF via WordsProcessing conversion — Partially Supports** (tables and links untagged; strategy-dependent heading support). **PDF via SpreadProcessing — Does Not Support** (no tagging support). **HTML — Does Not Support.** The exporter cannot produce WCAG-conforming HTML: no semantic headings, no table header markup, no `lang`, empty title, and `alt` omitted for images without a description. `HtmlExportSettings` offers no accessibility or semantic-output options; the `ImageExporting` event is the only escape hatch, and it addresses alt text only. |
| **504.2.1 Preservation of Information Provided for Accessibility in Format Conversion** | **Partially Supports** | **What is preserved across conversion paths:** image alternate text (`ShapeBase.Description`) in DOCX round-trips and in DOCX→PDF exports (`Figure`/`/Alt`); Word heading styles in DOCX→PDF exports under `TaggingStrategyType.UseExisting`; list structure in DOCX→PDF exports; hyperlink screen tips in DOCX (`Hyperlink.ToolTip`) and XLSX (`HyperlinkInfo.ScreenTip`); shape descriptions and note alternate text in XLSX round-trips; an existing PDF structure tree when re-exporting a PDF via `TaggingStrategyType.UseExisting`. **Much accessibility information is not preserved.** No DPL library — neither `RadFlowDocument` (WordsProcessing) nor `Workbook` (SpreadProcessing) nor any other — exposes a document-level language property, so document language is silently lost in every conversion regardless of source format. Additional losses include: table structure in DOCX→PDF (no `Table`/`TableHeader`/`TableData` tags; Word header rows are not promoted to header semantics); hyperlink semantics in DOCX→PDF (no `Link` tags); heading semantics in DOCX→HTML; and all accessibility structure in XLSX→PDF. `PdfExportSettings.StripStructureTree` discards any remaining PDF structure if enabled. These are representative examples; the scope of accessibility information lost in conversion is broader than this list. |
| **504.2.2 PDF Export** | **Supports** | All three DPL libraries (PdfProcessing, WordsProcessing, SpreadProcessing) can export documents to PDF. **Accessible compliance targets (PDF/UA-1, PDF/A-1a, PDF/A-2a, PDF/A-3a) are available only through PdfProcessing**, and with incomplete tagging through WordsProcessing (see 504.2 for tagging gaps). SpreadProcessing's PDF export has no compliance-level support and produces entirely untagged output. Within PdfProcessing: PDF/A-1b, 2b, 2u, 3b and 3u are visual-fidelity levels and are **not** accessible conformance targets. PDF/UA-2 and PDF/A-4 are not supported. Compliance targets are validated against veraPDF in the automated suite (subject to the evidence caveats above). `THead`/`TBody`/`TFoot` tags are unavailable at PDF/A-1 levels (`StructElementObject.cs:241`), an expected PDF 1.4 constraint. |
| **504.3 Prompts** | **Does Not Support** | As a code-level API the product has no authoring user interface and therefore no mechanism to prompt an author to create accessible content. Missing alternate text is silently auto-substituted or omitted rather than reported. |
| **504.4 Templates** | **Partially Supports** | No document templates ship with the product. A worked accessible-PDF example is provided in the public demo suite (`AccessibilityController` / `CreatePdfForAccessibility`), demonstrating headings, lists, tables, tagged figures with alternate text, links, artifacts, document language and title, and each accessible compliance level. |

### Chapter 6: Support Documentation and Services

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| 601.1 Scope | Not Evaluated | — |
| 602.2 Accessibility and Compatibility Features | Partially Supports | The reviewed materials cover PDF/A and PDF/UA compliance levels, tagging strategy, the structure tree API, and accessible-PDF examples. They do not document all conversion-path limitations listed above, including the loss of table, link, heading, language, and HTML semantics. |
| 602.3 Electronic Support Documentation | Not Evaluated | The accessibility of the docs.telerik.com portal is outside the scope of this repository-based evaluation. |
| 602.4 Alternate Formats for Non-Electronic Documentation | Not Applicable | No non-electronic documentation is provided. |
| 603.2 / 603.3 Support Services | Not Evaluated | Support-service conformance is outside the scope of this repository-based evaluation. |

---

## EN 301 549 Report

| Chapter | Conformance Level | Remarks |
| --- | --- | --- |
| Chapter 4 — Functional Performance Statements | Partially Supports | See Section 508 Chapter 3. |
| Chapter 5 — Generic Requirements | Partially Supports | 5.1 Closed functionality — Not Applicable. 5.2 Activation of accessibility features — Not Applicable. 5.3 Biometrics — Not Applicable. **5.4 Preservation of accessibility information during conversion — Partially Supports**, see 504.2.1. 5.5–5.9 — Not Applicable. |
| Chapter 6 — Two-Way Voice Communication | Not Applicable | No voice communication. |
| Chapter 7 — Video Capabilities | Not Applicable | No video capability. |
| Chapter 8 — Hardware | Not Applicable | Software-only product. |
| **Chapter 9 — Web** | **Partially Supports** | **This chapter applies** because WordsProcessing exports HTML, which is web content and to which WCAG applies directly. The generated HTML fails several Level A criteria: 1.1.1 (no `alt` when `Image.Description` is null), 1.3.1 (no semantic headings; no table header cells or table sections), 2.4.2 (empty title) and 3.1.1 (no `lang` attribute). Lists and links are conforming, as is the absence of layout tables. Consumers embedding DPL-generated HTML in a web page must post-process it to reach WCAG 2.1 AA. |
| Chapter 10 — Non-web Documents | Partially Supports | Applies to generated PDF, DOCX and XLSX documents. See the WCAG tables; conformance depends heavily on the output path. |
| Chapter 11 — Software | Partially Supports | 11.1–11.7 largely Not Applicable (no user interface). **11.8 Authoring tools** is the substantive section: 11.8.1 Content technology — Supports (PDF/UA-1, PDF/A-1a/2a/3a). 11.8.2 Accessible content creation — Partially Supports (PDF yes; HTML and XLSX→PDF no). 11.8.3 Preservation of accessibility information — Partially Supports. 11.8.4 Repair assistance — Does Not Support. 11.8.5 Templates — Partially Supports. |
| Chapter 12 — Documentation and Support Services | Not Evaluated | Documentation-portal and support-service conformance is outside the scope of this repository-based evaluation. |
| Chapter 13 — Relay / Emergency Service Access | Not Applicable | — |

---

## Known Exceptions and Limitations

The limitations below are listed in order of their likely impact on accessibility requirements. Items at the top represent the most significant gaps in the current product and are most likely to affect use cases where WCAG or Section 508 compliance is required.

| # | Limitation | Evidence | Impact |
| --- | --- | --- | --- |
| 1 | **HTML export does not emit semantic headings** — heading styles become styled paragraph elements | `HtmlContentManager.cs` — `ExportParagraph`, ~line 341 | WCAG 1.3.1 / 2.4.6 failure in all HTML output |
| 2 | **HTML export emits no table header cells, table sections, scope, caption, or summary** — every cell is a data cell | `TableRowElement.cs:67-74`, `TableElement.cs:101-110` | WCAG 1.3.1 failure; data tables inaccessible |
| 3 | **HTML export emits no `lang` attribute and an always-empty title** | `HeadElement.cs:37`, `TitleElement.cs` | WCAG 3.1.1 and 2.4.2 failures |
| 4 | **HTML export omits `alt` entirely when `Image.Description` is null** (rather than `alt=""`) | `ImageElement.cs:119-131` | WCAG 1.1.1 failure; null is the default for programmatically created images |
| 5 | **DOCX→PDF emits no table tags** — tables degrade to generic `Paragraph`/`Span` | `PdfTaggingContext.cs` (no `Table` tag emission) | Table semantics lost in the most common conversion path |
| 6 | **The two tagging strategies are mutually exclusive in coverage** — `UseExisting` gives headings/lists/figures but no tables; `Build` gives heuristic tables but no headings (Flow sets `autoTag = false`) | `PdfExporter.cs:565`, `PdfTaggingContext.cs:161`, `StructureTreeBuilder.cs:255-305` | No single setting produces a fully structured PDF from DOCX |
| 7 | **SpreadProcessing → PDF has no tagging or compliance-level support** | No `ComplianceLevel`/`StructureTag` references in `Documents\Spreadsheet\FormatProviders\Pdf\` | XLSX→PDF output cannot be made accessible |
| 8 | **Table accessibility attributes are `internal`** — `Scope`, `Summary`, `RowSpan`, `ColSpan` cannot be set by developers | `StructureElementTableAttributes.cs:12`; no public attribute API on `StructureElement` | Even hand-authored PDF tables cannot declare header scope |
| 9 | **No document-level language on `RadFlowDocument`** | No language property in `Documents\Flow` | Language lost in every DOCX path |
| 10 | **DOCX→PDF emits no `Link` tags** | `PdfTaggingContext.cs` | Converted hyperlinks are not exposed as links to AT |
| 11 | **Alternate text is auto-substituted, not enforced** — fallbacks use the field name or the tag type name; figures may get none | `PageObject.cs:375-390`, `PdfTaggingContext.cs:100-107` | Silent degradation; no error surfaces to the developer |
| 12 | **PDF `/Headers` attribute not implemented** | Absent from `StructureElementTableAttributes` | Complex/irregular tables cannot be made fully accessible |
| 13 | **Word header rows (`RepeatOnEveryPage`) are not converted to header semantics** in PDF or HTML | No references in either export path | Header rows lose meaning on conversion |
| 14 | **PDF/UA-2 and PDF/A-4 not supported** | `PdfComplianceLevel.cs` | Customers requiring PDF 2.0 accessibility standards are not covered |
| 15 | **No author prompting or repair assistance** | Inherent to a code-level API | §504.3 and EN 301 549 §11.8.4 not met |
| 16 | **veraPDF tests skip silently when Java is unavailable**, and veraPDF cannot verify semantic quality | `PdfAValidationTestBase.cs:129-133` | Evidence base is weaker than test names suggest |

## See Also

* [Creating accessible PDF documents]({%slug create-accessible-pdf-documents%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [PDF structure tree]({%slug radpdfprocessing-model-structure-tree%})