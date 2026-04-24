---
name: seo-meta-tags
description: 'Use this skill to validate and improve the tags: SEO frontmatter field of Markdown documentation articles in the Telerik Document Processing docs repository. Apply it when the user asks to enrich, fix, audit, or optimize SEO tags on one article, a folder, or the entire repo. Also use when asked to "check tags", "improve tags", "add SEO tags", "fix article tags", or "run a tag audit". The skill enforces the established house rules: 6-12 single-word, comma-separated, article-specific tags per page — no filler, no duplicates, no multi-word tags with spaces.'
---

# SEO Meta Tags — Telerik Document Processing Docs

This skill validates and rewrites the `tags:` line in the YAML frontmatter of Markdown documentation articles. Its goal is to maximise the discoverability of each article through search engines while keeping the tag set tight, accurate, and consistent with the repo-wide standard established in commit `defb303d`.

---

## The House Rules

These rules were derived directly from 594 manually curated articles. Follow them exactly.

### Count
- **6 to 12 tags per article.** Aim for 8 as the sweet spot.
- Fewer than 6 means the article is under-described. More than 12 means there is filler.

### Format
- **Single words only.** No tag may contain a space.
  - For compound terms, **use the form a user would search for**, or the form established in the library's own API/product name. Never mechanically split a well-known compound noun:
    - ✅ `fileformatdetector` (users search this as one token)
    - ✅ `radpdfprocessing` (official product name)
    - ✅ `multiuser` (natural single token)
    - ✅ `coding, assistant` (two distinct words, each meaningful on its own)
    - ❌ `file, format, detector` (splits a searchable compound into noise)
- **Comma-separated** with a single space after each comma: `tag1, tag2, tag3`
- **Always the single-line scalar form**: `tags: a, b, c` — not YAML arrays or multi-line block scalars.
- **Lowercase** (exception: quarter labels `Q1`, `Q2`, `Q3`, `Q4` and four-digit year numbers like `2025`).
- **Normalize punctuated tech names**: `dotnet` (not `.NET`), `aspnet` (not `ASP.NET`), `csharp` (not `C#`).
- **No duplicates** within the same tag list.
- **No trailing whitespace** on the `tags:` line.

### Content
Pick tags from these categories (use as many as relevant, but never pad):

| Category | Examples |
|---|---|
| Library/component name | `radpdfprocessing`, `radspreadprocessing`, `radwordsprocessing`, `radziplibrary`, `radspreadstreamprocessing` — **always the full `rad*` token; never shortened variants like `pdfprocessing` or `spreadprocessing`** |
| File formats | `pdf`, `docx`, `xlsx`, `csv`, `rtf`, `html`, `tiff`, `zip`, `xls`, `odt` |
| Core operations | `import`, `export`, `conversion`, `extraction`, `generation`, `merge`, `split` |
| Key features of the article | `signatures`, `forms`, `encryption`, `compression`, `annotations`, `bookmarks`, `tables`, `images`, `fonts` |
| Relevant tech/platform | `nuget`, `dotnet`, `azure`, `github`, `blazor`, `aspnet`, `netstandard`, `maui` |
| Topic-specific keywords | derived from the article title, description, and body — these make the tag set unique per article |

### What to Remove
These are the patterns that were systematically cleaned out:

- **`dpl`** — internal abbreviation, not searched by users.
- **`overview`** alone with no other context — too generic; only keep it when the article genuinely *is* an overview and paired with specific terms.
- **Multi-word tags** like `coding assistant`, `content control`, `plain text` — split them.
- **Overly-split compound nouns** — if users search for one token, keep it one: `fileformatdetector` not `file, format, detector`.
- **Duplicate tags** — e.g. old `pdf, docx, pdf, xlsx` had `pdf` twice.
- **Tags unrelated to the article** — don't add `excel` to a pure PDF article just because the product suite includes a spreadsheet library.
- **Version strings in non-release-note articles** — e.g. `2024.1.305` belongs only in release notes.

---

## Workflow

### When improving a single article

1. Read the article's frontmatter (`title`, `description`, `slug`) **and the first 3–5 paragraphs of the body**.
2. Identify the current `tags:` value (or note its absence).
3. Apply the validation checklist below.
4. Generate an improved tag set grounded in the actual article content, then replace the `tags:` line.

### When improving a folder or the whole repo

Use a two-pass approach so every rewrite is grounded in article content:

**Pass 1 — Structural scan (frontmatter only)**
1. Enumerate all `.md` files under the target path.
2. For each file, read only the frontmatter (text between the first `---` and the second `---`).
3. Flag any file that fails a *structural* check: missing `tags:`, wrong count, duplicates, spaces-in-tags, wrong case, or trailing whitespace.

**Pass 2 — Content rewrite (frontmatter + body)**
4. For every flagged file, read the `title`, `description`, and the first 3–5 body paragraphs.
5. Generate a new tag set that passes all checks, then write the updated `tags:` line.
6. Leave files that already pass all checks untouched.

Report a summary at the end: files checked, files updated, and for each updated file the before/after tag lines.

### Handling frontmatter edge cases

- **Missing frontmatter entirely**: skip the file and report it as `SKIP (no frontmatter)`.
- **Malformed frontmatter** (no closing `---`): skip and report as `SKIP (malformed frontmatter)`.
- **Tags as YAML array or block scalar**: normalize to `tags: a, b, c` single-line form before applying all other rules.
- **Missing `tags:` field**: treat as an empty tag list — the file needs rewriting.

### Validation checklist

Run each check and record which ones fail:

- [ ] `tags:` field exists in frontmatter
- [ ] Tag count is between 6 and 12
- [ ] No tag contains a space character
- [ ] No duplicate tags
- [ ] All tags are lowercase (except `Q1`–`Q4`, year numbers)
- [ ] No trailing whitespace on the `tags:` line
- [ ] Tags are relevant to the article content (not generic filler)
- [ ] No forbidden tokens: `dpl`, pure `overview` with no specifics

---

## How to Generate Good Tags

Read the article's `title`, `page_title`, `description`, and the first few paragraphs of the body. Then ask yourself:

1. **What library does this article cover?** → Add the library name (`radpdfprocessing`, etc.)
2. **What file format(s)?** → Add them (`pdf`, `docx`, etc.)
3. **What operation or feature is the article about?** → Add 2–4 specific keywords
4. **What platform or tooling is involved?** → Add if notable (`nuget`, `azure`, `blazor`, etc.)
5. **Are there product/feature names unique to this article?** → Add them

Stop when you reach 8–10 good tags. Resist adding more just to hit a higher count.

### Examples from the curated corpus

| Article | Old tags | New tags |
|---|---|---|
| `radpdfprocessing/overview.md` | `overview, pdf, processing, features` | `pdf, radpdfprocessing, processing, documents, export, import, forms, signatures` |
| `radspreadprocessing/overview.md` | `overview` | `spread, processing, spreadsheet, excel, xlsx, csv, pdf, import, export` |
| `agent-tools/overview.md` | `ai, dpl, document, processing, agent, tool, telerik, excel, pdf, word, docx, pdf, xlsx` | `agent, tools, ai, pdf, docx, xlsx, telerik, document` |
| `license-agreement.md` | `license,agreement, telerik, end, user` | `license, agreement, telerik, eula, document, processing, distribution, terms` |
| `fileformatdetector.md` | `file, format, detection, detector, pdf, docx, xlsx, zip, doc, xls, xlsm, txt, document, processing, libraries` | `fileformatdetector, detection, pdf, docx, xlsx, zip, document, formats` |
| `device-independent-pixels.md` | `dip, dips, device, independent, pixels, measurement, unit, SpreadProcessing, WordsProcessing, PdfProcessing` | `dip, pixels, measurement, unit, radspreadprocessing, radpdfprocessing, radwordsprocessing, fonts` |
| `setting-up-license-key.md` | `setting, up, license, key, document, processing, libraries` | `license, key, telerik, document, processing, activation, setup, libraries` |

### Release notes articles
Use this pattern: `release, notes, <year>, <Qn>, telerik, document, processing, changelog`

When the release note covers a single library, add that library's token too: `release, notes, 2025, Q1, radpdfprocessing, telerik, document, changelog`

When it covers multiple libraries or the whole DPL suite, omit the library token and keep the broader set: `release, notes, 2025, Q1, telerik, document, processing, changelog`

### Knowledge Base articles
Same rules apply. KB articles often cover a narrow scenario — lean into the specific technology and operation:

Good: `radpdfprocessing, pdf, tiff, conversion, image, multipage, dotnet`  
Bad: `pdfprocessing, document, processing, pdf, tiff, image, conversion, multipage` ← wrong library token, too much generic filler

---

## Output Format

When reporting improvements, always show the diff clearly:

```
FILE: libraries/radpdfprocessing/overview.md
  BEFORE: tags: overview, pdf, processing, features
  AFTER:  tags: pdf, radpdfprocessing, processing, documents, export, import, forms, signatures
  ISSUES FIXED: count too low (4), missing library name, missing specific features
```

If a file already passes all checks, note it as `OK` and skip it from the update list.

After processing a batch, provide a one-line summary: `Updated N of M files.`
