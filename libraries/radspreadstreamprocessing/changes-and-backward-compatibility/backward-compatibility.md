---
title: Backward Compatibility
description: Breaking changes and migration guidance for upgrading RadSpreadStreamProcessing between versions. Find solutions for each breaking change listed by release.
page_title: Backward Compatibility
slug: radspreadstreamprocessing-backward-compatibility
tags: migration, compatibility, radspreadstreamprocessing, breaking, spreadsheet, versions, upgrade, streaming
published: True
position: 1
---

# Backward Compatibility

The following sections list the breaking changes and the steps to resolve them when you upgrade from one version to the next.

## What Is Different in 2023 R1 SP1

### Changed

There are separate properties for the formula and the value in the `ICellImporter`.

### What to Do Now

Use each property depending on your desired result. 

## What Is Different in 2016 R3  

### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to Do Now

Use the assemblies with a version number ending with .40 suffix. The library does not contain code specific for .NET Framework 4.5, so an additional version is not needed.
