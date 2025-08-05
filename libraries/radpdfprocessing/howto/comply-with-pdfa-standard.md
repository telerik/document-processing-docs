---
title: How to Comply with PDF/A Standard
page_title: How to Comply with PDF/A Standard
slug: radpdfprocessing-howto-comply-with-pdfa-standard
tags: pdfa,standard
published: True
position: 1
---

# How to Comply with PDF/A Standard

[PDF/A](http://en.wikipedia.org/?title=PDF/A) is an ISO-standardized version of the PDF (Portable Document Format) specialized for the digital preservation of electronic documents. 

PDF/A standard is designed to use the PDF format for archiving documents. This means that the compliant documents should contain all the information necessary for displaying the document embedded in the file. This includes all content, fonts, and color information. A PDF/A document is not permitted to rely on information from external sources. Other key elements to PDF/A conformance include:

* Audio and video content is forbidden.
* JS and executable file launches are forbidden.
* All fonts must be embedded. This applies to the Standard 14 fonts as well.
* Color spaces should be specified in a device-independent manner.
* Encryption is forbidden.
* Use of standards-based metadata. 
* Transparent objects and layers are forbidden.
* LZW and JPEG2000 image compression models are forbidden.

## Compliance Levels

There are three major versions of the standard – PDF/A-1 (2005), PDF/A-2 (2011), PDF/A-3 (2013). RadPdfProcessing supports the following PDF/A compliance levels:

|Compliance Level|Description|
|----|----|
|**None**|Specify no compliance level.|
|**PdfA1B**|PDF/A-1b compliance level. Ensures reliable reproduction of the visual appearance of the document.|
|**PdfA1A**|PDF/A-1a compliance level. Ensures that document content can be searched and re-purposed. Requires document structure, tagged PDF, Unicode character maps, and language specification.|
|**PdfA2B**|PDF/A-2b compliance level. Similar to PDF/A-1b but based on PDF Reference 1.7.|
|**PdfA2A**|PDF/A-2a compliance level. Similar to PDF/A-1a but based on PDF Reference 1.7.|
|**PdfA2U**|PDF/A-2u compliance level. Similar to PDF/A-2b with the additional requirement that all text has Unicode mapping.|
|**PdfA3B**|PDF/A-3b compliance level. Similar to PDF/A-2b but allows embedding of arbitrary file formats.|
|**PdfA3A**|PDF/A-3a compliance level. Similar to PDF/A-2a but allows embedding of arbitrary file formats.|
|**PdfA3U**|PDF/A-3u compliance level. Requires character mapping to Unicode and allows embedding of arbitrary file formats.|
|**PdfUA1**|PDF/UA-1 compliance level. Ensures accessibility for users with disabilities.|

>note Any files embedded within a PDF/A-compliant document must also comply with the PDF/A standard.

## How to Conform to PDF/A Standard

The **PdfFormatProvider** class allows the export of a **RadFixedDocument** to PDF while also specifying available [export settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#export-settings). 

To comply with any of the standards, you need to set the **ComplianceLevel** property to a different value than **None**:

{{region cs-radpdfprocessing-howto-comply-with-pdfa-standard_0}}
	PdfFormatProvider provider = new PdfFormatProvider();
	
	PdfExportSettings settings = new PdfExportSettings();
	settings.ComplianceLevel = PdfComplianceLevel.PdfA2B;
	provider.ExportSettings = settings;
{{endregion}}

#### Accessibility Compliance

To comply with the [accessibility]({%slug create-accessible-pdf-documents%}) requirements of the PDF/A-1a, PDF/A-2a, PDF/A-3a, or PDF/UA-1 standards, you must also set the **TaggingStrategy** property of the PdfFormatProvider's **PdfExportSettings**. 

{{region cs-radpdfprocessing-howto-comply-with-pdfa-standard_1}}
	PdfFormatProvider provider = new PdfFormatProvider();
	
	PdfExportSettings settings = new PdfExportSettings();
	settings.ComplianceLevel = PdfComplianceLevel.PdfA1A;
	settings.TaggingStrategy = TaggingStrategyType.UseExisting;

	provider.ExportSettings = settings;	
{{endregion}}

This ensures that the exported PDF document is properly tagged, which is essential for meeting these standards' requirements.

> If you specify an encryption for the document, it will be ignored since the standard does not allow documents to be encrypted.

> PDF/A standard requires documents to contain all fonts used in them. RadPdfProcessing does not support embedding of the standard 14 fonts used in PDF documents, so using them will prevent the document from complying with the standard. More information about font embedding is available in the [Fonts]({%slug radpdfprocessing-concepts-fonts%}) article.

## See Also

 * [Using PdfFormatProvider]({%slug radpdfprocessing-formats-and-conversion-pdf-pdfformatprovider%})
 * [PdfFormatProvider Settings]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%})
 * [Fonts]({%slug radpdfprocessing-concepts-fonts%})
