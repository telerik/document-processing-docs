---
title: FIPS Compliance
page_title: FIPS Compliance
description: FIPS Compliance
slug: radspreadprocessing-features-protection-fips-compliance
tags: workbook,protection, fips
published: True
position: 3
---

# FIPS Compliance

The Federal Information Processing Standards (FIPS) are standards specified by the United States Government for approving cryptographic software. With RadSpreadProcessing, you can produce documents which conform to the FIPS 140-2 standard.

Some of the algorithms used to apply protection in RadSpreadProcessing are not allowed in environment that comply with the Federal Information Processing Standard Publication 140-2. If you try using an algorithm that is not allowed by this standard on a machine which has already using FIPS, you will get an InvalidOperationException. RadSpreadProcessing exposes API allowing you to ensure that only FIPS-compliant algorithms are used when working with spreadsheet documents.

## Enforcing FIPS Compliance

If you need to comply with the FIPS 140-2 standard, you can disable the forbiden algorithms using the **HashingAlgorithmsProvider** static class. Invoking its **EnforceFips1402()** method enables enforcing the FIPS standard by removing the algorithms which are not included in the standard. 

>Enforcing FIPS compliance might cause exceptions when importing documents which use any of the forbidden algorithms. 


#### [C#] Example 1: Enforce FIPS
{{region radspreadprocessing-features-protection-fips-compliance-0}}

    HashingAlgorithmsProvider.EnforceFips1402();
{{endregion}}

Enforcing the FIPS compliance should be done before using the Protection feature.


## See Also

 * [Workbook Protection]({%slug radspreadprocessing-features-protection-workbook%})
 * [Worksheet Protection]({%slug radspreadprocessing-features-protection-worksheet%})
 