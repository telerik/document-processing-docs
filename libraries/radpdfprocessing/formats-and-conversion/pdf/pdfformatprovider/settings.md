---
title: Settings
page_title: Settings
slug: radpdfprocessing-formats-and-conversion-pdf-settings
tags: settings
published: True
position: 3
---

# Settings



__PdfFormatProvider__ provides you with the ability to import/export PDF documents. Additionally, you can take advantage of the import/export settings that give you modification options.
      

## Import Settings

You can specify the import settings you wish through the __ImportSettings__ property of __PdfFormatProvider__.The available import settings are listed below:

### __ReadingMode__ 

Gets or sets the mode for loading the document pages content on import.  

* __ReadAllAtOnce:__ All document pages content will be loaded on import. This is the default behavior.
* __OnDemand:__  The document pages content will be loaded on demand. This mode is made for using with PdfViewers and only the currently visible page will be loaded. 

>important Currently, the __OnDemand__ mode should be applied for use with viewers only.

>note This property is available since R2 2020. 

### __CopyStream__ 

Gets or sets whether to copy the document stream on import. When false and ReadingMode is OnDemand, the original stream must be kept open while the document is in use. When true, the original stream can be disposed after import, regardless of the reading mode.

### __UserPasswordNeeded__

The event is fired when a user password is needed to open the document. The password can be specified in the __PasswordNeededEventArgs.Password__ property.
        

__Example 1__ shows how you can create a __PdfImportSettings__ object and assign it to a PdfFormatProvider.
        

#### __[C#] Example 1: Import settings with UserPasswordNeeded__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-settings_0}}

	PdfFormatProvider provider = new PdfFormatProvider();
	PdfImportSettings settings = new PdfImportSettings();
	settings.UserPasswordNeeded += (s, a) =>
	{
	    a.Password = "Us3rP4ssw0rd";
	};
	
	provider.ImportSettings = settings;

{{endregion}}

### OwnerPasswordNeeded

The event is fired when an owner password is needed to open the document. The password can be specified in the __PasswordNeededEventArgs.Password__ property.

#### __[C#] Example 2: Import settings with OwnerPasswordNeeded__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-settings_2}}

	PdfFormatProvider provider = new PdfFormatProvider();
	PdfImportSettings settings = new PdfImportSettings();
	settings.OwnerPasswordNeeded += (s, a) =>
	{
		a.Password = "Own3erP4ssw0rd";
	};

	provider.ImportSettings = settings;
 

{{endregion}}

### DuplicatedEmbeddedFileNameResolving

The event is fired when trying to resolve conflicts between the [embedded file names]({%slug radpdfprocessing-embedded-file-streams-overview%}) with the same names.

#### **[C#] Example 3: Import settings with DuplicatedEmbeddedFileNameResolving**

{{region cs-radpdfprocessing-formats-and-conversion-pdf-import_settings_3}}

            PdfFormatProvider provider = new PdfFormatProvider();
            PdfImportSettings importSettings = new PdfImportSettings();
            importSettings.DuplicatedEmbeddedFileNameResolving += (s, a) =>
            {
                string myNewName = "2_" + a.Name;
                if (!a.UsedNames.Contains(myNewName))
                {
                    a.NewName = myNewName;
                }
            };

            provider.ImportSettings = importSettings;	

{{endregion}}


## Export Settings

In order to modify the way content is exported, you can set the __ExportSettings__ property of __PdfFormatProvider__. These are the modification options you can use:
        
### __ShouldEmbedFonts__

This property controls if the fonts will be embedded in the file. The default value is *true* because by the PDF Standard the fonts should be embedded in the file. This means that by default the fonts are added which allows proper viewing on any device. If the fonts are not embedded and the file is viewed on a device that does not have the used fronts the font might be substituted. 

### __IsEncrypted__

This property specifies if the document should be encrypted. The default value is *False*. You can specify the encryption algorithm by setting the **EncryptionType** property. The supported values are **AES256** and **RC4**

>important **All passwords for revision 6 (AES-256) shall be based on Unicode**. Preprocessing of a user-provided password consists first of normalizing its representation by applying the "SASLPrep" profile (Internet RFC 4013) of the "stringprep" algorithm (Internet RFC 3454) to the supplied password using the Normalize and BiDi options.


>This setting is ignored when __ComplianceLevel__ differs from __None__ as PDF/A compliant documents do not allow encryption.

### __UserPassword__

The password to be used if the document is encrypted. The default password is an empty string.

### __OwnerPassword__

The password that governs permissions for operations such as printing, copying and modifying the document. The default password is an empty string.

### __UserAccessPermissions__

This property specifies three types of user access permissions: **PrintingPermissionType**, **ChangingPermissionType**, and **CopyingPermissionType**. These settings are exported **only** if the PdfExportSettings.IsEncrypted property is set to true. Each has an available set of values, represented by the respective enumerations:


* __PrintingPermissionType__: Sets the permissions for document printing. Possible values: 

    * __None__: Specify no printing is allowed.
    * __LowResolution__: Specify low resolution (150 dpi) printing is allowed.
    * __HighResolution__: Specify printing on the highest resolution is allowed.

* __ChangingPermissionType__: Sets the permissions for making changes to the document. Possible values: 

    * __None__: Specify no document changes are allowed.
    * __DocumentAssembly__: Specify inserting, deleting, and rotating page changes are allowed.
    * __FormFieldFillingOrSigning__: Specify filling in form fields and signing existing signature fields changes are allowed.
	* __FormFieldFillingOrSigningAndCommenting__: Specify commenting, filling in form fields, and signing existing signature fields changes are allowed.
    * __AnyExceptExtractingPages__: Specify any changes except extracting pages are allowed.

* __CopyingPermissionType__: Sets the permissions for document copying. Possible values: 

    * __None__: Specify no copying is allowed.
    * __Copying__: Specify copying is allowed.
    * __TextAccess__: Specify that text access for screen reader devices for copying is allowed.
    * __NumberingFieldsPrecisionLevel__: Represents precision level when updating numbering fields. When the Normal option is selected the fields are updated once, not taking into account if their new values would have shifted the already measured layout. In such cases, the results could be outdated. This is the MS Word-like behavior. If you need more accurate results, use NumberingFieldsPrecisionLevel.High where the fields are updated until their values become more accurate. This precision level is more accurate than NumberingFieldsPrecisionLevel.Normal but requires more resources.
 
__Example 4__ shows how you can create a __PdfExportSettings__ object with settings that specify an OwnerPassword and UserAccessPermissions.


#### __[C#] Example 4: Export settings__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-settings_1}}

	PdfFormatProvider provider = new PdfFormatProvider();
	PdfExportSettings settings = new PdfExportSettings(); 
	settings.IsEncrypted = true;
	settings.OwnerPassword = "0wn3rP4ssw0rd";
	// The following permissions are exported only if the settings.IsEncrypted property is set to true
	UserAccessPermissions permissions = new UserAccessPermissions
	{
	    Printing = PrintingPermissionType.HighResolution,
	    Changing = ChangingPermissionType.AnyExceptExtractingPages,
	    Copying = CopyingPermissionType.TextAccess,
	};
	
	settings.UserAccessPermissions = permissions;
	provider.ExportSettings = settings;

{{endregion}}

### __ImageQuality__

The **ImageQuality** property specifies the quality with which images are exported to PDF. More information about how it works is available in [this article]({%slug radpdfprocessing-concepts-imagequality%}).

>note **.NET Standard** specification does not define APIs for converting images or scaling their quality. That is why to allow the library to export images different than Jpeg and Jpeg2000 or ImageQuality different than High, you will need to provide an implementation of the **JpegImageConverterBase** abstract class. This implementation should be passed to the **JpegImageConverter** property of the of **FixedExtensibilityManager**. For more information check the [Cross-Platform Support]({%slug radpdfprocessing-cross-platform%}) help article.

### __ImageCompression__

 Sets the desired compression for the images when exporting. You can set one of the following values: 
 
* **ImageFilterTypes.Default:** The image compression will be preserved as it is in the original document.
* **ImageFilterTypes.None:** The images won't be encoded.
* **ImageFilterTypes.FlateDecode:** The images will be encoded with a FlateDecode filter. Compresses data using the zlib/deflate compression method.
* **ImageFilterTypes.DCTDecode:** The images will be encoded with a DCTDecode filter. Compresses data using a DCT (discrete cosine transform) technique based on the JPEG standard.

__Example 5__ shows how you can create a __PdfExportSettings__ object with settings for the image properties.

#### __[C#] Example 5: Image settings__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-settings_2}}

	PdfFormatProvider provider = new PdfFormatProvider();
	PdfExportSettings settings = new PdfExportSettings();
	settings.ImageCompression = new ImageFilterTypes[] { ImageFilterTypes.FlateDecode };
	settings.ImageQuality = ImageQuality.Medium;

provider.ExportSettings = settings;

{{endregion}}

### __StreamCompression__

 Gets or sets the content stream compression type. Possible Values are: 
 * **None**: The content streams won't be encoded.
 * **FlateDecode**: Compresses data using the zlib/deflate compression method.


### __ComplianceLevel__

Specifies the PDF/A compliance level. It can have one of the following values: 

* __None__: Specify no compliance level.
* __PdfA1B__: Specify PDF/A-1b compliance level.
* __PdfA2B__: Specify PDF/A-2b compliance level.
* __PdfA2U__: Specify PDF/A-2u compliance level.
* __PdfA3B__: Specify PDF/A-3b compliance level.
* __PdfA3U__: Specify PDF/A-3u compliance level.

The default value is __None__. For more information on PDF/A compliance, check the [PDF/A Compliance article]({%slug radpdfprocessing-howto-comply-with-pdfa-standard%}).


__Example 6__ shows how you can create a __PdfExportSettings__ object and assign it to a PdfFormatProvider.
        

#### __[C#] Example 6: Export settings__

{{region cs-radpdfprocessing-formats-and-conversion-pdf-settings_1}}
	PdfFormatProvider provider = new PdfFormatProvider();
	PdfExportSettings settings = new PdfExportSettings(); 
	settings.ComplianceLevel = PdfComplianceLevel.PdfA2B;
	provider.ExportSettings = settings;

{{endregion}}


## See Also

* [PdfExportSettings API Reference](https://docs.telerik.com/devtools/document-processing/api/Telerik.Windows.Documents.Fixed.FormatProviders.Pdf.Export.PdfExportSettings.html)
* [How to Comply with PDF/A Standard]({%slug radpdfprocessing-howto-comply-with-pdfa-standard%})
