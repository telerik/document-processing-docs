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

This report describes how Telerik Document Processing libraries support accessible documents. The libraries have no user interface; accessibility depends on the document you create, the export format, and the application that displays it.

## WCAG Edition (Based on VPAT® Version 2.5 Rev)

**Product:** Telerik Document Processing Libraries (DPL) — PdfProcessing, WordsProcessing, SpreadProcessing, SpreadStreamProcessing, and ZipLibrary

**Report Date:** August 27, 2026

**Product description:** Non-visual .NET class libraries (.NET Standard 2.0, .NET 8, .NET 10) for programmatic creation, import, export and conversion of PDF, DOCX/DOC/RTF/HTML/TXT/Markdown, XLSX/XLS/CSV and ZIP documents. The libraries have **no user interface**; they are consumed by developers as APIs and embedded in host applications.

**Scope:** This report evaluates the accessibility information that the libraries produce or preserve. Criteria that require an interactive user interface are marked *Not Applicable*.

## General Compliance Statements

Accessibility support differs by output format:

| Output path | Accessibility status |
| --- | --- |
| PdfProcessing with a manually authored structure tree | Supports tagged PDF authoring; you must supply meaningful structure and descriptions. |
| WordsProcessing to PDF | Partial. Headings, lists and figures are tagged; **tables and links are not**. |
| SpreadProcessing to PDF | **Untagged.** No compliance-level or tagging support at all. |
| WordsProcessing to HTML | **Largely inaccessible.** No semantic headings, no table headers, no `lang`, empty `<title>`. |
| DOCX, XLSX, and RTF conversion | Alt text, screen tips and notes are preserved; document language is not. |

**Evaluation methods:** Review of public APIs, generated output, automated PDF/A and PDF/UA validation, and accessible PDF examples.

**Automated validation:** PDF/A and PDF/UA tests use veraPDF where available. These checks do not establish whether alternate text is meaningful, headings follow a logical order, or content reads naturally. A PDF can pass automated checks even when an image lacks a useful description. Review generated documents with assistive technology as well.

## Special Considerations

1. DPL is a set of non-visual .NET class libraries. The consuming application and document viewer provide the end-user interface and assistive-technology experience.
2. PdfProcessing supports direct authoring of tagged PDF structure. WordsProcessing and SpreadProcessing conversion results depend on the selected output format and export path.
3. Accessibility features depend on how the consuming application authors content. Alternate text, language, heading structure, table semantics, link descriptions, and reading order must be supplied or verified by the developer where the API or conversion path does not provide them.
4. The conformance ratings are based on the default and publicly available API behavior described in this report. Export settings, source-document content, and post-processing may affect the result.

## Applicable Standards/Guidelines

This report covers the degree of conformance for the following accessibility standards and guidelines:

| Standard / Guideline | Included in Report |
| --- | --- |
| Web Content Accessibility Guidelines 2.0 (ISO/IEC 40500) | Level A — Yes; Level AA — Yes; Level AAA — No |
| Web Content Accessibility Guidelines 2.1 | Level A — Yes; Level AA — Yes; Level AAA — No |
| Revised Section 508 standards (36 CFR 1194, Appendix A, B, C) | Yes |
| EN 301 549 v3.2.1 (2021-03) | Yes |

## Terms

The report uses these conformance levels:

| Term | Definition |
| --- | --- |
| Supports | At least one method meets the criterion without known defects, or meets it with equivalent facilitation. |
| Partially Supports | Some functionality does not meet the criterion. |
| Does Not Support | The majority of functionality does not meet the criterion. |
| Not Applicable | The criterion is not relevant to the product. |
| Not Evaluated | The product has not been evaluated against the criterion. This status is used only for criteria outside the evaluated scope, including WCAG Level AAA criteria and non-WCAG service areas. |

## WCAG 2.x Report

The WCAG ratings apply to generated documents and documented ways to create them. They do not rate the interface of a host application or viewer.

### Table 1: Success Criteria, Level A

The remarks distinguish between direct PDF authoring and conversion from Word or spreadsheet formats.

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| **1.1.1 Non-text Content** | Partially Supports | **PDF:** Set `StructureElement.AlternateDescription` or `ActualText` for meaningful non-text content. Mark decorative content as an artifact; accessible export marks page headers and footers as pagination artifacts. The library does not require alternate text. Widgets and annotations can receive fallback descriptions, while figures may have none. **HTML:** Images have an `alt` attribute only when `Image.Description` is set. Use the `ImageExporting` event to provide descriptions where needed. |
| **1.2.1 / 1.2.2 / 1.2.3 Time-based Media** | Not Applicable | The product does not create or play time-based media. |
| **1.3.1 Info and Relationships** | Partially Supports | **PdfProcessing:** You can tag headings, lists, figures, and tables, but cannot set table scope, summary, or spans through the public API. **WordsProcessing to PDF:** `UseExisting` preserves headings, lists, and figures but not table or link semantics. `Build` detects tables but omits headings. **SpreadProcessing to PDF:** Output is untagged. **HTML:** Lists remain lists, but headings become styled paragraphs and tables lack header semantics. |
| **1.3.2 Meaningful Sequence** | Partially Supports | Reading order follows structure-tree order, which the developer controls directly in PdfProcessing. For `PdfUA1`, tab order is set to follow document structure. In the `Build` strategy, order is derived heuristically from element positions and is not author-controlled. |
| **1.3.3 Sensory Characteristics** | Not Applicable | Determined by content authored by the consuming application. |
| **1.4.1 Use of Color** | Not Applicable | Determined by the consuming application. |
| **1.4.2 Audio Control** | Not Applicable | The product produces no audio. |
| **2.1.1 / 2.1.2 / 2.1.4 Keyboard** | Not Applicable | No user interface. Keyboard interaction with generated documents is provided by the viewer. |
| **2.2.1 / 2.2.2 Timing** | Not Applicable | The product imposes no time limits and produces no auto-updating content. |
| **2.3.1 Three Flashes** | Not Applicable | No flashing content is produced. |
| **2.4.1 Bypass Blocks** | Partially Supports | **PDF:** PdfProcessing supports bookmarks and `TableOfContent` tags. At accessible compliance levels, repeating headers, footers, and page numbers become pagination artifacts. **HTML, SpreadProcessing to PDF, and WordsProcessing DOCX or RTF output:** These paths do not supply skip-navigation or equivalent bypass structures. |
| **2.4.2 Page Titled** | Partially Supports | **PDF: Supports.** `RadFixedDocument.DocumentInfo.Title` and `ViewerPreferences.ShouldDisplayDocumentTitle` are enforced at accessible compliance levels. **HTML: Does Not Support.** A title element is always emitted but is never populated from document metadata; the output title is always empty. |
| **2.4.3 Focus Order** | Partially Supports | **PDF/UA-1:** Page tab order follows the structure tree. **HTML:** The browser determines focus order; the export supplies no tab-order declaration. **DOCX, RTF, XLSX, CSV, and SpreadProcessing to PDF:** These paths do not provide an author-defined focus order. |
| **2.4.4 Link Purpose (In Context)** | Partially Supports | **PdfProcessing:** link annotations can be tagged `StructureTagType.Link` with an `AlternateDescription`; a fallback description is auto-applied when missing. **WordsProcessing to PDF:** `PdfTaggingContext` emits no `Link` tags under `UseExisting`, so hyperlinks converted from DOCX are not tagged as links. **HTML:** hyperlinks are exported as anchor elements with `Hyperlink.ToolTip` mapped to the title attribute when non-empty. |
| **2.5.1–2.5.4 Pointer / Motion** | Not Applicable | No user interface. |
| **3.1.1 Language of Page** | Partially Supports | **PDF: Supports.** `RadFixedDocument.Language` writes `/Lang` (default `"en"`) and is enforced at accessible compliance levels. **WordsProcessing: Does Not Support.** `RadFlowDocument` exposes no document-level language property, so a source document's language is neither round-tripped through DOCX nor carried into PDF; it must be set manually on the resulting `RadFixedDocument`. **SpreadProcessing: Does Not Support.** No workbook or worksheet language property. **HTML: Does Not Support.** No `lang` attribute is emitted anywhere. |
| **3.2.1 / 3.2.2 On Focus / On Input** | Not Applicable | No user interface. |
| **3.3.1 Error Identification** | Not Applicable | No user interface. API validation errors surface as .NET exceptions to the developer. |
| **3.3.2 Labels or Instructions** | Partially Supports | **PDF:** Set `FormField.UserInterfaceName` to provide a label. At accessible compliance levels, the exporter falls back to the field name when a label is missing; that name may not help readers. **WordsProcessing HTML, DOCX, and RTF, and SpreadProcessing XLSX and CSV:** These paths do not produce equivalent accessible form labels. |
| **4.1.1 Parsing** | Partially Supports | **PDF:** Automated tests check PDF/A and PDF/UA-1 with veraPDF when available. **DOCX and XLSX:** Automated tests check OOXML schema validity. **HTML:** Output uses an XHTML 1.0 Transitional DOCTYPE rather than HTML5. **RTF:** Formal accessibility conformance has not been evaluated. |
| **4.1.2 Name, Role, Value** | Partially Supports | Structure tags supply the role, `AlternateDescription`/`ActualText` the accessible name, `/Lang` the language, and `/TU` the form field label. Custom tags can be role-mapped via `CustomStructureType`. **Limitations:** the PDF `/Headers` attribute (explicit data-cell-to-header association) is not implemented; `Scope` is implemented but not publicly settable; and no ARIA or role information is emitted in HTML output. |

---

### Table 2: Success Criteria, Level AA

| Criteria | Conformance Level | Remarks and Explanations |
| --- | --- | --- |
| **1.2.4 / 1.2.5 Media** | Not Applicable | No time-based media. |
| **1.3.4 Orientation** | Not Applicable | No user interface. |
| **1.3.5 Identify Input Purpose** | Does Not Support | The PDF form-field API exposes no autocomplete/input-purpose token equivalent to the WCAG input-purpose taxonomy. |
| **1.4.3 Contrast (Minimum)** | Not Applicable | The host application chooses colors; the libraries do not check contrast. |
| **1.4.4 Resize Text** | Not Applicable | Text scaling is a viewer function. |
| **1.4.5 Images of Text** | Supports | DOCX, XLSX, RTF, HTML, and PDF exports keep authored text as text; they do not turn it into an image. Accessible PDF export also embeds fonts and provides `/ToUnicode` maps. The application can still supply images that contain text. |
| **1.4.10 Reflow** | Partially Supports | **DOCX, RTF, and HTML:** Text can reflow in a compatible viewer or browser. **PDF:** Fixed layout does not reflow. **XLSX and CSV:** Grid-based content does not use text reflow. |
| **1.4.11 Non-text Contrast** | Not Applicable | See 1.4.3. |
| **1.4.12 Text Spacing** | Not Applicable | Text rendering, line height, letter spacing, and word spacing are controlled by the viewer or browser, not by the document format. DPL does not restrict the viewer's ability to override text spacing. |
| **1.4.13 Content on Hover or Focus** | Not Applicable | No user interface. |
| **2.4.5 Multiple Ways** | Partially Supports | **PDF:** PdfProcessing supports bookmarks, `TableOfContent` tags, named destinations, and link annotations. **HTML, SpreadProcessing to PDF, DOCX, RTF, XLSX, and CSV:** These output paths do not add equivalent navigation mechanisms. |
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
| 302.3 Without Perception of Color | Not Applicable | The host application chooses document colors. |
| 302.4 / 302.5 Hearing | Not Applicable | No audio output. |
| 302.6 Without Speech | Not Applicable | No speech input required. |
| 302.7 / 302.8 Manipulation, Reach and Strength | Not Applicable | No user interface. |
| 302.9 With Limited Language, Cognitive, and Learning Abilities | Partially Supports | Tagged PDFs can provide headings, lists, and reading order. DOCX and RTF retain heading styles and lists; Word-to-PDF conversion carries some of that structure forward. HTML output lacks semantic headings, and SpreadProcessing output does not supply equivalent structure. Applications remain responsible for clear content. |

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
| **504.2 Content Creation or Editing (Authoring Tools)** | **Partially Supports** | PdfProcessing lets you author tagged PDFs with headings, lists, language, alternate text, form labels, artifacts, and accessible compliance settings. Public APIs do not expose all table accessibility attributes. Word-to-PDF conversion loses table and link tags; SpreadProcessing-to-PDF output is untagged. HTML export lacks semantic headings, table headers, language, and a populated title. |
| **504.2.1 Preservation of Information Provided for Accessibility in Format Conversion** | **Partially Supports** | DOCX round-trips preserve image descriptions; Word-to-PDF export can preserve figures, lists, and headings with `TaggingStrategyType.UseExisting`. XLSX round-trips preserve shape descriptions and note alternate text. Conversions can lose document language, PDF table and link tags, HTML headings, or spreadsheet structure. `PdfExportSettings.StripStructureTree` removes the PDF structure tree when enabled. |
| **504.2.2 PDF Export** | **Supports** | PdfProcessing, WordsProcessing, and SpreadProcessing export PDF. Only PdfProcessing exposes accessible compliance targets: PDF/UA-1 and PDF/A-1a, PDF/A-2a, and PDF/A-3a. Word-to-PDF tagging is incomplete; spreadsheet-to-PDF output is untagged. PDF/UA-2 and PDF/A-4 are not supported. PDF/A-1 does not support `THead`, `TBody`, or `TFoot` tags. |
| **504.3 Prompts** | **Does Not Support** | As a code-level API the product has no authoring user interface and therefore no mechanism to prompt an author to create accessible content. Missing alternate text is silently auto-substituted or omitted rather than reported. |
| **504.4 Templates** | **Partially Supports** | No accessible document templates ship with the libraries. The accessible PDF demo shows headings, lists, tables, described figures, links, artifacts, and document language. |

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
| Chapter 9 — Web | Partially Supports | WordsProcessing exports HTML, so WCAG applies to that output. Missing image descriptions, semantic headings, table headers, page titles, and language affect Level A criteria 1.1.1, 1.3.1, 2.4.2, and 3.1.1. Lists and links retain their semantics. Review and update the HTML before publishing it on an accessible site. |
| Chapter 10 — Non-web Documents | Partially Supports | Applies to generated PDF, DOCX and XLSX documents. See the WCAG tables; conformance depends heavily on the output path. |
| Chapter 11 — Software | Partially Supports | Sections 11.1–11.7 mostly do not apply because the libraries have no user interface. For authoring tools under 11.8, content technology is supported; accessible content creation and preservation are partially supported. Repair assistance is not supported, and templates are partially supported. See Section 508 criteria 504.2–504.4 for details. |
| Chapter 12 — Documentation and Support Services | Not Evaluated | Documentation-portal and support-service conformance is outside the scope of this repository-based evaluation. |
| Chapter 13 — Relay / Emergency Service Access | Not Applicable | — |

---

## Known Exceptions and Limitations

Check these limits before you choose an export path for accessible content:

| Output or feature | Limitation | Accessibility effect |
| --- | --- | --- |
| WordsProcessing to HTML | Heading styles become styled paragraphs. | Screen readers cannot navigate by heading. |
| WordsProcessing to HTML | Tables lack header cells, table sections, scope, captions, and summaries. | Readers cannot reliably identify row and column headings. |
| WordsProcessing to HTML | Output has no `lang` attribute, and the page title is empty. | Language and page context are unavailable. |
| WordsProcessing to HTML | Images with no `Image.Description` have no `alt` attribute. | Images may have no accessible description. |
| WordsProcessing to PDF | Tables lack table structure tags; converted hyperlinks lack link tags. | Table relationships and link roles are lost. |
| WordsProcessing to PDF | `UseExisting` preserves headings, lists, and figures but not table tags; `Build` can detect tables but does not tag headings. | Neither strategy preserves all document structure. |
| SpreadProcessing to PDF | Output has no tagging or accessible compliance-level setting. | The export does not provide a PDF structure tree. |
| PdfProcessing tables | Public APIs do not expose header scope, summary, or row and column spans. The PDF `/Headers` attribute is unavailable. | Complex table relationships cannot be fully described. |
| Document language | `RadFlowDocument` has no document-level language property. | Language information does not carry through Word document conversion. |
| Word table headers | Repeated header rows do not become semantic header rows in PDF or HTML. | Readers can lose table header context. |
| PDF alternate text | Some widgets and annotations receive fallback descriptions; figures can lack descriptions entirely. | Review each description for meaning before distribution. |
| PDF compliance | PDF/UA-2 and PDF/A-4 are unavailable. | These conformance targets cannot be selected. |
| Authoring assistance | The libraries have no authoring interface or repair prompts. | Applications must provide their own accessibility checks. |
| Automated PDF validation | Tests skip veraPDF checks when the tool is unavailable; automated checks cannot assess semantic quality. | Passing checks alone does not establish accessibility. |

## See Also

* [Creating accessible PDF documents]({%slug create-accessible-pdf-documents%})
* [Tagged PDF]({%slug radpdfprocessing-model-tagged-pdf%})
* [PDF structure tree]({%slug radpdfprocessing-model-structure-tree%})