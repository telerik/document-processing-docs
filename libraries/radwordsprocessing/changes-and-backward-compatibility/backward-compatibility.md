---
title: Backward Compatibility
page_title: Backward Compatibility
slug: radwordsprocessing-backward-compatibility
tags: backward,compatibility
published: True
position: 1
---

# Backward Compatibility

This article lists the breaking changes and how they can be fixed when upgrading from a specific version of the controls to the next one.

## What's Different in 2022 R3

### Changed

The __TryGetSwitch__ method is marked obsolete.

### What to do now

Use the __TryGetSwitch__ method where the second parameter is `IList<FieldSwitch>`. 

### Changed

The __FieldParameters.GetSwitchArgument__ method is marked obsolete.

### What to do now

Use the __GetSwitchArguments__ method instead.
  
### Changed

The __Field.GeneralFormatting__ property is marked obsolete.

### What to do now

Use the __GeneralFormattings__ property instead. 

## What's Different in 2016 R3  


### Changed

Assemblies with a version number ending with .45 suffix are **not** distributed.

### What to do now

Use the assemblies with a version number ending with .40 suffix. The library doesn't contain code specific for .NET Framework 4.5, thus an additional version is not needed.
