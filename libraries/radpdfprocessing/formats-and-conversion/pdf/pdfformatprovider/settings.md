---
title: Settings
description: Take advantage of the import/export settings that give you modification options offered by the PdfProcessing library.
page_title: Settings
slug: radpdfprocessing-formats-and-conversion-pdf-settings
tags: settings
published: True
position: 3
---
<style>
table, th, td {
	border: 1px solid;
}
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
} 
</style>

# Settings

**PdfFormatProvider** provides the ability to import/export PDF documents. Additionally, you can take advantage of the import/export settings that give you modification options and further fine-tuning.

## Import Settings

The **PdfFormatProvider** class offers the **ImportSettings** property which allows you to modify how the content is being imported. The available import settings are listed below:

|Property|Description|
|----|----|
|**ReadingMode**|Gets or sets the mode for loading the document pages content on import. *Introduced in R2 2020*.<table><tr><td width="20%">**ReadAllAtOnce**</td><td>All document pages content will be loaded on import. This is the default behavior.</td></tr><tr><td>**OnDemand**</td><td>The document pages content will be loaded on demand. This mode is made for using with PdfViewers and only the currently visible page will be loaded. </td></tr></table> Currently, the **OnDemand** mode should be applied when using with viewers only.|
|**CopyStream**|Gets or sets whether to copy the document stream on import. When false and ReadingMode is OnDemand, the original stream must be kept open while the document is in use. When true, the original stream can be disposed after import, regardless of the reading mode.|

|Event|Description|
|----|----|
|**UserPasswordNeeded**|The event is fired when a *user* password is needed to open the document. The password can be specified in the PasswordNeededEventArgs.**Password** property.|
|**OwnerPasswordNeeded**|The event is fired when an *owner* password is needed to open the document. The password can be specified in the PasswordNeededEventArgs.**Password** property.|
|**DuplicatedEmbeddedFileNameResolving**|The event is fired when trying to resolve conflicts between the [embedded file names]({%slug radpdfprocessing-embedded-file-streams-overview%}) with the same names.|
        
The example shows how you can create a **PdfImportSettings** object with the desired settings and handle the offered events:

<snippet id='libraries-pdf-formats-and-conversion-pdfformatprovider-import-settings'/>

## Export Settings

The **PdfFormatProvider** class offers the **ExportSettings** property which allows you to modify how the content is being exported. These are the modification options you can use:

|Property|Description|
|----|----|
|**StripJavaScriptActions**|Specifies if the PDF document should strip JavaScript actions on export. *Introduced in Q4 2024*.|
|**ShouldEmbedFonts** (obsolete)|Specifies whether the font files should be embedded in the PDF document. The default value is *true* because the fonts should be embedded in the file by the PDF Standard. This means that by default the fonts are added which allows proper viewing on any device. If the fonts are not embedded and the file is viewed on a device that does not have the used fronts the font might be substituted. If the font is embedded in the PDF file, it ensures the most predictable and dependable results. As of **Q2 2024** the ShouldEmbedFonts property is obsolete. Use the **FontEmbeddingType** property instead.|
|**FontEmbeddingType**|The property controls what part of the fonts will be embedded in the file offering the following options: <table><tr><td  width="20%">**None**</td><td>Does not embed fonts.</td></tr><tr><td>**Full**</td><td>Fully embeds fonts.</td></tr><tr><td>**Subset**</td><td>Embeds only the used characters subset of the fonts. This is the default approach.</td></tr></table> The subset export option is currently implemented **only** for TrueType fonts (.ttf).|
|**IsEncrypted**|This property specifies if the document should be encrypted. The default value is *false*. You can specify the encryption algorithm by setting the **EncryptionType** property. The supported values are **AES256** and **RC4**. </br>**All passwords for revision 6 (AES-256) shall be based on Unicode**. Preprocessing of a user-provided password consists first of normalizing its representation by applying the "SASLPrep" profile (Internet RFC 4013) of the "stringprep" algorithm (Internet RFC 3454) to the supplied password using the Normalize and BiDi options. </br> This setting is ignored when __ComplianceLevel__ differs from __None__ as PDF/A compliant documents do not allow encryption.|
|**UserPassword**|The password to be used if the document is encrypted. The default password is an empty string.|
|**OwnerPassword**|The password that governs permissions for operations such as printing, copying and modifying the document. The default password is an empty string.|
|**UserAccessPermissions**|Gets or sets the user access permissions. These permissions specify which access permissions should be granted when the document is opened with user access. In order to be applied, the **IsEncrypted** property should be set to *true*. This property specifies three types of user access permissions:<table><tr><td width="20%">**PrintingPermissionType**</td><td>Sets the permissions for document printing. Possible values: <table><tr><td  width="40%">**None**</td><td>Specify no printing is allowed.</td></tr><tr><td>**LowResolution**</td><td>Specify low resolution (150 dpi) printing is allowed.</td></tr><tr><td>**HighResolution**</td><td>Specify printing on the highest resolution is allowed.</td></tr></table></td></tr><tr><td>**ChangingPermissionType**</td><td>Sets the permissions for making changes to the document. Possible values: <table><tr><td width="40%">**None**</td><td>Specify no document changes are allowed.</td></tr><tr><td>**DocumentAssembly**</td><td>Specify inserting, deleting, and rotating page changes are allowed.</td></tr><tr><td>**FormFieldFillingOrSigning**</td><td>Specify filling in form fields and signing existing signature fields changes are allowed.</td></tr><tr><td>**FormFieldFillingOrSigningAndCommenting**</td><td>Specify commenting, filling in form fields, and signing existing signature fields changes are allowed.</td></tr><tr><td>**AnyExceptExtractingPages**</td><td>Specify any changes except extracting pages are allowed.</td></tr></table></td></tr><tr><td>**CopyingPermissionType**</td><td>Sets the permissions for document copying. Possible values: <table><tr><td width="40%">**None**</td><td>Specify no copying is allowed.</td></tr><tr><td>**Copying**</td><td>Specify copying is allowed.</td></tr><tr><td>**TextAccess**</td><td>Specify that text access for screen reader devices for copying is allowed.</td></tr><tr><td>**NumberingFieldsPrecisionLevel**</td><td>Represents precision level when updating numbering fields. When the Normal option is selected the fields are updated once, not taking into account if their new values would have shifted the already measured layout. In such cases, the results could be outdated. This is the MS Word-like behavior. If you need more accurate results, use NumberingFieldsPrecisionLevel.High where the fields are updated until their values become more accurate. This precision level is more accurate than NumberingFieldsPrecisionLevel.Normal but requires more resources.</td></tr></table></td></tr></table>|
|**ImageQuality**|Specifies the quality with which images are exported to PDF. More information about how it works is available in [this article]({%slug radpdfprocessing-concepts-imagequality%}). </br> **.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to allow the library to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the of **FixedExtensibilityManager**. For more information check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) help article.|
|**ImageCompression**|Sets the desired compression for the images when exporting. You can set one of the following values of the ImageFilterTypes: <table><tr><td width="20%">**Default**</td><td>The image compression will be preserved as it is in the original document.</td></tr><tr><td>**None**</td><td>The images won't be encoded.</td></tr><tr><td> **FlateDecode**</td><td>The images will be encoded with a FlateDecode filter. Compresses data using the zlib/deflate compression method.</td></tr><tr><td>**DCTDecode**</td><td> The images will be encoded with a DCTDecode filter. Compresses data using a DCT (discrete cosine transform) technique based on the JPEG standard.</td></tr></table>|
|**StreamCompression**|Gets or sets the content stream compression type. Possible Values are: <table><tr><td width="20%">**None**</td><td>The content streams won't be encoded.</td></tr><tr><td>**FlateDecode**</td><td>Compresses data using the zlib/deflate compression method.</td></tr></table>|
|**ComplianceLevel**|Specifies the PDF/A compliance level. It can have one of the following values: <table><tr><td width="20%">**None**</td><td>Specify no compliance level.</td></tr><tr><td>**PdfA1B**</td><td>Specify PDF/A-1b compliance level.</td></tr><tr><td>**PdfA2B**</td><td>Specify PDF/A-2b compliance level.</td></tr><tr><td>**PdfA2U**</td><td>Specify PDF/A-2u compliance level.</td></tr><tr><td>**PdfA3B**</td><td>Specify PDF/A-3b compliance level.</td></tr><tr><td>**PdfA3U**</td><td>Specify PDF/A-3u compliance level.</td></tr></table> The default value is __None__. For more information on PDF/A compliance, check the [PDF/A Compliance article]({%slug radpdfprocessing-howto-comply-with-pdfa-standard%}).|
|**ShouldExportXfa**|Specifies whether the PDF document should export XFA content (if any). Default value: *false*. Introduced in **Q1 2025**.|
 
>important The receiver of a PDF document must have the same fonts that were originally used to create it. If a different font is substituted, its character set, glyph shapes, and metrics may differ from those in the original font. This substitution can produce unexpected and unwanted results, such as lines of text extending into margins or overlapping with graphics. A PDF file can refer by name to fonts that are not embedded in the PDF file. In this case, a PDF consumer can use those fonts if they are available in its environment. This approach suffers from the uncertainties noted above. 

As of **Q1 2025** the PdfExportSettings offers the **DocumentUnhandledException** event which allows you to handle exceptions while exporting a document. 

The example shows how you can create a **PdfExportSettings** object with the desired settings and handle unexpected errors while exporting the PDF document:

<snippet id='libraries-pdf-formats-and-conversion-pdfformatprovider-export-settings'/>

## See Also

* [Handling Exceptions]({%slug radpdfprocessing-handling-exceptions%})
* [How to Comply with PDF/A Standard]({%slug radpdfprocessing-howto-comply-with-pdfa-standard%})
* [Optimizing and Reducing the Size of PDF Files with RadPdfProcessing]({%slug optimize-and-reduce-pdf-size-radpdfprocessing%})
