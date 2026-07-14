---
title: FIPS Compliance
description: Learn how to produce FIPS 140-2 compliant spreadsheet documents using RadSpreadProcessing with only approved cryptographic algorithms.
page_title: FIPS Compliance
slug: radspreadprocessing-features-protection-fips-compliance
tags: fips, protection, spreadsheet, radspreadprocessing, compliance, encryption, workbook, security
published: True
position: 3
---

# FIPS Compliance

The Federal Information Processing Standards (FIPS) are standards specified by the United States Government for approving cryptographic software. With RadSpreadProcessing, you can produce documents which conform to the FIPS 140-2 standard.

Some of the algorithms used to apply protection in RadSpreadProcessing are not allowed in an environment that complies with the Federal Information Processing Standard Publication 140-2. If you try to use an algorithm that is not allowed by this standard on a machine which already uses FIPS, you get an `InvalidOperationException`. RadSpreadProcessing exposes an API that allows you to ensure that only FIPS-compliant algorithms are used when working with spreadsheet documents.

## Enforcing FIPS Compliance

If you need to comply with the FIPS 140-2 standard, you can disable the forbidden algorithms through the `HashingAlgorithmsProvider` static class. Invoke its `EnforceFips1402()` method to enforce the FIPS standard by removing the algorithms which are not included in the standard.

>Enforcing FIPS compliance might cause exceptions when importing documents which use any of the forbidden algorithms.


**Example 1: Enforce FIPS 140-2 by disabling noncompliant hashing algorithms**

<snippet id='codeblock-cna'/>

Call this API before using document protection features in a FIPS-restricted environment.


## See Also

* [Workbook Protection]({%slug radspreadprocessing-features-protection-workbook%})
* [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
 