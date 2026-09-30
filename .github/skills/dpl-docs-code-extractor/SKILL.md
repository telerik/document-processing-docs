---
name: dpl-docs-code-extractor
description: Use ONLY when explicitly requested by the user to extract embedded C# code snippets from documentation markdown articles in the document-processing-docs repo into the DPL_Documentation_Code solution in document-processing-docs-tasks, replacing inline code blocks with `<snippet id='...'/>` placeholders. Do not trigger this skill automatically — it must be invoked only when the user explicitly says they want to extract snippets and supplies context (PRs, branches, or file paths). Supports one request covering multiple PRs/branches at once. Read this skill before touching either repo.
---

# dpl-docs-code-extractor

## Communication Style

Read and apply the `caveman` skill (intensity: **full**).

## Trigger Rule (mandatory)

This skill is **manual-trigger only**. Invoke it only when the user's prompt explicitly asks to extract/move/externalize code snippets from docs into the snippets solution AND supplies at least one of: a PR, a branch, or explicit file paths. Never invoke this skill speculatively, as a side effect of another task, or just because a markdown file with a fenced C# code block is open/mentioned.

## Repositories

| Purpose | Repo folder name (fixed across machines) | Role |
|---|---|---|
| Documentation articles | `document-processing-docs` | Source of embedded ` ```csharp ` or ` ```C# ` blocks; receives `<snippet id='...'/>` placeholders |
| Snippets solution | `document-processing-docs-tasks` | Hosts `DPL_Documentation_Code.sln` / `SampleCS.csproj`; receives the extracted `.cs` code |

On this machine both are checked out under `C:\Work\`. Resolve the actual local paths at start of the task:
1. Try `C:\Work\document-processing-docs` and `C:\Work\document-processing-docs-tasks`.
2. If either is not found, search nearby (siblings of the current repo root) for a directory with that exact name.
3. If still not found, **ask the user** for the local path — do not guess or clone a fresh copy.

## Solution Layout (document-processing-docs-tasks)

- Single project: `DPL_Documentation_Code\SampleCS.csproj` (root namespace `SampleCS`), single `.sln`: `DPL_Documentation_Code.sln`.
- Configurations: `Debug`, `Release`, `Debug-net8` (TFM `net8.0`), `Debug-net8-windows` (TFM `net8.0-windows`, `UseWPF`/`UseWindowsForms` true, defines `NET8_0_WINDOWS`).
- `Debug-net8` references cross-platform packages (`Telerik.Documents.*`). `Debug-net8-windows` references the WPF-era packages (`Telerik.Windows.Documents.*`, plus `PresentationFramework`/`WindowsBase`).
- Code lives under `Libraries\<Domain>\...` mirroring the docs repo's topical structure, e.g. `Libraries\RadPdfProcessing\Concepts\PdfCompliance.cs`, `Libraries\RadPdfProcessing\Features\DigitalSignature\GettingStarted.cs`. `AI Tools\AgentTools\*.cs` hosts AI-domain snippets.
- Namespace of each `.cs` file mirrors its folder path: `SampleCS.Libraries.RadPdfProcessing.Concepts`, etc.
- A `Moved-Snippets\` subfolder per domain holds legacy/relocated snippet files — do not add new snippets there unless the article you're extracting from already maps to a file in that folder.

## Snippet ID Convention

IDs are kebab-case and encode: `<top-level-domain>-<sub-area>-<article-slug-fragment>-<local-context>`. Examples observed in the codebase:
- `libraries-pdf-concepts-compliance-ensure-compliance`
- `libraries-pdf-features-digital-signature-gettingstarted-pkcs12-signing`

Before inventing a new ID:
1. Look at other snippet IDs already used for the **same article** (other placeholders in the same `.md` file) and other snippets in the **same target `.cs` file** — match their prefix/segment pattern exactly.
2. Derive the missing segment from the immediate heading/subheading text above the code block (kebab-cased, trimmed to the essential words).
3. IDs must be globally unique across the solution — grep the target repo for the candidate ID before using it.

## Region Marker Format (exact — do not deviate)

```csharp
// >> <snippet-id>
<code>
// << <snippet-id>
```

Content between markers is published into documentation. Preserve extracted
snippet there. Do not add build-only declarations, setup, cleanup, compatibility
aliases, dummy values, or helper code inside marker pair unless that code already
existed in original markdown block. Put required compile context outside markers:
`using` directives, fields, helper methods, test data, object construction, or
configuration-specific adapters.

Prefer one new, properly named `void` method per extracted code block. Derive
PascalCase method name from snippet's action/heading (for example,
`ExportDocumentWithCompliance`). Put setup required only to compile snippet before
opening marker inside same method. Put helper members outside method. Reuse existing
method only when article code depends on its established shared flow and a separate
method would change snippet semantics.

Markdown placeholder (exact — do not deviate):

```markdown
<snippet id='<snippet-id>'/>
```

## Per-Configuration Differences (`#if NET8_0_WINDOWS`)

When the snippet's namespace/API differs between the cross-platform (`Debug-net8`) and WPF/Windows (`Debug-net8-windows`) builds, wrap the differing parts:

```csharp
#if NET8_0_WINDOWS
using System.Windows.Media;
using FontFamily = System.Windows.Media.FontFamily;
#else
using Telerik.Documents.Core.Fonts;
#endif
```

or, when a whole snippet body only compiles on one TFM (e.g. an API only available cross-platform):

```csharp
#if NET8_0_WINDOWS
#else
public void LoadCertificate()
{
// >> <snippet-id>
<code>
// << <snippet-id>
}
#endif
```

Search the `Libraries\` tree for existing `#if NET8_0_WINDOWS` usages in the same domain before writing a new one — reuse the same style (aliasing vs. full `#if/#else` block) already established for that API.

Every extracted snippet must remain active source code in at least one
configuration. Never make a failing snippet "pass" by:
- Commenting out any extracted statement.
- Wrapping it in `#if false`.
- excluding its file from compilation.
- Replacing it with pseudocode, empty body, or placeholder comment.
- Moving marker pair into comments.

If snippet cannot compile in both configurations, compile it unchanged in supported
configuration using `#if NET8_0_WINDOWS` / `#else`; exclude whole method from
unsupported configuration. Both solution configurations must still build.

## Workflow

Run this workflow once per requested unit of work (a single PR, a single branch, or a single set of explicit files). If the user's request names **multiple PRs/branches**, repeat the full workflow for each one in sequence, reusing the same docs-tasks working branch across all of them (see Branching below) unless the user specifies separate target branches.

### Step 1 — Resolve scope
- Identify the docs repo branch/PR to work against. If a PR number/URL is given, resolve its source branch (via `github-mcp-server-pull_request_read` or `ado/repo_pull_request`, whichever host the URL indicates).
- If explicit file paths are given instead, use those directly.

### Step 2 — Prepare the docs repo (`document-processing-docs`)
- Fetch and check out the **exact branch associated with the PR** (or the named branch). Do **not** create a new branch here — the rule is: changes for a PR/branch go into that same branch.
- If no branch/PR is specified and the user just points at files on the currently checked-out branch, work in place.

### Step 3 — Prepare the snippets solution (`document-processing-docs-tasks`)
- Fetch `origin`, ensure the local default branch is up to date.
- Create a **new branch off the up-to-date default branch** for this extraction session (e.g. `docs/extract-snippets-<slug>`), unless the user explicitly names a target branch to reuse/create instead.
- If handling multiple PRs/branches in one request, reuse this same new branch for all of them unless told to split.

### Step 4 — Extract
For each fenced ` ```csharp ` or ` ```C# ` block in scope:
1. Determine the target `.cs` file location under `Libraries\<Domain>\...` mirroring the article's folder path in the docs repo. Reuse an existing file for the article if one exists; otherwise create one named after the article (PascalCase).
2. Derive the snippet ID per the convention above.
3. Prefer creating a new, descriptive PascalCase `void` method for this code block. Keep original extracted code unchanged between region markers.
4. Add compile context outside region markers: `using` directives, setup locals before opening marker, fields, helper methods, or configuration adapters. Apply `#if NET8_0_WINDOWS` splits wherever configurations require different namespaces/APIs. Snippet must be active and compile in at least one configuration; never comment it out.
5. Replace the original fenced code block in the markdown with `<snippet id='<snippet-id>'/>`.

### Step 5 — Build verification (both configurations + whole solution)
Run, from `document-processing-docs-tasks\DPL_Documentation_Code`:
```powershell
dotnet build DPL_Documentation_Code.sln -c Debug-net8
dotnet build DPL_Documentation_Code.sln -c Debug-net8-windows
```
Run both commands independently; never stop after first successful build. Both must
succeed with whole solution (not just new file). Fix compile errors (missing
usings, missing external setup, wrong `#if` split, wrong package-specific type
name) and re-run **both** configurations after every fix until both pass.

Then inspect every added marker pair and verify:
1. Marker body matches original markdown code block.
2. Marker body is not commented or disabled.
3. Snippet is compiled in `Debug-net8`, `Debug-net8-windows`, or both.
4. Every new snippet has build result proving its active configuration compiles.

If either solution build fails, or any snippet is inactive in both configurations,
task is incomplete. Report blocker; never claim successful extraction.

### Step 6 — Report, do not commit
- Report per PR/branch: docs repo branch used, files/snippets touched, snippet IDs added, docs-tasks branch used, build verification result for both configurations.
- **Never stage, commit, or push** in either repository. Leave all changes unstaged and uncommitted in the working tree for the user to review.

## Rules

- **Explicit trigger only** — see Trigger Rule above.
- **Preserve all non-code markdown** — only the fenced code blocks are replaced.
- **One snippet per code block** — never merge separate fenced blocks into one snippet or split one block into several.
- **Prefer one named `void` method per snippet** — method name describes snippet action.
- **Marker body stays faithful** — build scaffolding belongs outside markers.
- **No disabled snippets** — no comments, `#if false`, compile exclusion, pseudocode, or empty replacement.
- **At least one active configuration per snippet** — `Debug-net8`, `Debug-net8-windows`, or both.
- **Both whole-solution builds mandatory** — success in only one configuration is failure.
- **Respect existing placeholders** — never duplicate or overwrite an existing `<snippet id='...'/>`.
- **C# 7.3-safe by default** — the docs snippets target net8.0/net8.0-windows so modern C# is fine, but keep snippets self-contained and buildable; do not introduce unrelated language-version changes to the project file.
- **No commits, no pushes, and no staging, in either repo** — leave extraction changes unstaged and uncommitted in the working tree.
- **Docs repo branch = PR's branch** — never create a new branch in `document-processing-docs` for this workflow.
- **Docs-tasks repo branch = new, off the up-to-date default branch** — unless the user names an existing branch to use instead.
- **Multi-PR/branch requests** — process every named PR/branch from a single user request; do not stop after the first one.
