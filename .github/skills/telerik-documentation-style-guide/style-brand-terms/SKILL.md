---
name: style-brand-terms
description: "Use this skill when writing brand names, product names, trademarks, interaction verbs (click/tap/select/press), or specialized vocabulary terms in documentation. Covers Progress and Telerik trademark formatting, first-use vs subsequent-use rules, possessive restrictions on brand names, desktop vs mobile vs mixed interaction verbs, and the DPL-specific vocabulary list (checkbox, dataset, filename, namespace, dialog box, dropdown, etc.). Read this skill whenever writing product names, describing user interactions with UI elements, choosing between click/tap/select/press, or checking vocabulary consistency. Also use when asked to 'fix brand names', 'check product references', 'review interaction verbs', or 'correct terminology'."
---

# Brand Names, Interaction Verbs, and Vocabulary

This skill defines how to write brand names, describe user interactions, and use standard vocabulary terms in Progress DevTools documentation.

## Brand Names and Trademarks

### First Use in an Article

On the **first mention** in an article, use the full brand name with the trademark symbol:

```markdown
Progress® Telerik® Document Processing is a set of libraries for document manipulation.
```

### Subsequent Uses

After the first mention, use only the product name without the trademark symbol:

```markdown
Telerik Document Processing supports PDF, DOCX, and XLSX formats.
```

Or use the shorter, commonly recognized name if the full name is unwieldy:

```markdown
The Document Processing libraries support...
```

### Trademark Rules

1. **Never pluralize a trademark** — Trademarks are proper nouns and cannot be made plural.
   - ❌ "Telerik Document Processings"
   - ✅ "Telerik Document Processing libraries"

2. **Never use a trademark as a verb** — Trademarks are nouns or adjectives.
   - ❌ "Telerik the document"
   - ✅ "Process the document with Telerik Document Processing"

3. **Never form possessives with trademarks** — Do not add 's to brand names.
   - ❌ "Telerik's API" or "Progress's libraries"
   - ✅ "The Telerik API" or "The API of Telerik Document Processing"

4. **Lowercase generic nouns after product names** — The product name is the proper noun; the generic category noun that follows is lowercase.
   - ❌ "PdfFormatProvider Class"
   - ✅ "PdfFormatProvider class"
   - ❌ "RadFixedDocument Object"
   - ✅ "RadFixedDocument object"

### Common Product Names

| Full Name (first use) | Subsequent uses |
|---|---|
| Progress® Telerik® Document Processing | Telerik Document Processing, Document Processing, the library |
| Progress® Telerik® UI for WPF | Telerik UI for WPF |
| Progress® Telerik® UI for WinForms | Telerik UI for WinForms |
| Progress® NuGet packages | NuGet packages |

## Interaction Verbs

Use the correct verb for how users interact with interface elements. The choice depends on the platform (desktop, mobile, or mixed).

### Desktop Interactions

| Action | Verb | Example |
|--------|------|---------|
| Activate a button or link | **click** | Click **Export**. |
| Activate with two rapid clicks | **double-click** | Double-click the file to open it. |
| Activate with the secondary button | **right-click** | Right-click the item to open the context menu. |
| Activate a keyboard key | **press** | Press `Enter` to confirm. |
| Choose a menu item | **select** | Select **File** > **Save**. |
| Choose from a dropdown | **select** | Select a format from the dropdown. |
| Mark a checkbox | **select** | Select the **Enable Logging** checkbox. |
| Clear a checkbox | **clear** | Clear the **Enable Logging** checkbox. |
| Enter text in a field | **enter** or **type** | Enter the file path in the **Location** field. |
| Move a slider | **drag** | Drag the slider to adjust the value. |

### Important: "click" Not "click on"

Use **"click"** without "on". The preposition is redundant:

- ❌ Click on the **Save** button.
- ✅ Click the **Save** button.
- ✅ Click **Save**.

### Mobile Interactions

| Action | Verb | Example |
|--------|------|---------|
| Activate an element | **tap** | Tap **Export**. |
| Activate with two rapid taps | **double-tap** | Double-tap the image to zoom in. |
| Move an element | **drag** | Drag the item to reorder. |
| Swipe across the screen | **swipe** | Swipe left to delete. |
| Zoom in | **spread** | Spread to zoom in on the image. |
| Zoom out | **pinch** | Pinch to zoom out. |
| Touch and hold | **press and hold** | Press and hold the item to select it. |

### Mixed (Desktop + Mobile) Content

When writing for both desktop and mobile, use **"select"** as the universal verb:

```markdown
Select **Export** to save the document.
```

"Select" works across input methods (mouse click, keyboard, touch tap).

## Vocabulary — Standard Terms

Use these standard terms consistently throughout the documentation. Read the full vocabulary reference at `references/vocabulary.md` for the complete list.

### Most Common Terms

| ❌ Avoid | ✅ Use | Notes |
|---|---|---|
| check box, Check Box | checkbox | One word, lowercase |
| data set | dataset | One word |
| drop down, drop-down | dropdown | One word when used as a noun or adjective |
| dialog, dialogue | dialog box | Always "dialog box" (two words) when referring to a UI window |
| file name | filename | One word |
| name space | namespace | One word |
| tool bar | toolbar | One word |
| tool tip | tooltip | One word |
| work space | workspace | One word |
| plug in (noun) | plugin | One word as a noun; "plug in" as a verb (two words) |
| log in (noun) | login | One word as a noun; "log in" as a verb (two words) |
| set up (noun) | setup | One word as a noun; "set up" as a verb (two words) |
| back end (adj) | backend | One word as an adjective; varies by context as a noun |
| front end (adj) | frontend | One word as an adjective; varies by context as a noun |
| on-line | online | One word, no hyphen |
| off-line | offline | One word, no hyphen |
| e-mail | email | One word, no hyphen |
| web site | website | One word |
| web page | webpage | One word |

### Version and Comparison Terms

| ❌ Avoid | ✅ Use | Why |
|---|---|---|
| older version | earlier version | "Older" implies age, not sequence |
| newer version | later version | "Newer" implies recency, not sequence |
| lower version | earlier version | "Lower" implies rank, not sequence |
| higher version | later version | "Higher" implies rank, not sequence |
| since version 2.0 | starting with version 2.0 | "Since" is ambiguous (temporal or causal) |
| as of version 2.0 | starting with version 2.0 | Same ambiguity |

### Accessibility-Sensitive Terms

| ❌ Avoid | ✅ Use | Why |
|---|---|---|
| disabled (UI element) | unavailable | "Disabled" has accessibility connotations |
| grayed out | unavailable or dimmed | "Grayed out" is visual-only; inaccessible to screen readers |
| invalid | not valid | Less judgmental |

## Quick Checklist

When reviewing an article for brand names and terminology, verify:

- [ ] First brand mention includes trademark symbol (Progress® Telerik®)
- [ ] Subsequent mentions use product name only, no trademark symbols
- [ ] No possessives with brand names (not "Telerik's")
- [ ] No pluralized trademarks
- [ ] Generic nouns after product names are lowercase ("PdfFormatProvider class")
- [ ] Desktop interactions: click (not "click on"), press, select, enter
- [ ] No "click on" — just "click"
- [ ] Mobile interactions: tap, swipe, spread, pinch
- [ ] Mixed content: "select" as universal verb
- [ ] Standard compound words: checkbox, dropdown, filename, namespace, tooltip
- [ ] Version comparisons: "earlier/later" not "older/newer/lower/higher"
- [ ] Accessibility: "unavailable" not "disabled/grayed out"
