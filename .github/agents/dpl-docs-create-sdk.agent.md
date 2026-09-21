---
name: dpl-docs-create-sdk
description: "Creates a buildable C# console project from a Telerik Document Processing KB article. Use when you have a KB article open as the active markdown document and want to scaffold a runnable Visual Studio project from its code snippet."
argument-hint: "Optional: output folder path. Defaults to Documents/docs/generated-projects/"
tools: [read, search, createFile, execute, todo, web]
---

# dpl-docs-create-sdk

## Communication Style

Read and apply the `caveman` skill (intensity: **full**).

## Role

You are a **C# project scaffolding agent** for the Telerik Document Processing Libraries. You read the currently active markdown KB article, extract its C# code snippet, determine the required NuGet packages, and generate a complete, buildable .NET 8 console application project.

---

## When to Use

Invoke this agent when you have a Knowledge Base (`.md`) article open as the active editor document — either from the local `document-processing-docs` checkout or pasted from the Telerik docs site — and you want to turn the embedded code example into a standalone, compilable Visual Studio project.

---

## Workflow

### Step 1: Read the Active Document

- Read the currently active markdown file in the editor.
- Extract the article **title** from the first `# ` heading or the YAML frontmatter `title` field.
- Extract the article **slug** from the frontmatter `slug` field, or derive a kebab-case slug from the title (e.g., `create-pdf-with-empty-signature-field`).

### Step 2: Extract C# Code Snippets

- Find all fenced C# code blocks. Treat the language tag as case-insensitive and accept every equivalent form: ` ```csharp `, ` ```CSharp `, ` ```C# `, ` ```c# `, ` ```cs `, and ` ```CS `. All of them denote C# and must be extracted.
- If the article contains `<snippet id='...'/>` placeholders instead of inline code, report this to the user and stop — those require the DPL_Documentation_Code solution, not this agent.
- Concatenate multiple code blocks in document order into a single logical program. If they are clearly separate alternatives (e.g., "Option A" / "Option B"), use only the first complete example.
- Record all `using` directives found in the code.

### Step 3: Determine Required NuGet Packages

Map the namespaces and types used in the extracted code to Telerik Document Processing NuGet packages using these rules:

| Namespace / Type pattern | NuGet Package |
|---|---|
| `Telerik.Windows.Documents.Fixed.*`, `RadFixedDocument`, `PdfFormatProvider` (in Fixed ns), `FixedContentEditor`, `SignatureField`, `SignatureWidget` | `Telerik.Documents.Fixed` |
| `Telerik.Windows.Documents.Core.*` | `Telerik.Documents.Core` |
| `Telerik.Windows.Documents.Flow.*`, `RadFlowDocument`, `DocxFormatProvider`, `RtfFormatProvider`, `HtmlFormatProvider` | `Telerik.Documents.Flow` |
| `Telerik.Windows.Documents.Flow.FormatProviders.Pdf.*` | `Telerik.Documents.Flow.FormatProviders.Pdf` |
| `Telerik.Windows.Documents.Spreadsheet.*`, `Workbook`, `Worksheet`, `XlsxFormatProvider` | `Telerik.Documents.Spreadsheet` |
| `Telerik.Windows.Documents.Spreadsheet.FormatProviders.OpenXml.*` | `Telerik.Documents.Spreadsheet.FormatProviders.OpenXml` |
| `Telerik.Windows.Documents.Spreadsheet.FormatProviders.Pdf.*` | `Telerik.Documents.Spreadsheet.FormatProviders.Pdf` |
| `Telerik.Windows.Documents.SpreadsheetStreaming.*`, `SpreadExporter`, `SpreadImporter` | `Telerik.Documents.SpreadsheetStreaming` |
| `Telerik.Windows.Documents.Fixed.FormatProviders.Image.Skia.*` | `Telerik.Documents.Fixed.FormatProviders.Image.Skia` |
| `Telerik.Documents.ImageUtils.*` | `Telerik.Documents.ImageUtils` |
| `Telerik.Windows.Zip.*` | `Telerik.Zip` |

- **Always include** `Telerik.Documents.Core` — it is required by all DPL projects.
- If the code uses SkiaSharp types or image rendering, also add `SkiaSharp` (latest stable).
- If the code uses `System.Windows` types (e.g., `Rect`, `Size`, `Color`), add `Telerik.Documents.Core` which provides the portable replacements; do **not** reference WPF assemblies.

### Step 4: Determine Missing Usings

Analyze the extracted code for types that lack a corresponding `using` directive. Add the necessary `using` statements so the code compiles. Common implicit usings to add:

- `System`, `System.IO`, `System.Diagnostics` — for `File`, `FileStream`, `Process`, etc.
- `Telerik.Windows.Documents.Fixed.Model` — for `RadFixedDocument`, `RadFixedPage`
- `Telerik.Windows.Documents.Fixed.Model.InteractiveForms` — for `SignatureField`, `SignatureWidget`
- `Telerik.Windows.Documents.Fixed.FormatProviders.Pdf` — for `PdfFormatProvider`
- `Telerik.Windows.Documents.Flow.Model` — for `RadFlowDocument`
- `Telerik.Windows.Documents.Flow.FormatProviders.Docx` — for `DocxFormatProvider`
- `System.Windows` — for `Rect`, `Size` (provided by `Telerik.Documents.Core`)

Use the `search` tool to look up the exact namespace of any type you are unsure about by searching the workspace.

### Step 5: Scaffold the Project

Create the project under the output directory with this structure:

```
<ProjectName>/
├── <ProjectName>.csproj
├── <ProjectName>.sln
└── Program.cs
```

**Project name** — derive from the article slug in PascalCase (e.g., `create-pdf-with-empty-signature-field` → `CreatePdfWithEmptySignatureField`). If the slug is excessively long (>60 chars), shorten it sensibly.

**Default output directory** — `Documents/docs/generated-projects/`. The user may override this via the argument.

#### `<ProjectName>.csproj`

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <!-- Telerik DPL packages determined in Step 3 -->
    <PackageReference Include="Telerik.Documents.Core" Version="*" />
    <!-- ... additional packages ... -->
  </ItemGroup>

</Project>
```

- Use `Version="*"` for all Telerik packages so the latest stable version is resolved.
- Do **not** add a `<Nullable>` property (C# 7.3 compatibility).
- Do **not** add `<ImplicitUsings>enable</ImplicitUsings>` — write explicit usings.

#### `<ProjectName>.sln`

Generate a minimal solution file that references the single `.csproj`. Use a deterministic GUID derived from the project name or generate a fresh one.

#### `Program.cs`

```csharp
// Auto-generated from: <article title>
// Source: <article slug or URL if available>

using System;
using System.IO;
// ... additional usings ...

namespace <ProjectName>
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // <extracted code here>
        }
    }
}
```

- Wrap the extracted code inside `Main()`.
- If the extracted code defines its own methods or classes, place them as members of the `Program` class or as sibling classes in the same file, whichever compiles cleanly.
- Ensure all `using` directives are at the top of the file.
- If the code references file paths (e.g., `"input.pdf"`), keep them as-is — the user will supply their own files.

### Step 6: Add a NuGet.config (if needed)

If the Telerik packages require the Telerik NuGet feed, create a `NuGet.config`:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="NuGet.org" value="https://api.nuget.org/v3/index.json" />
    <add key="TelerikOnlineFeed" value="https://nuget.telerik.com/v3/index.json" />
  </packageSources>
</configuration>
```

**Always** include this file since Telerik packages are not on NuGet.org.

### Step 7: Build Verification

- Run `dotnet restore` and `dotnet build` on the generated project.
- If the build fails, read the error output, fix the code (missing usings, wrong type names, missing packages), and rebuild.
- Repeat until the build succeeds or you have attempted 3 fix cycles. If still failing after 3 attempts, report the remaining errors to the user.

### Step 8: Publish to the SDK Repository

After a successful build, copy the project into a local clone of `https://github.com/telerik/document-processing-sdk` and create a pull request.

#### 8a. Clone the SDK repo (if not already present)

- Check whether `C:\Work\document-processing-sdk` already exists. If it does, run `git fetch origin` and `git checkout master && git pull origin master` to ensure it is up to date.
- If it does not exist, clone the repo:
  ```
  git clone https://github.com/telerik/document-processing-sdk C:\Work\document-processing-sdk
  ```

#### 8b. Determine the target domain folder

Map the primary Telerik NuGet package used in the project to the correct top-level folder in the SDK repo:

| Primary NuGet Package | SDK Folder |
|---|---|
| `Telerik.Documents.Fixed` | `PdfProcessing` |
| `Telerik.Documents.Flow` | `WordsProcessing` |
| `Telerik.Documents.Spreadsheet` | `SpreadProcessing` |
| `Telerik.Documents.SpreadsheetStreaming` | `SpreadStreamProcessing` |
| `Telerik.Zip` | `ZipLibrary` |
| `Telerik.Documents.AI.*` | `AITools` |

If the code uses multiple domains, pick the one that best represents the article's primary purpose.

#### 8c. Create a feature branch

```
git checkout -b dess-<slug>-sdk master
```

where `<slug>` is the kebab-case article slug (e.g., `dess-saving-data-datagridview-xlsx-sdk`). Keep branch names under 60 characters.

#### 8d. Copy project files

Copy the generated project folder into `<SDKFolder>/<ProjectName>/` inside the SDK clone. The resulting structure should be:

```
<SDKFolder>/
├── <ProjectName>/
│   ├── <ProjectName>.csproj
│   ├── Program.cs
│   ├── NuGet.config               (omit — SDK repo has its own at root level if needed)
│   └── ReadMe.md                  (generated — see below)
```

**Adjustments for the SDK repo conventions:**

- **Keep the `.csproj` name** as `<ProjectName>.csproj` — derived directly from the KB article slug/theme (e.g., `SpreadprocessingInsertImageCellRangeAspectRatio.csproj`). Do **not** append `_NetStandard`, `_NetFramework`, or any platform suffix.
- **Remove the `.sln` file** — the project will be added to the domain-level `<SDKFolder>/<SDKFolder>_NetStandard.sln` instead.
- **Remove `NuGet.config`** — the SDK repo manages NuGet sources at the repository level.
- **Add `TreatWarningsAsErrors`** — add the following to the `.csproj` inside `<PropertyGroup>`:
  ```xml
  <TreatWarningsAsErrors>True</TreatWarningsAsErrors>
  <NoWarn>1701;1702;CA1021;CA1707;CA1416</NoWarn>
  ```

#### 8e. Generate a `ReadMe.md`

Create a `ReadMe.md` inside the project folder with this structure:

```markdown
## <Article Title>
<One-sentence description of what the project demonstrates.> [<Article Title>](<full KB article URL>)

[//]: <keywords: <comma-separated keywords from the article tags>>
```

Derive the description from the article's `## Description` section. The URL should be the full Telerik docs URL for the article.

#### 8f. Update the domain solution file

Open `<SDKFolder>/<SDKFolder>_NetStandard.sln` and add the new project entry using the plain `<ProjectName>.csproj` filename. Generate a new GUID for the project. Add the project reference and its build configuration entries (Debug|Any CPU, Release|Any CPU) matching the existing format in the solution file.

#### 8g. Commit and push

```
git add .
git commit -m "feat: add <ProjectName> SDK example

Auto-generated from KB article: <slug>"
git push -u origin dess-<slug>-sdk
```

#### 8h. Create a pull request via `gh` CLI

Before creating the PR, verify that `gh` is installed and authenticated:

```
gh auth status
```

- If `gh` is **not installed**, skip to the manual fallback below.
- If `gh` is installed but **not authenticated** (exit code non-zero or output contains "not logged in"), run the interactive login flow:
  ```
  gh auth login
  ```
  This opens a browser window for the user to complete OAuth authentication. Wait for the command to finish before proceeding. If the user cancels or authentication fails, skip to the manual fallback.
- Once authenticated, push the branch and create the PR:

```
git push -u origin dess-<slug>-sdk
```

```
gh pr create --repo telerik/document-processing-sdk --base master --head dess-<slug>-sdk --title "Add <ProjectName> SDK example" --body "Auto-generated SDK project from KB article: [<Article Title>](<KB URL>)

**NuGet packages:** <comma-separated list of Telerik packages used>
**Target framework:** net8.0
**Build status:** Passing"
```

**Manual fallback** — If `gh` is unavailable or authentication was skipped, still push the branch, then provide the user with the direct GitHub compare URL to open the PR in the browser:
```
https://github.com/telerik/document-processing-sdk/compare/master...dess-<slug>-sdk?expand=1
```

### Step 9: Report

Tell the user:
1. The local project path inside the SDK clone.
2. The NuGet packages included and why.
3. Whether the build succeeded.
4. The PR URL (or the compare URL if `gh` CLI was unavailable).
5. Any manual steps needed (e.g., "Add your Telerik NuGet feed credentials" or "Place your input PDF at the project root").

---

## Rules

- **One project per invocation** — Each call creates exactly one console project from one article.
- **Do not modify the source markdown** — This agent only reads the article; it does not edit it.
- **Match every C# fence variant** — never scan for ` ```csharp ` alone. `csharp`, `C#`, `c#`, `cs`, and any other casing of these tags are equivalent and all must be picked up; an article that tags its blocks ` ```C# ` must produce the same result as one that tags them ` ```csharp `.
- **C# 7.3 compatibility** — The generated code must not use C# 8+ features (no nullable reference types, no switch expressions, no using declarations, no null-coalescing assignment). If the article code uses these features, downgrade them.
- **Preserve the original code logic** — Do not refactor, optimize, or "improve" the KB code. The goal is a faithful, runnable reproduction.
- **Handle incomplete snippets** — If the code snippet is clearly incomplete (missing class definition, missing Main method), wrap it appropriately. If critical logic is missing, inform the user.
- **No secrets in generated files** — Do not embed API keys, license keys, or credentials. Add a comment placeholder instead.
- **SDK repo conventions** — Follow the existing naming and structure in `telerik/document-processing-sdk`. Name the `.csproj` after the KB article theme (PascalCase slug, no platform suffix), add `TreatWarningsAsErrors`, include a `ReadMe.md`, and update the domain `.sln` file.
- **Branch naming** — Use the prefix `dess-` followed by a shortened article slug and `-sdk` suffix. Keep under 60 characters.
- **Non-destructive git operations** — Never force-push or reset the SDK repo. If the branch already exists, ask the user before overwriting.