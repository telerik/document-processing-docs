---
title: Using NumberingFieldsProvider
page_title: Using NumberingFieldsProvider
slug: radpdfprocessing-formats-and-conversion-pdf-numbering-fields-provider
tags: using, numbering-fields-provider
published: True
position: 20
---

# Using NumberingFieldsProvider

The __NumberingFieldsProvider__ is used for calculating the layout of the document. This is necessary when updating the fields values. For example to calculate the total number of pages. 

### Requirements

To use the default implantation of the __NumberingFieldsProvider__ you need to reference the __**Telerik.Documents.Flow.FormatProviders.Pdf.dll**__ assembly.

### Setting the default implementation

The default provider can be set with the following code:

#### __[C#] Example 1: Register the default NumberingFieldsProvider__

{{region cs-radwordsprocessing-concepts- numbering-fields-provider_1}}

	 FlowExtensibilityManager.NumberingFieldsProvider = new NumberingFieldsProvider();

{{endregion}}

### Using the RegisterNumberingStyleConverter

This method allows you to use a custom numbering style converter.

#### __[C#] Example 2: Register custom NumberingStyleConverter__

{{region cs-radwordsprocessing-concepts- numbering-fields-provider_2}}

	NumberingFieldsProvider numberingFieldsProvider = new NumberingFieldsProvider();
	numberingFieldsProvider.RegisterNumberingStyleConverter(NumberingStyle.ChineseCounting, new NumberingStyleConverter());
	

{{endregion}}

The NumberingStyleConverter must implement the **INumberingStyleConverter** interface which has one method that takes a number and converts it to a string.







