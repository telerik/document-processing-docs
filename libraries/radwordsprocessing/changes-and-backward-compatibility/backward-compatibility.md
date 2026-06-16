---
title: Backward Compatibility
description: Review the breaking changes and migration steps for upgrading RadWordsProcessing between versions, including obsolete methods and assembly updates.
page_title: Backward Compatibility
slug: radwordsprocessing-backward-compatibility
tags: migration, compatibility, docx, processing, breaking, document, versions, upgrade, word, flow
published: True
position: 1
---

# Backward Compatibility

The following sections list the breaking changes and the corresponding migration steps when you upgrade from one version of the controls to the next.

## What Is Different in 2022 R3

### Changed

The `TryGetSwitch` method is marked obsolete.

### What to Do Now

Use the `TryGetSwitch` method where the second parameter is `IList<FieldSwitch>`.

### Changed

The `FieldParameters.GetSwitchArgument` method is marked obsolete.

### What to Do Now

Use the `GetSwitchArguments` method instead.

### Changed

The `Field.GeneralFormatting` property is marked obsolete.

### What to Do Now

Use the `GeneralFormattings` property instead.

## What Is Different in 2016 R3

### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to Do Now

Use the assemblies with a version number ending with .40 suffix. The library does not contain code specific for .NET Framework 4.5, so an additional version is not needed.
