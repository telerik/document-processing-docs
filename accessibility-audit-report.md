# Accessibility Audit Report

**Repository:** `telerik/document-processing-docs`  
**Audit date:** October 21, 2026  
**Primary guidance:** [Accessibility documentation optimization skill](.github/skills/accessibility-doc-optimization/SKILL.md)

## Executive Summary

This source-level audit reviewed the repository's documentation against the accessibility criteria in the repository skill, including heading hierarchy, image alternatives, link purpose, tables, code blocks, callouts, plain language, and motion content. The review covered 654 Markdown files outside `.github/`, with targeted inspection of the authoring guidance and repository configuration.

The documentation has several strong practices: image alternatives are generally present, most links describe their destinations, and examples use descriptive headings, tables, and semantic callouts. The confirmed issues are uneven heading hierarchy, a small number of vague or empty links, ambiguous blank table cells, one untagged code example, an alt-text styling marker, and animated GIFs that may not provide a way to stop motion. The repository has accessibility guidance, but no automated accessibility checks were found in the publishing workflows.

The most useful immediate actions are to correct the confirmed heading and link issues, make blank table cells understandable, and establish a policy for animated GIFs. Add source checks for recurring patterns, then validate rendered pages with keyboard and assistive technology testing. This audit does not establish WCAG conformance for the published site.

## Scope and Method

- Reviewed the repository's accessibility skill and scanned 654 Markdown files outside `.github/`.
- Inspected representative pages and searched for heading-level skips, image alternatives, weak links, blank table cells, untagged code blocks, callout patterns, and media.
- Checked `README.md` and repository workflow/configuration files for authoring guidance and automated accessibility validation.
- Treated source scans as indicators, not proof of rendered behavior. Potentially intentional spreadsheet blanks and platform-specific syntax are identified as requiring context-sensitive review.

**Limitations:** This was not a browser or assistive-technology audit. It did not test published HTML semantics, keyboard order or focus, screen-reader announcements, visual contrast, zoom/reflow, reduced-motion behavior, or whether the documentation renderer transforms Markdown correctly. No claim of WCAG conformance is made.

## Findings

### Heading levels are skipped in some articles

**Severity:** Medium

**Description**  
An automated heading scan found 40 heading-level jumps in Markdown content, including headings that move directly from H1 to H3 or H2 to H4. For example, `ai-tools/agent-tools/multi-user-scenario.md` starts an H3 section at “Risks and Mitigation” after its H1, and `getting-started/installation/pdf-export.md` contains H4 subsections directly under H2 sections. YAML frontmatter titles are not counted as rendered H1 headings.

**Affected Files**

- `ai-tools/agent-tools/multi-user-scenario.md`
- `getting-started/installation/pdf-export.md`
- Other files identified by a repository-wide Markdown heading scan

**Impact**  
People who navigate by heading in a screen reader encounter an outline that does not reflect the page's section nesting. This can make the relationship between a section and its subsections harder to understand.

**Recommendation**  
Use sequential heading levels to represent the actual structure. Change an H3 or H4 only after checking the surrounding sections; do not add headings merely to obtain a visual style.

**Examples**

- `ai-tools/agent-tools/multi-user-scenario.md`: `### Risks and Mitigation` follows the H1 without an H2.
- `getting-started/installation/pdf-export.md`: `#### Required packages` follows an H2 without an H3.

### A few links have vague or empty link text or destinations

**Severity:** Low

**Description**  
Two links in product documentation use “here” as their link text. The repository README contains another “here” link and an empty destination. The link text does not identify the destination when read out of context, and the empty destination does not provide a usable target.

**Affected Files**

- `libraries/radwordsprocessing/formats-and-conversion/formats-and-conversion.md` - “More information is available [here]” (line 367).
- `libraries/radwordsprocessing/formats-and-conversion/pdf/settings.md` - “listed [here]” (line 28).
- `README.md` - “click [here]” (line 76) and `[Telerik Document Processing]()` (line 9).

**Impact**  
Screen-reader users who review a page's links separately receive little information from “here.” An empty link destination may be nonfunctional or confusing for all readers.

**Recommendation**  
Replace “here” with concise text that names the linked topic, such as “custom code fields” or “standard PDF fonts.” Give the README link a valid destination or remove the link styling if it is not intended to navigate.

**Examples**  
Use `[standard PDF fonts]({%slug radpdfprocessing-concepts-fonts%})` instead of `[here]({%slug radpdfprocessing-concepts-fonts%})`.

### Blank cells make some data tables ambiguous

**Severity:** Medium

**Description**  
At least 12 files contain Markdown tables with blank cells. In `knowledge-base/resolve-toc-title-font-docx-to-pdf.md` (line 18), a version row ends with an empty Author cell. In `knowledge-base/implementing-transpose-array-function-in-spreadprocessing.md` (lines 24-35), blank cells are used to illustrate spreadsheet data, including a visually empty header row. Some blanks may be intentional data; their meaning is not stated.

**Affected Files**

- `knowledge-base/resolve-toc-title-font-docx-to-pdf.md`
- `knowledge-base/implementing-transpose-array-function-in-spreadprocessing.md`
- Other files found by scanning for adjacent table delimiters

**Impact**  
Assistive technology may announce empty cells without explaining whether they mean “not applicable,” missing information, or intentionally blank spreadsheet content. Blank header cells also make the table's column relationships unclear.

**Recommendation**  
For reference tables, replace unexplained blanks with a concise value such as “Not applicable” or “Not specified.” For examples of blank spreadsheet data, state that the cells are intentionally empty and provide meaningful column headers or an equivalent text explanation.

**Examples**  
In the environment table, use “Not specified” in the empty Author cell if that is accurate. In the TRANSPOSE example, label the columns and explain that the trailing cells are empty to represent the resulting range.

### An untagged code example lacks a language identifier

**Severity:** Low

**Description**  
The source scan found one untagged opening code fence in `knowledge-base/platform-agnostic-namespaces-migration.md` (line 67). It contains compiler error output. Other code examples should continue to be checked as content is added.

**Affected Files**

- `knowledge-base/platform-agnostic-namespaces-migration.md`

**Impact**  
Without a language identifier, Markdown renderers and language-aware tools cannot reliably identify the block's content type. This can reduce syntax highlighting and make code examples less distinguishable from surrounding prose.

**Recommendation**  
Add an appropriate language identifier, such as `text` for compiler output, and provide a brief introduction where the block is not already explained. Validate the language rather than assigning `csharp` to output that is not source code.

**Examples**

```text
error CS0246: The type or namespace name 'Telerik' could not be found
```

### Styling markers are included in some image alternatives

**Severity:** Low

**Description**  
`introduction.md` uses image alternatives ending in `><` (lines 89 and 112), and its CSS selects images whose `alt` value ends with that marker. The marker appears to be used for presentation rather than to describe the image.

**Affected Files**

- `introduction.md`
- Other pages using the same image styling convention should be checked

**Impact**  
If the marker is exposed as part of an image's accessible name, screen-reader users may hear characters that do not describe the image. The exact accessible name depends on how the documentation renderer handles the Markdown.

**Recommendation**  
Separate presentation hooks from alternative text. Use a renderer-supported class or image component for styling, or ensure the marker is removed from the rendered accessible name. Keep meaningful alternatives for informative images and use an empty alternative only when an image is truly decorative.

**Examples**

- `introduction.md`: `![DPL Ninja ><](images/dpl-ninja-banner.png)`
- `introduction.md`: `![Ninja Looking ><](images/ninja_looking.png)`

### Animated GIFs may not provide control over motion

**Severity:** Medium

**Description**  
The source contains 19 animated GIF references across 19 files. The reviewed examples provide alt text, including `ai-tools/ai-coding-assistant/mcp-server.md` (line 98), but an image link does not provide playback controls. Whether a specific GIF needs a pause, stop, or hide mechanism depends on its duration and motion behavior; that cannot be determined from its Markdown reference alone.

**Affected Files**

- `ai-tools/ai-coding-assistant/mcp-server.md`
- `knowledge-base/` and `libraries/` pages that embed animated GIFs

**Impact**  
Continuously moving content can distract or cause discomfort for some readers, and an image's alternative text does not let a reader pause or inspect an animation at their own pace. Readers also need equivalent instructions if the animation communicates multiple steps.

**Recommendation**  
Review each GIF's duration and motion. Where applicable, provide a pause/stop mechanism or replace it with a controllable media format. Include concise written steps for instructional animations, and ensure the alternative text describes the image's purpose rather than relying on motion alone.

**Examples**

- `ai-tools/ai-coding-assistant/mcp-server.md`: The animated VS Code walkthrough has descriptive alternative text but no playback control in the Markdown source.
- `knowledge-base/multiply-form-field-with-javascript-action-radpdfprocessing.md`: An animated form-field example is also included.

### Accessibility validation is not part of the publishing workflows

**Severity:** Medium

**Description**  
The repository contains detailed accessibility authoring guidance in `.github/skills/accessibility-doc-optimization/SKILL.md`, but the inspected publishing workflows do not include automated accessibility checks. A guide alone does not ensure new or changed pages are reviewed consistently.

**Affected Files**

- `.github/skills/accessibility-doc-optimization/SKILL.md`
- `.github/workflows/publish-kb.yml`
- `.github/workflows/docs-feedback-agent.yml`

**Impact**  
The confirmed source-level issues can recur because the publication process does not automatically flag them. Markdown checks also cannot detect rendered HTML or interaction problems.

**Recommendation**  
Add lightweight checks for patterns that can be validated safely in Markdown, including skipped heading levels, empty link destinations, untagged code blocks, and unexplained blank cells. Use human review for alt-text meaning and contextual table decisions. Establish a separate rendered-page review for keyboard access, focus, screen-reader output, motion, and visual presentation.

**Examples**  
The accessibility skill already defines the relevant authoring dimensions and can be used to define checks. Treat automated results as review prompts, not an assertion of WCAG conformance.

## Repository-Wide Improvement Opportunities

- **Global content fixes:** Replace confirmed “here” links and the empty README destination; resolve heading-level skips; clarify the purpose of blank cells; separate image styling markers from accessible names.
- **Authoring guideline updates:** Add explicit guidance for meaningful image alternatives, decorative images, table headers and intentional blanks, code-fence language tags, GIF motion and written alternatives, and descriptive links.
- **Documentation process improvements:** Add an accessibility checklist to content review and require manual rendered-page checks for representative pages, especially those with tables, images, or animated content.
- **Automated validation opportunities:** Check heading-level progression, missing/empty image alternatives, empty link destinations, untagged code fences, and blank table cells in changed Markdown files. Do not automatically rewrite content or treat intentional blank data as an error without review.
- **Future contribution checkpoints:** Confirm heading structure and links during authoring; review alternatives and table semantics before merge; verify keyboard and screen-reader behavior after rendering; recheck motion and contrast in the published site.

## Positive Findings

- The repository provides a detailed accessibility audit skill with eight weighted dimensions and concrete authoring checks.
- The scan found no empty Markdown image alternatives of the form `![](...)` in the production documentation. The 19 reviewed GIF references include alternatives in their source.
- Link text is generally descriptive; the vague “here” links are a small number of confirmed exceptions in the inspected files.
- Many pages use descriptive headings and introduce examples and tables with explanatory prose.
- The repository uses designated callout syntax such as `>note`, `>important`, and `>warning`. The distinct `>caption` pattern is used for figure captions and should not be treated as a warning or note callout.
- The source search found no video, audio, or iframe embeds. This does not rule out media or interactive content added during rendering.
- `README.md` asks contributors to use standard Markdown and preview changes, and links to the documentation authoring wiki.

## Prioritized Remediation Plan

### Immediate Actions

1. Replace the three confirmed vague “here” links with descriptive link text and fix or remove the empty README link destination.
2. Correct the known H1-to-H3 and H2-to-H4 heading jumps, then review the remaining heading-scan results in context.
3. Clarify blank cells in the cited reference and TRANSPOSE tables without changing intentional example data.
4. Replace the `><` image styling marker in accessible names with a presentation mechanism that does not alter alternative text.

### Short-Term Improvements

1. Review all 19 animated GIFs for duration, motion, pause/stop needs, and written equivalents for instructional steps.
2. Add a language identifier to the untagged compiler-output block and check future code samples for appropriate tags and introductions.
3. Add automated Markdown checks for repeatable source patterns, with an exception/review mechanism for legitimate examples.
4. Update contributor guidance with accessibility-specific authoring and review criteria based on the repository skill.

### Long-Term Improvements

1. Test representative rendered documentation pages with keyboard-only navigation and screen readers.
2. Add rendered HTML checks for heading semantics, table header associations, image alternatives, focus visibility, and contrast.
3. Include accessibility review in the regular publication and pull-request process, and periodically re-audit pages that use complex tables, animated media, or custom HTML.
4. Track remediation as discrete page-level and process-level tasks so the team can verify fixes and prevent regression.
