---
name: dpl-docs-article-from-links
description: Use when the user supplies Azure DevOps or GitHub links (PRs, PBIs, bug/task work items, feature implementations) and wants the document-processing-docs repository updated to reflect new PUBLIC API/behavior introduced by that work. Fetches each link, proactively searches for related linked work (parent/child items, associated PRs/commits), extracts only public-API-relevant changes, and creates or updates docs articles in a new unpushed/uncommitted branch. Also defines the DPL article conventions (frontmatter and slug patterns per article type, article templates, admonition syntax, code-example and snippet rules, version badges) on top of the telerik-documentation-style-guide resources.
---

# dpl-docs-article-from-links

## Communication Style

Read and apply the `caveman` skill (intensity: **full**).

## Purpose

Turn one or more Azure DevOps / GitHub links into documentation changes inside `document-processing-docs` — updating existing articles or creating new ones — strictly limited to newly introduced or changed **public API and public-facing behavior**. Internal/refactor-only changes are never documented.

## Scope Rule (critical)

- ✅ Document only: public classes/methods/properties/enums that are new or changed, and the user-visible behavior they enable.
- 🚫 Never document: internal/private implementation details, refactors with no public surface change, test code, or speculative/unshipped features.
- If a link contains both public and internal changes, extract and document only the public part.

## Repository

Docs repo folder name (fixed across machines): `document-processing-docs`. Resolve the local path (default `C:\Work\document-processing-docs`); if not found there, look for a sibling of the current repo root with that exact name; if still not found, **ask the user**.

## Workflow

### Step 1 — Parse input links
Accept any mix in one request: GitHub PR/issue URLs, ADO PR URLs, ADO work item URLs (PBI/Bug/Task/Feature). Detect source (GitHub vs ADO) and type per the URL pattern table in the `issue-analysis` skill.

### Step 2 — Fetch each supplied link
- **GitHub PR** → `github-mcp-server-pull_request_read` (diff + description). **GitHub issue** → `github-mcp-server-issue_read`.
- **ADO work item** → follow the `ado-mcp-read` skill: `ado/wit_get_work_item` with `expand: "all"`, project `DevTools`, plus `ado/wit_list_work_item_comments`.
- **ADO PR** → `ado/repo_pull_request` (and `ado/repo_pull_request_thread` for discussion context) to get the diff, title, description.

### Step 3 — Proactively discover related work (mandatory, do this even if not asked)
For every fetched item, look for and follow:
- Parent/child work item links (`System.LinkTypes.Hierarchy-*` relations in ADO responses).
- Linked pull requests (`ArtifactLink` relations in ADO; "linked PRs" / closing keywords in GitHub issue bodies).
- Linked commits and cross-referenced issues/PRs mentioned in descriptions or comments.
Fetch each related item found this way and include it in context if it is relevant to the public API surface being documented (i.e., it touches the same feature/type). Stop expanding once new links stop surfacing genuinely related public-API context — do not chase unrelated tangents.

### Step 4 — Extract the public API delta
- Read the actual diff/code changes (via `search`/`read`/`github-mcp-server-get_file_contents`/`ado/repo_file` as needed) for every relevant PR.
- List every new/changed public type, member, or enum value, plus the resulting user-visible behavior.
- Discard anything not reachable from public API surface (internal helpers, private fields, test-only code).

### Step 5 — Decide update vs. new article
- Search `document-processing-docs` (`libraries/`, `getting-started/`, `knowledge-base/`, `common-information/`, `integration/`, `troubleshooting/`, `security/`) for existing articles covering the affected type/feature (by class/namespace name, feature name, or folder convention under the relevant `libraries/<product>/` tree).
- If a matching article exists → update it in place (add a section, extend an example, update a table) preserving its existing structure.
- If none exists → create a new article using the appropriate feature, format-provider, or Knowledge Base template from the "DPL Article Conventions" section below, together with the local `telerik-documentation-style-guide` resources.

### Step 6 — Apply the style guide
Before writing anything, load and apply **all** of these (equal weight, same rules used by `dpl-docs-style-optimizer`):
- `.github/skills/telerik-documentation-style-guide/style-metadata-links/SKILL.md`
- `.github/skills/telerik-documentation-style-guide/style-structure/SKILL.md`
- `.github/skills/telerik-documentation-style-guide/style-formatting/SKILL.md`
- `.github/skills/telerik-documentation-style-guide/style-writing-tone/SKILL.md`
- `.github/skills/telerik-documentation-style-guide/style-grammar-words/SKILL.md` (+ `references/word-replacements.md`)
- `.github/skills/telerik-documentation-style-guide/style-brand-terms/SKILL.md` (+ `references/vocabulary.md`)
- `.github/skills/telerik-documentation-style-guide/style-kb-faq/SKILL.md` (only for KB/FAQ articles)

Apply the same protected-content rules the style optimizer uses: don't touch unrelated frontmatter fields, don't touch unrelated code blocks/Liquid tags, keep heading hierarchy valid, don't shrink existing content by breaking it.

Then apply the DPL-specific conventions in the "DPL Article Conventions" section below. Those conventions cover the repository specifics the style guide does not describe (frontmatter field sets, slug patterns, article templates, admonition syntax, snippet placeholders, version badges). **Where a DPL-specific convention and a `telerik-documentation-style-guide` rule overlap, the rule in this skill wins**; for everything the section does not mention (title case, tone, grammar, punctuation, lists, tables), the style guide is authoritative.

### Step 7 — Branch management (no commits)
- Fetch `origin`, ensure the local default branch is up to date.
- Create a **new branch off the up-to-date default branch**, e.g. `docs/<slug-summarizing-the-change>`.
- If the request covers multiple links resulting in multiple articles, make all the changes on this single new branch (one branch per request) unless the user explicitly asks for separate branches per item.
- Make all edits/creations in the working tree. **Never stage, never commit, never push.** Leave changes unstaged and uncommitted for review.

### Step 8 — Report
Summarize per processed link: source type, title, related items discovered, public API delta identified, article(s) created or updated (paths), and the branch name used. Explicitly call out anything skipped because it was internal-only/non-public.

## DPL Article Conventions

These are the repository-specific conventions for articles published to [telerik/document-processing-docs](https://github.com/telerik/document-processing-docs). They complement the `telerik-documentation-style-guide` resources listed in Step 6 and take priority over them wherever the two overlap.

### 1. YAML Frontmatter

Every article **must** start with a YAML frontmatter block. The field set depends on the article type.

**Library / feature / format-provider article:**

```yaml
---
title: <Human-readable title>
description: <One sentence, 120–150 characters, SEO meta description; avoid "This article contains...">
page_title: <Same as title, or a shorter variant for the browser tab; may differ from title for SEO>
slug: <unique-kebab-case-slug>
tags: <comma-separated lowercase tags>
published: True
position: <integer for ordering in the sidebar>
---
```

**Knowledge Base article:**

```yaml
---
title: <Title of the KB article>
description: <One sentence, 120–150 characters, SEO meta description>
type: how-to
page_title: <Title for the browser tab>
slug: <unique-kebab-case-slug>
tags: <comma-separated lowercase tags>
res_type: kb
---
```

>important The `type` and `res_type` fields and the `## Environment` table are **exclusive to Knowledge Base articles**. Never add them to feature or format-provider articles.

### 2. Slug Conventions

- PdfProcessing features: `radpdfprocessing-features-<feature-name>`
- WordsProcessing: `radwordsprocessing-<area>-<feature>`
- SpreadProcessing: `radspreadprocessing-<area>-<feature>`
- SpreadStreamProcessing: `radspreadstreamprocessing-<area>-<feature>`
- Knowledge Base: `<descriptive-kebab-case-name>` (no library prefix)

Slugs are unique, lowercase, and hyphen-separated. Match the pattern used by neighboring articles in the target directory, and follow `.github/skills/telerik-documentation-style-guide/style-metadata-links/SKILL.md` for everything else about metadata.

### 3. Article Templates

**Feature / behavioral-change article:**

```
# <Feature Name>

<Opening paragraph: 1–3 sentences describing what the feature does, when it was introduced, and which library it belongs to.>

## <Core Section>
<Behavior, affected APIs, properties.>

## Using <FeatureName>
#### __Example 1: <Description>__
<code snippet>
<Explanatory paragraph after the example.>

## See Also
<Bullet list of related links.>
```

**FormatProvider article:**

```
# Using <ProviderName>

<Opening paragraph: what the provider does, which document type it handles.>

<Required package references as a bullet list.>

## Import
#### __Example 1: Import from a file__
<code snippet>

## Export
#### __Example 2: Export to a file__
<code snippet>

## See Also
<Bullet list of related links.>
```

**Knowledge Base article:**

```
# <Title>

## Environment
| Version | Product | Author |
| --- | --- | --- |
| <version> | Document Processing Libraries | <author> |

## Description
<Problem description with context.>

## Solution
<Step-by-step solution with code examples.>

## See Also
<Bullet list of related links.>
```

KB title conventions: use the `-ing` form for how-to topics ("Signing Multiple Signature Fields"); use a full sentence stating the problem for troubleshooting topics ("Dates Are Treated As Strings during Grid Data Operations").

### 4. Headings

- Exactly one H1, immediately after the frontmatter, matching the `title` field.
- H4 (`####`) is reserved for example headings and is wrapped in double underscores: `#### __Example 1: <Description>__`.
- Never skip heading levels.

For title case, parallelism, punctuation, and bridge text, follow `.github/skills/telerik-documentation-style-guide/style-structure/SKILL.md`.

### 5. Code Examples

- Use either `csharp` or `C#` as the fence language tag. Both are supported by the documentation toolchain and are equivalent; never rewrite one into the other.
- Use fully qualified type names on first usage in an article (for example, `Telerik.Windows.Documents.Flow.FormatProviders.Docx.DocxFormatProvider`); short names afterwards.
- Always include the `TimeSpan? timeout` parameter in import/export calls, using `TimeSpan.FromSeconds(10)` as the example value.
- Wrap stream usage in `using` statements; use `File.OpenRead()` for import and `File.OpenWrite()` for export.
- Keep examples minimal but copy-paste runnable.
- Introduce each example with a descriptive sentence or bold caption, and add a brief explanatory paragraph after it.
- Code comments: American English, `//` single-line form, up to 80 characters per line; full sentences start with a capital letter and end with a period, fragments do neither.

**Snippet placeholders.** Articles in this repository may reference externalized snippets instead of inline code:

```
<snippet id='pdf-import-file'/>
```

Never create, duplicate, or overwrite a `<snippet id='...'/>` placeholder from this skill — externalizing code is the job of the `dpl-docs-code-extractor` skill. Write new examples as inline fenced blocks and leave existing placeholders untouched.

### 6. Admonitions

The repository uses a custom admonition syntax, not standard GitHub markdown:

| Type | Syntax | Renders as |
|---|---|---|
| Note | `>note Text here` | Blue info box |
| Important | `>important Text here` | Orange warning box |
| Caution | `>caution Text here` | Red alert box |
| Warning | `>warning Text here` | Red or orange warning box |
| Tip | `>tip Text here` | Green tip box |
| Plain blockquote | `> Text here` | Indented quote |

- One blank line before and after each admonition.
- No blank line between the marker and its text; continue on following `>` prefixed lines.
- Keep admonitions to 1–3 sentences.

### 7. Links

- Internal links use the slug syntax:

  ```markdown
  [the `RadFixedDocument` model]({%slug radpdfprocessing-model-radfixeddocument%})
  ```

- External links use HTML with `target="_blank"`:

  ```markdown
  <a href="https://learn.microsoft.com/en-us/dotnet/" target="_blank">the .NET documentation</a>
  ```

- `## See Also` is always the last H2 section, uses `*` bullets, and links related articles by slug plus API reference links when relevant.

Anchor-text quality rules (descriptive keywords, no "click here", paraphrased internal titles) come from `.github/skills/telerik-documentation-style-guide/style-metadata-links/SKILL.md`.

### 8. Images

- Reference images with relative paths: `![Alt text description](images/image-file-name.png)`.
- Place image files in an `images/` subfolder next to the article.
- Always provide descriptive alt text.

### 9. Minimum Version Badges

When the documented feature ships in a specific release, add a version badge table immediately after the H1:

```markdown
# Feature Name

|Minimum Version|Q3 2025|
|----|----|
```

### 10. Product Terminology

Use `RadPdfProcessing`, `RadWordsProcessing`, `RadSpreadProcessing`, and `RadSpreadStreamProcessing` (never "PDF Processing", "Words Processing", and so on). Use "format provider" in lowercase when generic and the code-formatted type name when specific. Use "import"/"export" rather than "load"/"save" unless the text is specifically about files.

### 11. Content to Omit

- No "Updated on &lt;date&gt;" lines — the platform generates them.
- No trial CTAs, support links, copyright notices, or cookie banners — the site template injects them.

### 12. Output Requirements

Every created or updated article must start with the frontmatter block, contain exactly one H1 matching `title`, follow the matching template from Section 3, end with `## See Also`, use LF line endings, and have no trailing blank lines.

## Rules

- **Public API only** — this is the hard scope boundary; when in doubt, exclude rather than include.
- **This skill is the single source for DPL article conventions** — do not defer to any other DPL writing skill; the conventions above plus the `telerik-documentation-style-guide` resources are complete on their own.
- **Search for related context proactively** — never limit to just the links given if a parent/child/linked PR clearly completes the picture.
- **Update over duplicate** — always search for an existing article before creating a new one.
- **Style guide is non-negotiable** — every generated/edited article must pass the same checks `dpl-docs-style-optimizer` would apply.
- **New branch, no commits, no pushes** — same non-destructive posture as `dpl-docs-style-optimizer`'s fix mode, but this skill never commits at all.
- **Multi-link requests** — process every supplied link from a single user request in one pass; do not stop after the first.
- **Do not invent behavior** — if code/behavior is ambiguous from the diff and comments, note the gap and ask the user rather than guessing.
