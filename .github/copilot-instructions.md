# Copilot Instructions for document-processing-docs

This repository contains the public documentation for Telerik Document Processing Libraries (DPL): RadPdfProcessing, RadWordsProcessing, RadSpreadProcessing, RadSpreadStreamProcessing, RadZipLibrary, and related topics. Content is Markdown with YAML frontmatter, Liquid slug links (`{%slug ...%}`), custom admonitions (`>note`, `>tip`, `>important`, `>caution`, `>warning`), and optional external snippet placeholders (`<snippet id='...'/>`).

## Skill-First Operating Rules

The repository ships task-specific skills under `.github/skills/`. These rules apply to every significant task: writing, editing, reviewing, scoring, analyzing, remediating, or generating documentation.

> **Repository skills are authoritative.**
>
> - Whenever a repository skill covers a task, you MUST treat that skill as the authoritative guidance for the task.
> - Repository skills MUST take precedence over default Copilot behavior and generic documentation-writing practices.
> - You MAY use generic documentation-writing practices only when no repository skill covers the requested task. In that case, follow [Fallback Behavior](#fallback-behavior).

### Mandatory Skill Discovery Workflow

Before you start any significant task, you MUST complete these steps in order:

1. **Identify the task.** Determine what is being requested, for example a new article, an edit from feedback, a PR review, a scoring report, or a snippet extraction.
2. **Consult the routing table.** Find the matching row or rows in [Skill Routing](#skill-routing). If no row matches, continue to step 3 anyway.
3. **Locate all relevant skills.** Search `.github/skills/` recursively, including `telerik-documentation-style-guide/` and its sub-skills. You MUST NOT stop at the first match; collect every skill whose triggers fit the task.
4. **Read each matching `SKILL.md` in full.** You MUST NOT act on a skill's name or description alone.
5. **Read referenced files.** You MUST read every file a matching skill references, including its `references/` folder (for example, `style-grammar-words/references/word-replacements.md` and `style-brand-terms/references/vocabulary.md`).
6. **Apply the skill workflow exactly.** You MUST follow the step order, scope rules, and output formats the skill defines. You MUST NOT substitute an ad hoc process when a skill defines one.
7. **Resolve conflicts.** When skills disagree, you MUST apply the [Precedence Rules](#precedence-rules) and the [Multi-Skill Execution Order](#multi-skill-execution-order).
8. **Report the skills used.** You MUST report skills as defined in [Skill Reporting](#skill-reporting).

If the discovery finds no applicable skill, you MUST follow [Fallback Behavior](#fallback-behavior).

### Precedence Rules

- `dpl-docs-article-from-links` (section "DPL Article Conventions") is the single source for DPL-specific conventions: frontmatter field sets, slug patterns, article templates, admonition syntax, code-example rules, snippet placeholders, and version badges. Where it overlaps with `telerik-documentation-style-guide`, it wins.
- `telerik-documentation-style-guide/*` is authoritative for everything else: tone, grammar, punctuation, title case, lists, tables, formatting, brand terms, and metadata quality.
- Scoring skills (`style-guide-scoring`, `llm-doc-optimization`, `seo-doc-optimization`, `accessibility-doc-optimization`) evaluate content; they do not override authoring conventions.

### Multi-Skill Execution Order

When several skills apply, you MUST combine them and run them in this order:

1. **Task-specific skills.** These skills define the job and its workflow, for example the Workflow steps in `dpl-docs-article-from-links` (fetch links, extract the public API delta, decide update vs. new article, manage the branch) or `dpl-docs-code-extractor`.
2. **Repository authoring skills.** The "DPL Article Conventions" section of `dpl-docs-article-from-links` supplies frontmatter, slugs, templates, admonitions, code rules, links, images, and version badges.
3. **Style-guide skills.** All applicable `telerik-documentation-style-guide/*` sub-skills (`style-writing-tone`, `style-grammar-words`, `style-structure`, `style-formatting`, `style-metadata-links`, `style-brand-terms`, and `style-kb-faq` for KB or FAQ content) refine the content.
4. **Scoring and optimization skills.** `style-guide-scoring`, `llm-doc-optimization`, `seo-doc-optimization`, and `accessibility-doc-optimization` run last to evaluate the result.

Additional rules:

- Scoring skills evaluate content. They MUST NOT redefine authoring conventions. When a scoring finding contradicts a DPL convention, the convention wins and you SHOULD note the finding as not applicable.
- Conflicts between skills MUST be resolved according to the [Precedence Rules](#precedence-rules).
- Example: writing a new KB article runs `dpl-docs-article-from-links` (KB template), then every `telerik-documentation-style-guide` sub-skill including `style-kb-faq`, then optionally the scoring skills for a quality check.

### Trigger Restrictions

- `dpl-docs-code-extractor` is manual-trigger only. You MUST NOT invoke it unless the user explicitly asks to extract or externalize snippets and supplies a PR, branch, or file paths.
- `dpl-docs-writing` is obsolete. You MUST NOT use it.

### Skill Reporting

Report the skills you applied in the final response according to the output type:

| Output Type | Skill Reporting |
|---|---|
| Audits | Required |
| Analyses | Required |
| Remediation plans | Required |
| Scoring reports | Required |
| Substantial content generation (new articles, multi-section rewrites, link-driven doc updates) | Required |
| Minor edits, small rewrites, and routine PR comments | Optional |

## Skill Inventory

| Skill | Path | Purpose | Triggers | Expected Output | Related Tasks |
|---|---|---|---|---|---|
| `dpl-docs-article-from-links` | `.github/skills/dpl-docs-article-from-links/SKILL.md` | Turns Azure DevOps or GitHub links into documentation updates limited to new or changed public API and behavior. Also defines all DPL article conventions. | User supplies PR, PBI, bug, task, feature, or issue links and wants docs updated; any new article or substantial edit that needs DPL templates, frontmatter, slugs, admonitions, or code rules. | Created or updated articles on a new local branch (`docs/<slug>`), unstaged and uncommitted; per-link report of related items discovered, public API delta, files touched, and skipped internal-only changes. | Feature articles, format-provider articles, KB articles, release-driven doc updates, version badges. |
| `dpl-docs-code-extractor` | `.github/skills/dpl-docs-code-extractor/SKILL.md` | Moves fenced C# blocks from docs into the `DPL_Documentation_Code` solution in `document-processing-docs-tasks` and replaces them with `<snippet id='...'/>` placeholders. | **Only** when the user explicitly asks to extract or externalize snippets and supplies a PR, branch, or file paths. | Snippet `.cs` code with `// >> id` / `// << id` markers, Markdown placeholders, successful builds for `Debug-net8` and `Debug-net8-windows`, and a per-PR/branch report. No commits or pushes. | Snippet externalization, snippet ID naming, `#if NET8_0_WINDOWS` splits. |
| `style-guide-scoring` | `.github/skills/style-guide-scoring/SKILL.md` | Scores one article against the local Telerik style guide. | Style review, style compliance evaluation, docs scoring. | JSON only: 8 dimensions (metadata, titles and headings, tone and voice, grammar and language, formatting conventions, lists, punctuation, structure and completeness) with 1–5 scores, rationale, violations, and weighted `overall_score`. | Style audits, pre-merge reviews, docs-scoring runs. |
| `llm-doc-optimization` | `.github/skills/llm-doc-optimization/SKILL.md` | Scores one article for LLM and AI-agent readability (parsing, chunking, retrieval, reasoning). | LLM readability, RAG suitability, AI-assistant grounding quality. | JSON only: 8 dimensions (semantic structure, self-contained sections, terminology consistency, code block quality, retrieval metadata, chunk coherence, reference and link quality, formatting signal clarity) with weighted `overall_score`. | AI tooling content, MCP/assistant grounding, chunk-friendly rewrites. |
| `seo-doc-optimization` | `.github/skills/seo-doc-optimization/SKILL.md` | Scores one article for traditional and modern SEO (metadata, keywords, linking, search intent, E-E-A-T, task completion). | SEO review, discoverability, meta title or description quality. | JSON only: 12 dimensions split into Technical SEO and Modern SEO with weighted `overall_score`. | Metadata fixes, title and description rewrites, internal linking improvements. |
| `accessibility-doc-optimization` | `.github/skills/accessibility-doc-optimization/SKILL.md` | Scores one article for accessibility (WCAG 2.1 AA, plain language, assistive technology). | Accessibility review, alt text, link text, table headers, readability. | JSON only: 8 dimensions (heading structure, alternative text, link text clarity, plain language, table accessibility, formatting independence, callout structure, code block accessibility) with weighted `overall_score`. | Accessibility audits, image and table remediation. |
| `style-writing-tone` | `.github/skills/telerik-documentation-style-guide/style-writing-tone/SKILL.md` | Active voice, imperative mood, present tense, gerund avoidance, sentence and paragraph length, simple and inclusive language. | Drafting or rewriting prose; "fix the tone", "simplify the language". | Compliant prose. | All writing and editing. |
| `style-grammar-words` | `.github/skills/telerik-documentation-style-guide/style-grammar-words/SKILL.md` (+ `references/word-replacements.md`) | Modal verbs, contractions, singular and plural, numbers, punctuation, Oxford comma, en dash ranges, word replacements. | "Fix grammar", "check word choice", "review punctuation". | Corrected text. | All writing and editing. |
| `style-structure` | `.github/skills/telerik-documentation-style-guide/style-structure/SKILL.md` | Article skeleton, title case, heading levels and style, list rules. | New article skeletons, heading or list fixes, restructuring. | Valid heading hierarchy and list formatting. | All writing and editing. |
| `style-formatting` | `.github/skills/telerik-documentation-style-guide/style-formatting/SKILL.md` | Bold UI labels, monospace code and keys, italics for new terms, admonitions, code blocks, screenshots, code comments. | "Format the article", "add a note", "check code blocks". | Consistently formatted elements. | All writing and editing. |
| `style-metadata-links` | `.github/skills/telerik-documentation-style-guide/style-metadata-links/SKILL.md` | Frontmatter fields, description rules (120–150 characters), slug links, anchor text, external links. | "Fix metadata", "add frontmatter", "check links", "improve SEO". | Valid frontmatter and links. | New articles, metadata and link audits. |
| `style-brand-terms` | `.github/skills/telerik-documentation-style-guide/style-brand-terms/SKILL.md` (+ `references/vocabulary.md`) | Progress and Telerik trademarks, product names, interaction verbs, DPL vocabulary. | Product names, "click/tap/select/press", terminology checks. | Correct brand and vocabulary usage. | All writing and editing. |
| `style-kb-faq` | `.github/skills/telerik-documentation-style-guide/style-kb-faq/SKILL.md` | KB article types (how-to, troubleshooting, CVE/security), titles, required sections, FAQ formatting. | Writing or reviewing anything under `knowledge-base/` or FAQ sections. | KB/FAQ-compliant articles. | KB authoring, support-to-docs conversion. |
| `dpl-docs-writing` | `.github/skills/dpl-docs-writing/SKILL.md` | **Obsolete pointer.** Defines no rules. | Never. | None. | Redirects to `dpl-docs-article-from-links` and `telerik-documentation-style-guide`. |

## Skill Routing

Use this table to choose skills. Read every listed skill before acting.

| Task | Skills to Apply | Notes |
|---|---|---|
| Update docs from ADO/GitHub links (PRs, PBIs, bugs, features) | `dpl-docs-article-from-links` + all `telerik-documentation-style-guide/*` | Public API only. New branch, no staging, no commits, no pushes. Search for existing articles before creating new ones. |
| Write a new feature or format-provider article | `dpl-docs-article-from-links` (DPL Article Conventions) + `style-structure`, `style-metadata-links`, `style-formatting`, `style-writing-tone`, `style-grammar-words`, `style-brand-terms` | Use the matching template, slug pattern, and frontmatter field set. |
| Write or edit a KB article (`knowledge-base/`) | `dpl-docs-article-from-links` (KB template) + `style-kb-faq` + remaining `telerik-documentation-style-guide/*` | `type` and `res_type` frontmatter and the `## Environment` table are KB-only. |
| Edit an existing article based on feedback | All `telerik-documentation-style-guide/*` + `dpl-docs-article-from-links` conventions | Preserve unrelated frontmatter, code blocks, Liquid tags, and snippet placeholders. |
| Optimize or fix article style | All seven `telerik-documentation-style-guide/*` sub-skills with their `references/` files | Same rules the `dpl-docs-style-optimizer` agent applies. |
| Review or score an article (full quality review) | `style-guide-scoring` + `llm-doc-optimization` + `seo-doc-optimization` + `accessibility-doc-optimization` | Produce each skill's JSON exactly as specified; then summarize. |
| Style compliance review only | `style-guide-scoring` | JSON output only. |
| SEO, metadata, or discoverability review | `seo-doc-optimization` + `style-metadata-links` | Description must be 120–150 characters; never exceed 150. |
| Accessibility review (alt text, link text, tables, headings) | `accessibility-doc-optimization` + `style-formatting` + `style-structure` | |
| LLM/AI readability review | `llm-doc-optimization` | |
| Remediation plan from scores or feedback | Scoring skill(s) that produced the findings + the `telerik-documentation-style-guide` sub-skill that owns each violated rule | Map every finding to the rule and skill that defines the fix. |
| Extract C# snippets into `DPL_Documentation_Code` | `dpl-docs-code-extractor` | **Explicit user request only**, with PR, branch, or file paths. Both configurations must build. |
| Brand names, product names, interaction verbs | `style-brand-terms` + `dpl-docs-article-from-links` (Section 10, Product Terminology) | |
| Links, slugs, cross-references, See Also | `style-metadata-links` + `dpl-docs-article-from-links` (Section 7) | |
| Admonitions, code blocks, images | `style-formatting` + `dpl-docs-article-from-links` (Sections 5, 6, 8) | DPL admonition syntax (`>note`, `>tip`) wins over generic Markdown. |

### Related Custom Agents

The agents in `.github/agents/` wrap these skills. Prefer the agent when the user asks for its workflow by name.

| Agent | Skills Used |
|---|---|
| `dpl-docs-generator` | `dpl-docs-article-from-links`, `telerik-documentation-style-guide/*` |
| `dpl-docs-style-optimizer` | All `telerik-documentation-style-guide/*` sub-skills and references |
| `docs-scoring` | `style-guide-scoring`, `llm-doc-optimization`, `seo-doc-optimization`, `accessibility-doc-optimization` |
| `docs-editor` | `telerik-documentation-style-guide/*` plus the four scoring skills for quality checks |
| `dpl-docs-analyzer` | `telerik-documentation-style-guide/*` |
| `dpl-docs-code-extractor` | `dpl-docs-code-extractor` |
| `docs-code-reader` | Resolves `<snippet id='...'/>` and `{{source=... region=...}}` placeholders from `DPL_Documentation_Code` |
| `dpl-docs-create-sdk` | Scaffolds a runnable C# console project from a KB article |
| `dpl-docs-feedback-analyzer` | Analyzes customer feedback CSV files against the referenced articles |

## Agent Execution Workflow

This workflow applies to GitHub Copilot Coding Agent sessions assigned to issues, PR-review agents, the custom agents in `.github/agents/`, and any other Copilot automation running in this repository. Agents MUST execute these steps in order:

1. **Read these instructions first.** Load `.github/copilot-instructions.md` before reading issues, diffs, or articles.
2. **Determine the task category.** Classify the request: link-driven doc update, new article, KB article, feedback-driven edit, style optimization, PR review, scoring or audit, remediation plan, or snippet extraction.
3. **Consult Skill Routing.** Map the category to its row in [Skill Routing](#skill-routing). For PR reviews, also apply [Pull Request Review Guidance](#pull-request-review-guidance).
4. **Load all applicable skills.** Complete the [Mandatory Skill Discovery Workflow](#mandatory-skill-discovery-workflow), including `references/` files.
5. **Follow skill-defined workflows.** Execute skills in the [Multi-Skill Execution Order](#multi-skill-execution-order). Do not skip mandatory steps such as related-work discovery in `dpl-docs-article-from-links` or both-configuration builds in `dpl-docs-code-extractor`.
6. **Apply repository guardrails.** Enforce every rule in [Repository Guardrails](#repository-guardrails), especially public-API-only scope and Git safety.
7. **Produce outputs in the skill-defined format.** Scoring skills return their JSON structure exactly; workflow skills return the report their final step defines.
8. **Report the skills used** for audits, analyses, remediation plans, scoring reports, and substantial content, as defined in [Skill Reporting](#skill-reporting).

If a step cannot be completed (for example, a required external skill or repository is unavailable), the agent MUST state the blocker in its output instead of silently skipping the step.

## Documentation Quality Requirements

Every created or edited Markdown article must be evaluated against the relevant skills for:

- **Markdown quality and structure** — exactly one H1 matching `title`, no skipped heading levels, `#### __Example N: ...__` for example headings, `## See Also` as the last H2 (`style-structure`, `dpl-docs-article-from-links`).
- **Metadata** — complete frontmatter for the article type, 120–150 character `description`, unique kebab-case `slug` following the library pattern (`style-metadata-links`, `dpl-docs-article-from-links`).
- **Links** — internal links use `{%slug ...%}`, external links use HTML anchors with `target="_blank"`, descriptive anchor text, no "click here" (`style-metadata-links`, `accessibility-doc-optimization`).
- **Style and tone** — active voice, imperative instructions, present tense, approved contractions only, American English (`style-writing-tone`, `style-grammar-words`).
- **Formatting** — bold UI elements, monospace code, DPL admonition syntax, `csharp` or `C#` fences (both are valid; never rewrite one into the other) (`style-formatting`).
- **Terminology** — `RadPdfProcessing`, `RadWordsProcessing`, `RadSpreadProcessing`, `RadSpreadStreamProcessing`; correct trademarks and interaction verbs (`style-brand-terms`).
- **Accessibility** — meaningful alt text, table header rows, information not conveyed by formatting alone (`accessibility-doc-optimization`).
- **Content quality** — task-focused, self-contained sections, runnable minimal examples, no invented behavior (`seo-doc-optimization`, `llm-doc-optimization`, `dpl-docs-article-from-links`).

## Pull Request Review Guidance

When reviewing a pull request:

- **Review changed files first.** Start with the diff and the full content of each changed article.
- **Limit scope to changed files.** Do not review unchanged articles unless the user asks for broader analysis. Comment on unchanged lines only when the change directly affects them, for example a broken slug reference or a heading hierarchy the change invalidates.
- **Use the applicable repository skills.** Evaluate each changed file against the skills in [Skill Routing](#skill-routing) for its article type and against [Documentation Quality Requirements](#documentation-quality-requirements).
- **Categorize findings by severity:**

  | Severity | Meaning | Examples |
  |---|---|---|
  | Critical | Breaks the build, rendering, or correctness | Invalid frontmatter, broken `{%slug ...%}` link, duplicate slug, documented internal or nonexistent API, removed or altered `<snippet id='...'/>` placeholder |
  | Major | Violates a required DPL convention or guardrail | Missing `## See Also`, multiple H1s, `description` outside 120–150 characters, KB-only fields in a feature article, wrong product name |
  | Minor | Violates a style-guide rule without affecting correctness | Passive voice, unapproved contraction, title-case error, inconsistent list punctuation |
  | Suggestion | Optional improvement | Clearer anchor text, tighter wording, additional cross-link |

- **Link each finding to its rule.** Cite the skill and section that defines the rule, for example `dpl-docs-article-from-links` › Section 6 Admonitions or `style-grammar-words` › Contractions.
- **Do not contradict repository conventions.** Never suggest changes that conflict with DPL conventions or the style guide, such as converting `>note` to GitHub alert syntax, rewriting `C#` fences to `csharp` (or the reverse), or replacing slug links with relative paths.

## Repository Guardrails

- **Public API only.** Never document internal, private, test-only, or unshipped behavior.
- **Do not invent behavior.** If code or behavior is ambiguous, state the gap and ask.
- **Update over duplicate.** Search `libraries/`, `getting-started/`, `knowledge-base/`, `common-information/`, `integration/`, `troubleshooting/`, and `security/` for an existing article before creating a new one.
- **Preserve protected content.** Do not modify unrelated frontmatter fields, code blocks, Liquid tags, or existing `<snippet id='...'/>` placeholders.
- **Omit platform-injected content.** No "Updated on" lines, trial CTAs, support links, copyright notices, or cookie banners.
- **Git safety.** Skill workflows that create branches leave changes unstaged and uncommitted. Never stage, commit, push, or force-push unless the user explicitly asks.
- **Line endings.** Use LF line endings and no trailing blank lines in Markdown files.

## Fallback Behavior

When the [Mandatory Skill Discovery Workflow](#mandatory-skill-discovery-workflow) finds no repository skill for the task:

1. **State the gap.** Say explicitly that no matching repository skill was identified for the task.
2. **Fall back to general best practices.** Use general technical documentation best practices for the uncovered part of the task.
3. **Preserve repository conventions.** Continue to apply everything else in these instructions, including [Documentation Quality Requirements](#documentation-quality-requirements), [Repository Guardrails](#repository-guardrails), and any DPL convention that applies to the content being touched. Fallback guidance MUST NOT override a repository convention.
4. **Identify the fallback guidance.** In the final response, name which guidance was used as fallback and which parts of the output it affected.

When a skill covers only part of a task, apply the skill to that part and use fallback behavior only for the remainder.

## External Skill Dependencies

Some skills reference skills that are not stored in this repository: `caveman` (communication style), `issue-analysis` (URL pattern detection), and `ado-mcp-read` (Azure DevOps work item reads). Use them when available in the environment. If they are unavailable, continue with the workflow defined in the repository skill and note the missing dependency in the final report.
