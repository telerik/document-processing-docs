---
title: Settings
description: Learn how to configure the PdfFormatProvider import and export settings to control encryption, image quality, compliance levels, and font embedding in RadPdfProcessing.
page_title: Settings
slug: radpdfprocessing-formats-and-conversion-pdf-settings
tags: pdfformatprovider, settings, pdf, import, export, radpdfprocessing, encryption, compliance
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

The `PdfFormatProvider` class imports and exports PDF documents. The import and export settings provide options for controlling encryption, image quality, font embedding, compliance levels, and more.

## Import Settings

The `PdfFormatProvider` class exposes the `ImportSettings` property, which allows you to control how the content is imported. The following table lists the available import settings:

|Property|Description|
|----|----|
|`ReadingMode`|Gets or sets the mode for loading the document pages content on import. *Introduced in R2 2020*.<ul><li>**ReadAllAtOnce**: All document pages content is loaded on import. This is the default behavior.</li><li>**OnDemand**: The document pages content is loaded on demand. This mode is designed for use with PdfViewers and only the currently visible page is loaded. </td></tr></ul> The **OnDemand** mode must be applied when used with viewers only.|
|`CopyStream`|Gets or sets whether to copy the document stream on import. When false and ReadingMode is OnDemand, the original stream must be kept open while the document is in use. When true, the original stream can be disposed after import, regardless of the reading mode.|

|Event|Description|
|----|----|
|`UserPasswordNeeded`|The event fires when a *user* password is needed to open the document. The password can be set in the `PasswordNeededEventArgs.Password` property.|
|`OwnerPasswordNeeded`|The event fires when an *owner* password is needed to open the document. The password can be set in the `PasswordNeededEventArgs.Password` property.|
|`DuplicatedEmbeddedFileNameResolving`|The event fires when the provider resolves conflicts between [embedded file names]({%slug radpdfprocessing-embedded-file-streams-overview%}) with the same names.|
|`DocumentUnhandledException`|Raised when an unhandled exception occurs during document import. Provides error details for logging or recovery.|
        
The following example shows how to create a `PdfImportSettings` object with the desired settings and handle the offered events:

<snippet id='libraries-pdf-formats-and-conversion-pdfformatprovider-import-settings'/>

## Export Settings

The `PdfFormatProvider` class exposes the `ExportSettings` property, which allows you to control how the content is exported. The following table lists the available export settings:

|Property|Description|
|----|----|
|`StripStructureTree`|Specifies whether the PDF document strips the structure tree on export. *Introduced in Q2 2025*. The default value is **false**.|
|`StripJavaScriptActions`|Specifies whether the PDF document strips JavaScript actions on export. *Introduced in Q4 2024*. The default value is **false**.|
|`FontEmbeddingType`|Controls what part of the fonts is embedded in the file: <ul><li>**None**: Does not embed fonts.</li><li>**Full**: Fully embeds fonts.</li><li>**Subset**: Embeds only the used characters subset of the fonts. This is the default approach.</li></ul> The subset export option is implemented **only** for TrueType fonts (.ttf).|
|`IsEncrypted`|Specifies whether the document is encrypted. The default value is *false*. You can set the encryption algorithm through the `EncryptionType` property.</br>**All passwords for revision 6 (AES-256) must be based on Unicode**. Preprocessing of a user-provided password consists first of normalizing its representation by applying the "SASLPrep" profile (Internet RFC 4013) of the "stringprep" algorithm (Internet RFC 3454) to the supplied password using the Normalize and BiDi options. </br> This setting is ignored when `ComplianceLevel` differs from `None` as PDF/A compliant documents do not allow encryption.|
|`EncryptionType`|Encryption algorithm applied when the `IsEncrypted` property is *true*. The supported values are: <ul><li> **AES256**</li><li>**AES128** (*introduced in Q4 2025*) </li><li>**RC4** (default value)</li></ul> |
|`UserPassword`|The password to use if the document is encrypted. The default password is an empty string.|
|`OwnerPassword`|The password that governs permissions for operations such as printing, copying, and modifying the document. The default password is an empty string.|
|`UserAccessPermissions`|Gets or sets the user access permissions. These permissions specify which operations are allowed when the document is opened with user access. To apply these permissions, set the `IsEncrypted` property to *true*. This property supports three types of user access permissions: [Available UserAccessPermissions]({%slug radpdfprocessing-formats-and-conversion-pdf-settings%}#available-useraccesspermissions)|
|`ImageQuality`|Specifies the quality with which images are exported to PDF. More information is available in [the ImageQuality article]({%slug radpdfprocessing-concepts-imagequality%}). </br> The .NET Standard specification does not define APIs for converting images or scaling their quality. To allow the library to export images other than Jpeg and Jpeg2000, or to use ImageQuality values other than High, provide an implementation of the `JpegImageConverterBase` abstract class. Pass this implementation to the `JpegImageConverter` property of the `FixedExtensibilityManager`. For more information, refer to the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) article.|
|`ImageCompression`|Sets the desired compression for images when exporting. You can set one of the following values of the `ImageFilterTypes` enum: <ul><li>**Default**: The image compression is preserved as in the original document.</li><li>**None**: The images are not encoded.</li><li> **FlateDecode**: The images are encoded with a FlateDecode filter. Compresses data with the zlib/deflate compression method.</li><li>**DCTDecode**: The images are encoded with a DCTDecode filter. Compresses data with a DCT (discrete cosine transform) technique based on the JPEG standard.</li></ul>|
|`StreamCompression`|Gets or sets the content stream compression type. Possible values: <ul><li>**None**: The content streams are not encoded.</li><li>**FlateDecode**: Compresses data with the zlib/deflate compression method.</li></ul>|
|`ComplianceLevel`|Specifies the PDF/A or PDF/UA compliance level. It can have one of the following values: <ul><li>**None**: No compliance level.</li><li>**PdfA1B**: PDF/A-1b compliance level.</li><li>**PdfA1A**: PDF/A-1a compliance level.</li><li>**PdfA2B**: PDF/A-2b compliance level.</li><li>**PdfA2A**: PDF/A-2a compliance level.</li><li>**PdfA2U**: PDF/A-2u compliance level.</li><li>**PdfA3B**: PDF/A-3b compliance level.</li><li>**PdfA3A**: PDF/A-3a compliance level.</li><li>**PdfA3U**: PDF/A-3u compliance level.</li><li>**PdfUA1**: PDF/UA-1 compliance level.</li></ul> The default value is `None`. For more information on PDF/A compliance, refer to the [PDF/A Compliance article]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%}).|
|`ShouldExportXfa`|Specifies whether the PDF document exports XFA content (if any). Default value: *false*. Introduced in **Q1 2025**.|
|`TaggingStrategy`|Specifies the tagging strategy used when exporting the document. Default value: *UseExisting*. Introduced in **Q3 2025.** </br>Possible values: <ul><li>**UseExisting**: The document is not tagged automatically and the existing StructureTree is used.</li><li>**Build**: The document is automatically tagged and a new StructureTree is created.</li></ul>|

### Available UserAccessPermissions

|UserAccessPermission Type|Description|
|----|----|
|`PrintingPermissionType`|Sets the permissions for document printing. Possible values: <ul><li>**None**: No printing is allowed.</li><li>**LowResolution**: Low resolution (150 dpi) printing is allowed.</li><li>**HighResolution**: Printing at the highest resolution is allowed.</li></ul>|
|`ChangingPermissionType`|Sets the permissions for making changes to the document. Possible values: <ul><li>**None**: No document changes are allowed.</li><li>**DocumentAssembly**: Inserting, deleting, and rotating page changes are allowed.</li><li>**FormFieldFillingOrSigning**: Filling in form fields and signing existing signature fields are allowed.</li><li>**FormFieldFillingOrSigningAndCommenting**: Commenting, filling in form fields, and signing existing signature fields are allowed.</li><li>**AnyExceptExtractingPages**: Any changes except extracting pages are allowed.</li></ul>|
|`CopyingPermissionType`|Sets the permissions for document copying. Possible values: <ul><li>**None**: No copying is allowed.</li><li>**Copying**: Copying is allowed.</li><li>**TextAccess**: Text access for screen reader devices for copying is allowed.</li><li>**NumberingFieldsPrecisionLevel**: Represents precision level when updating numbering fields. When the Normal option is selected the fields are updated once, not taking into account if their new values have shifted the already measured layout. In such cases, the results could be outdated. This is the MS Word-like behavior. If you need more accurate results, use NumberingFieldsPrecisionLevel.High where the fields are updated until their values become more accurate. This precision level is more accurate than NumberingFieldsPrecisionLevel.Normal but requires more resources.</li></ul>|
 
>important The receiver of a PDF document must have the same fonts that were originally used to create it. If a different font is substituted, its character set, glyph shapes, and metrics may differ from those in the original font. This substitution can produce unexpected and unwanted results, such as lines of text extending into margins or overlapping with graphics. A PDF file can refer by name to fonts that are not embedded in the PDF file. In this case, a PDF consumer can use those fonts if they are available in its environment. This approach suffers from the uncertainties noted previously.

Starting with **Q1 2025**, the `PdfExportSettings` class exposes the `DocumentUnhandledException` event, which allows you to handle exceptions while exporting a document.

The following example shows how to create a `PdfExportSettings` object with custom settings and handle unexpected errors while exporting the PDF document:

<snippet id='libraries-pdf-formats-and-conversion-pdfformatprovider-export-settings'/>

## See Also

* [Handling Exceptions]({%slug radpdfprocessing-handling-exceptions%})
* [How to Comply with PDF/A Standard]({%slug radpdfprocessing-concepts-comply-with-pdfa-standard%})
* [Optimizing and Reducing the Size of PDF Files with RadPdfProcessing]({%slug optimize-and-reduce-pdf-size-radpdfprocessing%})
* [Removing Password from a PDF Using Telerik PdfProcessing]({%slug remove-password-from-pdf-telerik-pdfprocessing%})
