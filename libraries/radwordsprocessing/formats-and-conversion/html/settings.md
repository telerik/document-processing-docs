---
title: Settings
page_title: Settings
slug: radwordsprocessing-formats-and-conversion-html-settings
tags: settings
published: True
position: 4
---

# Settings

__HtmlFormatProvider__ allows you to import HTML documents and to export a RadFlowDocument to HTML. Additionally, the import/export settings provide modification options. This article outlines the available settings.
      

* [Import Settings](#import-settings)

* [UriImageSource Class](#uriimagesource-class)

* [Export Settings](#export-settings)


## Import Settings

The import settings are represented by the __HtmlImportSettings__ class. The options that you can specify are as follows:
        

### DefaultStyleSheet

The property specifies the default style sheet that should be used. This is equivalent to the browser's "user agents style defaults" and specifies the formatting that should be applied by default to the elements (before all styles explicitly defined in the document).
            

The default value, for example, specifies that "b" elements should be imported with "font-weight: bold".
            

You can set the value of the property to any valid CSS document. **Example 1** shows how you can add styling in addition to the default ones. 

#### [C#] Example 1: Add CSS to the DefaultStyleSheet

{{region }}
	HtmlFormatProvider provider = new HtmlFormatProvider();
	provider.ImportSettings.DefaultStyleSheet = provider.ImportSettings.DefaultStyleSheet + @" p {color: #ff99ac;}";
{{endregion}}
            

### GenericFonts

Contains an instance of __GenericHtmlFonts__ class, which specifies the ThemableFontFamily objects that should be used when importing the 5 generic CSS font families: serif, sans-serif, monospace, cursive and fantasy. By default, these fonts are Times New Roman, Arial, Courier New, Comic Sans MS and Algerian, respectively.
            
### LoadImageFromUri and LoadStyleSheetFromUri events 
These events should be used when you need to load external resources (images and CSS files) that are not included in the HTML. When using these events you need to load the data using the Uri passed in the event arguments and return the data.  

>important The __LoadFromUri__ event is obsoleted in R1 2021, you can use one of the above events instead. With Q3 2015 the __UriImageSource__ class was introduced. This allows the images to be automatically downloaded, however since such approach can be considered as a security vulnerability this is obsoleted in R1 2021.

The __LoadImageFromUri__ event uses the __LoadImageFromUriEventArgs__ object which exposes the following properties: 

* __Uri__: The URI originally specified in the imported HTML file.
* __SetImageInfo__: Used to pass the image data and image format (extension).


__Example 2__ Shows how you can use the __LoadImageFromUri__ event to download an image.

#### __[C#] Example 2: Use the LoadImageFromUri__
{{region cs-radwordsprocessing-formats-and-conversion-html-settings_4}}

    HtmlFormatProvider provider = new HtmlFormatProvider();
    HtmlImportSettings importSettings = new HtmlImportSettings();

    importSettings.LoadImageFromUri += (s, e) =>
	{
		// Load the data representing the resource 
		System.Net.WebClient webClient = new System.Net.WebClient();
		byte[] data = webClient.DownloadData(e.Uri);

		// Pass the loaded data to the arguments
		string extension = System.IO.Path.GetExtension(e.Uri).Substring(1); // Get the extension without the dot
		e.SetImageInfo(data, extension);
	};

    provider.ImportSettings = importSettings;

{{endregion}}

The __LoadStyleSheetFromUri__ event uses the __LoadStyleSheetFromUriEventArgs__ object which exposes the following properties: 
 
* __Uri__: The URI originally specified in the imported HTML file.
* __SetStyleSheetContent__: Used to pass the styles as string.

__Example 3__ Shows how you can use the __LoadStyleSheetFromUri__ event.
            
#### __[C#] Example 3: Use the LoadStyleSheetFromUri event__
{{region cs-radwordsprocessing-formats-and-conversion-html-settings_0}}

    HtmlFormatProvider provider = new HtmlFormatProvider();
    HtmlImportSettings importSettings = new HtmlImportSettings();

  	importSettings.LoadStyleSheetFromUri += (s, e) =>
    {
        string styles = File.ReadAllText(@"Data\"+ e.Uri);
        e.SetStyleSheetContent(styles);
    };

    provider.ImportSettings = importSettings;
	
{{endregion}}

## UriImageSource Class

When importing HTML, which contains images with URI source, the **HtmlFormatProvider** will create an **UriImageSource** object for each of these images. The image data will be downloaded on demand. **UriImageSource** exposes the following properties:

* __Uri__: Gets the URI of the image.
* __Data__: Gets a byte[], which represents the data of the image. Accessing this property will download the image data.
* __Extension__: Gets the extension. Accessing this property will download the image data only if the extension is not predefined.

> important Using __UriImageSource__ or the __LoadFromUri__ event will make an http request and will download the respected resource. Consider this fact if your application is not meant to freely access any remote resources.

> Exporting an **UriImageSource** object to other supported formats will download the image and save it according to the used format specification.


### Converting UriImageSource to ImageSource

The **UriImageSource** objects are always exported as images with URI as their source independently of the export settings. If you need to export this object as an embedded or external image, you could convert the **UriImageSource** to **ImageSource** object. 

#### __[C#] Example 4: Convert UriImageSource to ImageSource__

{{region cs-radwordsprocessing-formats-and-conversion-html-settings_2}}
	UriImageSource uriImageSource = imageInline.Image.ImageSource as UriImageSource;
	if (uriImageSource != null)
	{
	    imageInline.Image.ImageSource = new ImageSource(uriImageSource.Data, uriImageSource.Extension);
	}
{{endregion}}


## Export Settings

The export settings are represented by the __HtmlExportSettings__ class. The settings that you can specify are as follows:
        

### BordersMinimalThickness

Specifies the minimal exported thickness of the borders of tables and table cells. This could be useful as some browsers cannot properly visualize thin borders (below 1px or similar). The default value is 0, equivalent to exporting all borders with their actual thickness.
            

### DocumentExportLevel

Specifies the export level of the document using the __DocumentExportLevel__ enumeration:
            

* __Document__: Exports full HTML document. This is the default value of the property.
* __Fragment__: Exports a fragment of the HTML document – only the 'body' tag.
                

### IndentDocument

Specifies whether the exported document should be indented (formatted with spaces). The default value is __false__, as this ensures minimum size as opposed to human-readability.
            

### ImagesExportMode

This property is used to control how images are exported. The available options are as external file or as embedded images.
            
> When an image with Uri source is imported, the ImageSource property of the Image contains object of type UriImageSource. Hence, the image is always exported with URI and the __ImagesExportMode__ property is not respected. If you need this property to be respected, you could convert the **UriImageSource** object to __ImageSource__.
          
<p>
>When working with relative URI, the import/export functionalities only preserve the path to the image and do not modify it.

### ImagesFolderPath

This property is used to specify the folder path where external images should be exported. This property is used only when __ImageExportMode__ is set to __External__.
            

### ImagesSourceBasePath

Specifies the base path for the "src" attribute of the exported image tags. This property is used only when the __ImageExportMode__ is set to __External__.
            

### ImageExporting

The event is raised for every image in the document. The event argument exposes the following options:
            
* __Title__: Allows you to set the _title_ attribute of the _image_ element.

* __AlternativeText__: Can be used to specify the content of the 'alt' attribute of the image. It is null by default and the attribute is not exported.
                

* __Handled__: Marks the event as handled. If __ImagesExportMode__ is set to __External__ and the event is marked as handled, the format provider does not attempt to export the image to an external image file.
                

* __Image__: Can be used to obtain the original Image object, from where you can access image name, image data and image extension.
                

* __Source__: Can be used to specify the value of the 'src' attribute of the 'image' element. If __ImagesExportMode__ is set to __External__, the source can be set to absolute or to a relative path pointing to the image file.
                
* __ExportSize__: Use this property to specify whether the _width_ and _height_ attributes of an _image_ element should be exported. The default value is _true_.


### StylesExportMode

Specifies the export mode for the [styles in RadFlowdDocument's StyleRepository]({%slug radwordsprocessing-concepts-styles%}), using the __StylesExportMode__ enumeration:
            

* __Embedded__: RadFlowDocument styles are exported as internal CSS – selectors embedded into the HTML in 'style' element in the 'head' section. This is the default value of the property.
                

* __External__: RadFlowDocument styles are exported as CSS selectors in external CSS file. You have two options:
                

    * Set __StylesFilePath__ and __StylesSourcePath__ properties, which should be used to export the external file.
                    

    * Handle __ExportStylesToExternalSource__ event, specifying the output stream and reference Uri to be exported.
                    

* __Inline__: RadFlowDocument styles are exported as CSS properties in the 'style' attribute of the HTML elements. This ensures maximum compatibility with some applications that don't support external or embedded CSS, for example some email clients.
                

* __None__: RadFlowDocument styles are not exported. Note that the local values of [style properties]({%slug radwordsprocessing-concepts-style-properties%}) of the DocumentElements are still exported as CSS properties in the 'style' attribute of the HTML elements.
                

### StylesFilePath

This property is used to specify the file path where the external styles should be exported.
            

### StylesSourcePath

The property specifies the base path for the "href" attribute of the "link" element pointing to the file containing the external styles.
            

### ExternalStylesExporting

The event is only raised when the __StylesExportMode__ property is set to __External__. The event argument exposes the following properties:
            

* __Css__: String containing the actual CSS that will be exported.
                

* __Handled__: Marks the event as handled. If the event is marked as handled, the format provider does not attempt to export the CSS file.
                

* __Reference__: The value that will be set to the "href" attribute of the "link" element tag. In general, this should be set to the absolute or relative path pointing to the file containing the CSS styles.
                

__Example 5__ demonstrates how you can create export settings.
            

#### __[C#] Example 5: Create HtmlExportSettings__

{{region cs-radwordsprocessing-formats-and-conversion-html-settings_1}}
	HtmlFormatProvider provider = new HtmlFormatProvider();
	HtmlExportSettings exportSettings = new HtmlExportSettings();
	
	byte[] data = null;
	exportSettings.BordersMinimalThickness = 1;
	exportSettings.DocumentExportLevel = DocumentExportLevel.Fragment;
	exportSettings.IndentDocument = true;
	exportSettings.ImageExporting += (s, e) =>
	{
	    e.Source = "test.jpg";
	    data = e.Image.ImageSource.Data;
	    e.Handled = true;
	    e.Title = "Test image";
	    e.ExportSize = true;
	    e.AlternativeText = "You will see this text if the image is not loaded";
	};
	
	provider.ExportSettings = exportSettings;
{{endregion}}



## See Also

 * [Styles]({%slug radwordsprocessing-concepts-styles%})
 * [Style Properties]({%slug radwordsprocessing-concepts-style-properties%})
